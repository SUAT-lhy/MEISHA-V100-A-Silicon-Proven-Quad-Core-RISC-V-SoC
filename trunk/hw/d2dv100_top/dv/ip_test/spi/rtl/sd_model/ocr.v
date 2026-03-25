// ocr.v
//以kingston microSDHC为模型
module ocr (
    output reg [31:0] OCR,
    output reg        sdsc,
    output reg        v2sdhc,
    output reg        v2sdsc,
    output reg        v1sdsc,

    input             init_done
);



    // initial begin
    //     // 设置默认的OCR寄存器值
    //     // 高位(31): 卡是否完成电源准备 (1 = 已准备好)
    //     // [30:29]: 卡类型 (01 = SDHC/SDXC)
    //     // [23:15]: 电压范围
    //     // 低位(7): 保留
    //     //ocr_value = 32'h00FF8000; // toshiba 假设卡是SDSC，电压范围为2.7-3.6V
    //     ocr_value = {IN_IDLE_ST,31'h41FF8000}; // kingston 假设卡是SDHC，电压范围为2.7-3.6V
    // end


//version不影响，但是容量模式会影响
    always @(*) begin

        OCR = {init_done,31'h41FF800};

        if (OCR[30] == 1'b0) begin
            sdsc = 1'b1; // 如果OCR的第30位为0，则设置sdsc为真
            v1sdsc = 1'b1;
            v2sdsc = 1'b0;
            v2sdhc = 1'b0;
        end else begin
            sdsc = 1'b0; // 否则，设置为假
            v2sdhc = 1'b1;
            v1sdsc = 1'b0;
            v2sdsc = 1'b0;
        end
    end



endmodule


/*
32位操作条件寄存器存储卡的VDD电压分布。此外，该寄存器还包括状态信息位。如果卡上电过程已完成，则设置一个状态位。该寄存器包括另一个状态位，指示设置通电状态位后的卡容量状态。OCR寄存器应由卡实现。
32位操作条件寄存器存储卡的VDD电压分布。OCR的第7位是为双电压卡新定义的，默认设置为0。如果双电压卡未收到CMD8，则响应中的OCR位7指示0，收到CMD8的双电压卡将此位设置为1。

此外，该寄存器还包括2个状态信息位：

位31 - 卡通电状态位，如果卡通电过程已完成，则设置此状态位。
只要卡忙，相应的位（31）就设置为低。
IN_IDLE_ST
位31:如果卡没有完成上电程序，则该位设置为低。

位30 - 卡容量状态位，如果卡是高容量SD存储卡（比如sdhc和sdxc），则此状态位设置为1。0表示该卡是标准容量SD存储卡（比如sdsc）。卡容量状态位在卡加电过程完成并且卡加电状态位设置为1后有效。主机应读取此状态位以识别标准或高容量SD存储卡。
CCS

OCR寄存器应通过卡片实现。

支持的电压范围编码如表5-1所示。如果相应的位值设置为低，则不支持电压范围。
*/

