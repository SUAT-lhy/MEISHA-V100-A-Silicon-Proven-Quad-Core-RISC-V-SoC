module bridge_64to32 (
    // 64-bit interface
    input           clk,
    input           rst_n,
    output  reg         ram64_accept_i,
    output  reg          ram64_ack_i,
    output  reg         ram64_error_i,
    output  reg [63:0]   ram64_read_data_i,
    input [  7:0]  ram64_wr_o,
    input          ram64_rd_o,
    input [  7:0]  ram64_len_o,
    input [ 31:0]  ram64_addr_o,
    input [ 63:0]  ram64_write_data_o,

    // 32-bit interface
    input           ram32_accept_i,
    input           ram32_ack_i,
    input           ram32_error_i,
    input  [31:0]   ram32_read_data_i,
    output reg [  3:0]  ram32_wr_o,
    output reg          ram32_rd_o,
    output reg [  7:0]  ram32_len_o,
    output reg [ 31:0]  ram32_addr_o,
    output reg [ 31:0]  ram32_write_data_o
);

    // FIFO for write data
    reg [63:0] write_fifo_data_in;
    reg        write_fifo_push;
    reg        write_fifo_pop;
    wire [63:0] write_fifo_data_out;
    wire        write_fifo_empty;
    wire        write_fifo_full;

    fifo #(.WIDTH(64), .DEPTH(4)) write_fifo (
        .clk(clk),
        .rst_n(rst_n),
        .push(write_fifo_push),
        .data_in(write_fifo_data_in),
        .pop(write_fifo_pop),
        .data_out(write_fifo_data_out),
        .empty(write_fifo_empty),
        .full(write_fifo_full)
    );

    // FIFO for read data
    reg [31:0] read_fifo_data_in;
    reg        read_fifo_push;
    reg        read_fifo_pop;
    wire [31:0] read_fifo_data_out;
    wire        read_fifo_empty;
    wire        read_fifo_full;

    fifo #(.WIDTH(32), .DEPTH(4)) read_fifo (
        .clk(clk),
        .rst_n(rst_n),
        .push(read_fifo_push),
        .data_in(read_fifo_data_in),
        .pop(read_fifo_pop),
        .data_out(read_fifo_data_out),
        .empty(read_fifo_empty),
        .full(read_fifo_full)
    );

    // State machine for write operation
    typedef enum logic [1:0] {
        WRITE_IDLE,
        WRITE_LOW,
        WRITE_HIGH
    } write_state_t;

    write_state_t write_state, write_next_state;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            write_state <= WRITE_IDLE;
        end else begin
            write_state <= write_next_state;
        end
    end

    always_comb begin
        write_next_state = write_state;
        write_fifo_push = 1'b0;
        ram32_wr_o = 4'b0;
        ram32_write_data_o = 32'b0;
        ram32_addr_o = 32'b0;
        ram32_len_o = 8'b0;

        case (write_state)
            WRITE_IDLE: begin
                if (ram64_wr_o != 8'b0 && !write_fifo_full) begin
                    write_fifo_push = 1'b1;
                    write_fifo_data_in = ram64_write_data_o;
                    ram32_addr_o = ram64_addr_o;
                    ram32_len_o = ram64_len_o;
                    write_next_state = WRITE_LOW;
                end
            end

            WRITE_LOW: begin
                if (ram32_accept_i) begin
                    ram32_wr_o = 4'b1111;
                    ram32_write_data_o = write_fifo_data_out[31:0];
                    write_fifo_pop = 1'b1;
                    write_next_state = WRITE_HIGH;
                end
            end

            WRITE_HIGH: begin
                if (ram32_accept_i) begin
                    ram32_wr_o = 4'b1111;
                    ram32_write_data_o = write_fifo_data_out[63:32];
                    write_fifo_pop = 1'b1;
                    write_next_state = WRITE_IDLE;
                end
            end
        endcase
    end

    // State machine for read operation
    typedef enum logic [1:0] {
        READ_IDLE,
        READ_LOW,
        READ_HIGH
    } read_state_t;

    read_state_t read_state, read_next_state;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            read_state <= READ_IDLE;
        end else begin
            read_state <= read_next_state;
        end
    end

    always_comb begin
        read_next_state = read_state;
        read_fifo_push = 1'b0;
        ram32_rd_o = 1'b0;

        case (read_state)
            READ_IDLE: begin
                if (ram64_rd_o && !read_fifo_full) begin
                    ram32_rd_o = 1'b1;
                    ram32_addr_o = ram64_addr_o;
                    ram32_len_o = ram64_len_o;
                    read_next_state = READ_LOW;
                end
            end

            READ_LOW: begin
                if (ram32_ack_i) begin
                    read_fifo_push = 1'b1;
                    read_fifo_data_in = ram32_read_data_i;
                    read_next_state = READ_HIGH;
                end
            end

            READ_HIGH: begin
                if (ram32_ack_i) begin
                    read_fifo_push = 1'b1;
                    read_fifo_data_in = ram32_read_data_i;
                    read_next_state = READ_IDLE;
                end
            end
        endcase
    end

    // Combine read data from FIFO
    reg [63:0] ram64_read_data_reg;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ram64_read_data_reg <= 64'b0;
        end else if (ram64_rd_o && !read_fifo_empty) begin
            ram64_read_data_reg[31:0] <= read_fifo_data_out;
            read_fifo_pop <= 1'b1;
            if (!read_fifo_empty) begin
                ram64_read_data_reg[63:32] <= read_fifo_data_out;
                read_fifo_pop <= 1'b1;
            end
        end
    end

    assign ram64_read_data_i = ram64_read_data_reg;

endmodule