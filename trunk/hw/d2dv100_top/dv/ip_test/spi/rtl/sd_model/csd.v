// csd.v
//参照kingston写的

module csd (
    output reg  [127:0] CSD,
    output reg          CSD_VER,
    output reg  [3:0]   READ_BL_LEN
);

reg    [127:0]  csd_value;

reg    [1:0]    CSD_STRUCTURE;
reg    [7:0]    TAAC;
reg    [7:0]    NSAC;
reg    [7:0]    TRAN_SPEED;
reg    [11:0]   CCC;
reg             READ_BL_PARTIAL;
reg             WRITE_BLK_MISALIGN;
reg             READ_BLK_MISALIGN;
reg             DSR_IMP;
reg    [11:0]   C_SIZE;
reg    [2:0]    VDD_R_CURR_MIN;
reg    [2:0]    VDD_R_CURR_MAX;
reg    [2:0]    VDD_W_CURR_MIN;
reg    [2:0]    VDD_W_CURR_MAX;
reg    [2:0]    C_SIZE_MULT;
reg             ERASE_BLK_EN;
reg    [6:0]    SECTOR_SIZE;
reg    [6:0]    WP_GRP_SIZE;
reg             WP_GRP_ENABLE;
reg    [2:0]    R2W_FACTOR;
reg    [3:0]    WRITE_BL_LEN;
reg             WRITE_BL_PARTIAL;
reg             FILE_FORMAT_GRP;
reg             COPY;
reg             PERM_WRITE_PROTECT;
reg             TMP_WRITE_PROTECT;
reg    [1:0]    FILE_FORMAT;
reg    [6:0]    CRC;


initial begin
    CSD_VER = 1;

/*toshiba
    CSD_STRUCTURE = 2'b0;
    //相关CSD结构的版本号。

    TAAC = 8'b00101101;
    //定义数据访问时间的异步部分。200us。

    NSAC = 8'b0;
    //定义数据访问时间的时钟相关因素的最坏情况。单位为100时钟周期。
    //总访问时间等于TAAC加NSAC，按实际时钟频率计算。这是数据块第一个时钟输出的平均延迟。
    
    TRAN_SPEED = 8'b00110010;
    //传输速率为25Mbps

    CCC = 12'b000100110101;
    //卡类命令寄存器（CCC）定义了该卡支持哪些命令类。支持0,2,4,5,8类

    READ_BL_LEN = 4'b1001;
    //读取的最大读取数据块长度计算为2^READ_BL_LEN。READ_BL_LEN始终等于WRITE_BL_LEN。
    //512Bytes on this card

    READ_BL_PARTIAL = 1'b1;
    //这始终是SD存储卡中的数据“1”，因此可以按字节单位读取块数据。
    //'1'：此卡可以部分读取字节单位。
    
    WRITE_BLK_MISALIGN = 1'b0;
    //定义一个命令要写入的数据块是否可以分布在闪存设备的多个物理块上。
    //'0'：此卡不允许

    READ_BLK_MISALIGN = 1'b0;
    //定义一个命令要读取的数据块是否可以分布在闪存设备的多个物理块上。
    //“0”：此卡上无效

    DSR_IMP = 1'b0;
    //如果设置，则实现（支持）驱动级寄存器（DSR）。
    //'0'：DSR未实现

    C_SIZE = 12'he93;
    //此参数用于计算用户的数据卡容量（不包括安全区域）
    //用户的数据卡容量如下。256MB：233.25MB

    VDD_R_CURR_MIN = 3'b110;
    VDD_R_CURR_MAX = 3'b110;
    VDD_W_CURR_MIN = 3'b110;
    VDD_W_CURR_MAX = 3'b110;
    //VDD时读/写电流的最大值：MINIMUM。
    //60mA@Vdd=2.7 V（最小值）
    //VDD时读/写电流的最大值：MAXMUM。
    //此卡上80mA@VDU=3.3V（最大）

    C_SIZE_MULT = 3'b101;
    //此参数用于计算用户的数据卡容量，不包括受安全保护的数据。请参阅C_SIZE。
    //256MB:27=128在这张卡上

    ERASE_BLK_EN = 1'b1;
    //(Note)
    //（注意！：这与MMC不同。请小心。）
    //WRITE_BL_LEN定义是否允许擦除一个写块（请参阅WRITE_BL_ LEN）
    //“1”：可以通过WRITE_BL_LEN单元擦除
    //所以应该检查这个值，并了解如何擦除。

    SECTOR_SIZE = 7'b0011111;
    //扇区定义了最小可擦除大小。SECTOR_SIZE表示最小可擦除大小，即写入块的数量。
    //1扇区大小=此卡上的32个写块

    WP_GRP_SIZE = 7'b0000000;
    //WP_GRP_SIZE定义了可以为写保护组（WP_group）设置的最小扇区数。
    //值“0”表示1WP组=1个擦除扇区，'127表示1WP组=128个扇区。

    WP_GRP_ENABLE = 1'b0;
    //值“0”表示未实现（支持）WP组功能。

    R2W_FACTOR = 3'b101;
    //R2W_FACTOR将典型写入时间的倍数定义为读取访问时间的倍数。
    //'5'：此卡上的典型写入时间=读取访问时间x32

    WRITE_BL_LEN = 4'b1001;
    //最大写入块长度计算为2^WRITE_BL_LEN
    //“9”：此卡上有512字节

    WRITE_BL_PARTIAL = 1'b0;
    //WRITE_BL_PARTIAL定义部分块写入是否可用。
    //“0”：此卡不支持部分大小写入

    FILE_FORMAT_GRP = 1'b0;
    //指示所选的文件格式组和文件格式组。
    //[0.0]：Hard disk-like file system with partition table on this card

    COPY = 1'b0;
    //定义此卡的内容是原始（=0）还是重复（1）。
    //此位可一次性编程。
    //'0': Original on this card

    PERM_WRITE_PROTECT = 1'b0;
    //永久保护整个卡内容，防止写入或擦除。
    //此位可一次性编程。
    //'0'：Not Protected/Writable on this card

    TMP_WRITE_PROTECT = 1'b0;
    //临时保护整个卡内容，防止写入或擦除。
    //'0'：Not Protected/Writable on this card 

    FILE_FORMAT = 2'b00;
    CRC = 7'b0;//假设为0
    //默认数据的计算CRC在此处设置。
    //如果任何CSD内容发生变化，主机系统负责重新计算此CRC。
    */

//kingston
    CSD_STRUCTURE = 2'b01;
    //相关CSD结构的版本号。

    TAAC = 8'h0E;
    //定义数据访问时间的异步部分。200us。

    NSAC = 8'b0;
    //定义数据访问时间的时钟相关因素的最坏情况。单位为100时钟周期。
    //总访问时间等于TAAC加NSAC，按实际时钟频率计算。这是数据块第一个时钟输出的平均延迟。
    
    TRAN_SPEED = 8'h5A;
    //传输速率为25Mbps

    CCC = 12'h5B5;
    //卡类命令寄存器（CCC）定义了该卡支持哪些命令类。支持0,2,4,5,8类

    READ_BL_LEN = 4'h9;
    //读取的最大读取数据块长度计算为2^READ_BL_LEN。READ_BL_LEN始终等于WRITE_BL_LEN。
    //512Bytes on this card

    READ_BL_PARTIAL = 1'b0;
    //这始终是SD存储卡中的数据“1”，因此可以按字节单位读取块数据。
    //'1'：此卡可以部分读取字节单位。
    
    WRITE_BLK_MISALIGN = 1'b0;
    //定义一个命令要写入的数据块是否可以分布在闪存设备的多个物理块上。
    //'0'：此卡不允许

    READ_BLK_MISALIGN = 1'b0;
    //定义一个命令要读取的数据块是否可以分布在闪存设备的多个物理块上。
    //“0”：此卡上无效

    DSR_IMP = 1'b0;
    //如果设置，则实现（支持）驱动级寄存器（DSR）。
    //'0'：DSR未实现

    C_SIZE = 22'h00E93F;
    //此参数用于计算用户的数据卡容量（不包括安全区域）
    //用户的数据卡容量如下。256MB：233.25MB

    ERASE_BLK_EN = 1'b1;
    //(Note)
    //（注意！：这与MMC不同。请小心。）
    //WRITE_BL_LEN定义是否允许擦除一个写块（请参阅WRITE_BL_ LEN）
    //“1”：可以通过WRITE_BL_LEN单元擦除
    //所以应该检查这个值，并了解如何擦除。

    SECTOR_SIZE = 7'h7F;
    //扇区定义了最小可擦除大小。SECTOR_SIZE表示最小可擦除大小，即写入块的数量。
    //1扇区大小=此卡上的32个写块

    WP_GRP_SIZE = 7'b0000000;
    //WP_GRP_SIZE定义了可以为写保护组（WP_group）设置的最小扇区数。
    //值“0”表示1WP组=1个擦除扇区，'127表示1WP组=128个扇区。

    WP_GRP_ENABLE = 1'b0;
    //值“0”表示未实现（支持）WP组功能。

    R2W_FACTOR = 3'h2;
    //R2W_FACTOR将典型写入时间的倍数定义为读取访问时间的倍数。
    //'5'：此卡上的典型写入时间=读取访问时间x32

    WRITE_BL_LEN = 4'h9;
    //最大写入块长度计算为2^WRITE_BL_LEN
    //“9”：此卡上有512字节

    WRITE_BL_PARTIAL = 1'b0;
    //WRITE_BL_PARTIAL定义部分块写入是否可用。
    //“0”：此卡不支持部分大小写入

    FILE_FORMAT_GRP = 1'b0;
    //指示所选的文件格式组和文件格式组。
    //[0.0]：Hard disk-like file system with partition table on this card

    COPY = 1'b0;
    //定义此卡的内容是原始（=0）还是重复（1）。
    //此位可一次性编程。
    //'0': Original on this card

    PERM_WRITE_PROTECT = 1'b0;
    //永久保护整个卡内容，防止写入或擦除。
    //此位可一次性编程。
    //'0'：Not Protected/Writable on this card

    TMP_WRITE_PROTECT = 1'b0;
    //临时保护整个卡内容，防止写入或擦除。
    //'0'：Not Protected/Writable on this card 

    FILE_FORMAT = 2'b00;
    CRC = 7'b0;//假设为0
    //默认数据的计算CRC在此处设置。
    //如果任何CSD内容发生变化，主机系统负责重新计算此CRC。
end



// 将拼接后的二进制序列赋值给cid_value
always @(*) begin
    //csd_value = csd_binary_sequence;
    csd_value = {CSD_STRUCTURE, 6'b0, TAAC, NSAC, TRAN_SPEED, CCC, READ_BL_LEN, READ_BL_PARTIAL, 
                 WRITE_BLK_MISALIGN, READ_BLK_MISALIGN, DSR_IMP, 6'b0, C_SIZE, 1'b0, ERASE_BLK_EN, 
                 SECTOR_SIZE, WP_GRP_SIZE, WP_GRP_ENABLE, 2'b0, R2W_FACTOR, WRITE_BL_LEN, 
                 WRITE_BL_PARTIAL, 5'b0, FILE_FORMAT_GRP, COPY, PERM_WRITE_PROTECT, TMP_WRITE_PROTECT, 
                 FILE_FORMAT, 2'b0, CRC, 1'b1};
    CSD = csd_value;
end

/*
    csd_reg = 
    //可编程部分
*/

endmodule




/*P78
CSD是卡特定数据寄存器，提供128位宽度的信息。

此寄存器的某些字段可由PROGRAM_CSD（CMD27）写入。

有关允许的块大小和可编程性的信息存储在CSD中
有关扇区大小（以块为单位）的信息存储在CSD中。
WP组：是为支持写保护组的设备提供单独写保护的最小单元。它的大小是将由一位写保护的组的数量。WP组的大小对于每个设备都是固定的。有关大小的信息存储在CSD中。

P99
卡特定数据寄存器提供有关访问卡内容的信息。CSD定义了数据格式、纠错类型、最大数据访问时间、是否可以使用DSR寄存器等。
寄存器的可编程部分（标记为W或E的条目，见下文）可以通过CMD27进行更改。下表中的条目类型编码如下：R=可读，W（1）=一次可写，W=多次可写。



111CSD_STRUCTURE
111TAAC
111NSAC
111TRAN_SPEED
111CCC
111READ_BL_LEN
111READ_BL_PARTIAL
111WRITE_BLK_MISALIGN
111READ_BLK_MISALIGN
111DSR_IMP
111C_SIZE
111VDD_R_CURR_MIN
111VDD_R_CURR_MAX
111VDD_W_CURR_MIN
111VDD_W_CURR_MAX
111C_SIZE_MULT
111ERASE_BLK_EN(Note)
111SECTOR_SIZE
111WP_GRP_SIZE
111WP_GRP_ENABLE
111R2W_FACTOR
111WRITE_BL_LEN
111WRITE_BL_PARTIAL
111FILE_FORMAT_GRP
111COPY
111PERM_WRITE_PROTECT
111TMP_WRITE_PROTECT
111FILE_FORMAT
111CRC*/