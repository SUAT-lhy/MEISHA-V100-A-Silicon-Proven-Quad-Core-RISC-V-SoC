// This file contains the variable to be used both in manycore and rocket.
#ifndef  _MC_RC_BUFFER_H_
#define  _MC_RC_BUFFER_H_

#define MANYCORE_PROG 1

#ifndef MANYCORE_PROG
#define _MC_RC_PREFIX_ extern volatile

#else
#define _MC_RC_PREFIX_ 

#endif

///////////////////////////////////////////////////////////////
#ifndef MANYCORE_SRC_BUF_LEN
    #define MANYCORE_SRC_BUF_LEN  8
#endif

#ifndef MANYCORE_DST_BUF_LEN
    #define MANYCORE_DST_BUF_LEN  8
#endif

typedef struct manycore_task_def {
    //the base address that this struct has been mapped.
    //When manycore try to store data back to the rocket, it 
    //should added the base_addr to the buffer to get the right 
    //address
    unsigned int base_addr;
    int source[ MANYCORE_SRC_BUF_LEN ];
    int done                          ;
    int result[ MANYCORE_DST_BUF_LEN ];
} manycore_task_s;

_MC_RC_PREFIX_  manycore_task_s  manycore_data_s;

#endif
