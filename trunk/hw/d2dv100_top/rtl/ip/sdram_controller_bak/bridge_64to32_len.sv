module bridge_64to32 (
    input  logic         clk,
    input  logic         rst_n,
    input  logic [7:0]   ram64_wr_i,
    input  logic         ram64_rd_i,
    input  logic [7:0]   ram64_len_i,
    input  logic [31:0]  ram64_addr_i,
    input  logic [63:0]  ram64_write_data_i,
    output logic         ram64_accept_o,
    output logic         ram64_ack_o,
    output logic         ram64_error_o,
    output logic [63:0]  ram64_read_data_o,
    input  logic         ram32_accept_i,
    input  logic         ram32_ack_i,
    input  logic         ram32_error_i,
    input  logic [31:0]  ram32_read_data_i,
    output logic [3:0]   ram32_wr_o,
    output logic         ram32_rd_o,
    output logic [7:0]   ram32_len_o,
    output logic [31:0]  ram32_addr_o,
    output logic [31:0]  ram32_write_data_o
);

    // State variables for read and write operations
    typedef enum logic [1:0] {IDLE, READ, WRITE} state_t;
    state_t state, next_state;

    // Internal registers
    reg [31:0] ram32_addr_reg;
    reg [7:0]  ram32_len_reg;
    reg [31:0] ram32_write_data_reg;
    reg [63:0] ram64_read_data_reg;
    reg [31:0] internal_addr;
    reg [7:0]  internal_len;
    reg [63:0] internal_write_data;

    // FIFO for write data
    logic [31:0] write_fifo_data_in;
    logic        write_fifo_push;
    logic        write_fifo_pop;
    logic        write_fifo_empty;
    logic        write_fifo_full;
    logic [31:0] write_fifo_data_out;

    // FIFO for read data
    logic [31:0] read_fifo_data_in;
    logic        read_fifo_push;
    logic        read_fifo_pop;
    logic        read_fifo_empty;
    logic        read_fifo_full;
    logic [31:0] read_fifo_data_out;

    // Instantiate FIFOs
    fifo #(.WIDTH(32), .DEPTH(8)) write_fifo (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(write_fifo_data_in),
        .push(write_fifo_push),
        .pop(write_fifo_pop),
        .empty(write_fifo_empty),
        .full(write_fifo_full),
        .data_out(write_fifo_data_out)
    );

    fifo #(.WIDTH(32), .DEPTH(8)) read_fifo (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(read_fifo_data_in),
        .push(read_fifo_push),
        .pop(read_fifo_pop),
        .empty(read_fifo_empty),
        .full(read_fifo_full),
        .data_out(read_fifo_data_out)
    );

    // State machine logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            ram64_accept_o <= 1'b0;
            ram64_ack_o <= 1'b0;
            ram64_error_o <= 1'b0;
            ram64_read_data_o <= 64'b0;
            ram32_wr_o <= 4'b0;
            ram32_rd_o <= 1'b0;
            ram32_len_o <= 8'b0;
            ram32_addr_o <= 32'b0;
            ram32_write_data_o <= 32'b0;
            ram32_addr_reg <= 32'b0;
            ram32_len_reg <= 8'b0;
            ram32_write_data_reg <= 32'b0;
            internal_addr <= 32'b0;
            internal_len <= 8'b0;
            internal_write_data <= 64'b0;
        end else begin
            state <= next_state;
            ram64_accept_o <= 1'b0;
            ram64_ack_o <= 1'b0;
            ram64_error_o <= 1'b0;
            ram64_read_data_o <= ram64_read_data_reg;
            ram32_wr_o <= 4'b0;
            ram32_rd_o <= 1'b0;
            ram32_len_o <= ram32_len_reg;
            ram32_addr_o <= ram32_addr_reg;
            ram32_write_data_o <= ram32_write_data_reg;

            case (state)
                IDLE: begin
                    if (ram64_wr_i != 8'b0) begin
                        internal_addr <= ram64_addr_i;
                        internal_len <= ram64_len_i;
                        internal_write_data <= ram64_write_data_i;
                        next_state = WRITE;
                    end else if (ram64_rd_i) begin
                        internal_addr <= ram64_addr_i;
                        internal_len <= ram64_len_i;
                        next_state = READ;
                    end
                end

                WRITE: begin
                    if (!write_fifo_full) begin
                        write_fifo_push <= 1'b1;
                        write_fifo_data_in <= internal_write_data[31:0];
                        ram32_wr_o <= 4'b1111;
                        ram32_addr_reg <= internal_addr;
                        ram32_len_reg <= internal_len;
                        ram32_write_data_reg <= internal_write_data[31:0];
                        internal_addr <= internal_addr + 4;
                        internal_write_data <= {internal_write_data[63:32], 32'b0};
                        if (internal_len == 1) begin
                            ram64_ack_o <= 1'b1;
                            next_state <= IDLE;
                        end else begin
                            internal_len <= internal_len - 1;
                        end
                    end
                end

                READ: begin
                    if (!read_fifo_full && !ram32_error_i) begin
                        ram32_rd_o <= 1'b1;
                        ram32_addr_reg <= internal_addr;
                        ram32_len_reg <= internal_len;
                        if (ram32_ack_i) begin
                            read_fifo_push <= 1'b1;
                            read_fifo_data_in <= ram32_read_data_i;
                            internal_addr <= internal_addr + 4;
                            internal_len <= internal_len - 1;
                            if (internal_len == 0) next_state <= IDLE;
                        end
                    end
                end
            endcase
        end
    end

    // Handle FIFO pop for read data
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ram64_read_data_reg <= 64'b0;
        end else if (read_fifo_pop) begin
            if (internal_len == 1) begin
                ram64_read_data_reg[63:32] <= 32'b0;
                ram64_read_data_reg[31:0] <= read_fifo_data_out;
            end else begin
                ram64_read_data_reg[31:0] <= read_fifo_data_out;
                ram64_read_data_reg[63:32] <= read_fifo_data_out;
            end
        end
    end

    // Control FIFO pop
    always_comb begin
        read_fifo_pop = 1'b0;
        if (state == IDLE && !read_fifo_empty) begin
            read_fifo_pop = 1'b1;
        end
    end

endmodule