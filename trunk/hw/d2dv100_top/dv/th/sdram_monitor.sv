// File: sdram_monitor.sv
// Description: SDRAM协议监控接口（自动判断读写方向）

interface sdram_monitor(input logic sdram_clk_0);
    //-------------------------
    // 1. 信号声明（与波形图严格对应）
    //-------------------------
    logic        sdram_ras_0;            // 行地址选通
    logic        sdram_cas_0;            // 列地址选通
    logic        sdram_we_0;             // 写使能
    logic [1:0]  sdram_ba_0;             // Bank地址
    logic [12:0] sdram_addr_0;           // 地址总线
    wire  [15:0] sdram_data;             // 双向数据总线（图中sdram_data_output_o/input_i合并）
    logic [1:0]  sdram_dqm_0;            // 数据掩码

    //-------------------------
    // 2. 内部状态与配置
    //-------------------------
    typedef enum {
          CMD_ACTIVE = 3'b011
        , CMD_READ = 3'b101
        , CMD_WRITE = 3'b100
        , CMD_BURST_STOP = 3'b110
        , CMD_PRECHARGE = 3'b010
        , CMD_REFRESH = 3'b001
        , CMD_MRS = 3'b000
        , CMD_NOP = 3'b111
    } sdram_cmd_t;
    
    sdram_cmd_t current_cmd;
    logic [15:0] captured_data;
    logic is_write_phase = 0;

    //-------------------------
    // 3. 时钟域同步与命令解码
    //-------------------------

    assign current_cmd = {sdram_ras_0, sdram_cas_0, sdram_we_0};

    //-------------------------
    // 4. 命令打印与协议检查
    //-------------------------
    task automatic print_command();
        string msg;
        case (current_cmd)
            // CMD_PRECHARGE: 
            //     $sformat(msg, "PRECHARGE %s", sdram_addr_0[10] ? "All" : "Single");
            // CMD_ACTIVE: 
            //     $sformat(msg, "ACTIVE  Bank=%0d Row=0x%04x", sdram_ba_0, sdram_addr_0);
            // CMD_WRITE: 
            //     $sformat(msg, "WRITE   Bank=%0d Col=0x%04x Data=0x%04x", 
            //             sdram_ba_0, sdram_addr_0[9:0], sdram_data);
            // CMD_BURST_STOP: 
            //     $sformat(msg, "BURST_STOP");
            // CMD_REFRESH: 
            //     $sformat(msg, "REFRESH");
            CMD_READ: 
                $sformat(msg, "READ    Bank=%0d Col=0x%04x", sdram_ba_0, sdram_addr_0[9:0]);
            CMD_MRS: 
                $sformat(msg, "MRS     Mode=0x%04x", sdram_addr_0);
            default: ;
        endcase
        $display("[%0t] SDRAM_CMD: %s", $time, msg);
        // if (current_cmd != CMD_NOP && current_cmd != CMD_REFRESH) begin
        //     $display("[%0t] SDRAM_CMD: %s", $time, msg);
        // end
    endtask

    // 每个时钟周期打印命令
    always @(posedge sdram_clk_0) begin
        print_command();
    end

    //-------------------------
    // 5. 时序检查（示例：tRCD检查）
    //-------------------------
    int trcd_cycles = 1;  // 根据模式寄存器配置
    int active_to_read_delay = 0;

    always @(posedge sdram_clk_0) begin
        if (current_cmd == CMD_ACTIVE) begin
            active_to_read_delay <= 0;
        end else if (active_to_read_delay < trcd_cycles) begin
            active_to_read_delay <= active_to_read_delay + 1;
        end

        if (current_cmd == CMD_READ && active_to_read_delay < trcd_cycles) begin
            $error("[Protocol] tRCD violation: ACTIVE to READ delay=%0d < %0d", 
                   active_to_read_delay, trcd_cycles);
        end
    end

endinterface