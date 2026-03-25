	.file	"sd.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/zdd/MEISHAV100/trunk/sw/sdboot" "sd.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"sd_cmd: timeout"
	.text
	.align	1
	.type	sd_cmd, @function
sd_cmd:
.LFB3:
	.file 1 "sd.c"
	.loc 1 40 1
	.cfi_startproc
.LVL0:
	.loc 1 41 2
	.loc 1 42 2
	.loc 1 44 2
	.loc 1 40 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 44 29
	li	a5,1677725696
	li	a4,2
	sw	a4,24(a5)
	.loc 1 45 2 is_stmt 1
.LBB126:
	.loc 1 36 2
.LVL1:
.LBB127:
.LBB128:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a4,255
	sw	a4,72(a5)
	.loc 1 29 7
	li	a4,1677725696
.L2:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL2:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L2
	.loc 1 31 2
.LVL3:
.LBE128:
.LBE127:
.LBE126:
	.loc 1 46 2
.LBB129:
.LBB130:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sext.w	a0,a0
.LVL4:
	sw	a0,72(a4)
	.loc 1 29 7
	li	a4,1677725696
.L3:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL5:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L3
	.loc 1 31 2
.LVL6:
.LBE130:
.LBE129:
	.loc 1 47 2
	.loc 1 47 15 is_stmt 0
	srliw	a5,a1,24
.LVL7:
.LBB131:
.LBB132:
	.loc 1 25 2 is_stmt 1
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a5,72(a4)
	.loc 1 29 7
	li	a4,1677725696
.LVL8:
.L4:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL9:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L4
	.loc 1 31 2
.LVL10:
.LBE132:
.LBE131:
	.loc 1 48 2
.LBB133:
.LBB134:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	zero,72(a4)
	.loc 1 29 7
	li	a4,1677725696
.L5:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL11:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L5
	.loc 1 31 2
.LVL12:
.LBE134:
.LBE133:
	.loc 1 49 2
.LBB135:
.LBB136:
	.loc 1 25 2
	.loc 1 27 2
.LBE136:
.LBE135:
	.loc 1 49 15 is_stmt 0
	srliw	a5,a1,8
	andi	a5,a5,0xff
.LBB138:
.LBB137:
	.loc 1 27 29
	sw	a5,72(a4)
	.loc 1 29 7
	li	a4,1677725696
.L6:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL13:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L6
	.loc 1 31 2
.LVL14:
.LBE137:
.LBE138:
	.loc 1 50 2
.LBB139:
.LBB140:
	.loc 1 25 2
	.loc 1 27 2
	andi	a1,a1,0xff
.LVL15:
	.loc 1 27 29 is_stmt 0
	sw	a1,72(a4)
	.loc 1 29 7
	li	a4,1677725696
.L7:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL16:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L7
	.loc 1 31 2
.LVL17:
.LBE140:
.LBE139:
	.loc 1 51 2
.LBB141:
.LBB142:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sext.w	a5,a2
	sw	a5,72(a4)
	.loc 1 29 7
	li	a4,1677725696
.L8:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL18:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L8
.LBE142:
.LBE141:
.LBB144:
.LBB145:
.LBB146:
	.loc 1 27 29 is_stmt 0
	li	a4,1677725696
.LBE146:
.LBE145:
.LBE144:
.LBB151:
.LBB143:
	li	a3,1000
.LBE143:
.LBE151:
.LBB152:
.LBB149:
.LBB147:
	addi	a1,a4,72
	li	a2,255
.LVL19:
.L11:
.LBE147:
.LBE149:
.LBE152:
	.loc 1 54 2 is_stmt 1
	.loc 1 55 3
.LBB153:
	.loc 1 36 2
.LBB150:
.LBB148:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a2,0(a1)
.L9:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
	sext.w	s0,a5
.LVL20:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L9
	.loc 1 31 2
.LVL21:
.LBE148:
.LBE150:
.LBE153:
	.loc 1 56 3
	.loc 1 56 6 is_stmt 0
	slliw	a5,s0,24
	sraiw	a5,a5,24
	bge	a5,zero,.L10
	.loc 1 60 15 is_stmt 1
	addi	a3,a3,-1
	bne	a3,zero,.L11
	.loc 1 61 2
	lla	a0,.LC0
	call	kputs
.LVL22:
.L10:
	.loc 1 63 2
	.loc 1 64 1 is_stmt 0
	ld	ra,8(sp)
	.cfi_restore 1
	andi	a0,s0,0xff
	ld	s0,0(sp)
	.cfi_restore 8
.LVL23:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	sd_cmd, .-sd_cmd
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"INIT"
	.align	3
.LC2:
	.string	"CMD0"
	.align	3
.LC3:
	.string	"CMD8"
	.align	3
.LC4:
	.string	"ACMD41"
	.align	3
.LC5:
	.string	"CMD58"
	.align	3
.LC6:
	.string	"CMD16"
	.align	3
.LC7:
	.string	"CMD18"
	.align	3
.LC8:
	.string	"LOADING  "
	.align	3
.LC9:
	.string	"\b- CRC mismatch "
	.align	3
.LC10:
	.string	"\b "
	.align	3
.LC11:
	.string	"ERROR"
	.align	3
.LC12:
	.string	"BOOT"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB14:
	.loc 1 210 1 is_stmt 1
	.cfi_startproc
	.loc 1 211 2
	.loc 1 210 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,16(sp)
	.loc 1 211 31
	li	a5,1677721600
	li	a4,1
	.loc 1 210 1
	sd	ra,24(sp)
	sd	s1,8(sp)
	sd	s2,0(sp)
	.cfi_offset 8, -16
	.cfi_offset 1, -8
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.loc 1 211 31
	sw	a4,8(a5)
	.loc 1 213 2 is_stmt 1
	lla	a0,.LC1
	call	kputs
.LVL24:
	.loc 1 214 2
.LBB257:
.LBB258:
	.loc 1 75 2
	.loc 1 76 2
	.loc 1 76 29 is_stmt 0
	li	a5,1677725696
	li	a4,166
	sw	a4,0(a5)
	.loc 1 77 2 is_stmt 1
.LBB259:
.LBB260:
.LBB261:
	.loc 1 27 29 is_stmt 0
	li	s0,1677725696
.LBE261:
.LBE260:
.LBE259:
	.loc 1 77 29
	li	a4,3
	sw	a4,24(a5)
	.loc 1 78 2 is_stmt 1
.LVL25:
	.loc 1 78 17
.LBB268:
.LBB265:
.LBB262:
	.loc 1 27 29 is_stmt 0
	addi	a2,s0,72
.LBE262:
.LBE265:
.LBE268:
	.loc 1 77 29
	li	a4,10
.LBB269:
.LBB266:
.LBB263:
	.loc 1 27 29
	li	a3,255
.LVL26:
.L25:
.LBE263:
.LBE266:
.LBE269:
	.loc 1 79 3 is_stmt 1
.LBB270:
	.loc 1 36 2
.LBB267:
.LBB264:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a3,0(a2)
.L24:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(s0)
.LVL27:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L24
	.loc 1 31 2
.LVL28:
.LBE264:
.LBE267:
.LBE270:
	.loc 1 78 23
	.loc 1 78 17
	addi	a4,a4,-1
	bne	a4,zero,.L25
	.loc 1 81 2
.LBE258:
.LBE257:
.LBB272:
.LBB273:
	.loc 1 87 2 is_stmt 0
	lla	a0,.LC2
.LBE273:
.LBE272:
.LBB280:
.LBB271:
	.loc 1 81 29
	sw	zero,24(s0)
.LBE271:
.LBE280:
	.loc 1 215 2 is_stmt 1
.LBB281:
.LBB279:
	.loc 1 86 2
	.loc 1 87 2
	call	kputs
.LVL29:
	.loc 1 88 2
	.loc 1 88 8 is_stmt 0
	li	a2,149
	li	a1,0
	li	a0,64
	call	sd_cmd
.LVL30:
	.loc 1 89 2 is_stmt 1
.LBB274:
.LBB275:
	.loc 1 68 2
.LBB276:
	.loc 1 36 2
.LBB277:
.LBB278:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(s0)
	.loc 1 29 7
	li	s0,1677725696
.L26:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(s0)
.LVL31:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L26
	.loc 1 31 2
.LVL32:
.LBE278:
.LBE277:
.LBE276:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(s0)
.LBE275:
.LBE274:
	.loc 1 90 2 is_stmt 1
.LVL33:
.LBE279:
.LBE281:
	.loc 1 215 5 is_stmt 0
	li	a5,1
	bne	a0,a5,.L28
.LBB282:
.LBB283:
	.loc 1 95 2 is_stmt 1
	.loc 1 96 2
	lla	a0,.LC3
	call	kputs
.LVL34:
	.loc 1 97 2
	.loc 1 97 8 is_stmt 0
	li	a1,426
	li	a2,135
	li	a0,72
	call	sd_cmd
.LVL35:
	.loc 1 97 39
	sext.w	a3,a0
	addi	a3,a3,-1
.LBB284:
.LBB285:
.LBB286:
	.loc 1 27 29
	li	a5,255
.LBE286:
.LBE285:
.LBE284:
	.loc 1 97 39
	snez	a1,a3
.LVL36:
	.loc 1 98 2 is_stmt 1
.LBB289:
	.loc 1 36 2
.LBB288:
.LBB287:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a5,72(s0)
	.loc 1 29 7
	li	a4,1677725696
.L29:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL37:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L29
	.loc 1 31 2
.LVL38:
.LBE287:
.LBE288:
.LBE289:
	.loc 1 99 2
.LBB290:
	.loc 1 36 2
.LBB291:
.LBB292:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(a4)
	.loc 1 29 7
	li	a4,1677725696
.L30:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL39:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L30
	.loc 1 31 2
.LVL40:
.LBE292:
.LBE291:
.LBE290:
	.loc 1 100 2
.LBB293:
	.loc 1 36 2
.LBB294:
.LBB295:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(a4)
	.loc 1 29 7
	li	a3,1677725696
.L31:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a3)
	sext.w	a4,a5
.LVL41:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L31
	.loc 1 31 2
.LVL42:
.LBE295:
.LBE294:
.LBE293:
	.loc 1 100 28 is_stmt 0
	andi	a4,a4,15
	addi	a5,a4,-1
	snez	a4,a5
.LVL43:
	.loc 1 101 2 is_stmt 1
.LBB296:
	.loc 1 36 2
.LBB297:
.LBB298:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(a3)
	.loc 1 29 7
	li	a2,1677725696
.L32:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a2)
	sext.w	a3,a5
.LVL44:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L32
	.loc 1 31 2
.LVL45:
.LBE298:
.LBE297:
.LBE296:
	.loc 1 101 20 is_stmt 0
	andi	a5,a3,0xff
	addi	a5,a5,-170
	snez	a5,a5
	or	a5,a4,a5
	or	a3,a1,a5
.LBB299:
.LBB300:
.LBB301:
.LBB302:
.LBB303:
	.loc 1 27 29
	li	a5,255
	andi	a3,a3,0xff
.LVL46:
.LBE303:
.LBE302:
.LBE301:
.LBE300:
.LBE299:
	.loc 1 102 2 is_stmt 1
.LBB308:
.LBB307:
	.loc 1 68 2
.LBB306:
	.loc 1 36 2
.LBB305:
.LBB304:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a5,72(a2)
	.loc 1 29 7
	li	a4,1677725696
.L33:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a4)
.LVL47:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L33
	.loc 1 31 2
.LVL48:
.LBE304:
.LBE305:
.LBE306:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(a4)
.LBE307:
.LBE308:
	.loc 1 103 2 is_stmt 1
.LVL49:
.LBE283:
.LBE282:
	.loc 1 215 16 is_stmt 0
	beq	a3,zero,.L91
.L28:
	.loc 1 221 3 is_stmt 1
	lla	a0,.LC11
	call	kputs
.LVL50:
	.loc 1 222 3
	.loc 1 222 10 is_stmt 0
	li	s0,1
.L59:
	.loc 1 229 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	ld	s0,16(sp)
	.cfi_restore 8
	ld	s1,8(sp)
	.cfi_restore 9
	ld	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L91:
	.cfi_restore_state
.LBB309:
.LBB310:
	.loc 1 114 2 is_stmt 1
	.loc 1 115 2
	lla	a0,.LC4
	call	kputs
.LVL51:
.LBB311:
.LBB312:
.LBB313:
.LBB314:
.LBB315:
.LBB316:
.LBB317:
	.loc 1 27 29 is_stmt 0
	li	s0,1677725696
	li	s2,255
.LBE317:
.LBE316:
.LBE315:
.LBE314:
.LBE313:
.LBE312:
.LBE311:
	.loc 1 119 13
	li	s1,1
.L36:
	.loc 1 116 2 is_stmt 1
	.loc 1 117 3
.LBB324:
.LBB323:
	.loc 1 108 2
	li	a2,101
	li	a1,0
	li	a0,119
	call	sd_cmd
.LVL52:
	.loc 1 109 2
.LBB322:
.LBB321:
	.loc 1 68 2
.LBB320:
	.loc 1 36 2
.LBB319:
.LBB318:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	s2,72(s0)
.L35:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(s0)
.LVL53:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L35
	.loc 1 31 2
.LVL54:
.LBE318:
.LBE319:
.LBE320:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(s0)
.LBE321:
.LBE322:
.LBE323:
.LBE324:
	.loc 1 118 3 is_stmt 1
	.loc 1 118 7 is_stmt 0
	li	a2,119
	li	a1,1073741824
	li	a0,105
	call	sd_cmd
.LVL55:
	.loc 1 119 13 is_stmt 1
	beq	a0,s1,.L36
	.loc 1 120 2
.LVL56:
.LBE310:
.LBE309:
	.loc 1 216 16 is_stmt 0
	bne	a0,zero,.L28
.LBB325:
.LBB326:
	.loc 1 125 2 is_stmt 1
	.loc 1 126 2
	lla	a0,.LC5
	call	kputs
.LVL57:
	.loc 1 127 2
	.loc 1 127 8 is_stmt 0
	li	a2,253
	li	a1,0
	li	a0,122
	call	sd_cmd
.LVL58:
.LBB327:
.LBB328:
.LBB329:
	.loc 1 27 29
	li	a5,255
.LBE329:
.LBE328:
.LBE327:
	.loc 1 127 30
	snez	a3,a0
.LVL59:
	.loc 1 128 2 is_stmt 1
.LBB332:
	.loc 1 36 2
.LBB331:
.LBB330:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a5,72(s0)
	.loc 1 29 7
	li	a2,1677725696
.L37:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a2)
	sext.w	a4,a5
.LVL60:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L37
	.loc 1 31 2
.LVL61:
.LBE330:
.LBE331:
.LBE332:
	.loc 1 128 29 is_stmt 0
	sraiw	a5,a4,7
	xori	a5,a5,1
	andi	a5,a5,1
	or	a4,a3,a5
.LVL62:
	.loc 1 129 2 is_stmt 1
.LBB333:
	.loc 1 36 2
.LBB334:
.LBB335:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(a2)
	.loc 1 29 7
	li	a3,1677725696
.L38:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a3)
.LVL63:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L38
	.loc 1 31 2
.LVL64:
.LBE335:
.LBE334:
.LBE333:
	.loc 1 130 2
.LBB336:
	.loc 1 36 2
.LBB337:
.LBB338:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(a3)
	.loc 1 29 7
	li	a3,1677725696
.L39:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a3)
.LVL65:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L39
	.loc 1 31 2
.LVL66:
.LBE338:
.LBE337:
.LBE336:
	.loc 1 131 2
.LBB339:
	.loc 1 36 2
.LBB340:
.LBB341:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(a3)
	.loc 1 29 7
	li	a3,1677725696
.L40:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a3)
.LVL67:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L40
	.loc 1 31 2
.LVL68:
.LBE341:
.LBE340:
.LBE339:
	.loc 1 132 2
.LBB342:
.LBB343:
	.loc 1 68 2
.LBB344:
	.loc 1 36 2
.LBB345:
.LBB346:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(a3)
	.loc 1 29 7
	li	s0,1677725696
.L41:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(s0)
.LVL69:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L41
	.loc 1 31 2
.LVL70:
.LBE346:
.LBE345:
.LBE344:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(s0)
.LBE343:
.LBE342:
	.loc 1 133 2 is_stmt 1
.LVL71:
.LBE326:
.LBE325:
	.loc 1 217 18 is_stmt 0
	bne	a4,zero,.L28
.LBB347:
.LBB348:
	.loc 1 138 2 is_stmt 1
	.loc 1 139 2
	lla	a0,.LC6
	call	kputs
.LVL72:
	.loc 1 140 2
	.loc 1 140 8 is_stmt 0
	li	a2,21
	li	a1,512
	li	a0,80
	call	sd_cmd
.LVL73:
.LBB349:
.LBB350:
.LBB351:
.LBB352:
.LBB353:
	.loc 1 27 29
	li	a4,255
	sw	a4,72(s0)
.LBE353:
.LBE352:
.LBE351:
.LBE350:
.LBE349:
	.loc 1 140 8
	mv	a5,a0
.LVL74:
	.loc 1 141 2 is_stmt 1
.LBB358:
.LBB357:
	.loc 1 68 2
.LBB356:
	.loc 1 36 2
.LBB355:
.LBB354:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 29 7 is_stmt 0
	li	s0,1677725696
.L42:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a4,76(s0)
.LVL75:
	.loc 1 30 13 is_stmt 1
	blt	a4,zero,.L42
	.loc 1 31 2
.LVL76:
.LBE354:
.LBE355:
.LBE356:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(s0)
.LBE357:
.LBE358:
	.loc 1 142 2 is_stmt 1
.LVL77:
.LBE348:
.LBE347:
	.loc 1 218 17 is_stmt 0
	bne	a5,zero,.L28
.LBB359:
.LBB360:
	.loc 1 162 2 is_stmt 1
.LVL78:
	.loc 1 163 2
	.loc 1 164 2
	.loc 1 166 2
	lla	a0,.LC7
	call	kputs
.LVL79:
	.loc 1 167 2
	lla	a0,.LC8
	call	kprintf
.LVL80:
	.loc 1 169 2
	.loc 1 169 29 is_stmt 0
	li	a5,3
	sw	a5,0(s0)
	.loc 1 170 2 is_stmt 1
	.loc 1 170 6 is_stmt 0
	li	a2,225
	li	a1,0
	li	a0,82
	call	sd_cmd
.LVL81:
	.loc 1 170 5
	bne	a0,zero,.L92
.LBB361:
.LBB362:
.LBB363:
.LBB364:
	.loc 1 150 22
	li	a7,8192
.LBE364:
.LBE363:
.LBE362:
.LBE361:
	.loc 1 163 7
	li	t6,53248
	.loc 1 162 20
	li	a6,1342177280
.LBB405:
.LBB377:
.LBB378:
.LBB379:
	.loc 1 27 29
	li	a2,1677725696
	li	t0,255
	li	a0,255
.LBE379:
.LBE378:
.LBE377:
	.loc 1 180 21
	li	t4,254
.LBB386:
.LBB383:
.LBB380:
	.loc 1 29 7
	li	s0,1677725696
.LBE380:
.LBE383:
.LBE386:
.LBB387:
.LBB368:
.LBB365:
	.loc 1 150 22
	addi	a7,a7,-32
.LBE365:
.LBE368:
.LBE387:
.LBB388:
.LBB389:
	.file 2 "kprintf.h"
	.loc 2 27 3
	li	t3,1677721600
	li	t5,8
.LBE389:
.LBE388:
	.loc 1 198 17
	lla	ra,spinner
.LBE405:
	.loc 1 200 15
	li	t2,1369440256
.LVL82:
.L43:
	.loc 1 174 2 is_stmt 1
.LBB406:
	.loc 1 175 3
	.loc 1 176 3
	.loc 1 178 3
	.loc 1 179 3
	.loc 1 180 3
.LBB391:
.LBB384:
.LBB381:
	.loc 1 27 29 is_stmt 0
	addi	a3,a2,72
.L46:
.LBE381:
.LBE384:
.LBE391:
	.loc 1 180 21 is_stmt 1
.LBB392:
	.loc 1 36 2
.LVL83:
.LBB385:
.LBB382:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a0,0(a3)
.L45:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a2)
	sext.w	a4,a5
.LVL84:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L45
	.loc 1 31 2
.LVL85:
.LBE382:
.LBE385:
.LBE392:
	.loc 1 180 21 is_stmt 0
	andi	a4,a4,0xff
	bne	a4,t4,.L46
	mv	a1,a6
	.loc 1 178 7
	li	a3,0
	addi	a6,a6,512
.LVL86:
.LBB393:
.LBB369:
.LBB370:
.LBB371:
	.loc 1 27 29
	addi	t1,a2,72
.LVL87:
.L48:
.LBE371:
.LBE370:
.LBE369:
.LBE393:
	.loc 1 181 3 is_stmt 1
.LBB394:
	.loc 1 182 4
.LBB374:
	.loc 1 36 2
.LBB373:
.LBB372:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	a0,0(t1)
.L47:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a2)
	sext.w	a4,a5
.LVL88:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L47
	.loc 1 31 2
	slliw	a5,a3,8
	srliw	a3,a3,8
.LVL89:
	or	a5,a5,a3
	slli	a5,a5,48
	.loc 1 31 9 is_stmt 0
	andi	a4,a4,0xff
.LVL90:
.LBE372:
.LBE373:
.LBE374:
	.loc 1 183 4 is_stmt 1
	srli	a5,a5,48
.LBB375:
.LBB366:
	.loc 1 147 6 is_stmt 0
	xor	a5,a4,a5
	.loc 1 148 9
	srliw	a3,a5,4
	andi	a3,a3,15
	xor	a5,a5,a3
	.loc 1 149 13
	slliw	a3,a5,12
	.loc 1 149 6
	xor	a5,a5,a3
	.loc 1 150 22
	slliw	a3,a5,16
	srliw	a3,a3,16
	slliw	a3,a3,5
	and	a3,a7,a3
	.loc 1 150 6
	xor	a5,a5,a3
	slli	a3,a5,48
.LBE366:
.LBE375:
	.loc 1 183 6
	addi	s1,a1,1
.LVL91:
	.loc 1 183 9
	sb	a4,0(a1)
	.loc 1 184 4 is_stmt 1
.LVL92:
.LBB376:
.LBB367:
	.loc 1 146 2
	.loc 1 147 2
	.loc 1 148 2
	.loc 1 149 2
	.loc 1 150 2
	.loc 1 150 6 is_stmt 0
	srli	a3,a3,48
.LVL93:
	.loc 1 151 2 is_stmt 1
.LBE367:
.LBE376:
.LBE394:
	.loc 1 185 16
	beq	s1,a6,.L93
.LBB395:
	.loc 1 183 6 is_stmt 0
	mv	a1,s1
	j	.L48
.L93:
.LBE395:
	.loc 1 187 3 is_stmt 1
.LBB396:
	.loc 1 36 2
.LVL94:
.LBB397:
.LBB398:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	t0,72(s0)
.LVL95:
.L49:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a2)
	sext.w	a4,a5
.LVL96:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L49
	.loc 1 31 2
.LVL97:
.LBE398:
.LBE397:
.LBE396:
	.loc 1 187 24 is_stmt 0
	andi	a4,a4,0xff
	.loc 1 187 11
	slliw	a4,a4,8
	slli	a4,a4,48
	srli	a4,a4,48
.LVL98:
	.loc 1 188 3 is_stmt 1
.LBB399:
	.loc 1 36 2
.LBB400:
.LBB401:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	sw	t0,72(a2)
.L50:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(a2)
	sext.w	a1,a5
.LVL99:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L50
	.loc 1 31 2
.LVL100:
.LBE401:
.LBE400:
.LBE399:
	.loc 1 190 3
	.loc 1 188 11 is_stmt 0
	andi	a5,a1,0xff
	.loc 1 190 6
	or	a5,a5,a4
	bne	a5,a3,.L94
	.loc 1 196 3 is_stmt 1
	.loc 1 196 7 is_stmt 0
	andi	a5,t6,63
	.loc 1 196 6
	beq	a5,zero,.L54
.LVL101:
.L53:
.LBE406:
	.loc 1 200 15 is_stmt 1
	addi	t6,t6,-1
.LVL102:
	bne	s1,t2,.L43
	.loc 1 164 6 is_stmt 0
	li	s0,0
.LVL103:
.L52:
	.loc 1 201 2 is_stmt 1
.LBB407:
.LBB408:
	.loc 1 68 2
.LBB409:
	.loc 1 36 2
.LBB410:
.LBB411:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,1677725696
	li	a4,255
	sw	a4,72(a5)
	.loc 1 29 7
	li	s1,1677725696
.LVL104:
.L56:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a5,76(s1)
.LVL105:
	.loc 1 30 13 is_stmt 1
	blt	a5,zero,.L56
	.loc 1 31 2
.LVL106:
.LBE411:
.LBE410:
.LBE409:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(s1)
.LBE408:
.LBE407:
	.loc 1 203 2 is_stmt 1
	li	a2,1
	li	a1,0
	li	a0,76
	call	sd_cmd
.LVL107:
	.loc 1 204 2
.LBB412:
.LBB413:
	.loc 1 68 2
.LBB414:
	.loc 1 36 2
.LBB415:
.LBB416:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(s1)
	.loc 1 29 7
	li	a5,1677725696
.L57:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a4,76(a5)
.LVL108:
	.loc 1 30 13 is_stmt 1
	blt	a4,zero,.L57
	.loc 1 31 2
.LVL109:
.LBE416:
.LBE415:
.LBE414:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(a5)
.LBE413:
.LBE412:
	.loc 1 205 2 is_stmt 1
	lla	a0,.LC10
	call	kputs
.LVL110:
	.loc 1 206 2
.LBE360:
.LBE359:
	.loc 1 219 17 is_stmt 0
	bne	s0,zero,.L28
	.loc 1 225 2 is_stmt 1
	lla	a0,.LC12
	call	kputs
.LVL111:
	.loc 1 227 2
 #APP
# 227 "sd.c" 1
	fence.i
# 0 "" 2
	.loc 1 228 2
	.loc 1 228 9 is_stmt 0
 #NO_APP
	j	.L59
.LVL112:
.L54:
.LBB424:
.LBB423:
.LBB417:
.LBB402:
.LBB390:
	.loc 2 25 2 is_stmt 1
	.loc 2 26 2
	.loc 2 27 3
 #APP
# 27 "kprintf.h" 1
	amoor.w a5, t5, 0(t3)

# 0 "" 2
 #NO_APP
	sext.w	a5,a5
.LVL113:
	.loc 2 31 13
	blt	a5,zero,.L54
.LVL114:
.LBE390:
.LBE402:
	.loc 1 198 4
	.loc 1 198 18 is_stmt 0
	srai	a5,t6,6
	andi	a5,a5,3
	.loc 1 198 17
	add	a5,ra,a5
	lbu	a4,0(a5)
.LVL115:
.L55:
.LBB403:
.LBB404:
	.loc 2 25 2 is_stmt 1
	.loc 2 26 2
	.loc 2 27 3
 #APP
# 27 "kprintf.h" 1
	amoor.w a5, a4, 0(t3)

# 0 "" 2
 #NO_APP
	sext.w	a5,a5
.LVL116:
	.loc 2 31 13
	blt	a5,zero,.L55
	j	.L53
.LVL117:
.L94:
.LBE404:
.LBE403:
	.loc 1 191 4
	lla	a0,.LC9
	call	kputs
.LVL118:
	.loc 1 192 4
	.loc 1 193 4
	.loc 1 192 7 is_stmt 0
	li	s0,1
	.loc 1 193 4
	j	.L52
.LVL119:
.L92:
.LBE417:
	.loc 1 171 3 is_stmt 1
.LBB418:
.LBB419:
	.loc 1 68 2
.LBB420:
	.loc 1 36 2
.LBB421:
.LBB422:
	.loc 1 25 2
	.loc 1 27 2
	.loc 1 27 29 is_stmt 0
	li	a5,255
	sw	a5,72(s0)
	.loc 1 29 7
	li	a5,1677725696
.L44:
	.loc 1 28 2 is_stmt 1
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	lw	a4,76(a5)
.LVL120:
	.loc 1 30 13 is_stmt 1
	blt	a4,zero,.L44
	.loc 1 31 2
.LVL121:
.LBE422:
.LBE421:
.LBE420:
	.loc 1 69 2
	.loc 1 69 29 is_stmt 0
	sw	zero,24(a5)
.LBE419:
.LBE418:
	.loc 1 172 3 is_stmt 1
.LVL122:
	j	.L28
.LBE423:
.LBE424:
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.section	.srodata,"a"
	.align	3
	.type	spinner, @object
	.size	spinner, 4
spinner:
	.ascii	"-/|\\"
	.text
.Letext0:
	.file 3 "/home/zdd/opt/riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/zdd/opt/riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1004
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x1b
	.4byte	.LASF34
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL101
	.8byte	0
	.4byte	.Ldebug_line0
	.byte	0xc
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0xd
	.4byte	.LASF5
	.byte	0x3
	.byte	0x2b
	.byte	0x18
	.4byte	0x3d
	.byte	0xc
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.byte	0xc
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.byte	0xd
	.4byte	.LASF6
	.byte	0x3
	.byte	0x39
	.byte	0x19
	.4byte	0x57
	.byte	0xc
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0xd
	.4byte	.LASF8
	.byte	0x3
	.byte	0x4d
	.byte	0x18
	.4byte	0x6a
	.byte	0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xd
	.4byte	.LASF9
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x7d
	.byte	0xc
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0xc
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0xc
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.byte	0xd
	.4byte	.LASF13
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x31
	.byte	0x13
	.4byte	0x92
	.byte	0xd
	.4byte	.LASF14
	.byte	0x4
	.byte	0x24
	.byte	0x14
	.4byte	0x4b
	.byte	0xd
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2c
	.byte	0x13
	.4byte	0x5e
	.byte	0xd
	.4byte	.LASF16
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x71
	.byte	0x13
	.4byte	0xbb
	.byte	0x1d
	.4byte	.LASF17
	.byte	0x2
	.byte	0x13
	.byte	0x22
	.4byte	0xe1
	.4byte	0x64000000
	.byte	0xf
	.4byte	0xc7
	.byte	0x10
	.4byte	0xdc
	.byte	0x1e
	.string	"spi"
	.byte	0x1
	.byte	0x15
	.byte	0x22
	.4byte	0xe1
	.4byte	0x64001000
	.byte	0x1f
	.4byte	0x112
	.4byte	0x106
	.byte	0x20
	.4byte	0x8b
	.byte	0x3
	.byte	0
	.byte	0x10
	.4byte	0xf6
	.byte	0xc
	.byte	0x1
	.byte	0x8
	.4byte	.LASF18
	.byte	0x10
	.4byte	0x10b
	.byte	0x21
	.4byte	.LASF19
	.byte	0x1
	.byte	0x9e
	.byte	0x13
	.4byte	0x106
	.byte	0x9
	.byte	0x3
	.8byte	spinner
	.byte	0x14
	.4byte	.LASF20
	.byte	0x27
	.4byte	0x13e
	.byte	0x15
	.4byte	0x13e
	.byte	0x22
	.byte	0
	.byte	0xf
	.4byte	0x112
	.byte	0x14
	.4byte	.LASF21
	.byte	0x26
	.4byte	0x153
	.byte	0x15
	.4byte	0x13e
	.byte	0
	.byte	0x23
	.4byte	.LASF35
	.byte	0x1
	.byte	0xd1
	.byte	0x5
	.4byte	0x6a
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0xc39
	.byte	0x7
	.4byte	0xd5a
	.8byte	.LBB257
	.4byte	.LLRL23
	.byte	0xd6
	.byte	0x2
	.4byte	0x1dc
	.byte	0x8
	.4byte	.LLRL23
	.byte	0x1
	.4byte	0xd67
	.4byte	.LLST24
	.byte	0x9
	.4byte	0xfac
	.8byte	.LBB259
	.4byte	.LLRL25
	.byte	0x4f
	.byte	0x3
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB260
	.4byte	.LLRL25
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST26
	.byte	0x8
	.4byte	.LLRL25
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0xd3e
	.8byte	.LBB272
	.4byte	.LLRL28
	.byte	0xd7
	.byte	0x6
	.4byte	0x29f
	.byte	0x8
	.4byte	.LLRL28
	.byte	0x1
	.4byte	0xd4e
	.4byte	.LLST29
	.byte	0x4
	.4byte	0xd72
	.8byte	.LBB274
	.8byte	.LBE274-.LBB274
	.byte	0x59
	.byte	0x2
	.4byte	0x25f
	.byte	0x5
	.4byte	0xfac
	.8byte	.LBB276
	.8byte	.LBE276-.LBB276
	.byte	0x44
	.byte	0x2
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB277
	.8byte	.LBE277-.LBB277
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST30
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST31
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL29
	.4byte	0x143
	.4byte	0x27e
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC2
	.byte	0
	.byte	0xb
	.8byte	.LVL30
	.4byte	0xd7a
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x40
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x9
	.byte	0x95
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xd22
	.8byte	.LBB282
	.8byte	.LBE282-.LBB282
	.byte	0xd8
	.byte	0x6
	.4byte	0x472
	.byte	0x1
	.4byte	0xd32
	.4byte	.LLST32
	.byte	0x7
	.4byte	0xfac
	.8byte	.LBB284
	.4byte	.LLRL33
	.byte	0x62
	.byte	0x2
	.4byte	0x307
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB285
	.4byte	.LLRL33
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST34
	.byte	0x8
	.4byte	.LLRL33
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST35
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB290
	.8byte	.LBE290-.LBB290
	.byte	0x63
	.byte	0x2
	.4byte	0x34d
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB291
	.8byte	.LBE291-.LBB291
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST36
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST37
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB293
	.8byte	.LBE293-.LBB293
	.byte	0x64
	.byte	0xa
	.4byte	0x393
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB294
	.8byte	.LBE294-.LBB294
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST38
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST39
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB296
	.8byte	.LBE296-.LBB296
	.byte	0x65
	.byte	0x9
	.4byte	0x3d9
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB297
	.8byte	.LBE297-.LBB297
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST40
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST41
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0xd72
	.8byte	.LBB299
	.4byte	.LLRL42
	.byte	0x66
	.byte	0x2
	.4byte	0x431
	.byte	0x9
	.4byte	0xfac
	.8byte	.LBB301
	.4byte	.LLRL43
	.byte	0x44
	.byte	0x2
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB302
	.4byte	.LLRL43
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST44
	.byte	0x8
	.4byte	.LLRL43
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST45
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL34
	.4byte	0x143
	.4byte	0x450
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC3
	.byte	0
	.byte	0xb
	.8byte	.LVL35
	.4byte	0xd7a
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x48
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x1aa
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x9
	.byte	0x87
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xcff
	.8byte	.LBB309
	.8byte	.LBE309-.LBB309
	.byte	0xd9
	.byte	0x6
	.4byte	0x566
	.byte	0x1
	.4byte	0xd0f
	.4byte	.LLST46
	.byte	0x7
	.4byte	0xd1a
	.8byte	.LBB311
	.4byte	.LLRL47
	.byte	0x75
	.byte	0x3
	.4byte	0x525
	.byte	0x7
	.4byte	0xd72
	.8byte	.LBB313
	.4byte	.LLRL48
	.byte	0x6d
	.byte	0x2
	.4byte	0x505
	.byte	0x9
	.4byte	0xfac
	.8byte	.LBB315
	.4byte	.LLRL49
	.byte	0x44
	.byte	0x2
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB316
	.4byte	.LLRL49
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST50
	.byte	0x8
	.4byte	.LLRL49
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST51
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.8byte	.LVL52
	.4byte	0xd7a
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x77
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x8
	.byte	0x65
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL51
	.4byte	0x143
	.4byte	0x544
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC4
	.byte	0
	.byte	0xb
	.8byte	.LVL55
	.4byte	0xd7a
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x69
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x40
	.byte	0x4a
	.byte	0x24
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x8
	.byte	0x77
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xce3
	.8byte	.LBB325
	.8byte	.LBE325-.LBB325
	.byte	0xda
	.byte	0x6
	.4byte	0x73d
	.byte	0x1
	.4byte	0xcf3
	.4byte	.LLST52
	.byte	0x7
	.4byte	0xfac
	.8byte	.LBB327
	.4byte	.LLRL53
	.byte	0x80
	.byte	0xa
	.4byte	0x5ce
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB328
	.4byte	.LLRL53
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST54
	.byte	0x8
	.4byte	.LLRL53
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST55
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB333
	.8byte	.LBE333-.LBB333
	.byte	0x81
	.byte	0x2
	.4byte	0x614
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB334
	.8byte	.LBE334-.LBB334
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST56
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST57
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB336
	.8byte	.LBE336-.LBB336
	.byte	0x82
	.byte	0x2
	.4byte	0x65a
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB337
	.8byte	.LBE337-.LBB337
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST58
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST59
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB339
	.8byte	.LBE339-.LBB339
	.byte	0x83
	.byte	0x2
	.4byte	0x6a0
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB340
	.8byte	.LBE340-.LBB340
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST60
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST61
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xd72
	.8byte	.LBB342
	.8byte	.LBE342-.LBB342
	.byte	0x84
	.byte	0x2
	.4byte	0x6fe
	.byte	0x5
	.4byte	0xfac
	.8byte	.LBB344
	.8byte	.LBE344-.LBB344
	.byte	0x44
	.byte	0x2
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB345
	.8byte	.LBE345-.LBB345
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST62
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST63
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL57
	.4byte	0x143
	.4byte	0x71d
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC5
	.byte	0
	.byte	0xb
	.8byte	.LVL58
	.4byte	0xd7a
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x7a
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x9
	.byte	0xfd
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xcc7
	.8byte	.LBB347
	.8byte	.LBE347-.LBB347
	.byte	0xdb
	.byte	0x6
	.4byte	0x7f9
	.byte	0x1
	.4byte	0xcd7
	.4byte	.LLST64
	.byte	0x7
	.4byte	0xd72
	.8byte	.LBB349
	.4byte	.LLRL65
	.byte	0x8d
	.byte	0x2
	.4byte	0x7b9
	.byte	0x9
	.4byte	0xfac
	.8byte	.LBB351
	.4byte	.LLRL66
	.byte	0x44
	.byte	0x2
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB352
	.4byte	.LLRL66
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST67
	.byte	0x8
	.4byte	.LLRL66
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST68
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL72
	.4byte	0x143
	.4byte	0x7d8
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC6
	.byte	0
	.byte	0xb
	.8byte	.LVL73
	.4byte	0xd7a
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x50
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x45
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0xc39
	.8byte	.LBB359
	.4byte	.LLRL69
	.byte	0xdc
	.byte	0x6
	.4byte	0xbdf
	.byte	0x8
	.4byte	.LLRL69
	.byte	0x1
	.4byte	0xc49
	.4byte	.LLST70
	.byte	0x1
	.4byte	0xc53
	.4byte	.LLST71
	.byte	0x1
	.4byte	0xc5d
	.4byte	.LLST72
	.byte	0x16
	.4byte	0xc68
	.4byte	.LLRL73
	.4byte	0xa25
	.byte	0x1
	.4byte	0xc69
	.4byte	.LLST74
	.byte	0x1
	.4byte	0xc75
	.4byte	.LLST75
	.byte	0x1
	.4byte	0xc81
	.4byte	.LLST76
	.byte	0x16
	.4byte	0xc8b
	.4byte	.LLRL77
	.4byte	0x8d5
	.byte	0x1
	.4byte	0xc8c
	.4byte	.LLST78
	.byte	0x7
	.4byte	0xc9e
	.8byte	.LBB363
	.4byte	.LLRL79
	.byte	0xb8
	.byte	0xa
	.4byte	0x894
	.byte	0x3
	.4byte	0xcba
	.4byte	.LLST80
	.byte	0x17
	.4byte	0xcae
	.byte	0
	.byte	0x9
	.4byte	0xfac
	.8byte	.LBB369
	.4byte	.LLRL81
	.byte	0xb6
	.byte	0x10
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB370
	.4byte	.LLRL81
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST82
	.byte	0x8
	.4byte	.LLRL81
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST83
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0xfac
	.8byte	.LBB377
	.4byte	.LLRL84
	.byte	0xb4
	.byte	0xa
	.4byte	0x919
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB378
	.4byte	.LLRL84
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST85
	.byte	0x8
	.4byte	.LLRL84
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST86
	.byte	0
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0xfde
	.8byte	.LBB388
	.4byte	.LLRL87
	.byte	0xc5
	.byte	0x4
	.4byte	0x94a
	.byte	0x17
	.4byte	0xfe7
	.byte	0x8
	.4byte	.LLRL87
	.byte	0x18
	.4byte	0xff1
	.byte	0x1
	.4byte	0xffc
	.4byte	.LLST88
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB396
	.8byte	.LBE396-.LBB396
	.byte	0xbb
	.byte	0x18
	.4byte	0x990
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB397
	.8byte	.LBE397-.LBB397
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST89
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST90
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB399
	.8byte	.LBE399-.LBB399
	.byte	0xbc
	.byte	0xe
	.4byte	0x9d6
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB400
	.8byte	.LBE400-.LBB400
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST91
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST92
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfde
	.8byte	.LBB403
	.8byte	.LBE403-.LBB403
	.byte	0xc6
	.byte	0x4
	.4byte	0xa09
	.byte	0x3
	.4byte	0xfe7
	.4byte	.LLST93
	.byte	0x18
	.4byte	0xff1
	.byte	0x1
	.4byte	0xffc
	.4byte	.LLST94
	.byte	0
	.byte	0xb
	.8byte	.LVL118
	.4byte	0x143
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC9
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xd72
	.8byte	.LBB407
	.8byte	.LBE407-.LBB407
	.byte	0xc9
	.byte	0x2
	.4byte	0xa83
	.byte	0x5
	.4byte	0xfac
	.8byte	.LBB409
	.8byte	.LBE409-.LBB409
	.byte	0x44
	.byte	0x2
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB410
	.8byte	.LBE410-.LBB410
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST95
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST96
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xd72
	.8byte	.LBB412
	.8byte	.LBE412-.LBB412
	.byte	0xcc
	.byte	0x2
	.4byte	0xae1
	.byte	0x5
	.4byte	0xfac
	.8byte	.LBB414
	.8byte	.LBE414-.LBB414
	.byte	0x44
	.byte	0x2
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB415
	.8byte	.LBE415-.LBB415
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST97
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST98
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xd72
	.8byte	.LBB418
	.8byte	.LBE418-.LBB418
	.byte	0xab
	.byte	0x3
	.4byte	0xb3f
	.byte	0x5
	.4byte	0xfac
	.8byte	.LBB420
	.8byte	.LBE420-.LBB420
	.byte	0x44
	.byte	0x2
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB421
	.8byte	.LBE421-.LBB421
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST99
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST100
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL79
	.4byte	0x143
	.4byte	0xb5e
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC7
	.byte	0
	.byte	0xa
	.8byte	.LVL80
	.4byte	0x12d
	.4byte	0xb7d
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC8
	.byte	0
	.byte	0xa
	.8byte	.LVL81
	.4byte	0xd7a
	.4byte	0xba0
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x52
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x9
	.byte	0xe1
	.byte	0
	.byte	0xa
	.8byte	.LVL107
	.4byte	0xd7a
	.4byte	0xbc2
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x4c
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x2
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0xb
	.8byte	.LVL110
	.4byte	0x143
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC10
	.byte	0
	.byte	0
	.byte	0
	.byte	0xa
	.8byte	.LVL24
	.4byte	0x143
	.4byte	0xbfe
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC1
	.byte	0
	.byte	0xa
	.8byte	.LVL50
	.4byte	0x143
	.4byte	0xc1d
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC11
	.byte	0
	.byte	0xb
	.8byte	.LVL111
	.4byte	0x143
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC12
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF23
	.byte	0xa0
	.byte	0xc
	.4byte	0x6a
	.byte	0x1
	.4byte	0xc99
	.byte	0x6
	.string	"p"
	.byte	0x1
	.byte	0xa2
	.byte	0x14
	.4byte	0xc99
	.byte	0x6
	.string	"i"
	.byte	0x1
	.byte	0xa3
	.byte	0x7
	.4byte	0x84
	.byte	0x6
	.string	"rc"
	.byte	0x1
	.byte	0xa4
	.byte	0x6
	.4byte	0x6a
	.byte	0x19
	.byte	0x6
	.string	"crc"
	.byte	0x1
	.byte	0xaf
	.byte	0xc
	.4byte	0xa3
	.byte	0x24
	.4byte	.LASF22
	.byte	0x1
	.byte	0xaf
	.byte	0x11
	.4byte	0xa3
	.byte	0x6
	.string	"n"
	.byte	0x1
	.byte	0xb0
	.byte	0x8
	.4byte	0x84
	.byte	0x19
	.byte	0x6
	.string	"x"
	.byte	0x1
	.byte	0xb6
	.byte	0xc
	.4byte	0x92
	.byte	0
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	0x9e
	.byte	0xe
	.4byte	.LASF24
	.byte	0x91
	.byte	0x11
	.4byte	0xa3
	.byte	0x1
	.4byte	0xcc7
	.byte	0x11
	.string	"crc"
	.byte	0x1
	.byte	0x91
	.byte	0x26
	.4byte	0xa3
	.byte	0x25
	.4byte	.LASF25
	.byte	0x1
	.byte	0x91
	.byte	0x33
	.4byte	0x92
	.byte	0
	.byte	0xe
	.4byte	.LASF26
	.byte	0x88
	.byte	0xc
	.4byte	0x6a
	.byte	0x1
	.4byte	0xce3
	.byte	0x6
	.string	"rc"
	.byte	0x1
	.byte	0x8a
	.byte	0x6
	.4byte	0x6a
	.byte	0
	.byte	0xe
	.4byte	.LASF27
	.byte	0x7b
	.byte	0xc
	.4byte	0x6a
	.byte	0x1
	.4byte	0xcff
	.byte	0x6
	.string	"rc"
	.byte	0x1
	.byte	0x7d
	.byte	0x6
	.4byte	0x6a
	.byte	0
	.byte	0xe
	.4byte	.LASF28
	.byte	0x70
	.byte	0xc
	.4byte	0x6a
	.byte	0x1
	.4byte	0xd1a
	.byte	0x6
	.string	"r"
	.byte	0x1
	.byte	0x72
	.byte	0xa
	.4byte	0x92
	.byte	0
	.byte	0x1a
	.4byte	.LASF31
	.byte	0x6a
	.byte	0xd
	.byte	0x1
	.byte	0xe
	.4byte	.LASF29
	.byte	0x5d
	.byte	0xc
	.4byte	0x6a
	.byte	0x1
	.4byte	0xd3e
	.byte	0x6
	.string	"rc"
	.byte	0x1
	.byte	0x5f
	.byte	0x6
	.4byte	0x6a
	.byte	0
	.byte	0xe
	.4byte	.LASF30
	.byte	0x54
	.byte	0xc
	.4byte	0x6a
	.byte	0x1
	.4byte	0xd5a
	.byte	0x6
	.string	"rc"
	.byte	0x1
	.byte	0x56
	.byte	0x6
	.4byte	0x6a
	.byte	0
	.byte	0x26
	.4byte	.LASF36
	.byte	0x1
	.byte	0x49
	.byte	0xd
	.byte	0x1
	.4byte	0xd72
	.byte	0x6
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.byte	0x7
	.4byte	0x84
	.byte	0
	.byte	0x1a
	.4byte	.LASF32
	.byte	0x42
	.byte	0x14
	.byte	0x3
	.byte	0x27
	.4byte	.LASF37
	.byte	0x1
	.byte	0x27
	.byte	0x10
	.4byte	0x92
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0xfac
	.byte	0x12
	.string	"cmd"
	.byte	0x1f
	.4byte	0x92
	.4byte	.LLST0
	.byte	0x12
	.string	"arg"
	.byte	0x2d
	.4byte	0xbb
	.4byte	.LLST1
	.byte	0x12
	.string	"crc"
	.byte	0x3a
	.4byte	0x92
	.4byte	.LLST2
	.byte	0x6
	.string	"n"
	.byte	0x1
	.byte	0x29
	.byte	0x10
	.4byte	0x8b
	.byte	0x28
	.string	"r"
	.byte	0x1
	.byte	0x2a
	.byte	0xa
	.4byte	0x92
	.4byte	.LLST3
	.byte	0x29
	.4byte	.LASF38
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.8byte	.L10
	.byte	0x4
	.4byte	0xfac
	.8byte	.LBB126
	.8byte	.LBE126-.LBB126
	.byte	0x2d
	.byte	0x2
	.4byte	0xe34
	.byte	0x5
	.4byte	0xfb9
	.8byte	.LBB127
	.8byte	.LBE127-.LBB127
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST4
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfb9
	.8byte	.LBB129
	.8byte	.LBE129-.LBB129
	.byte	0x2e
	.byte	0x2
	.4byte	0xe62
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST6
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST7
	.byte	0
	.byte	0x4
	.4byte	0xfb9
	.8byte	.LBB131
	.8byte	.LBE131-.LBB131
	.byte	0x2f
	.byte	0x2
	.4byte	0xe90
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST8
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST9
	.byte	0
	.byte	0x4
	.4byte	0xfb9
	.8byte	.LBB133
	.8byte	.LBE133-.LBB133
	.byte	0x30
	.byte	0x2
	.4byte	0xebe
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST10
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST11
	.byte	0
	.byte	0x7
	.4byte	0xfb9
	.8byte	.LBB135
	.4byte	.LLRL12
	.byte	0x31
	.byte	0x2
	.4byte	0xeee
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST13
	.byte	0x8
	.4byte	.LLRL12
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST14
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0xfb9
	.8byte	.LBB139
	.8byte	.LBE139-.LBB139
	.byte	0x32
	.byte	0x2
	.4byte	0xf1c
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST15
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST16
	.byte	0
	.byte	0x7
	.4byte	0xfb9
	.8byte	.LBB141
	.4byte	.LLRL17
	.byte	0x33
	.byte	0x2
	.4byte	0xf4c
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST18
	.byte	0x8
	.4byte	.LLRL17
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST19
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0xfac
	.8byte	.LBB144
	.4byte	.LLRL20
	.byte	0x37
	.byte	0x7
	.4byte	0xf90
	.byte	0x9
	.4byte	0xfb9
	.8byte	.LBB145
	.4byte	.LLRL20
	.byte	0x24
	.byte	0x9
	.byte	0x3
	.4byte	0xfc9
	.4byte	.LLST21
	.byte	0x8
	.4byte	.LLRL20
	.byte	0x1
	.4byte	0xfd3
	.4byte	.LLST22
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.8byte	.LVL22
	.4byte	0x143
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0
	.byte	0x2a
	.4byte	.LASF39
	.byte	0x1
	.byte	0x22
	.byte	0x17
	.4byte	0x92
	.byte	0x3
	.byte	0xe
	.4byte	.LASF33
	.byte	0x17
	.byte	0x17
	.4byte	0x92
	.byte	0x3
	.4byte	0xfde
	.byte	0x11
	.string	"d"
	.byte	0x1
	.byte	0x17
	.byte	0x28
	.4byte	0x92
	.byte	0x6
	.string	"r"
	.byte	0x1
	.byte	0x19
	.byte	0xa
	.4byte	0xaf
	.byte	0
	.byte	0x2b
	.4byte	.LASF40
	.byte	0x2
	.byte	0x15
	.byte	0x14
	.byte	0x3
	.byte	0x11
	.string	"c"
	.byte	0x2
	.byte	0x15
	.byte	0x1f
	.4byte	0x10b
	.byte	0x6
	.string	"tx"
	.byte	0x2
	.byte	0x17
	.byte	0x15
	.4byte	0xdc
	.byte	0x6
	.string	"r"
	.byte	0x2
	.byte	0x19
	.byte	0xa
	.4byte	0xaf
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x27
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x2b
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST24:
	.byte	0x7
	.8byte	.LVL25
	.8byte	.LVL26
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST26:
	.byte	0x7
	.8byte	.LVL26
	.8byte	.LVL28
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x7
	.8byte	.LVL27
	.8byte	.LVL28
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST29:
	.byte	0x7
	.8byte	.LVL30
	.8byte	.LVL33
	.byte	0xb
	.byte	0x7a
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x31
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST30:
	.byte	0x7
	.8byte	.LVL30
	.8byte	.LVL32
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST31:
	.byte	0x7
	.8byte	.LVL31
	.8byte	.LVL32
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST32:
	.byte	0x7
	.8byte	.LVL36
	.8byte	.LVL43
	.byte	0x6
	.byte	0x7b
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL43
	.8byte	.LVL46
	.byte	0x9
	.byte	0x7b
	.byte	0
	.byte	0x7e
	.byte	0
	.byte	0x21
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL46
	.8byte	.LVL49
	.byte	0x6
	.byte	0x7d
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST34:
	.byte	0x7
	.8byte	.LVL36
	.8byte	.LVL38
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST35:
	.byte	0x7
	.8byte	.LVL37
	.8byte	.LVL38
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST36:
	.byte	0x7
	.8byte	.LVL38
	.8byte	.LVL40
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST37:
	.byte	0x7
	.8byte	.LVL39
	.8byte	.LVL40
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST38:
	.byte	0x7
	.8byte	.LVL40
	.8byte	.LVL42
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST39:
	.byte	0x7
	.8byte	.LVL41
	.8byte	.LVL42
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST40:
	.byte	0x7
	.8byte	.LVL43
	.8byte	.LVL45
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST41:
	.byte	0x7
	.8byte	.LVL44
	.8byte	.LVL45
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST44:
	.byte	0x7
	.8byte	.LVL46
	.8byte	.LVL48
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST45:
	.byte	0x7
	.8byte	.LVL47
	.8byte	.LVL48
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST46:
	.byte	0x7
	.8byte	.LVL55
	.8byte	.LVL56
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST50:
	.byte	0x7
	.8byte	.LVL52
	.8byte	.LVL54
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST51:
	.byte	0x7
	.8byte	.LVL53
	.8byte	.LVL54
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST52:
	.byte	0x7
	.8byte	.LVL59
	.8byte	.LVL62
	.byte	0x6
	.byte	0x7d
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL62
	.8byte	.LVL71
	.byte	0x6
	.byte	0x7e
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST54:
	.byte	0x7
	.8byte	.LVL59
	.8byte	.LVL61
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST55:
	.byte	0x7
	.8byte	.LVL60
	.8byte	.LVL61
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST56:
	.byte	0x7
	.8byte	.LVL62
	.8byte	.LVL64
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST57:
	.byte	0x7
	.8byte	.LVL63
	.8byte	.LVL64
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST58:
	.byte	0x7
	.8byte	.LVL64
	.8byte	.LVL66
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST59:
	.byte	0x7
	.8byte	.LVL65
	.8byte	.LVL66
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST60:
	.byte	0x7
	.8byte	.LVL66
	.8byte	.LVL68
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST61:
	.byte	0x7
	.8byte	.LVL67
	.8byte	.LVL68
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST62:
	.byte	0x7
	.8byte	.LVL68
	.8byte	.LVL70
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST63:
	.byte	0x7
	.8byte	.LVL69
	.8byte	.LVL70
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST64:
	.byte	0x7
	.8byte	.LVL74
	.8byte	.LVL77
	.byte	0xb
	.byte	0x7f
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.byte	0
.LLST67:
	.byte	0x7
	.8byte	.LVL74
	.8byte	.LVL76
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST68:
	.byte	0x7
	.8byte	.LVL75
	.8byte	.LVL76
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST70:
	.byte	0x7
	.8byte	.LVL78
	.8byte	.LVL82
	.byte	0x4
	.byte	0x44
	.byte	0x4a
	.byte	0x24
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL82
	.8byte	.LVL86
	.byte	0x1
	.byte	0x60
	.byte	0x7
	.8byte	.LVL86
	.8byte	.LVL91
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.8byte	.LVL91
	.8byte	.LVL104
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.8byte	.LVL112
	.8byte	.LVL119
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.8byte	.LVL119
	.8byte	.LVL122
	.byte	0x4
	.byte	0x44
	.byte	0x4a
	.byte	0x24
	.byte	0x9f
	.byte	0
.LLST71:
	.byte	0x7
	.8byte	.LVL78
	.8byte	.LVL82
	.byte	0x4
	.byte	0xa
	.2byte	0xd000
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL82
	.8byte	.LVL103
	.byte	0x1
	.byte	0x6f
	.byte	0x7
	.8byte	.LVL112
	.8byte	.LVL118-1
	.byte	0x1
	.byte	0x6f
	.byte	0x7
	.8byte	.LVL119
	.8byte	.LVL122
	.byte	0x4
	.byte	0xa
	.2byte	0xd000
	.byte	0x9f
	.byte	0
.LLST72:
	.byte	0x7
	.8byte	.LVL78
	.8byte	.LVL103
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL103
	.8byte	.LVL110
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.8byte	.LVL112
	.8byte	.LVL118
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL118
	.8byte	.LVL119
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL119
	.8byte	.LVL122
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST74:
	.byte	0x7
	.8byte	.LVL82
	.8byte	.LVL87
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL87
	.8byte	.LVL89
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.8byte	.LVL93
	.8byte	.LVL103
	.byte	0x1
	.byte	0x5d
	.byte	0x7
	.8byte	.LVL112
	.8byte	.LVL118-1
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST75:
	.byte	0x7
	.8byte	.LVL98
	.8byte	.LVL100
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.8byte	.LVL100
	.8byte	.LVL101
	.byte	0x9
	.byte	0x7b
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x7e
	.byte	0
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL112
	.8byte	.LVL115
	.byte	0x9
	.byte	0x7b
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x7e
	.byte	0
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL117
	.8byte	.LVL118-1
	.byte	0x9
	.byte	0x7b
	.byte	0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x7e
	.byte	0
	.byte	0x21
	.byte	0x9f
	.byte	0
.LLST76:
	.byte	0x7
	.8byte	.LVL82
	.8byte	.LVL87
	.byte	0x4
	.byte	0xa
	.2byte	0x200
	.byte	0x9f
	.byte	0
.LLST78:
	.byte	0x7
	.8byte	.LVL90
	.8byte	.LVL95
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST80:
	.byte	0x7
	.8byte	.LVL92
	.8byte	.LVL93
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST82:
	.byte	0x7
	.8byte	.LVL87
	.8byte	.LVL90
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST83:
	.byte	0x7
	.8byte	.LVL88
	.8byte	.LVL90
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST85:
	.byte	0x7
	.8byte	.LVL83
	.8byte	.LVL85
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST86:
	.byte	0x7
	.8byte	.LVL84
	.8byte	.LVL85
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST88:
	.byte	0x7
	.8byte	.LVL113
	.8byte	.LVL114
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST89:
	.byte	0x7
	.8byte	.LVL94
	.8byte	.LVL97
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST90:
	.byte	0x7
	.8byte	.LVL96
	.8byte	.LVL97
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST91:
	.byte	0x7
	.8byte	.LVL98
	.8byte	.LVL100
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST92:
	.byte	0x7
	.8byte	.LVL99
	.8byte	.LVL100
	.byte	0x1
	.byte	0x5b
	.byte	0
.LLST93:
	.byte	0x7
	.8byte	.LVL115
	.8byte	.LVL117
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST94:
	.byte	0x7
	.8byte	.LVL116
	.8byte	.LVL117
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST95:
	.byte	0x7
	.8byte	.LVL103
	.8byte	.LVL106
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST96:
	.byte	0x7
	.8byte	.LVL105
	.8byte	.LVL106
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST97:
	.byte	0x7
	.8byte	.LVL107
	.8byte	.LVL109
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST98:
	.byte	0x7
	.8byte	.LVL108
	.8byte	.LVL109
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST99:
	.byte	0x7
	.8byte	.LVL119
	.8byte	.LVL121
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST100:
	.byte	0x7
	.8byte	.LVL120
	.8byte	.LVL121
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST0:
	.byte	0x7
	.8byte	.LVL0
	.8byte	.LVL4
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.8byte	.LVL4
	.8byte	.LFE3
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.8byte	.LVL0
	.8byte	.LVL15
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.8byte	.LVL15
	.8byte	.LFE3
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.8byte	.LVL0
	.8byte	.LVL19
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.8byte	.LVL19
	.8byte	.LFE3
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.8byte	.LVL21
	.8byte	.LVL23
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.8byte	.LVL23
	.8byte	.LFE3
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST4:
	.byte	0x7
	.8byte	.LVL1
	.8byte	.LVL3
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.8byte	.LVL2
	.8byte	.LVL3
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST6:
	.byte	0x7
	.8byte	.LVL3
	.8byte	.LVL4
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.8byte	.LVL4
	.8byte	.LVL6
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x7
	.8byte	.LVL5
	.8byte	.LVL6
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST8:
	.byte	0x7
	.8byte	.LVL7
	.8byte	.LVL8
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.8byte	.LVL8
	.8byte	.LVL10
	.byte	0x3
	.byte	0x7e
	.byte	0xc8,0
	.byte	0
.LLST9:
	.byte	0x7
	.8byte	.LVL9
	.8byte	.LVL10
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST10:
	.byte	0x7
	.8byte	.LVL10
	.8byte	.LVL12
	.byte	0x5
	.byte	0x7b
	.byte	0
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x7
	.8byte	.LVL11
	.8byte	.LVL12
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST13:
	.byte	0x7
	.8byte	.LVL12
	.8byte	.LVL14
	.byte	0x5
	.byte	0x7b
	.byte	0
	.byte	0x38
	.byte	0x25
	.byte	0x9f
	.byte	0
.LLST14:
	.byte	0x7
	.8byte	.LVL13
	.8byte	.LVL14
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST15:
	.byte	0x7
	.8byte	.LVL14
	.8byte	.LVL17
	.byte	0x1
	.byte	0x5b
	.byte	0
.LLST16:
	.byte	0x7
	.8byte	.LVL16
	.8byte	.LVL17
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST18:
	.byte	0x7
	.8byte	.LVL17
	.8byte	.LVL19
	.byte	0x1
	.byte	0x5c
	.byte	0
.LLST19:
	.byte	0x7
	.8byte	.LVL18
	.8byte	.LVL19
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST21:
	.byte	0x7
	.8byte	.LVL19
	.8byte	.LVL21
	.byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.byte	0
.LLST22:
	.byte	0x7
	.8byte	.LVL20
	.8byte	.LVL21
	.byte	0x1
	.byte	0x58
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.8byte	0
	.8byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.LLRL12:
	.byte	0x6
	.8byte	.LBB135
	.8byte	.LBE135
	.byte	0x6
	.8byte	.LBB138
	.8byte	.LBE138
	.byte	0
.LLRL17:
	.byte	0x6
	.8byte	.LBB141
	.8byte	.LBE141
	.byte	0x6
	.8byte	.LBB151
	.8byte	.LBE151
	.byte	0
.LLRL20:
	.byte	0x6
	.8byte	.LBB144
	.8byte	.LBE144
	.byte	0x6
	.8byte	.LBB152
	.8byte	.LBE152
	.byte	0x6
	.8byte	.LBB153
	.8byte	.LBE153
	.byte	0
.LLRL23:
	.byte	0x6
	.8byte	.LBB257
	.8byte	.LBE257
	.byte	0x6
	.8byte	.LBB280
	.8byte	.LBE280
	.byte	0
.LLRL25:
	.byte	0x6
	.8byte	.LBB259
	.8byte	.LBE259
	.byte	0x6
	.8byte	.LBB268
	.8byte	.LBE268
	.byte	0x6
	.8byte	.LBB269
	.8byte	.LBE269
	.byte	0x6
	.8byte	.LBB270
	.8byte	.LBE270
	.byte	0
.LLRL28:
	.byte	0x6
	.8byte	.LBB272
	.8byte	.LBE272
	.byte	0x6
	.8byte	.LBB281
	.8byte	.LBE281
	.byte	0
.LLRL33:
	.byte	0x6
	.8byte	.LBB284
	.8byte	.LBE284
	.byte	0x6
	.8byte	.LBB289
	.8byte	.LBE289
	.byte	0
.LLRL42:
	.byte	0x6
	.8byte	.LBB299
	.8byte	.LBE299
	.byte	0x6
	.8byte	.LBB308
	.8byte	.LBE308
	.byte	0
.LLRL43:
	.byte	0x6
	.8byte	.LBB301
	.8byte	.LBE301
	.byte	0x6
	.8byte	.LBB306
	.8byte	.LBE306
	.byte	0
.LLRL47:
	.byte	0x6
	.8byte	.LBB311
	.8byte	.LBE311
	.byte	0x6
	.8byte	.LBB324
	.8byte	.LBE324
	.byte	0
.LLRL48:
	.byte	0x6
	.8byte	.LBB313
	.8byte	.LBE313
	.byte	0x6
	.8byte	.LBB322
	.8byte	.LBE322
	.byte	0
.LLRL49:
	.byte	0x6
	.8byte	.LBB315
	.8byte	.LBE315
	.byte	0x6
	.8byte	.LBB320
	.8byte	.LBE320
	.byte	0
.LLRL53:
	.byte	0x6
	.8byte	.LBB327
	.8byte	.LBE327
	.byte	0x6
	.8byte	.LBB332
	.8byte	.LBE332
	.byte	0
.LLRL65:
	.byte	0x6
	.8byte	.LBB349
	.8byte	.LBE349
	.byte	0x6
	.8byte	.LBB358
	.8byte	.LBE358
	.byte	0
.LLRL66:
	.byte	0x6
	.8byte	.LBB351
	.8byte	.LBE351
	.byte	0x6
	.8byte	.LBB356
	.8byte	.LBE356
	.byte	0
.LLRL69:
	.byte	0x6
	.8byte	.LBB359
	.8byte	.LBE359
	.byte	0x6
	.8byte	.LBB424
	.8byte	.LBE424
	.byte	0
.LLRL73:
	.byte	0x6
	.8byte	.LBB361
	.8byte	.LBE361
	.byte	0x6
	.8byte	.LBB405
	.8byte	.LBE405
	.byte	0x6
	.8byte	.LBB406
	.8byte	.LBE406
	.byte	0x6
	.8byte	.LBB417
	.8byte	.LBE417
	.byte	0
.LLRL77:
	.byte	0x6
	.8byte	.LBB362
	.8byte	.LBE362
	.byte	0x6
	.8byte	.LBB387
	.8byte	.LBE387
	.byte	0x6
	.8byte	.LBB393
	.8byte	.LBE393
	.byte	0x6
	.8byte	.LBB394
	.8byte	.LBE394
	.byte	0x6
	.8byte	.LBB395
	.8byte	.LBE395
	.byte	0
.LLRL79:
	.byte	0x6
	.8byte	.LBB363
	.8byte	.LBE363
	.byte	0x6
	.8byte	.LBB368
	.8byte	.LBE368
	.byte	0x6
	.8byte	.LBB375
	.8byte	.LBE375
	.byte	0x6
	.8byte	.LBB376
	.8byte	.LBE376
	.byte	0
.LLRL81:
	.byte	0x6
	.8byte	.LBB369
	.8byte	.LBE369
	.byte	0x6
	.8byte	.LBB374
	.8byte	.LBE374
	.byte	0
.LLRL84:
	.byte	0x6
	.8byte	.LBB377
	.8byte	.LBE377
	.byte	0x6
	.8byte	.LBB386
	.8byte	.LBE386
	.byte	0x6
	.8byte	.LBB391
	.8byte	.LBE391
	.byte	0x6
	.8byte	.LBB392
	.8byte	.LBE392
	.byte	0
.LLRL87:
	.byte	0x6
	.8byte	.LBB388
	.8byte	.LBE388
	.byte	0x6
	.8byte	.LBB402
	.8byte	.LBE402
	.byte	0
.LLRL101:
	.byte	0x6
	.8byte	.Ltext0
	.8byte	.Letext0
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF19:
	.string	"spinner"
.LASF5:
	.string	"__uint8_t"
.LASF30:
	.string	"sd_cmd0"
.LASF8:
	.string	"__int32_t"
.LASF29:
	.string	"sd_cmd8"
.LASF39:
	.string	"sd_dummy"
.LASF20:
	.string	"kprintf"
.LASF33:
	.string	"spi_xfer"
.LASF25:
	.string	"data"
.LASF31:
	.string	"sd_cmd55"
.LASF3:
	.string	"unsigned char"
.LASF27:
	.string	"sd_cmd58"
.LASF12:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF21:
	.string	"kputs"
.LASF22:
	.string	"crc_exp"
.LASF6:
	.string	"__uint16_t"
.LASF38:
	.string	"done"
.LASF9:
	.string	"__uint32_t"
.LASF35:
	.string	"main"
.LASF36:
	.string	"sd_poweron"
.LASF10:
	.string	"unsigned int"
.LASF18:
	.string	"char"
.LASF13:
	.string	"uint8_t"
.LASF24:
	.string	"crc16_round"
.LASF37:
	.string	"sd_cmd"
.LASF15:
	.string	"int32_t"
.LASF4:
	.string	"short int"
.LASF14:
	.string	"uint16_t"
.LASF32:
	.string	"sd_cmd_end"
.LASF17:
	.string	"uart"
.LASF16:
	.string	"uint32_t"
.LASF11:
	.string	"long int"
.LASF40:
	.string	"kputc"
.LASF2:
	.string	"signed char"
.LASF34:
	.string	"GNU C11 12.2.0 -mcmodel=medany -mabi=lp64 -mtune=rocket -misa-spec=20191213 -march=rv64imac_zicsr_zifencei -g -O2 -std=gnu11 -fno-common"
.LASF26:
	.string	"sd_cmd16"
.LASF28:
	.string	"sd_acmd41"
.LASF23:
	.string	"copy"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/zdd/MEISHAV100/trunk/sw/sdboot"
.LASF0:
	.string	"sd.c"
	.ident	"GCC: (g2ee5e430018) 12.2.0"
