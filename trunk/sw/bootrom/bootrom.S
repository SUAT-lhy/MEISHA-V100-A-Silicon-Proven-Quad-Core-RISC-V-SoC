#define DRAM_BASE 0x80000000


#include <smp.h>
#include "common.h"

.section .text.start, "ax", @progbits
.globl _start
_start:
    smp_pause(s1, s2)
    li sp, (PAYLOAD_DEST + 0x7fff000)
	lui	  a5,0x51000
    addi  a5,a5,0x40
    li	  a4,0x00000008 # cfg mig takeover release
    sw	  a4,0(a5)
	auipc t0,0x7fff0  
	jr    t0
    smp_resume(s1, s2) # always not jump it

