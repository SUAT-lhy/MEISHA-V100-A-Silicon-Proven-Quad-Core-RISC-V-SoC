// See LICENSE for license details.
#include <platform.h>
#include <smp.h>
#include "common.h"

  .section .text.init
  .option norvc
  .globl _prog_start
_prog_start:
  //li t1, 0x10000
  //jr t1
  //smp_pause(s1, s2) # used in bootrom.hex
  //li sp, (PAYLOAD_DEST + 0x7fff000)  # used in bootrom.hex
  call main
  smp_resume(s1, s2)
  csrr a0, mhartid
  .section .rodata
