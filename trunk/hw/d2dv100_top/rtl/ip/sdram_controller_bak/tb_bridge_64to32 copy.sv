`timescale 1ns / 1ps

module tb_bridge_64to32;

    // Clock and reset
    reg clk;
    reg rst_n;

    // 64-bit interface signals
    reg           ram64_accept_i;
    reg           ram64_ack_i;
    reg           ram64_error_i;
    reg [63:0]    ram64_read_data_i;
    reg [  7:0]  ram64_wr_o;
    reg          ram64_rd_o;
    reg [  7:0]  ram64_len_o;
    reg [ 31:0]  ram64_addr_o;
    reg [ 63:0]  ram64_write_data_o;

    // 32-bit interface signals
    reg           ram32_accept_i;
    reg           ram32_ack_i;
    reg           ram32_error_i;
    reg [31:0]    ram32_read_data_i;
    reg [  3:0]  ram32_wr_o;
    reg          ram32_rd_o;
    reg [  7:0]  ram32_len_o;
    reg [ 31:0]  ram32_addr_o;
    reg [ 31:0]  ram32_write_data_o;

    // Instantiate the DUT (Device Under Test)
    bridge_64to32 dut (
        .clk(clk),
        .rst_n(rst_n),
        .ram64_accept_i(ram64_accept_i),
        .ram64_ack_i(ram64_ack_i),
        .ram64_error_i(ram64_error_i),
        .ram64_read_data_i(ram64_read_data_i),
        .ram64_wr_o(ram64_wr_o),
        .ram64_rd_o(ram64_rd_o),
        .ram64_len_o(ram64_len_o),
        .ram64_addr_o(ram64_addr_o),
        .ram64_write_data_o(ram64_write_data_o),
        .ram32_accept_i(ram32_accept_i),
        .ram32_ack_i(ram32_ack_i),
        .ram32_error_i(ram32_error_i),
        .ram32_read_data_i(ram32_read_data_i),
        .ram32_wr_o(ram32_wr_o),
        .ram32_rd_o(ram32_rd_o),
        .ram32_len_o(ram32_len_o),
        .ram32_addr_o(ram32_addr_o),
        .ram32_write_data_o(ram32_write_data_o)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset sequence
    initial begin
        rst_n = 0;
        #10 rst_n = 1;
    end

    // Test sequences
    initial begin
        // Initialize signals
        ram32_accept_i = 1;
        ram32_ack_i = 0;
        ram32_error_i = 0;
        ram32_read_data_i = 32'b0;

        // Write test
        #10;
        ram64_addr_o = 32'h1234_5678;
        ram64_write_data_o = 64'hDEADBEEF_CAFECAFE;
        ram64_len_o = 8;
        ram64_wr_o = 8'b1111_1111;

        #10;
        ram32_accept_i = 1;
        #10;
        ram32_ack_i = 1;
        #10;
        ram32_ack_i = 0;
        #10;
        ram32_ack_i = 1;
        #10;
        ram32_ack_i = 0;

        // Read test
        #10;
        ram64_addr_o = 32'h1234_5678;
        ram64_len_o = 8;
        ram64_rd_o = 1;

        #10;
        ram32_read_data_i = 32'hDEADBEEF;
        ram32_ack_i = 1;
        #10;
        ram32_ack_i = 0;
        #10;
        ram32_read_data_i = 32'hCAFECAFE;
        ram32_ack_i = 1;
        #10;
        ram32_ack_i = 0;

        // Finish simulation
        #10 $finish;
    end

    // Monitor
    initial begin
        $monitor("Time %0t: ram64_wr_o = %b, ram64_addr_o = %h, ram64_write_data_o = %h, ram32_wr_o = %b, ram32_addr_o = %h, ram32_write_data_o = %h", $time, ram64_wr_o, ram64_addr_o, ram64_write_data_o, ram32_wr_o, ram32_addr_o, ram32_write_data_o);
        $monitor("Time %0t: ram64_rd_o = %b, ram64_addr_o = %h, ram64_read_data_i = %h, ram32_rd_o = %b, ram32_addr_o = %h, ram32_read_data_i = %h", $time, ram64_rd_o, ram64_addr_o, ram64_read_data_i, ram32_rd_o, ram32_addr_o, ram32_read_data_i);
    end

    // Dump FSDB waveforms
    initial begin
        $dumpfile("tb_bridge_64to32.fsdb");
        $dumpvars(0, tb_bridge_64to32);
    end

endmodule