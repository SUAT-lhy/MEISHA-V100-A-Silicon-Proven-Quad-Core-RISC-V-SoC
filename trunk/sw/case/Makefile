# RISCV environment variable must be set

export RISCV=/work/install/riscv/toolchain
export TOOLCHAIN_PATH=${RISCV}
export RISCV_TOOLCHAIN=${TOOLCHAIN_PATH}
export RISCV_GCC=${RISCV}/bin/riscv32-unknown-elf-gcc
export RISCV_OBJCOPY=${RISCV}/bin/riscv32-unknown-elf-objcopy
# RISCV lib maybe conflict to vcs run
export LD_LIBRARY_PATH=${RISCV}/lib:$LD_LIBRARY_PATH
# export PATH=${RISCV}/bin:${PATH}

TEST := test_demo

COMMON_DIR  = ./common
INCLUDE_DIR = ./include
MAKE_DIR    =./

CC     =$(RISCV)/bin/riscv64-unknown-elf-gcc
OBJCOPY=$(RISCV)/bin/riscv64-unknown-elf-objcopy
OBJDUMP=$(RISCV)/bin/riscv64-unknown-elf-objdump
#CFLAGS=-march=rv64imac -mcmodel=medany -O0 -std=gnu11 -Wall -nostartfiles 
CFLAGS=-march=rv64g -mcmodel=medany -O0 -std=gnu11 -Wall -nostartfiles 
CFLAGS+= -fno-common -g -DENTROPY=0 -mabi=lp64d -DNONSMP_HART=0  
CFLAGS+= -I $(INCLUDE_DIR) -I $(INCLUDE_DIR)/devices -I. -I $(COMMON_DIR) 
#LFLAGS=-static -nostdlib -L ./linker -T memboot.elf.lds
LFLAGS=-static   -L ./linker -T memboot.elf.lds
ELF2HEX=elf2hex



RAM_WIDTH = 8  
#RAM_DEPTH = 268435456  #### This is real RAM Depth    ;RAM(0x8000_0000~0xBFFF_FFFF)  1073741824
# RAM_DEPTH  = 1048576      ####  1M  This is not real RAM Depth;RAM(0x8000_0000~0x8800_0000) Use this To make hex generation fast
RAM_BASE  = 2147483648
RAM_BIT_WIDTH = 134217728

ifeq ($(TEST),test_nvdla_img)
RAM_DEPTH  = 1048576	##  1M 
else
RAM_DEPTH  = 32768  # 32K
endif



elf  := $(MAKE_DIR)/$(TEST).elf
bin  := $(MAKE_DIR)/$(TEST).bin
dump := $(MAKE_DIR)/$(TEST).dump
hex  := $(MAKE_DIR)/$(TEST).hex     


all: clean elf bin hex dump
.PHONY: all


$(elf):  $(COMMON_DIR)/head.S $(COMMON_DIR)/kprintf.c $(TEST).c 
	$(CC) $(CFLAGS)    $(LFLAGS) -o $@ $(COMMON_DIR)/head.S $(TEST).c $(COMMON_DIR)/kprintf.c 

.PHONY: elf
elf: $(elf)


$(bin): $(elf)
	$(OBJCOPY) -O binary $< $@
	#$(OBJCOPY) -O binary --only-section=.text $< $@
	

.PHONY: bin
bin: $(bin)




.PHONY: dump
dump: $(dump)	

$(dump): $(elf)
	$(OBJDUMP) -S -x -d $< > $@  
	               	


.PHONY: hex
hex: $(hex)


$(hex): $(elf)
	@$(OBJCOPY) -I binary -O verilog --adjust-vma 0x80000000 $(MAKE_DIR)/$(TEST).bin $@
	@python hex_to_verilog_mem.py $@ $(MAKE_DIR)/$(TEST).hex.tmp
	@mv $(MAKE_DIR)/$(TEST).hex.tmp $@
	

unused_hex_gen: $(elf)
	$(ELF2HEX) $(RAM_WIDTH) $(RAM_DEPTH) $< $(RAM_BASE) > $@
	#$(ELF2HEX) --bit-width $(RAM_BIT_WIDTH) --input $< --output $@
	#$(OBJCOPY) -O verilog --change-addresses $(RAM_BASE) $< $@
	#python3 reformat_hex.py $@ $@
	



.PHONY: clean
clean::
	rm -rf $(hex) $(dump) $(elf) $(bin)
