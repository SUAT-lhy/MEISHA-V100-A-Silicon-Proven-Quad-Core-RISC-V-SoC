#ifndef _BSG_ROCKET_ROCC_H_
#define _BSG_ROCKET_ROCC_H_

#include "bsg_manycore_buffer.h"
#include "rocc.h"  // 包含前一个文件的ROCC宏定义

#define bsg_rocc_addr_width    32
#define bsg_rocc_cfg_width     1
#define bsg_rocc_x_cord_width 16
#define bsg_rocc_y_cord_width 15

#define bsg_rocc_cfg_shift    (bsg_rocc_addr_width)
#define bsg_rocc_x_cord_shift (bsg_rocc_cfg_width + bsg_rocc_cfg_shift)
#define bsg_rocc_y_cord_shift (bsg_rocc_x_cord_width + bsg_rocc_x_cord_shift)

// 地址计算宏保持不变
#define bsg_rocc_manycore_addr(y_cord, x_cord, local_addr) \
    ((((uint64_t)(y_cord)) << bsg_rocc_y_cord_shift) | \
     (((uint64_t)(x_cord)) << bsg_rocc_x_cord_shift) | \
     (((uint64_t)(local_addr)) & 0xFFFFFFFFUL))

#define bsg_rocc_manycore_cfg_addr(y_cord, x_cord, config_addr) \
    ((0x1UL << bsg_rocc_cfg_shift) | \
     bsg_rocc_manycore_addr(y_cord, x_cord, config_addr))

// 使用新的ROCC_INSTRUCTION格式重写指令宏
#define bsg_rocc_write(y_cord, x_cord, local_addr, value) \
    ROCC_INSTRUCTION_SS(0, \
        bsg_rocc_manycore_addr(y_cord, x_cord, local_addr), \
        value, \
        0)

#define bsg_rocc_config(y_cord, x_cord, config_addr, value) \
    ROCC_INSTRUCTION_SS(0, \
        bsg_rocc_manycore_cfg_addr(y_cord, x_cord, config_addr), \
        value, \
        0)

#define bsg_rocc_seg_addr(addr) \
    ROCC_INSTRUCTION_S(0, addr, 1)

#define bsg_rocc_reset_manycore() \
    ROCC_INSTRUCTION(0, 5)

// DMA传输函数改写
void bsg_rocc_dma_xfer_nb(int *rocket_addr,
                                int *manycore_addr,
                                uint64_t rocket_skip,
                                uint64_t manycore_skip,
                                uint64_t run_bytes,
                                uint64_t repeats) {
    asm volatile("fence");
    
    ROCC_INSTRUCTION_SS(0, manycore_addr, rocket_addr, 2);
    ROCC_INSTRUCTION_SS(0, manycore_skip, rocket_skip, 3);
    ROCC_INSTRUCTION_SS(0, run_bytes, repeats, 4);
}

#define bsg_rocket_fence() asm volatile("fence")

#define bsg_rocc_unfreeze(y_cord, x_cord) \
    bsg_rocc_config((y_cord), (x_cord), 0x0, 0x0)

// 外部声明保持不变
extern int manycore_mem_vect[];
extern int bsg_rocc_manycore_mem_words;

// 函数声明保持不变
void bsg_rocc_load_manycore(int y_cord, int x_cord);
void bsg_rocc_load_manycore_len(int y_cord, int x_cord, int word_len);
void bsg_rocc_dma_load_manycore_nb(int y_cord, int x_cord);
void bsg_rocc_dma_load_x_manycore_nb(int y_cord, int x_cord_start, int x_cord_end);
int bsg_rocc_poll_task(volatile manycore_task_s *pRocketViewTask, int waiting_cycle_limit);

#endif