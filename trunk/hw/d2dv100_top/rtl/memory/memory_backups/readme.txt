axi_ram_umc40lvt.v是基于SJLA40_8192X32X1CM8_top.v的SRAM修改后的iram controller（代码内有注释）
============================================================
rom
	SPLB40_2048X32BM1A.v是memory maker生成的2048×32rom没做任何修改
	SPLB40_2048X32BM1A_top.v是将rom进行例化

single port sram
	SYLB40_512X8X8CM4.v是memory maker生成的512×64ram，具备8字节使能（8byteen）
	SYLB40_512X8X8CM4_top.v是将single_port_ram进行例化

	SYLB40_512X8X4CM4.v是memory maker生成的512×32ram，具备4字节使能（4byteen）
	SYLB40_512X8X4CM4_top.v是将single_port_ram进行例化


two port sram
	SZLB40_512X8X4CM4.v是memory maker生成的512×32ram，具备4字节使能（4byteen）
	SZLB40_512X8X4CM4_top.v是将two_port_ram进行例化


dual port sram
	SJLA40_8192X32X1CM8.v是memory maker生成的真双端口8192×32ram没做任何修改（已按要求重新生成64位ram，如下）
	SJLA40_8192X32X1CM8_top.v是将sram进行例化

	SJLA40_8192X8X8CM8.v是memory maker生成的真双端口8192×64ram带有8字节使能(8byteen)
	SJLA40_8192X8X8CM8_top.v是将sram进行例化
============================================================
axi_ram_umc40lvt.v是基于SJLA40_8192X32X1CM8_top.v的SRAM修改后的iram controller（代码内有注释）
    ||||||| .r42
axi_ram_umc40lvt.v是基于SJLA40_8192X32X1CM8_top.v的SRAM修改后的iram controller（代码内有注释）
