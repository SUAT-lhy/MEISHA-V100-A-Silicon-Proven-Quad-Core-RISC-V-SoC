# 1.Introduction to MEISHA Chip
The MEISHA V100 is a silicon-proven SoC manufactured on a 40nm process. It integrates four 64-bit RISC-V RV64GC Rocket cores featuring a 5-stage in-order scalar pipeline with a clock speed of up to 1.0GHz. For AI workloads, the chip features an embedded NVIDIA DLA providing 0.5 TOPS of computing power. Equipped with comprehensive peripherals and interfaces, the platform fully supports the Linux operating system.

**Processing Units**
- Four 64-bit RISC-V RV64GC Rocket cores
- 5-stage in-order scalar pipeline
- RocketTile interconnection via S-BUS
- NVDLA (NVIDIA Deep Learning Accelerator) NPU

**Memory Hierarchy**
- DDR3 main memory (via FPGA)
- 1MB SRAM
- SD card external storage
- 64KB Boot ROM storage

**Bus Architecture**
- S-BUS: Core interconnection
- PERIPHERAL_BUS (AXI-based): Peripheral IP Interconnect: e.g. uart/sd/spi
- CONTROL_BUS: System control IP Interconnect: e.g. plic/clint/debug
- Chiplink: Chip-to-chip communication interface

**Key Peripheral Interfaces**
- UART: Serial communication
- SPI/QSPI: High-speed serial interface, Support Master/Slave Mode
- GPIO: General-purpose I/O
- JTAG: Debug interface

**System Control**
- PLL_WRAPPER: Clock management
- RST_GEN: Reset control
- CLINT: Core Local Interrupt Controller
- PLIC: Platform Level Interrupt Controller
- DTM: Debug and Trace Module

Each MEISHA V100 SoC contains four 64-bit RISC-V RV64GC Rocket cores an in-order scalar processor with 5-stage pipeline. In order to accelerate processor prototyping and provide a flexible framework for hardware/software interface validation, the FPGA prototype based on MEISHA V100 is publicly released.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113s8e10d4e8d995df3c70336545596e8705?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3M4ZTEwZDRlOGQ5OTVkZjNjNzAzMzY1NDU1OTZlODcwNSJ9.vsD66GI71D8niTRXk6TqlQGOjD5YZCaKSVmbB0pXs44&download=image.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 1.FPGA Prototype Based on MEISHA V100</center> 

# 2.MEISHA Test Board Overview
The MEISHA hardware resource block diagram is as follows:
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113rb1b4c2519cb3673cb85b46afcbb54ce4?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3JiMWI0YzI1MTljYjM2NzNjYjg1YjQ2YWZjYmI1NGNlNCJ9.-TPGU-x3nSgoW47J7rv2mVTc3o6RSNRChiviAj4a5m8&download=image.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 2.MEISHA Hardware Resource Block Diagram</center> <br>

PS (Processor System) is the hard processor system built into the chip, typically containing an ARM CPU and fixed peripherals, responsible for running software algorithms and system management; PL (Programmable Logic) is the programmable logic part of a traditional FPGA, which can be flexibly reconfigured according to requirements, mainly responsible for parallel computing, hardware acceleration, and custom interface implementation.

The MEISHA development board adopts a design combining an SoC baseboard and an FPGA core board. The FPGA core board uses the ZYNQ7020 chip. The onboard resources of the SoC baseboard are shown in the following figure:
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r70f1d0d6b806b9b7131ac64b7b65baa3?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3I3MGYxZDBkNmI4MDZiOWI3MTMxYWM2NGI3YjY1YmFhMyJ9.XhPzYmNvEfqnHxlFSLqweozcf_OKA8aOgu8bLTpNI2I&download=soc.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 3.SoC Baseboard Onboard Resources</center> <br>

The FPGA core board used with the SoC baseboard is shown in the following figure:
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r72d411a3a12038c69f99f88f0a902001?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3I3MmQ0MTFhM2ExMjAzOGM2OWY5OWY4OGYwYTkwMjAwMSJ9.2HFRJtfoekqv3yEUTQsrWoc2NuQSTy_IGBNR27jeR5U&download=FPGA.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 4.FPGA Core Board</center><br>

The onboard resources of the FPGA core board are as follows:
- Main Chip: XC7Z020CLG484-1I
- ARM Specification: Cortex-A9 dual-core, main frequency 667M
- FPGA Specification:
  - Architecture: Artix-7
  - Logic Cells: 85K
  - Look-Up Tables (LUTs): 53,200
  - Block RAM: 4.9Mb
  - DSP slices: 220
  - Flip-flops: 106,400
  - Speed Grade: -1, corresponding to a main frequency of 667 MHz
- DDR3L: MT41K256M16TW-107:P * 2 (512x2 MB), 2 chips connected to the PS memory interface, supporting up to 1066MHz main frequency
- eMMC: KLM8G1GEME-B041 (8GB), connected to the PS peripheral interface, using SD mode, supporting up to 50MHz clock frequency
- Flash: W25Q128FV (16MB), connected to the PS peripheral interface, quad-mode, supporting up to 104MHz clock frequency
- Crystal Oscillator: 1 channel 33.3333MHz active crystal oscillator, connected to the PS interface
- 4 DF40HC-100DP board-to-board connectors
  - 54 PS MIO pins are brought out
  - 200 PL pins (96 differential pairs) are brought out

The detailed introduction of peripherals and interfaces is shown in the following table:
**SoC**
- Onboard 40MHz crystal oscillator
- External 5V power input, selectable via USB/DC
- Power DIP switch SW9
- Power reset button SW3
- Hard reset button SW24
- LED indicators
- DIP switch SW21 to change the FPGA boot location

**PS**
- DIP switch SW25, used to modify DEBUG_MODE_SEL and DEBUG_MODE_CONFIG
- CHIP_JTAG debug interface U58
- AUTO_SPI debug interface H61
- CHIP_SPI debug interface H60
- DIP switch SW23, controls H60 signal selection
- Pins connected to FT2232 H62
- SD_SPI debug interface H59
- DIP switch SW26, controls H59 signal selection
- UART2 interface connected to FT2232
- 512MB SDRAM

**PL**
- FPGA_JTAG debug interface U16
- FPGA expansion connectors CN1, CN2, CN5, CN6

<center style="font-size:14px;color:#000000;">Table 1.memory map:</center>

| Base               | Size（B）                                                                               | Description                                          | Notes                                                                                |
| ------------------ | ------------------------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------------ |
| 0x0000_0000        | 4K                                                                                    | debug-controller                                     |                                                                                      |
| 0x0000_3000        | 4K                                                                                    | error-device                                         |                                                                                      |
| 0x0001_0000        | 8K                                                                                    | Mask ROM (32 KiB)                                    |                                                                                      |
| 0x0200_0000        | 64K                                                                                   | CLINT                                                |                                                                                      |
| 0x0C00_0000        | 4M                                                                                    | PLIC                                                 |                                                                                      |
| 0x5000_0000        | 0x6000_0000(256M)                                                                     | PCIE HOST 空间                                         |                                                                                      |
| 0x5000_0000        | 1M                                                                                    | on chip sram                                         |                                                                                      |
| 0x5100_0000        | 4K                                                                                    | soc_lsys                                             |                                                                                      |
| 0x5200_0000        | 4K                                                                                    | spi_1                                                |                                                                                      |
| 0x6000_0000        | 0x6400_0000                                                                           | TIMEOUT                                              |                                                                                      |
| 0x20_0000_0000     | 0x20_0800_0000/128M                                                                   | pci ctrl 空间 timeout                                  |                                                                                      |
| 0x20_0800_0000     | 0x20_1000_0000                                                                        | TIME_OUT                                             |                                                                                      |
| 0x20_1000_0000     | 0x21_000_0000                                                                         | TIME_OUT                                             |                                                                                      |
| 0x21_0000_0000     | 0x3F_FFFF_FFFF                                                                        | TIME_OUT                                             |                                                                                      |
| 0x6400_0000        | 4K                                                                                    | serial                                               | Does not support narrow, sparse                                                                   |
| 0x6400_1000        | 4K                                                                                    | spi_0                                                | Does not support narrow, sparse                                                                    |
| 0x6400_2000        | 4K                                                                                    | gpio                                                 | Does not support narrow, sparse                                                                    |
| 0x8000_0000        | 512M                                                                                  | CHIPLINK                                             |                                                                                      |
| 0xA000_0000        | 512M                                                                                  | DDR（SDRAM）                                           |                                                                                      |
| 0xC000_0000        | 1G                                                                                    | TIME_OUT                                             | Note: Access to this memory space is not allowed; attempting to do so may cause abnormal behavior.                                                             |
| MIG_CHIPLINK_SLAVE | 1 MIG real space 0x8000_0000 - 0xC000_0000 can be remapped to the following space: 0x1000_0000 - 0xE000_0000 (13*256=3328M) | 1 slave port requires address remap, the highest 4 bits can be controlled, connected to SOC_LSYS, default highest 4 bits changed to 1| Integrate chiplink into meishav100 version for subsequent verification 1. Currently, the chiplink peer address is 1000_0000-3000_0000, needs adaptation to the peer chiplink controller |

<center style="font-size:14px;color:#000000;">Table 2.Register Default Values Table:</center>

| Module    | Base Address | Register                                      | Address Offset | Default Value     |  Default Value       | Description                     |
| -------- | ---------- | ---------------------------------------- | ----- | ---------- | ---------- | ----------------------- |
| serial   | 0x64000000 | txdata                                   | 0x00  | 0x0        |            |                         |
|          |            | rxdata                                   | 0x04  | 0x80000000 |            |                         |
|          |            | txctrl                                   | 0x08  | 0x0        |            |                         |
|          |            | rxctrl                                   | 0x0C  | 0x0        |            |                         |
|          |            | div                                      | 0x18  | 0x1b2      |            |                         |
| pll      | 0x51000000 | DEBUG_MODE_CONFIG                        | /     | 0          | 1          | DIP switch SW25, its value affects the default values of some registers |
|          |            | unlock_reg                               | 0x00  | 0x1        | 0x1        |                         |
|          |            | pll_cfg_reg[31:0] (pll_cfg_reg_frac)     | 0x08  | 0x1        | 0x1        |  `pll_cfg_reg_frac[4:0]` serves as the pre-divider, denoted as coefficient M, which divides the reference clock `ref_clk`. Its value ranges from 1 to 31.<br>`pll_cfg_reg_frac[28:5]` is used as the fractional part (`frac`) to achieve finer fractional division ratio configuration. Currently, MEISHA does not support fractional division mode.        |
|          |            | pll_cfg_reg[63:32] (pll_cfg_reg_postdiv) | 0x10  | 0xc98663   | 0xc98663   |  The output clock frequency is given by **Fvco = Fref × NI ÷ M**, where Fref is the reference clock frequency (40 MHz), NI (`pll_cfg_reg_postdiv[29:18]`) is the feedback divider integer ratio (`fbdiv`) used for frequency multiplication, and M (`pll_cfg_reg_frac[4:0]`) is the pre-divider.<br>Then, post-division is applied: `pll_cfg_reg_postdiv[17:15]` as Q0_0, `[14:12]` as Q1_0, `[11:9]` as Q0_1, `[8:6]` as Q1_1, `[5:3]` as Q0_2, and `[2:0]` as Q1_2. Each Q ranges from 1 to 8, corresponding to the stored value plus 1. The three output clocks are: `pll_cpu_clk (clko0)`, `pll_main_clk (clko1)`, and `pll_chiplink_clk (clko2)`. Their frequencies are calculated as, e.g., **Fclko0 = Fvco ÷ Q0_0 ÷ Q1_0**.            |
|          |            |                 pll_cfg_mix[31]                        | 0x100  | 0x1   | 0x1        | The MSB of this register, `pll_cfg_mix[31]`, acts as the power-down (pd) signal. To enable the PLL, this bit must be set to 0; otherwise, the PLL will not output a clock. To modify the PLL configuration registers at power-on, first switch to the reference clock, assert the pd bit to 1, modify the configuration, wait at least 1 µs, then set the pd bit to 0, and finally switch back to using the PLL clock.               |
|          |            |use_which_clk_reg                        | 0x18  | 0x95000    | 0x0        |   `use_which_clk` selects the final clock source (PLL clock, divided PLL clock, reference clock, or divided reference clock). For `cpu_clk`, when `use_which_clk` is set to 0–31, it selects from `{clk_out_ref_temp[MAX_DIV_CNT-1:0], clk_out_cpu_temp[MAX_DIV_CNT-1:0], pll_output_clk_cpu, clk_in1}`. For example, `use_which_clk = 0` selects the `reference clock`; `=2` selects `pll_output_clk_cpu`; values 2–16 correspond to reference clock divided by 2,4,6,…,30; values 17–31 correspond to pll_cpu_clk divided by 2,4,6,…,30. **Note**: This selection only takes effect when use_which_clk[4:0] (for the CPU domain) is non-zero; otherwise, all clock domains use the 40 MHz reference clock.                      |
|          |            | pll_state_reg                            | 0x20  | 0x40000001 | 0x80000000 |                         |
| chiplink |            | chiplink tx                              | 0xB0  | 0x318c6305 |            |                         |
|          |            | chiplink rx                              | 0xB8  | 0x318c6305 |            |                         |
|          |            | mig_slave_base_addr_msb_4_reg            | 0x40  | 0x8        |            |                         |

## 2.1 Power-On Testing
This chapter mainly introduces how to perform basic hardware and software tests on the board. The specific steps for power-on testing are shown in the following figure:
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113s8ee90698ebb26de93337274204705c38?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IjY4NWEyYzlhY2JmZmVlMWRlMmE2NDQ0OSIsImV4cCI6MTc3Mzk5NzU4MywiaWF0IjoxNzczMzkyNzgzLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3M4ZWU5MDY5OGViYjI2ZGU5MzMzNzI3NDIwNDcwNWMzOCJ9.j2o_OJQd0eJbQ5VhpS7R7bj4kf7BxEdR4an5gBrL26o&download=%E4%B8%8A%E7%94%B5%E6%B5%8B%E8%AF%95%E6%AD%A5%E9%AA%A4.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 5.Power-On Test Procedure Flowchart</center><br>

The blue parts are purely hardware operations, while the yellow parts involve software operations.

⚠️ Debugging Precautions
- Avoid plugging or unplugging while the power is on to prevent latch-up effects caused by improper hot-swapping, which could damage the chip.
- After power-on, if any abnormal phenomena such as smoke, unusual odors, electrical discharge sounds or lights, or components overheating occur, immediately disconnect the power supply.

### 2.1.1 Hardware Operations
First, when installing or removing the FPGA, align the connectors of the MEISHA board and the FPGA, and press down firmly vertically or pull it out. After the FPGA is correctly inserted, connect the necessary debugger according to the schematic diagram, power on, and the normal working effect is shown in the figure:
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r77dcafd9665023e4d3cbcfc82b1dc34c?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3I3N2RjYWZkOTY2NTAyM2U0ZDNjYmNmYzgyYjFkYzM0YyJ9.2lmR6MyesVxog2qdLBO1rYCiOeRKzI4ZskzmTJF0Mhs&download=%E6%AD%A3%E5%B8%B8%E5%B7%A5%E4%BD%9C.jpg "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 6.Board Normal Working Condition</center>

### 2.1.2 SPI_SLAVE
SPI_SLAVE is a debug module that directly accesses all accessible address spaces inside the chip through the bus. It is used to verify on-chip peripherals and conduct preliminary testing of the MEISHA chip.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113re822a0f7e4860773aaf40d53dd9a89dc?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3JlODIyYTBmN2U0ODYwNzczYWFmNDBkNTNkZDlhODlkYyJ9.bCIfXyqAv1Hfy2L7OVSx9_YPmsABIFMFDk2Hvcu1rds&download=SPI_SLAVE%E7%B3%BB%E7%BB%9F%E6%A1%86%E5%9B%BE.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 7.SPI_SLAVE System Block Diagram</center>

#### SPI_SLAVE Board-Level Design
The pins of SPI_SLAVE are SPI SCLK, SPI CS, SPI DATA[3:0].
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113rfc1d44d8d75212e85fb499cbe3d890de?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3JmYzFkNDRkOGQ3NTIxMmU4NWZiNDk5Y2JlM2Q4OTBkZSJ9.31J4wirvI8hccpDqYUM7evkKfUXw7dOiSP7UCiDSobc&download=SPI_SLAVE%E7%AE%A1%E8%84%9A.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 8.SPI_SLAVE Pinout</center><br>

The SPI_SLAVE_TEST_MODE signal should default to 1; it seems it is not available as an input pin. When it is 1, SPI SCLK is used as the module clock. It needs to be configured to 0. Configuring it to 1 is for DFT SCAN mode, which is not actually used.

By default, SPI dual-wire full-duplex mode is used, so only SPI SCLK, SPI CS, SPI DATA0, and SPI DATA1 are used. SPI DATA0 corresponds to SPI DO (MOSI), and SPI DATA1 corresponds to SPI DI (MISO). The SPI_SLAVE pins of the MEISHA chip are directly connected to a voltage level translator chip (SN74AXC4T774PWR), which converts the core's 1.8V to the FT2232's 3.3V.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r137b8156ff9cd19ec253964aaf6b2aab?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3IxMzdiODE1NmZmOWNkMTllYzI1Mzk2NGFhZjZiMmFhYiJ9.SFBnYDwdv7TSCGnMROdTvjsM04gkdcZ0ThbHFRnuN5k&download=SPI_SLAVE%E7%94%B5%E5%B9%B3%E8%BD%AC%E6%8D%A2.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 9.SPI_SLAVE Level Shifting Circuit</center><br>

The corresponding channel signals are level-shifted through the voltage level translator chip (A1 corresponds to B1). SPI_DATA0 (core 1.8V) is converted to SPI_DO_U (3.3V connected to FT2232).

Then, DIP switch SW23 is used to select whether to connect to the onboard FT2232 chip or to connect to an external FT2232 via the H60 pins. When connected to the onboard FT2232, H60 can be connected to a logic analyzer to capture SPI signals for debugging, etc.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r2462ebe991e5c4d09a10acbbcb1647cf?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3IyNDYyZWJlOTkxZTVjNGQwOWExMGFjYmJjYjE2NDdjZiJ9.6izwu99F3qXaiHH0U6MIeYSgtIOt6piYgfTr_sGH9Jw&download=SPI_SLAVE%E6%8B%A8%E7%A0%81%E5%BC%80%E5%85%B3.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 10.SPI_SLAVE DIP Switch Connection</center><br>

The SPI_DO_U signal is connected via DIP switch SW23 to SPI DO, which is connected to the BDBUS channel of the FT2232HQ. Therefore, the BDBUS channel of the FT2232HQ needs to be configured as an SPI interface. For details, see "FT2232 Development Board User Manual.pdf".

The onboard FT2232HQ is equipped with a 93AA56BT-I/OT EEPROM as non-volatile memory. To program the FT2232HQ, the board must be powered on to supply power to the FT2232HQ, as the USB interface alone does not power it.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r2420b90fc578a8e5b1a9e73d69f12a10?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3IyNDIwYjkwZmM1NzhhOGU1YjFhOWU3M2Q2OWYxMmExMCJ9.A4QfgPfIYtYOS8-ss9aSbIqw1WBvVKwlEw9Pn0KF7SU&download=FT2232HQ.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 11.FT2232HQ Chip</center><br>

For more flexible use of the SPI chip select signal, the FT2232 BDBUS hardware SPI CS (BDBUS3) is not used; instead, a GPIO (BDBUS4) is used as the chip select signal. When programming the FT2232 SPI, the chip select signal is manually operated via GPIO to meet command requirements.

### 2.1.3 Clock and PLL
The onboard crystal oscillator clock is 40MHz, single-ended input to MEISHA, connected to SYS CLOCK P.
<center>

![](https://tcs-devops.aliyuncs.com/storage/113r33a0a46355bfe11e1d46bf3880a0e2a2?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3IzM2EwYTQ2MzU1YmZlMTFlMWQ0NmJmMzg4MGEwZTJhMiJ9.EBv2K5bRc2ytzUKuYEIV4sSVvPSn9da8Zy2ikFBM7pk&download=SYS_CLOCK_P.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 12.SYS_CLOCK_P Input Connection</center><br>

The entire SoC system is divided into four clock domains: <font color=Chocolate>CPU (RocketTile)</font>, <font color=gold>main</font>, <font color=green>chiplink</font>, and <font color=blue>ddr</font>. 
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r97fafcf8fa55418c0ae2b0081143377e?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3I5N2ZhZmNmOGZhNTU0MThjMGFlMmIwMDgxMTQzMzc3ZSJ9.iBYxR_3Dm4OyNNkUEkDILcjI7o3rQj7NoDhrYYxy9c4&download=image.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 13.SoC Clock Domain Partition</center><br>

Refer to this diagram for details; additionally, the DDR clock domain is not marked, used for the SDR SDRAM chip and the SDRAM controller. The CPU domain mainly consists of the 4 CPU cores. The main clock domain contains most of the sub-modules, system bus, various peripherals, IRAM, etc. The chiplink clock domain is the chiplink bus for communication with the FPGA subsystem. The DDR clock domain is the clock domain for the SDRAM controller and the SDR SDRAM chip.

The crystal oscillator inputs 40MHz as ref_clk into the PLL. The PLL has three registers that can be configured. Finally, three clock domain outputs are generated through frequency division: cpu, main, chiplink. The DDR clock is directly connected to the chiplink clock.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r9a7699c575e47ab798f2c6b8d67f6ad2?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3I5YTc2OTljNTc1ZTQ3YWI3OThmMmM2YjhkNjdmNmFkMiJ9.2_U8U8IpG1JqofQOKkwYkRaBUKPiD5ANl9Kl57IvbtA&download=a0f54a74da93b9e0e45316ca5480eb17.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 14.PLL Structure Diagram</center>


### 2.1.4 JTAG Debugging
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113rec2af9df2a5cba128e0928171cf21585?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3JlYzJhZjlkZjJhNWNiYTEyOGUwOTI4MTcxY2YyMTU4NSJ9.zih16CjXOW6FPCzTt2UmGR6Z06ta-PTPQK0ad_RFpJg&download=JTAG%E8%BF%9E%E7%BA%BF%E5%9B%BE.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 15.JTAG Connection Diagram</center><br>

Connect the chip to the JTAG debugger as shown in the wiring diagram. Pin 9 of output U58 corresponds to the DEBUG_SYSTEM_TDI signal, pin 5 corresponds to the DEBUG_SYSTEM_TMS signal, pin 3 corresponds to the DEBUG_SYSTEM_TDO signal, pin 1 corresponds to the DEBUG_SYSTEM_CLK signal, and pin 10 is connected to ground.

Connect the JTAG debugger to the computer. In the JTAG folder, open Windows cmd and enter `openocd -f freedom.cfg` to start the openocd debugger, as shown in the figure:
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r2c01242cdcc6225381e41d3ebd53b2fe?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3IyYzAxMjQyY2RjYzYyMjUzODFlNDFkM2ViZDUzYjJmZSJ9.zW3HRVhQwnWsyKizufonauiMQ6nOqtr8JoQeFkSFSck&download=openocd.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 16.OpenOCD Startup Interface</center><br>

Open MobaXterm and open a Telnet connection to localhost:4444 to connect to the board, as shown in the figure:
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113rb9f315e5817a1efb84085a40922ae1f2?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3JiOWYzMTVlNTgxN2ExZWZiODQwODVhNDA5MjJhZTFmMiJ9.NwxurEgPudb1GiUTJIqlVrDjU5wTR2gW4t6MrNXStM8&download=GDB.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 17.GDB Connection Interface</center><br>

Before executing instructions, the `halt` command is needed to pause the core for test reads and writes.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113rf5f2edc3776f68e68c838e28c522c6c8?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3JmNWYyZWRjMzc3NmY2OGU2OGM4MzhlMjhjNTIyYzZjOCJ9.qd5qUUd9fmbK645Wq_ozUxB99-nf6SBAwXKVvvvcNHk&download=%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 18.OpenOCD Common Commands</center>

### 2.1.5 SRAM Program Execution Test
To boot from SRAM, the following conditions must be met:
- The program must be linked with the SRAM physical address as the link address.
- The program must be burned to the corresponding SRAM physical address.
- The boot code must jump to that SRAM address for execution.

In the `sdboot.elf.lds` file, modify the target memory region for the .text section from `maskrom_mem` to `memory_mem`, so that the program generates instructions based on the SRAM address during linking.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r3bd71948ba1a174c51166681a006cc47?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3IzYmQ3MTk0OGJhMWExNzRjNTExNjY2ODFhMDA2Y2M0NyJ9.bpg0jhSsFNIJvVY2LO2X90-cmXQdQDotS1kAqbUW3_0&download=%E9%93%BE%E6%8E%A5%E5%9C%B0%E5%9D%80.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 19.Linker Script Modification Example</center><br>

The boot code specifies the execution start address of the user program via `PAYLOAD_DEST`. Set `PAYLOAD_DEST` in `head.s` to the SRAM start physical address, so that the processor fetches and executes the user program from SRAM.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r7768337a331c28f11c6a2217b23dd5db?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3I3NzY4MzM3YTMzMWMyOGYxMWM2YTIyMTdiMjNkZDVkYiJ9.CikO63dZYileDSJ1DXpzWiPPbRnfsrA_QMocFUbFnUU&download=%E5%90%AF%E5%8A%A8%E5%9C%B0%E5%9D%80.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 20.Boot Address Setting</center><br>

During testing, first ensure DEBUG_MODE_SEL is set to 1, corresponding to the core not being released from reset. After reset release, it defaults to booting from ON CHIP SRAM. Write 1 to the reset register sft_rst_reg to keep the core in reset and not running. Modify the head.s and sdboot.elf.lds files, compile and generate a hex file, and burn the hex file to the corresponding SRAM address. Then change the reset register value to 0, and observe the output in the serial port assistant to see if it meets expectations.
<center>

![](https://tcs-devops.aliyuncs.com/storage/113r4c3a2dd0443ed71afeacea30d950f975?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3I0YzNhMmRkMDQ0M2VkNzFhZmVhY2VhMzBkOTUwZjk3NSJ9.xvHnjkRo8Aie_-AeBHB7m9wrZwaU8rit7U-V3WX3lCs&download=SW25.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 21.DIP Switch SW25 Setting (Boot Mode)</center>

### 2.1.6 UART Debugging
Check if the `DEBUG_MODE_CONFIG` on DIP switch SW25 corresponds to 1 (which means using the 40MHz clock). According to the formula:
$f_{baud}=\frac{f_{in}}{div+1}$
where f_baud is 115200, calculate the current UART div and modify the register to ensure the UART can sample correctly.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113r3c4cfe0ac7820151ac4ee5a4415f00b6?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3IzYzRjZmUwYWM3ODIwMTUxYWM0ZWU1YTQ0MTVmMDBiNiJ9.WUtGsu-3AkUUaMahSUZyVRSGA0JG4f8FzMXN126CrzI&download=SW25.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 22.DIP Switch SW25 Setting (UART Debug)</center>
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113rdaad68c74a39f0e255863bde9b1c7d98?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3JkYWFkNjhjNzRhMzlmMGUyNTU4NjNiZGU5YjFjN2Q5OCJ9.0OmYaqiJm_-S5B8H1o5RdirUCECIvBEtBNcbuPKjenE&download=UART%E5%AF%84%E5%AD%98%E5%99%A8.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 23.UART Registers</center>

### 2.1.7 SD Card Data Read Debugging
#### 1. Writing Data to SD Card
Use WinHex to write data to the SD card:

Start the software as an administrator, open the physical drive corresponding to the SD card on the computer, write the clipboard data, and select ASCII HEX format.

#### 2. SD Card Data Read Verification
Refer to the logic in `sd.c` and rewrite the SD card control program `SD.py` in Python.

Hardware Configuration:
- DEBUG_MODE_SEL is set to 1, core does not boot.
- DEBUG_MODE_CONFIG is set to 3, uses 40MHz reference clock.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113qef8cc965239315913aa18e4197bd8033?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3FlZjhjYzk2NTIzOTMxNTkxM2FhMThlNDE5N2JkODAzMyJ9.j_zup3mLbpT7R5DPcLt8CQH2ng4qPVr0uR8mTB1Ajsg&download=image-1.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 24.USD Card Debug Hardware Configuration</center><br>

The software driver actually operates the pins of the auto_spi module.

Check the hardware power supply of the external SD module and adjust its power to a stable 3.3V.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113qa54f167f1b943a4202322efa3737f760?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3FhNTRmMTY3ZjFiOTQzYTQyMDIzMjJlZmEzNzM3Zjc2MCJ9.rIsICV7pVoBqgh3IkDo4rrfxY5o_p23tXY0k4mrdvPk&download=image.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 25.SD Card Module Power Supply Check</center><br>

Considering that SD initialization is sensitive to timing, adjust the clock division parameters of the SPI module so that the SCK clock does not exceed 20MHz, ensuring the SCK frequency during the initialization phase is within the acceptable range for the SD card.

The code workflow first initializes the SD card, then reads data.

The controller sequentially sends commands to the SD card: cmd0, cmd8, acmd41, cmd58, CMD18.

Specify the sector address to read. The SD card returns a response and sends the data block to the controller.

Write data `AABBCCDDEEFF` to address 0 of sector 0 in advance. The code runs the commands normally and reads the 512 bytes of data from that sector.

The overall initialization process runs smoothly, and the SD card read/write test is finally successful.
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113qb8b5022708065c4a059b478f893a7eb9?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3FiOGI1MDIyNzA4MDY1YzRhMDU5YjQ3OGY4OTNhN2ViOSJ9.WjFKrjhORu_Ld2_QPFCZexYExyTzHlMTyFaN00PEOus&download=image-2.png "")
<center style="font-size:14px;color:#000000;">Figure 26.SD Card Read/Write Test Success Screenshot 1</center><br>

![](https://tcs-devops.aliyuncs.com/storage/113q8e1ba7c0aa536681c8c23e9cbafc1f4a?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3Mzk4NzQ4MSwiaWF0IjoxNzczMzgyNjgxLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3E4ZTFiYTdjMGFhNTM2NjgxYzhjMjNlOWNiYWZjMWY0YSJ9.vteMmnV91g-7Uw45N4fHZZkNmXqEFvVbJQtAsdtObQU&download=image-3.png "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 27.SD Card Read/Write Test Success Screenshot 2</center>

### 2.1.8 Installing Serial Port Driver
The board currently uses the FT2232, a USB to serial and parallel interface converter. PyFTDI is a pure Python library for controlling FTDI devices, allowing easy control of FT232H, FT4232H, FT2232H, and other USB-to-serial chips via Python, enabling UART, SPI, I2C, GPIO, and other interface communications. Installation method is as follows:
[https://eblot.github.io/pyftdi/installation.html](https://eblot.github.io/pyftdi/installation.html)

### 2.1.9 Installing Serial Debugging Software
Serial debugging software is needed to monitor the board's output. There are many commonly used serial debugging tools on the market, such as Minicom, MobaXterm, Xshell, etc. Since this document is used on a Linux system, minicom is chosen. Installation and usage tutorials can be found at:
[https://blog.csdn.net/gitblog_09787/article/details/142976810](https://blog.csdn.net/gitblog_09787/article/details/142976810)

### 2.1.10 Chiplink
There is not much detailed introduction about Chiplink, and its usage mainly refers to the FPGA development section of the "One Life One Chip" board.
https://ysyx.oscc.cc/chip/board/official/boards/board-3/#%E7%A1%AC%E4%BB%B6%E8%AE%BE%E8%AE%A1
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113s5e34656a8a6235ffea86d3be2131df9e?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3NDIyODg4NywiaWF0IjoxNzczNjI0MDg3LCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3M1ZTM0NjU2YThhNjIzNWZmZWE4NmQzYmUyMTMxZGY5ZSJ9.w6dbftWPOMN9tMt0Ibdt56xcuFe0Clj908PflM9D-As&download=_cgi-bin_mmwebwx-bin_webwxgetmsgimg__%26MsgID%3D3120467347145370429%26skey%3D%40crypt_fef886f8_7376ce2cb911e98d18527fe6f9edfd6a%26mmweb_appid%3Dwx_webfilehelper.jpg "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 28.Chiplink System Block Design Overview</center><br>
When building the system according to the block diagram above, the following four points need attention:

- The UART1 interface must be enabled in the ZYNQ7 Processing System; otherwise, the Vitis project for "Hello World" cannot be created.

- The ZYNQ7 Processing System should output two clocks: a 10MHz clock for the Chiplink module (must not exceed 25MHz) and a 100MHz clock for the ZYNQ7 Processing System itself.
<center>

![](https://tcs-devops.aliyuncs.com/storage/113sb29a5e161d11a212d924f70b5d6ad113?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3NDIyODg4NywiaWF0IjoxNzczNjI0MDg3LCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3NiMjlhNWUxNjFkMTFhMjEyZDkyNGY3MGI1ZDZhZDExMyJ9.GUVUMZrhTxoURaDxNd5-wo9jayxaNz2r8SLBtRBdQWQ&download=_cgi-bin_mmwebwx-bin_webwxgetmsgimg__%26MsgID%3D2464704669439385186%26skey%3D%40crypt_fef886f8_7376ce2cb911e98d18527fe6f9edfd6a%26mmweb_appid%3Dwx_webfilehelper.jpg "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 29.ZYNQ7 Processing System Clock Configuration</center><br>

- The DDR memory model must be modified to the correct one.
<center>

![](https://tcs-devops.aliyuncs.com/storage/113s4db255812fe19e64fcd142bc6b877f89?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IiIsImV4cCI6MTc3NDIyODg4NywiaWF0IjoxNzczNjI0MDg3LCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3M0ZGIyNTU4MTJmZTE5ZTY0ZmNkMTQyYmM2Yjg3N2Y4OSJ9.-FeB9DNU5rh8Tdk6GdllTqQArN0cdzE_QBhb_qTVipo&download=_cgi-bin_mmwebwx-bin_webwxgetmsgimg__%26MsgID%3D4945181983439798140%26skey%3D%40crypt_fef886f8_7376ce2cb911e98d18527fe6f9edfd6a%26mmweb_appid%3Dwx_webfilehelper.jpg "")
</center> 
<center style="font-size:14px;color:#000000;">Figure 30.DDR Memory Part Number Configuration</center><br>

- Pin constraints need to be added:
```none
create_generated_clock -name chiplink_rx_clk -source [get_pins top_i/chiplink_master_0/clk] -divide_by 1 [get_ports chiplink_rx_clk_0]
set_input_delay -clock [get_clocks chiplink_rx_clk] -min -add_delay 0.680 [get_ports {chiplink_rx_data_0[*]}]
set_input_delay -clock [get_clocks chiplink_rx_clk] -max -add_delay 2.500 [get_ports {chiplink_rx_data_0[*]}]
set_input_delay -clock [get_clocks chiplink_rx_clk] -min -add_delay 0.680 [get_ports chiplink_rx_rst_0]
set_input_delay -clock [get_clocks chiplink_rx_clk] -max -add_delay 2.500 [get_ports chiplink_rx_rst_0]
set_input_delay -clock [get_clocks chiplink_rx_clk] -min -add_delay 0.680 [get_ports chiplink_rx_send_0]
set_input_delay -clock [get_clocks chiplink_rx_clk] -max -add_delay 2.500 [get_ports chiplink_rx_send_0]

create_clock -period 40.000 -name chiplink_tx_clk -waveform {0.000 20.000}
set_output_delay -clock [get_clocks chiplink_tx_clk] -min -add_delay 0.680 [get_ports {chiplink_tx_data_0[*]}]
set_output_delay -clock [get_clocks chiplink_tx_clk] -max -add_delay 2.500 [get_ports {chiplink_tx_data_0[*]}]
set_output_delay -clock [get_clocks chiplink_tx_clk] -min -add_delay 0.680 [get_ports chiplink_tx_rst_0]
set_output_delay -clock [get_clocks chiplink_tx_clk] -max -add_delay 2.500 [get_ports chiplink_tx_rst_0]
set_output_delay -clock [get_clocks chiplink_tx_clk] -min -add_delay 0.680 [get_ports chiplink_tx_send_0]
set_output_delay -clock [get_clocks chiplink_tx_clk] -max -add_delay 2.500 [get_ports chiplink_tx_send_0]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets chiplink_rx_clk_0_IBUF]
```
# 3.Linux Boot and Run
## 3.1 Start-up Process
Power on → Run the bootloader in the maskROM → Load the Linux image file `bbl.bin` in the SD card to the DDR → Start the Linux system The bootloader program stored in maskROM mainly completes loading and starting Linux image files from SD card to DDR storage. The construction of Linux image files is detailed in Section 8.2.

## 3.2 Generating an SD-Bootable Image
The Linux image file is built on ubuntu16.04. Follow the commands below to install and compile the required software package:

`$ apt-get install -y build-essential git autotools-dev texinfo bison flex libgmp-dev libmpfr-dev libmpc-dev gawk zlib1g-dev libssl-dev python unzip libncurses5-dev libglib2.0-dev libpixman-1-dev device-tree-compiler ftp`
`$ wget cpio bc gdisk e2fsprogs vim`

The MEISHA V100 SDK package is partially based on Freedom-u-sdk. Clone the warehouse as follows:

`$ git clone https://github.com/mcd500/freedom-u-sdk.git`
`$ git checkout remotes/origin/linux_u500vc707devkit_config`

Since a number of sub repositories in Freedom-u-sdk are no longer accessible. Follow the steps below to recursively update all required sub repositories:

1.Rename `freedom-u-sdk.gitmodules` to `.gitmodules`, and then replace the `.gitmodules` file in the `freedom-u-sdk` directory.

2.Update submodules:

`$ git submodule sync`
`$ git submodule update --init --recursive`

3.Rename `qemu.gitmodules` to `.gitmodules` and replace the `.gitmodules` file under `freedom-u-sdk/riscv-qemu`.

4.Update submodules:

`$ git submodule sync`
`$ git submodule update --init --recursive`

5.Rename `toolchain.gitmodules` to `.gitmodules` and replace the `.gitmodules` file under `freedom-u-sdk/riscv-gnu-toolchain`.

6.Update submodules:

`$ git submodule sync`
`$ git submodule update --init --recursive`

7.Rename `toolchain-qemu.gitmodules` to `.gitmodules`, and then replace the `.gitmodules` file under `freedom-u-sdk/riscv-gnu-toolchain/riscv-qemu`.

8.Update submodules:

`$ git submodule sync`
`$ git submodule update --init --recursive`

After fully clone the repository, compile and execute the Linux image:

`$ make -j4 BOARD=vc707devkit`

Then the image file bbl.bin is generated in the work directory. Burn the bbl.bin to the SD card.

`$ sudo dd if=bbl.bin of=/dev/sdx bs=512K iflag=fullblock oflag=direct conv=fsync status=progress`

If extra peripherals are needed, modify the `MEISHAV100.dts` file, add the device tree for the corresponding device, and generate a new dtb file.

## 3.3 Compile the ROM bootloader
The bootloader is `sd.c` located in the `sdboot` folder.

The toolchain is `riscv64-unkown-elf-gcc`. Compile the toolchain according to the following steps, provided by the freedom library and add the bin folder path of the toolchain to the system environment variable file `.bashrc`.

Compile `sd.c` with `make` command in the sdboot folder to generate `sdboot.hex` file. Add the path of the file `sdboot.hex` to the `BootROM.v`, e.g., include the scipt `path = "../../builds/vc707-u500devkit/sdboot.hex"`.

## 3.4 MEISHA V100 VC707 FPGA bitstream
To program the MEISHA V100 VC707 FPGA BPI linear flash programming file with Vivado:
1.Click on the Tools→Generate Memory Configuration File ; 2.Select Format as `MCS` ; 3.Select Memory as `mt28gu01gaax1e-bpi-x16` ; 4.Set the file name and path for `Filename`:; 5.Select `Load bitstream files` ; 6.Upload bitfile `meisha.bit` ; 7.Click on `OK` ;

To program the flash with Vivado :

1.Launch Vivado ; 2.Open Hardware Manager, open target board ; 3.Click the FPGA device and select `Add Configuration Memory Device`;
4.Set the following parameters:

|Part	| mt28gu01gaax1e-bpi-x16|
|-----|-----------------------|
|Manufacturer	|      Micron   |
|Alias        	|     28f00ag18f|
|Family        |       g18     |
|Type          |     	bpi     |
|Density       |      	1024    |
|Width	        |       x16     |

5.Click on `OK` to “Do you want to program the configuration memory device now?” ; 6.upload `filemeisha.mcs` to `Configuration file:` , and upload `meisha.prm` to `PRM file:`; 7.set RS Pins = 25:24 ; 8.Click on `OK` .

The programming process requires approximately 5 minutes. The full terminal log is shown on the next session.
## 3.5 Boot Flags
INIT  
CMD0  
CMD8  
ACMD41  
CMD58  
CMD16  
CMD18  
LOADING  
BOOT  
bbl loader  

MEISHAV100, INC.  
<center> 

![](https://tcs-devops.aliyuncs.com/storage/113s324d2b0b65616dece89572061c3bcd2e?Signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBcHBJRCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9hcHBJZCI6IjVlNzQ4MmQ2MjE1MjJiZDVjN2Y5YjMzNSIsIl9vcmdhbml6YXRpb25JZCI6IjY4NWEyYzlhY2JmZmVlMWRlMmE2NDQ0OSIsImV4cCI6MTc3NDQyMTUwMywiaWF0IjoxNzczODE2NzAzLCJyZXNvdXJjZSI6Ii9zdG9yYWdlLzExM3MzMjRkMmIwYjY1NjE2ZGVjZTg5NTcyMDYxYzNiY2QyZSJ9.2fH3owa3I43ncr50ZjMoO1H1HPVsUy9NhckKccU9RN8&download=image-1.png "")
</center> 

MEISHAV100 RISC-V Coreplex

[ 0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000  
[ 0.000000] Linux version 4.15.0-00047-g2751b6a-dirty (freddy@freddy-virtual-machine) (gcc version 7.2.0 (GCC)) #1 SMP Thu Dec 5 14:47:48 CST 2024  
[ 0.000000] bootconsole [early0] enabled  
[ 0.000000] Initial ramdisk at: 0x (ptrval) (11035648 bytes)  
[ 0.000000] Zone ranges:  
[ 0.000000] DMA32 [mem 0x0000000080200000-0x00000000bfffffff]  
[ 0.000000] Normal [mem 0x00000000c0000000-0x00000bffffffffff]  
[ 0.000000] Movable zone start for each node  
[ 0.000000] Early memory node ranges  
[ 0.000000] node 0: [mem 0x0000000080200000-0x00000000bfffffff]  
[ 0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x00000000bfffffff]  
[ 0.000000] software IO TLB [mem 0xbb1fa000-0xbf1fa000] (64MB) mapped at  
[ (ptrval)- (ptrval)]  
[ 0.000000] elf_hwcap is 0x112d  
[ 0.000000] percpu: Embedded 14 pages/cpu @ (ptrval) s28568 r0 d28776 u57344  
[ 0.000000] Built 1 zonelists, mobility grouping on. Total pages: 258055  
[ 0.000000] Kernel command line: earlyprintk  
[ 0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)  
[ 0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)  
[ 0.000000] Sorting __ex_table...  
[ 0.000000] Memory: 948972K/1046528K available (2810K kernel code, 201K rwdata, 734K rodata, 10935K init, 777K bss, 97556K reserved, 0K cma-reserved)  
[ 0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1  
[ 0.000000] Hierarchical RCU implementation.  
[ 0.000000] RCU event tracing is enabled.  
[ 0.000000] RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.  
[ 0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4  
[ 0.000000] NR_IRQS: 0, nr_irqs: 0, preallocated irqs: 0  
[ 0.000000] riscv,cpu_intc,0: 64 local interrupts mapped  
[ 0.000000] riscv,cpu_intc,1: 64 local interrupts mapped  
[ 0.000000] riscv,cpu_intc,2: 64 local interrupts mapped  
[ 0.000000] riscv,cpu_intc,3: 64 local interrupts mapped  
[ 0.000000] ------------[ cut here ]------------  
[ 0.000000] WARNING: CPU: 3 PID: 0 at /home/freddy/Desktop/freedom-u-sdk/linux/drivers/irqchip/irq-riscv-intc.c:167 riscv_irq_enable+0x92/0x94  
[ 0.000000] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 4.15.0-00047-g2751b6a-dirty #1  
[ 0.000000] Call Trace:  
[ 0.000000] [< (ptrval)>] walk_stackframe+0x0/0xa2  
[ 0.000000] [< (ptrval)>] show_stack+0x26/0x34  
[ 0.000000] [< (ptrval)>] dump_stack+0x5e/0x7c  
[ 0.000000] [< (ptrval)>] __warn+0xc6/0xdc [ 0.000000] [< (ptrval)>]  
warn_slowpath_null+0x2c/0x3e  
[ 0.000000] [< (ptrval)>] riscv_irq_enable+0x8e/0x94  
[ 0.000000] [< (ptrval)>] irq_enable+0x3a/0x6a  
[ 0.000000] [< (ptrval)>] __irq_startup+0x80/0x88  
[ 0.000000] [< (ptrval)>] irq_startup+0x4e/0xe2  
[ 0.000000] [< (ptrval)>] irq_activate_and_startup+0x1c/0x28  
[ 0.000000] [< (ptrval)>] __irq_do_set_handler+0x6e/0x134  
[ 0.000000] [< (ptrval)>] irq_set_chained_handler_and_data+0x2c/0x4a  
[ 0.000000] [< (ptrval)>] plic_init+0x1ea/0x316  
[ 0.000000] [< (ptrval)>] of_irq_init+0x136/0x252  
[ 0.000000] [< (ptrval)>] irqchip_init+0x10/0x1c  
[ 0.000000] [< (ptrval)>] init_IRQ+0x8/0x14  
[ 0.000000] [< (ptrval)>] start_kernel+0x20a/0x350  
[ 0.000000] [< (ptrval)>] _sinittext+0x4e/0x56  
[ 0.000000] random: get_random_bytes called from print_oops_end_marker+0x3a/0x52 with crng_init=0  
[ 0.000000] ---[ end trace 66814e3a8c80ec10 ]---  
[ 0.000000] riscv,plic0,c000000: mapped 7 interrupts to 4/8 handlers  
[ 0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns  
[ 0.000229] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns  
[ 0.010473] console [hvc0] enabled  
[ 0.010473] console [hvc0] enabled  
[ 0.016945] bootconsole [early0] disabled  
[ 0.016945] bootconsole [early0] disabled  
[ 0.027372] Calibrating delay loop (skipped), value calculated using timer frequency.. 2.00 BogoMIPS (lpj=10000)  
[ 0.038632] pid_max: default: 32768 minimum: 301  
[ 0.052701] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)  
[ 0.062864] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)  
[ 0.165517] Hierarchical SRCU implementation.  
[ 0.211731] smp: Bringing up secondary CPUs ...  
[ 0.256483] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns  
[ 0.257250] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns  
[ 0.310763] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns  
[ 0.311517] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns  
[ 0.362522] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns  
[ 0.363297] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns  
[ 0.372029] smp: Brought up 1 node, 4 CPUs  
[ 0.467907] devtmpfs: initialized  
[ 0.582030] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns  
[ 0.593941] futex hash table entries: 1024 (order: 4, 65536 bytes)  
[ 0.641011] NET: Registered protocol family 16  
[ 1.041480] SCSI subsystem initialized  
[ 1.069970] usbcore: registered new interface driver usbfs  
[ 1.077864] usbcore: registered new interface driver hub  
[ 1.091722] usbcore: registered new device driver usb  
[ 1.139631] clocksource: Switched to clocksource riscv_clocksource  
[ 1.260992] NET: Registered protocol family 2  
[ 1.300734] TCP established hash table entries: 8192 (order: 4, 65536 bytes)  
[ 1.320561] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)  
[ 1.347969] TCP: Hash tables configured (established 8192 bind 8192)  
[ 1.379826] UDP hash table entries: 512 (order: 2, 16384 bytes)  
[ 1.389719] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)  
[ 1.413720] NET: Registered protocol family 1  
[ 8.092829] Unpacking initramfs...  
[ 15.251565] Initialise system trusted keyrings  
[ 15.268243] workingset: timestamp_bits=62 max_order=18 bucket_order=0  
[ 15.73613] random: fast init done  
[ 15.922895] Key type asymmetric registered  
[ 15.928507] Asymmetric key parser 'x509' registered  
[ 15.933808] io scheduler noop registered  
[ 15.954286] io scheduler cfq registered (default)  
[ 15.960626] io scheduler mq-deadline registered  
[ 15.966384] io scheduler kyber registered  
[ 16.039776] sifive_gpio 64002000.gpio: SiFive GPIO chip registered 4 GPIOs  
[ 20.863221] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled  
[ 20.948618] 64000000.serial: ttySI0 at MMIO 0x64000000 (irq = 1, base_baud = 0) is a sifive-serial  
[ 21.070438] sifive_spi 64001000.spi: CS bits read: 0x1  
[ 21.078674] sifive_spi 64001000.spi: mapped; irq=2, cs=1  
[ 21.119650] sifive_spi 52000000.spi: CS bits read: 0x0  
[ 21.124790] sifive_spi 52000000.spi: Could not auto probe CS lines, defaulting to 1 CS  
[ 21.138769] sifive_spi 52000000.spi: mapped; irq=3, cs=1  
[ 21.182064] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver  
[ 21.192434] usbcore: registered new interface driver usb-storage  
[ 21.214647] usbcore: registered new interface driver usbhid  
[ 21.221956] usbhid: USB HID core driver  
[ 21.241281] NET: Registered protocol family 17  
[ 21.287242] Loading compiled-in X.509 certificates  
[ 23.022815] Freeing unused kernel memory: 10932K  
[ 23.028721] This architecture does not have kernel memory protection.  
Starting logging: OK  
Starting mdev...  
modprobe: can't change directory to '/lib/modules': No such file or directory  
Initializing random number generator... done.  
Starting network...  
Waiting for interface eth0 to appear............... timeout!  
run-parts: /etc/network/if-pre-up.d/wait_iface: exit status 1  
Starting dropbear sshd: OK  
  
Welcome to Buildroot  
buildroot login:  