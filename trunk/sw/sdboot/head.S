// See LICENSE for license details.
#include <platform.h>
#include <smp.h>
#include "common.h"

  .section .text.init
  .option norvc
  .globl _prog_start
_prog_start:
  smp_pause(s1, s2)
  li sp, (PAYLOAD_DEST + 0x7fff000)
	lui	  a5,0x51000
  addi  a5,a5,0x40
  li	  a4,0x00000008 # cfg mig takeover release
  sw	  a4,0(a5)
  call main
  smp_resume(s1, s2)
  csrr a0, mhartid
  la a1, dtb
  li s1, PAYLOAD_DEST
  jr s1
  .section .rodata
dtb:
  .incbin DEVICE_TREE


