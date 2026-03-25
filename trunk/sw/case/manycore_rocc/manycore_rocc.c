// See LICENSE for license details.
#include <stdint.h>
//====================================================================
// bsg_rocket_manycore_loopback.c
// 02/08/2016, shawnless.xie@gmail.com
//====================================================================
// The following is a basic RISC-V program to test the functionality of the
// Rocket + manycore, in which manycore just copy data back to Rocket

#include <assert.h>
#include <stdio.h>

#include <platform.h>

#include "common.h"

#define DEBUG
#include "kprintf.h"

#include "bsg_manycore_buffer.h"
#include "bsg_rocket_rocc.h"

int manycore_mem_vect [ 2048 ] __attribute__ ( (aligned (2048* 4) ) ) = {0x00000093};
int bsg_rocc_manycore_mem_words = 2048;

//#define DMA_LOAD
////////////////////////////////////////////////////////////
//
int   waiting_cycle_limit = 10000;

void init_source( int y_cord, int x_cord, \
            volatile manycore_task_s * pMCViewTask,  \
            volatile manycore_task_s * pRocketViewTask);

int check_result(volatile manycore_task_s *pRocketViewTask);

//load the memory content into the manycore tile( y_cord, x_cord)
//the IMEM_INIT_LEN is defined in Makefile.
//the DMEM_INIT_LEN is defined in Makefile.
int IMEM_INIT_LEN=0x1000;
int DMEM_INIT_LEN=0x1000;

void bsg_rocc_load_manycore(int y_cord, int x_cord ){
    int i;
    int DM_START_ADDR= ( 0x1000 >> 2 );
    for( i=0; i< ( IMEM_INIT_LEN >>2 ); i++)
        bsg_rocc_write( y_cord, x_cord, i*4,  manycore_mem_vect[i]);

    for( i=DM_START_ADDR; i< DM_START_ADDR + (IMEM_INIT_LEN>>2); i++)
        bsg_rocc_write( y_cord, x_cord, i*4,  manycore_mem_vect[i]);
}

// load part of the memory content into the manycore tile( y_cord, x_cord)
void bsg_rocc_load_manycore_len(int y_cord, int x_cord, int word_len ){
    int i;
    for( i=0; i< word_len ; i++)
        bsg_rocc_write( y_cord, x_cord, i*4,  manycore_mem_vect[i]);
}
//load the memory content into the manycore tile( y_cord, x_cord)
//using dma functions. 
//this is a non-block function, user has to issue fence instuction to check the completion 
void bsg_rocc_dma_load_manycore_nb(int y_cord, int x_cord ){

int * rocket_addr   = manycore_mem_vect ;
int * manycore_addr = (int *) bsg_rocc_manycore_addr( y_cord, x_cord, 0x0);
bsg_rocc_dma_xfer_nb( rocket_addr                       ,
                      manycore_addr                     ,
                      0                                 ,
                      0,
                      (bsg_rocc_manycore_mem_words*4)   ,
                      1);
}

//load the memory content into the multile manycore tiles
void bsg_rocc_dma_load_x_manycore_nb(int y_cord      ,
                                     int x_cord_start, int x_cord_end ){

int * rocket_addr   = manycore_mem_vect ;
int * manycore_addr = (int *) bsg_rocc_manycore_addr( y_cord, x_cord_start, 0x0);

int         x_tiles_num   = x_cord_end - x_cord_start + 1;
int64_t    mem_byte_size = bsg_rocc_manycore_mem_words * 0x4UL                 ;
int64_t    mem_x_distance= ( 0x1UL << bsg_rocc_x_cord_shift  ) - mem_byte_size  ;
bsg_rocc_dma_xfer_nb( rocket_addr                           ,
                      manycore_addr                         ,
                      -mem_byte_size                        ,
                      mem_x_distance                        ,
                      mem_byte_size                         ,
                      x_tiles_num                           );
}                     

//wait the task done.
int  bsg_rocc_poll_task( volatile manycore_task_s *pRocketViewTask, int waiting_cycle_limit) {
    int volatile *pDone = &( pRocketViewTask-> done);                                                                    
    int i=0;
    do { 
        asm volatile( "fence ");
        i++;
      }while( (i< waiting_cycle_limit ) & ( *pDone == 0x0) );
 
    return i;
}


int main(void)
{
  
  //REG32(uart, UART_REG_DIV) = 271;  // 
  REG32(uart, UART_REG_DIV) = 1;
  REG32(uart, UART_REG_RXCTRL) = UART_TXEN;
  REG32(uart, UART_REG_TXCTRL) = UART_RXEN;  // donot delete
  _REG32(_AC(0x51000000, UL), 0x18) = (0x3 << 20) + (0x2 << 10) + (0x1);  // SOC_LSYS cfg pll cfg

	kprintf("Test begin ! @ core: 0x%x, compiler date: %s, time: %s", read_csr(mhartid), __DATE__,__TIME__);

    int i=0;
    volatile manycore_task_s * pRocketViewTask = \
            ( volatile manycore_task_s*) (   (uint64_t)(&manycore_data_s)  \
                                        + (uint64_t)(manycore_mem_vect) \
                                        );

    //setup the segment address
    bsg_rocc_seg_addr(  manycore_mem_vect );

    //reset the manycore
    bsg_rocc_reset_manycore();

    //load the manycore image.
    #ifndef DMA_LOAD
        bsg_rocc_load_manycore(0, 0);
    #else
        bsg_rocc_dma_load_manycore_nb(0, 0);
        bsg_rocket_fence( );
    #endif

    //initial the source data for manycore
    init_source(0,0, &manycore_data_s, pRocketViewTask);

    //start the manycore
    bsg_rocc_unfreeze( 0x0, 0x0);

    //wait the result
    i = bsg_rocc_poll_task( pRocketViewTask, waiting_cycle_limit );

    if( i == waiting_cycle_limit )
        kprintf(" ==> FAIL ! wait %d but not result return", waiting_cycle_limit );
    else if( check_result( pRocketViewTask ) )
        kprintf(" ==> FAIL ! received data is not correct");
    else
    kprintf(" ==> PASS !");
	
	kprintf("Test end ! @ core: 0x%x", read_csr(mhartid));

	if (1){
		kprintf("PASS");
	}
	else{
		kprintf("FAIL");
	}

	kprintf(SHUTDOWN_FLAG_STR);  // donnot delete

	return 0;
}


// /////////////////////////////////////////////////////////////
//init the source data
void init_source( int y_cord, int x_cord, \
            volatile manycore_task_s * pMCViewTask,  \
            volatile manycore_task_s * pRocketViewTask){
  int i;
  for(i=0; i< MANYCORE_SRC_BUF_LEN; i++)
        bsg_rocc_write( y_cord, x_cord, &(pMCViewTask->source[i]),  i);
  //setup the base address
  bsg_rocc_write( y_cord, x_cord, &(pMCViewTask->base_addr), manycore_mem_vect);

  //reset the done signal.
  pRocketViewTask->done = 0;
}
//check the result
int check_result(volatile manycore_task_s *pRocketViewTask){
    int i=0;
    for( i=0; i< MANYCORE_DST_BUF_LEN ; i ++ ){
        if( pRocketViewTask->result[i] != i ) return 1;
    }
    return 0;
}

