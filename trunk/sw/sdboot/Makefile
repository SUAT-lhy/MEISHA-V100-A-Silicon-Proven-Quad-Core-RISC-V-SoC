# RISCV environment variable must be set

TEST := sdboot

BUILD_DIR=.
BOOTROM_DIR=.
CC=$(RISCV)/bin/riscv64-unknown-elf-gcc
OBJCOPY=$(RISCV)/bin/riscv64-unknown-elf-objcopy
OBJDUMP=$(RISCV)/bin/riscv64-unknown-elf-objdump
CFLAGS=-march=rv64imac -mcmodel=medany -O2 -std=gnu11 -Wall -nostartfiles 
CFLAGS+= -fno-common -g -DENTROPY=0 -mabi=lp64 -DNONSMP_HART=0 
CFLAGS+= -I $(BOOTROM_DIR)/include -I.  
LFLAGS=-static -nostdlib -L $(BOOTROM_DIR)/linker -T $(TEST).elf.lds

CONFIG = MEISHAV100
dtb = $(CONFIG).dtbS

dts := $(BUILD_DIR)/../$(CONFIG).dts
dtb := $(BUILD_DIR)/$(CONFIG).dtb
clk := $(BUILD_DIR)/$(CONFIG).tl_clock.h
dump := $(BUILD_DIR)/$(TEST).dump

all: clean elf bin hex dump
.PHONY: all


$(clk): $(dts)
	awk '/tlclk {/ && !f{f=1; next}; f && match($$0, /^.*clock-frequency.*<(.*)>.*/, arr) { print "#define TL_CLK " arr[1] "UL"}' $< > $@.tmp
	mv $@.tmp $@

$(dtb): $(dts)
	dtc -I dts -O dtb -o $@ $<

.PHONY: dtb
dtb: $(dtb)

elf := $(BUILD_DIR)/$(TEST).elf
$(elf): $(dtb) head.S kprintf.c sd.c $(clk)
	$(CC) $(CFLAGS) -include $(clk) -DDEVICE_TREE='"$(dtb)"' $(LFLAGS) -o $@ head.S sd.c kprintf.c

.PHONY: elf
elf: $(elf)

bin := $(BUILD_DIR)/$(TEST).bin
$(bin): $(elf)
	$(OBJCOPY) -O binary $< $@

.PHONY: bin
bin: $(bin)

hex := $(BUILD_DIR)/$(TEST).hex
$(hex): $(bin)
	od -t x4 -An -w4 -v $< > $@


.PHONY: dump
dump: $(dump)

$(dump): $(elf)
	$(OBJDUMP) -S -s -x -d $< > $@  
	               	

.PHONY: hex
hex: $(hex)

romgen := $(BUILD_DIR)/rom.v
$(romgen): $(hex)
	$(rocketchip_dir)/scripts/vlsi_rom_gen $(ROMCONF) $< > $@

.PHONY: romgen
romgen: $(romgen)

.PHONY: clean
clean::
	rm -rf $(hex) $(elf) $(dump)
