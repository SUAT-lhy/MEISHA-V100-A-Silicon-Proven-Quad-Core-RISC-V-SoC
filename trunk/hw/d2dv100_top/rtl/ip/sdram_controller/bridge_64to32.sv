module sram_bridge_64to32 (
    input  logic         clk,
    input  logic         rst_n,
    input  logic [7:0]   ram64_wr_strb_i,
    input  logic         ram64_rd_i,
    input  logic [31:0]  ram64_addr_i,
    input  logic [63:0]  ram64_write_data_i,
    output logic         ram64_accept_o,
    output logic         ram64_ack_o,
    output logic [63:0]  ram64_read_data_o,
    input  logic         ram32_accept_i,
    input  logic         ram32_ack_i,
    input  logic [31:0]  ram32_read_data_i,
    output logic [3:0]   ram32_wr_strb_o,
    output logic         ram32_rd_o,
    output logic [31:0]  ram32_addr_o,
    output logic [31:0]  ram32_write_data_o
);

    // 写数据 FIFO 实例
    logic [63:0] fifo_wr_data_out;
    logic fifo_wr_empty, fifo_wr_full;
    logic fifo_wr_en, fifo_rd_en;

    cbb_fifo #(
        .WIDTH(64),
        .DEPTH(4)
    ) fifo_wr (
        .clk       (clk),
        .rst_n     (rst_n),
        .wr_data   (ram64_write_data_i),
        .wr_en     (fifo_wr_en),
        .rd_data   (fifo_wr_data_out),
        .rd_en     (fifo_rd_en),
        .empty     (fifo_wr_empty),
        .full      (fifo_wr_full)
    );

    // 读数据 FIFO 实例
    logic [31:0] fifo_rd_data_in, fifo_rd_data_out;
    logic fifo_rd_empty, fifo_rd_full;
    logic fifo_wr_rd_en, fifo_rd_wr_en;

    cbb_fifo #(
        .WIDTH(32),
        .DEPTH(4)
    ) fifo_rd (
        .clk       (clk),
        .rst_n     (rst_n),
        .wr_data   (fifo_rd_data_in),
        .wr_en     (fifo_rd_wr_en),
        .rd_data   (fifo_rd_data_out),
        .rd_en     (fifo_wr_rd_en),
        .empty     (fifo_rd_empty),
        .full      (fifo_rd_full)
    );

    typedef enum logic [1:0] {
        IDLE,
        WRITE,
        READ
    } state_t;

    state_t state, next_state;

    // 状态机逻辑
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always_comb begin
        next_state = state;
        ram64_accept_o = 0;
        ram64_ack_o = 0;
        ram32_wr_strb_o = 4'b0;
        ram32_rd_o = 0;
        ram32_addr_o = 0;
        ram32_write_data_o = 0;
        fifo_wr_en = 0;
        fifo_rd_en = 0;
        fifo_rd_wr_en = 0;
        fifo_wr_rd_en = 0;
        case (state)
            IDLE: begin
                if (ram64_wr_strb_i != 0) begin
                    if (!fifo_wr_full) begin
                        next_state = WRITE;
                        fifo_wr_en = 1;
                        ram64_accept_o = 1;
                    end
                end else if (ram64_rd_i) begin
                    if (!fifo_rd_empty) begin
                        next_state = READ;
                        ram64_accept_o = 1;
                    end
                end
            end
            WRITE: begin
                if (!fifo_wr_full && ram32_accept_i) begin
                    ram32_wr_strb_o <= ram64_wr_strb_i[3:0];
                    ram32_addr_o <= ram64_addr_i;
                    ram32_write_data_o <= ram64_write_data_i[31:0];
                    ram64_ack_o = 1;
                    next_state = IDLE;
                end
            end
            READ: begin
                if (!fifo_rd_empty && ram32_accept_i) begin
                    ram32_rd_o = 1;
                    ram32_addr_o = ram64_addr_i;
                    if (ram32_ack_i) begin
                        fifo_rd_data_in = ram32_read_data_i;
                        fifo_rd_wr_en = 1; // 写使能
                        if (!fifo_wr_rd_en) begin
                            fifo_wr_rd_en = 1; // 读使能
                            ram64_read_data_o <= {fifo_rd_data_out, fifo_rd_data_out}; // 例如合并，请根据需要调整
                            ram64_ack_o = 1;
                            next_state = IDLE;
                        end
                    end
                end
            end
        endcase
    end

endmodule
