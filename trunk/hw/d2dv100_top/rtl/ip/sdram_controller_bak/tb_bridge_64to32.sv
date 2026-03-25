module tb_sram_bridge_64to32;
    // 时钟与复位信号
    logic clk;
    logic rst_n;

    // 64位端口信号
    logic [7:0]   ram64_wr_strb_i;
    logic         ram64_rd_i;
    logic [31:0]  ram64_addr_i;
    logic [63:0]  ram64_write_data_i;
    logic         ram64_accept_o;
    logic         ram64_ack_o;
    logic [63:0]  ram64_read_data_o;

    // 32位端口信号
    logic         ram32_accept_i;
    logic         ram32_ack_i;
    logic [31:0]  ram32_read_data_i;
    logic [3:0]   ram32_wr_strb_o;
    logic         ram32_rd_o;
    logic [31:0]  ram32_addr_o;
    logic [31:0]  ram32_write_data_o;

    // 实例化被测模块
    sram_bridge_64to32 uut (
        .clk(clk),
        .rst_n(rst_n),
        .ram64_wr_strb_i(ram64_wr_strb_i),
        .ram64_rd_i(ram64_rd_i),
        .ram64_addr_i(ram64_addr_i),
        .ram64_write_data_i(ram64_write_data_i),
        .ram64_accept_o(ram64_accept_o),
        .ram64_ack_o(ram64_ack_o),
        .ram64_read_data_o(ram64_read_data_o),
        .ram32_accept_i(ram32_accept_i),
        .ram32_ack_i(ram32_ack_i),
        .ram32_read_data_i(ram32_read_data_i),
        .ram32_wr_strb_o(ram32_wr_strb_o),
        .ram32_rd_o(ram32_rd_o),
        .ram32_addr_o(ram32_addr_o),
        .ram32_write_data_o(ram32_write_data_o)
    );

    // 时钟生成
    always #5 clk = ~clk;

    // 复位过程
    initial begin
        clk = 0;
        rst_n = 0;
        #20;
        rst_n = 1;
    end

    // 模拟32位端口
    initial begin
        ram32_accept_i = 0;
        ram32_ack_i = 0;
        ram32_read_data_i = 0;
        wait (rst_n == 1);
        #30;

        // 模拟32位写接受
        forever begin
            @(posedge clk);
            ram32_accept_i <= 1;
            @(posedge clk);
            ram32_accept_i <= 0;
        end
    end

    // 模拟32位读响应
    initial begin
        forever begin
            @(posedge clk);
            if (ram32_rd_o) begin
                ram32_read_data_i <= $random;
                ram32_ack_i <= 1;
                @(posedge clk);
                ram32_ack_i <= 0;
            end
        end
    end

    // 添加 FSDB dump 功能
    initial begin
        $fsdbDumpfile("waveform.fsdb");
        $fsdbDumpvars(0, tb_sram_bridge_64to32);
    end

    // 测试序列
    initial begin
        // 初始化信号
        ram64_wr_strb_i = 0;
        ram64_rd_i = 0;
        ram64_addr_i = 0;
        ram64_write_data_i = 0;

        // 等待复位完成
        wait (rst_n == 1);
        #30;

        // 测试写操作
        @(posedge clk);
        ram64_addr_i = 32'h0000_0001;
        ram64_wr_strb_i = 8'hFF;
        ram64_write_data_i = 64'hDEAD_BEEF_F00D_FACE;
        @(posedge clk);
        ram64_wr_strb_i = 0;
        ram64_write_data_i = 0;
        
        // 等待写响应
        wait (ram64_ack_o);
        @(posedge clk);

        // 测试读操作
        @(posedge clk);
        ram64_rd_i = 1;
        ram64_addr_i = 32'h0000_0001;
        @(posedge clk);
        ram64_rd_i = 0;

        // 等待读响应
        wait (ram64_ack_o);
        $display("Read Data: %h", ram64_read_data_o);
        @(posedge clk);

        // 结束仿真
        $finish;
    end
endmodule
