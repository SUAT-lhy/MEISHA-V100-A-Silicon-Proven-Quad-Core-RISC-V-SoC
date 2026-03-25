/*******************************************************************************
________________________________________________________________________________________________


            Synchronous RVT Periphery High-Density Dual-Port SRAM Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________

       IP Name            :  FSH0L_A_SJ                      
       IP Version         :  1.2.0                           
       IP Release Status  :  Active                          
       Word               :  8192                            
       Bit                :  8                               
       Byte               :  8                               
       Mux                :  8                               
       Output Loading     :  0.3                             
       Clock Input Slew   :  0.4                             
       Data Input Slew    :  0.4                             
       Ring Type          :  Ringless Model                  
       Ring Width         :  0                               
       Bus Format         :  0                               
       Memaker Path       :  /home/autumn/pdk/memory/ftclib  
       GUI Version        :  m20130120                       
       Date               :  2024/08/07 07:43:32             
________________________________________________________________________________________________


   Notice on usage: Fixed delay or timing data are given in this model.
                    It supports SDF back-annotation, please generate SDF file
                    by EDA tools to get the accurate timing.

 |-----------------------------------------------------------------------------|

   Warning : If customer's design viloate the set-up time or hold time criteria 
   of synchronous SRAM, it's possible to hit the meta-stable point of 
   latch circuit in the decoder and cause the data loss in the memory bitcell.
   So please follow the memory IP's spec to design your product.

 *******************************************************************************/

`resetall
`timescale 10ps/1ps


module SJLA40_8192X8X8CM8 (DOA0,DOA1,DOA2,DOA3,DOA4,DOA5,DOA6,DOA7,DOA8,
                           DOA9,DOA10,DOA11,DOA12,DOA13,DOA14,DOA15,
                           DOA16,DOA17,DOA18,DOA19,DOA20,DOA21,DOA22,
                           DOA23,DOA24,DOA25,DOA26,DOA27,DOA28,DOA29,
                           DOA30,DOA31,DOA32,DOA33,DOA34,DOA35,DOA36,
                           DOA37,DOA38,DOA39,DOA40,DOA41,DOA42,DOA43,
                           DOA44,DOA45,DOA46,DOA47,DOA48,DOA49,DOA50,
                           DOA51,DOA52,DOA53,DOA54,DOA55,DOA56,DOA57,
                           DOA58,DOA59,DOA60,DOA61,DOA62,DOA63,DOB0,
                           DOB1,DOB2,DOB3,DOB4,DOB5,DOB6,DOB7,DOB8,
                           DOB9,DOB10,DOB11,DOB12,DOB13,DOB14,DOB15,
                           DOB16,DOB17,DOB18,DOB19,DOB20,DOB21,DOB22,
                           DOB23,DOB24,DOB25,DOB26,DOB27,DOB28,DOB29,
                           DOB30,DOB31,DOB32,DOB33,DOB34,DOB35,DOB36,
                           DOB37,DOB38,DOB39,DOB40,DOB41,DOB42,DOB43,
                           DOB44,DOB45,DOB46,DOB47,DOB48,DOB49,DOB50,
                           DOB51,DOB52,DOB53,DOB54,DOB55,DOB56,DOB57,
                           DOB58,DOB59,DOB60,DOB61,DOB62,DOB63,A0,
                           A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,B0,B1,
                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,DIA0,DIA1,
                           DIA2,DIA3,DIA4,DIA5,DIA6,DIA7,DIA8,DIA9,
                           DIA10,DIA11,DIA12,DIA13,DIA14,DIA15,DIA16,
                           DIA17,DIA18,DIA19,DIA20,DIA21,DIA22,DIA23,
                           DIA24,DIA25,DIA26,DIA27,DIA28,DIA29,DIA30,
                           DIA31,DIA32,DIA33,DIA34,DIA35,DIA36,DIA37,
                           DIA38,DIA39,DIA40,DIA41,DIA42,DIA43,DIA44,
                           DIA45,DIA46,DIA47,DIA48,DIA49,DIA50,DIA51,
                           DIA52,DIA53,DIA54,DIA55,DIA56,DIA57,DIA58,
                           DIA59,DIA60,DIA61,DIA62,DIA63,DIB0,DIB1,
                           DIB2,DIB3,DIB4,DIB5,DIB6,DIB7,DIB8,DIB9,
                           DIB10,DIB11,DIB12,DIB13,DIB14,DIB15,DIB16,
                           DIB17,DIB18,DIB19,DIB20,DIB21,DIB22,DIB23,
                           DIB24,DIB25,DIB26,DIB27,DIB28,DIB29,DIB30,
                           DIB31,DIB32,DIB33,DIB34,DIB35,DIB36,DIB37,
                           DIB38,DIB39,DIB40,DIB41,DIB42,DIB43,DIB44,
                           DIB45,DIB46,DIB47,DIB48,DIB49,DIB50,DIB51,
                           DIB52,DIB53,DIB54,DIB55,DIB56,DIB57,DIB58,
                           DIB59,DIB60,DIB61,DIB62,DIB63,WEAN0,WEAN1,
                           WEAN2,WEAN3,WEAN4,WEAN5,WEAN6,WEAN7,WEBN0,
                           WEBN1,WEBN2,WEBN3,WEBN4,WEBN5,WEBN6,WEBN7,CSAN,
                           CSBN,CKA,DVSE,DVS0,DVS1,DVS2,
                           DVS3,CKB,NAP);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 13;               
  parameter  DVSize               = 4;                
  parameter  Bits                 = 8;                
  parameter  Words                = 8192;             
  parameter  Bytes                = 8;                
  parameter  AspectRatio          = 8;                
  parameter  Tr2w                 = (233.0:394.3:798.6);
  parameter  Tw2r                 = (233.5:394.3:798.8);
  parameter  TOH                  = (193.3:328.5:685.1);
  parameter  TOH_1                = (235.7:406.8:859.3);
  parameter  TOH_2                = (193.3:328.5:685.1);
  parameter  TOH_3                = (172.9:292.2:606.9);
  parameter  TWDX                 = (92.6:186.6:440.6);
  parameter  TWDX_1               = (92.6:186.6:440.6);
  parameter  TWDX_2               = (92.6:186.6:440.6);
  parameter  TWDX_3               = (92.6:186.6:440.7);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (233.5:394.3:798.8);
`else
`endif
  parameter  TNAP_Wakeup          = 0;                

  output     DOA0,DOA1,DOA2,DOA3,DOA4,DOA5,DOA6,DOA7,DOA8,
             DOA9,DOA10,DOA11,DOA12,DOA13,DOA14,DOA15,DOA16,DOA17,DOA18,
             DOA19,DOA20,DOA21,DOA22,DOA23,DOA24,DOA25,DOA26,DOA27,DOA28,
             DOA29,DOA30,DOA31,DOA32,DOA33,DOA34,DOA35,DOA36,DOA37,DOA38,
             DOA39,DOA40,DOA41,DOA42,DOA43,DOA44,DOA45,DOA46,DOA47,DOA48,
             DOA49,DOA50,DOA51,DOA52,DOA53,DOA54,DOA55,DOA56,DOA57,DOA58,
             DOA59,DOA60,DOA61,DOA62,DOA63;
  output     DOB0,DOB1,DOB2,DOB3,DOB4,DOB5,DOB6,DOB7,DOB8,
             DOB9,DOB10,DOB11,DOB12,DOB13,DOB14,DOB15,DOB16,DOB17,DOB18,
             DOB19,DOB20,DOB21,DOB22,DOB23,DOB24,DOB25,DOB26,DOB27,DOB28,
             DOB29,DOB30,DOB31,DOB32,DOB33,DOB34,DOB35,DOB36,DOB37,DOB38,
             DOB39,DOB40,DOB41,DOB42,DOB43,DOB44,DOB45,DOB46,DOB47,DOB48,
             DOB49,DOB50,DOB51,DOB52,DOB53,DOB54,DOB55,DOB56,DOB57,DOB58,
             DOB59,DOB60,DOB61,DOB62,DOB63;
  input      DIA0,DIA1,DIA2,DIA3,DIA4,DIA5,DIA6,DIA7,DIA8,
             DIA9,DIA10,DIA11,DIA12,DIA13,DIA14,DIA15,DIA16,DIA17,DIA18,
             DIA19,DIA20,DIA21,DIA22,DIA23,DIA24,DIA25,DIA26,DIA27,DIA28,
             DIA29,DIA30,DIA31,DIA32,DIA33,DIA34,DIA35,DIA36,DIA37,DIA38,
             DIA39,DIA40,DIA41,DIA42,DIA43,DIA44,DIA45,DIA46,DIA47,DIA48,
             DIA49,DIA50,DIA51,DIA52,DIA53,DIA54,DIA55,DIA56,DIA57,DIA58,
             DIA59,DIA60,DIA61,DIA62,DIA63;
  input      DIB0,DIB1,DIB2,DIB3,DIB4,DIB5,DIB6,DIB7,DIB8,
             DIB9,DIB10,DIB11,DIB12,DIB13,DIB14,DIB15,DIB16,DIB17,DIB18,
             DIB19,DIB20,DIB21,DIB22,DIB23,DIB24,DIB25,DIB26,DIB27,DIB28,
             DIB29,DIB30,DIB31,DIB32,DIB33,DIB34,DIB35,DIB36,DIB37,DIB38,
             DIB39,DIB40,DIB41,DIB42,DIB43,DIB44,DIB45,DIB46,DIB47,DIB48,
             DIB49,DIB50,DIB51,DIB52,DIB53,DIB54,DIB55,DIB56,DIB57,DIB58,
             DIB59,DIB60,DIB61,DIB62,DIB63;
  input      A0,A1,A2,A3,A4,A5,A6,A7,A8,
             A9,A10,A11,A12;
  input      B0,B1,B2,B3,B4,B5,B6,B7,B8,
             B9,B10,B11,B12;
  input      DVSE;                                    
  input      DVS0,DVS1,DVS2,DVS3;
  input      WEAN0;                                   
  input      WEAN1;                                   
  input      WEAN2;                                   
  input      WEAN3;                                   
  input      WEAN4;                                   
  input      WEAN5;                                   
  input      WEAN6;                                   
  input      WEAN7;                                   
  input      WEBN0;                                   
  input      WEBN1;                                   
  input      WEBN2;                                   
  input      WEBN3;                                   
  input      WEBN4;                                   
  input      WEBN5;                                   
  input      WEBN6;                                   
  input      WEBN7;                                   
  input      CKA;                                     
  input      CKB;                                     
  input      CSAN;                                    
  input      CSBN;                                    
  input      NAP;                                     

`protect
  reg        [Bits-1:0]           Memory_byte0 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte1 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte2 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte3 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte4 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte5 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte6 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte7 [Words-1:0];     


  wire       [Bytes*Bits-1:0]     DOA_;               
  wire       [Bytes*Bits-1:0]     DOB_;               
  wire       [AddressSize-1:0]    A_;                 
  wire       [AddressSize-1:0]    B_;                 
  wire       [Bits-1:0]           DIA_byte0_;         
  wire       [Bits-1:0]           DIB_byte0_;         
  wire       [Bits-1:0]           DIA_byte1_;         
  wire       [Bits-1:0]           DIB_byte1_;         
  wire       [Bits-1:0]           DIA_byte2_;         
  wire       [Bits-1:0]           DIB_byte2_;         
  wire       [Bits-1:0]           DIA_byte3_;         
  wire       [Bits-1:0]           DIB_byte3_;         
  wire       [Bits-1:0]           DIA_byte4_;         
  wire       [Bits-1:0]           DIB_byte4_;         
  wire       [Bits-1:0]           DIA_byte5_;         
  wire       [Bits-1:0]           DIB_byte5_;         
  wire       [Bits-1:0]           DIA_byte6_;         
  wire       [Bits-1:0]           DIB_byte6_;         
  wire       [Bits-1:0]           DIA_byte7_;         
  wire       [Bits-1:0]           DIB_byte7_;         
  wire                            WEBN0_;             
  wire                            WEBN1_;             
  wire                            WEBN2_;             
  wire                            WEBN3_;             
  wire                            WEBN4_;             
  wire                            WEBN5_;             
  wire                            WEBN6_;             
  wire                            WEBN7_;             
  wire                            WEAN0_;             
  wire                            WEAN1_;             
  wire                            WEAN2_;             
  wire                            WEAN3_;             
  wire                            WEAN4_;             
  wire                            WEAN5_;             
  wire                            WEAN6_;             
  wire                            WEAN7_;             
  wire                            CKA_;               
  wire                            CKB_;               
  wire                            CSA_;               
  wire                            CSB_;               

  wire       [DVSize-1:0]         DVS_;               
  wire                            DVSE_;              
  reg                             DVSA_TRIGGER;       
  reg                             DVSB_TRIGGER;       

  reg                             con_dvsea;          
  reg                             con_dvseb;          
  reg                             wrong_dvsa0;        
  reg                             wrong_dvsb0;        
  reg                             con_dvsa1;          
  reg                             con_dvsb1;          
  reg                             con_dvsa2;          
  reg                             con_dvsb2;          
  reg                             con_dvsa3;          
  reg                             con_dvsb3;          
  reg                             wrong_dvsa4;        
  reg                             wrong_dvsb4;        
  reg                             wrong_dvsa5;        
  reg                             wrong_dvsb5;        
  reg                             wrong_dvsa6;        
  reg                             wrong_dvsb6;        
  reg                             wrong_dvsa7;        
  reg                             wrong_dvsb7;        
  reg                             wrong_dvsa8;        
  reg                             wrong_dvsb8;        
  reg                             wrong_dvsa9;        
  reg                             wrong_dvsb9;        
  reg                             wrong_dvsa10;       
  reg                             wrong_dvsb10;       
  reg                             wrong_dvsa11;       
  reg                             wrong_dvsb11;       
  reg                             wrong_dvsa12;       
  reg                             wrong_dvsb12;       
  reg                             wrong_dvsa13;       
  reg                             wrong_dvsb13;       
  reg                             wrong_dvsa14;       
  reg                             wrong_dvsb14;       
  reg                             wrong_dvsa15;       
  reg                             wrong_dvsb15;       

  reg                             reada0;             
  reg                             writea0;            
  reg                             readb0;             
  reg                             writeb0;            
  reg                             reada1;             
  reg                             writea1;            
  reg                             readb1;             
  reg                             writeb1;            
  reg                             reada2;             
  reg                             writea2;            
  reg                             readb2;             
  reg                             writeb2;            
  reg                             reada3;             
  reg                             writea3;            
  reg                             readb3;             
  reg                             writeb3;            
  reg                             reada4;             
  reg                             writea4;            
  reg                             readb4;             
  reg                             writeb4;            
  reg                             reada5;             
  reg                             writea5;            
  reg                             readb5;             
  reg                             writeb5;            
  reg                             reada6;             
  reg                             writea6;            
  reg                             readb6;             
  reg                             writeb6;            
  reg                             reada7;             
  reg                             writea7;            
  reg                             readb7;             
  reg                             writeb7;            

  wire                            NAP_;               



  wire                            con_A;              
  wire                            con_B;              
  wire                            con_DIA_byte0;      
  wire                            con_DIB_byte0;      
  wire                            con_DIA_byte1;      
  wire                            con_DIB_byte1;      
  wire                            con_DIA_byte2;      
  wire                            con_DIB_byte2;      
  wire                            con_DIA_byte3;      
  wire                            con_DIB_byte3;      
  wire                            con_DIA_byte4;      
  wire                            con_DIB_byte4;      
  wire                            con_DIA_byte5;      
  wire                            con_DIB_byte5;      
  wire                            con_DIA_byte6;      
  wire                            con_DIB_byte6;      
  wire                            con_DIA_byte7;      
  wire                            con_DIB_byte7;      
  wire                            con_CKA;            
  wire                            con_CKB;            
  wire                            cka_per;            
  wire                            ckb_per;            
  wire                            cka_per1;           
  wire                            ckb_per1;           
  wire                            cka_per2;           
  wire                            ckb_per2;           
  wire                            cka_per3;           
  wire                            ckb_per3;           
  wire                            con_WEAN0;          
  wire                            con_WEAN1;          
  wire                            con_WEAN2;          
  wire                            con_WEAN3;          
  wire                            con_WEAN4;          
  wire                            con_WEAN5;          
  wire                            con_WEAN6;          
  wire                            con_WEAN7;          
  wire                            con_WEBN0;          
  wire                            con_WEBN1;          
  wire                            con_WEBN2;          
  wire                            con_WEBN3;          
  wire                            con_WEBN4;          
  wire                            con_WEBN5;          
  wire                            con_WEBN6;          
  wire                            con_WEBN7;          
  wire                            con_DVSE_WA;        
  wire                            con_DVS_WA;         
  wire                            con_DVSE_WB;        
  wire                            con_DVS_WB;         

  reg        [AddressSize-1:0]    Latch_A;            
  reg        [AddressSize-1:0]    Latch_B;            
  reg        [Bits-1:0]           Latch_DIA_byte0;    
  reg        [Bits-1:0]           Latch_DIB_byte0;    
  reg        [Bits-1:0]           Latch_DIA_byte1;    
  reg        [Bits-1:0]           Latch_DIB_byte1;    
  reg        [Bits-1:0]           Latch_DIA_byte2;    
  reg        [Bits-1:0]           Latch_DIB_byte2;    
  reg        [Bits-1:0]           Latch_DIA_byte3;    
  reg        [Bits-1:0]           Latch_DIB_byte3;    
  reg        [Bits-1:0]           Latch_DIA_byte4;    
  reg        [Bits-1:0]           Latch_DIB_byte4;    
  reg        [Bits-1:0]           Latch_DIA_byte5;    
  reg        [Bits-1:0]           Latch_DIB_byte5;    
  reg        [Bits-1:0]           Latch_DIA_byte6;    
  reg        [Bits-1:0]           Latch_DIB_byte6;    
  reg        [Bits-1:0]           Latch_DIA_byte7;    
  reg        [Bits-1:0]           Latch_DIB_byte7;    
  reg                             Latch_WEAN0;        
  reg                             Latch_WEAN1;        
  reg                             Latch_WEAN2;        
  reg                             Latch_WEAN3;        
  reg                             Latch_WEAN4;        
  reg                             Latch_WEAN5;        
  reg                             Latch_WEAN6;        
  reg                             Latch_WEAN7;        
  reg                             Latch_WEBN0;        
  reg                             Latch_WEBN1;        
  reg                             Latch_WEBN2;        
  reg                             Latch_WEBN3;        
  reg                             Latch_WEBN4;        
  reg                             Latch_WEBN5;        
  reg                             Latch_WEBN6;        
  reg                             Latch_WEBN7;        
  reg                             Latch_CSA;          
  reg                             Latch_CSB;          
  reg                             Latch_DVSE;         
  reg        [DVSize-1:0]         Latch_DVS;          
  reg        [AddressSize-1:0]    LastCycleAAddress;  
  reg        [AddressSize-1:0]    LastCycleBAddress;  

  reg        [AddressSize-1:0]    A_i;                
  reg        [AddressSize-1:0]    B_i;                
  reg        [Bits-1:0]           DIA_byte0_i;        
  reg        [Bits-1:0]           DIB_byte0_i;        
  reg        [Bits-1:0]           DIA_byte1_i;        
  reg        [Bits-1:0]           DIB_byte1_i;        
  reg        [Bits-1:0]           DIA_byte2_i;        
  reg        [Bits-1:0]           DIB_byte2_i;        
  reg        [Bits-1:0]           DIA_byte3_i;        
  reg        [Bits-1:0]           DIB_byte3_i;        
  reg        [Bits-1:0]           DIA_byte4_i;        
  reg        [Bits-1:0]           DIB_byte4_i;        
  reg        [Bits-1:0]           DIA_byte5_i;        
  reg        [Bits-1:0]           DIB_byte5_i;        
  reg        [Bits-1:0]           DIA_byte6_i;        
  reg        [Bits-1:0]           DIB_byte6_i;        
  reg        [Bits-1:0]           DIA_byte7_i;        
  reg        [Bits-1:0]           DIB_byte7_i;        
  reg                             WEAN0_i;            
  reg                             WEAN1_i;            
  reg                             WEAN2_i;            
  reg                             WEAN3_i;            
  reg                             WEAN4_i;            
  reg                             WEAN5_i;            
  reg                             WEAN6_i;            
  reg                             WEAN7_i;            
  reg                             WEBN0_i;            
  reg                             WEBN1_i;            
  reg                             WEBN2_i;            
  reg                             WEBN3_i;            
  reg                             WEBN4_i;            
  reg                             WEBN5_i;            
  reg                             WEBN6_i;            
  reg                             WEBN7_i;            
  reg                             CSA_i;              
  reg                             CSB_i;              
  reg                             DVSE_i;             
  reg        [DVSize-1:0]         DVS_i;              
  reg                             NAP_i;              
  reg                             NAPREG;             

  reg                             n_flag_A0;          
  reg                             n_flag_A1;          
  reg                             n_flag_A2;          
  reg                             n_flag_A3;          
  reg                             n_flag_A4;          
  reg                             n_flag_A5;          
  reg                             n_flag_A6;          
  reg                             n_flag_A7;          
  reg                             n_flag_A8;          
  reg                             n_flag_A9;          
  reg                             n_flag_A10;         
  reg                             n_flag_A11;         
  reg                             n_flag_A12;         
  reg                             n_flag_B0;          
  reg                             n_flag_B1;          
  reg                             n_flag_B2;          
  reg                             n_flag_B3;          
  reg                             n_flag_B4;          
  reg                             n_flag_B5;          
  reg                             n_flag_B6;          
  reg                             n_flag_B7;          
  reg                             n_flag_B8;          
  reg                             n_flag_B9;          
  reg                             n_flag_B10;         
  reg                             n_flag_B11;         
  reg                             n_flag_B12;         
  reg                             n_flag_DIA0;        
  reg                             n_flag_DIB0;        
  reg                             n_flag_DIA1;        
  reg                             n_flag_DIB1;        
  reg                             n_flag_DIA2;        
  reg                             n_flag_DIB2;        
  reg                             n_flag_DIA3;        
  reg                             n_flag_DIB3;        
  reg                             n_flag_DIA4;        
  reg                             n_flag_DIB4;        
  reg                             n_flag_DIA5;        
  reg                             n_flag_DIB5;        
  reg                             n_flag_DIA6;        
  reg                             n_flag_DIB6;        
  reg                             n_flag_DIA7;        
  reg                             n_flag_DIB7;        
  reg                             n_flag_DIA8;        
  reg                             n_flag_DIB8;        
  reg                             n_flag_DIA9;        
  reg                             n_flag_DIB9;        
  reg                             n_flag_DIA10;       
  reg                             n_flag_DIB10;       
  reg                             n_flag_DIA11;       
  reg                             n_flag_DIB11;       
  reg                             n_flag_DIA12;       
  reg                             n_flag_DIB12;       
  reg                             n_flag_DIA13;       
  reg                             n_flag_DIB13;       
  reg                             n_flag_DIA14;       
  reg                             n_flag_DIB14;       
  reg                             n_flag_DIA15;       
  reg                             n_flag_DIB15;       
  reg                             n_flag_DIA16;       
  reg                             n_flag_DIB16;       
  reg                             n_flag_DIA17;       
  reg                             n_flag_DIB17;       
  reg                             n_flag_DIA18;       
  reg                             n_flag_DIB18;       
  reg                             n_flag_DIA19;       
  reg                             n_flag_DIB19;       
  reg                             n_flag_DIA20;       
  reg                             n_flag_DIB20;       
  reg                             n_flag_DIA21;       
  reg                             n_flag_DIB21;       
  reg                             n_flag_DIA22;       
  reg                             n_flag_DIB22;       
  reg                             n_flag_DIA23;       
  reg                             n_flag_DIB23;       
  reg                             n_flag_DIA24;       
  reg                             n_flag_DIB24;       
  reg                             n_flag_DIA25;       
  reg                             n_flag_DIB25;       
  reg                             n_flag_DIA26;       
  reg                             n_flag_DIB26;       
  reg                             n_flag_DIA27;       
  reg                             n_flag_DIB27;       
  reg                             n_flag_DIA28;       
  reg                             n_flag_DIB28;       
  reg                             n_flag_DIA29;       
  reg                             n_flag_DIB29;       
  reg                             n_flag_DIA30;       
  reg                             n_flag_DIB30;       
  reg                             n_flag_DIA31;       
  reg                             n_flag_DIB31;       
  reg                             n_flag_DIA32;       
  reg                             n_flag_DIB32;       
  reg                             n_flag_DIA33;       
  reg                             n_flag_DIB33;       
  reg                             n_flag_DIA34;       
  reg                             n_flag_DIB34;       
  reg                             n_flag_DIA35;       
  reg                             n_flag_DIB35;       
  reg                             n_flag_DIA36;       
  reg                             n_flag_DIB36;       
  reg                             n_flag_DIA37;       
  reg                             n_flag_DIB37;       
  reg                             n_flag_DIA38;       
  reg                             n_flag_DIB38;       
  reg                             n_flag_DIA39;       
  reg                             n_flag_DIB39;       
  reg                             n_flag_DIA40;       
  reg                             n_flag_DIB40;       
  reg                             n_flag_DIA41;       
  reg                             n_flag_DIB41;       
  reg                             n_flag_DIA42;       
  reg                             n_flag_DIB42;       
  reg                             n_flag_DIA43;       
  reg                             n_flag_DIB43;       
  reg                             n_flag_DIA44;       
  reg                             n_flag_DIB44;       
  reg                             n_flag_DIA45;       
  reg                             n_flag_DIB45;       
  reg                             n_flag_DIA46;       
  reg                             n_flag_DIB46;       
  reg                             n_flag_DIA47;       
  reg                             n_flag_DIB47;       
  reg                             n_flag_DIA48;       
  reg                             n_flag_DIB48;       
  reg                             n_flag_DIA49;       
  reg                             n_flag_DIB49;       
  reg                             n_flag_DIA50;       
  reg                             n_flag_DIB50;       
  reg                             n_flag_DIA51;       
  reg                             n_flag_DIB51;       
  reg                             n_flag_DIA52;       
  reg                             n_flag_DIB52;       
  reg                             n_flag_DIA53;       
  reg                             n_flag_DIB53;       
  reg                             n_flag_DIA54;       
  reg                             n_flag_DIB54;       
  reg                             n_flag_DIA55;       
  reg                             n_flag_DIB55;       
  reg                             n_flag_DIA56;       
  reg                             n_flag_DIB56;       
  reg                             n_flag_DIA57;       
  reg                             n_flag_DIB57;       
  reg                             n_flag_DIA58;       
  reg                             n_flag_DIB58;       
  reg                             n_flag_DIA59;       
  reg                             n_flag_DIB59;       
  reg                             n_flag_DIA60;       
  reg                             n_flag_DIB60;       
  reg                             n_flag_DIA61;       
  reg                             n_flag_DIB61;       
  reg                             n_flag_DIA62;       
  reg                             n_flag_DIB62;       
  reg                             n_flag_DIA63;       
  reg                             n_flag_DIB63;       
  reg                             n_flag_WEAN0;       
  reg                             n_flag_WEAN1;       
  reg                             n_flag_WEAN2;       
  reg                             n_flag_WEAN3;       
  reg                             n_flag_WEAN4;       
  reg                             n_flag_WEAN5;       
  reg                             n_flag_WEAN6;       
  reg                             n_flag_WEAN7;       
  reg                             n_flag_WEBN0;       
  reg                             n_flag_WEBN1;       
  reg                             n_flag_WEBN2;       
  reg                             n_flag_WEBN3;       
  reg                             n_flag_WEBN4;       
  reg                             n_flag_WEBN5;       
  reg                             n_flag_WEBN6;       
  reg                             n_flag_WEBN7;       
  reg                             n_flag_DVSE;        
  reg                             n_flag_DVS0;        
  reg                             n_flag_DVS1;        
  reg                             n_flag_DVS2;        
  reg                             n_flag_DVS3;        
  reg                             n_flag_CSA;         
  reg                             n_flag_CSB;         
  reg                             n_flag_CKA_PER;     
  reg                             n_flag_CKA_MINH;    
  reg                             n_flag_CKA_MINL;    
  reg                             n_flag_CKB_PER;     
  reg                             n_flag_CKB_MINH;    
  reg                             n_flag_CKB_MINL;    
  reg                             n_flag_TR2W;        
  reg                             CKA_CKB_SKEW;       
  reg                             CKB_CKA_SKEW;       
  reg                             LAST_n_flag_WEAN0;  
  reg                             LAST_n_flag_WEAN1;  
  reg                             LAST_n_flag_WEAN2;  
  reg                             LAST_n_flag_WEAN3;  
  reg                             LAST_n_flag_WEAN4;  
  reg                             LAST_n_flag_WEAN5;  
  reg                             LAST_n_flag_WEAN6;  
  reg                             LAST_n_flag_WEAN7;  
  reg                             LAST_n_flag_WEBN0;  
  reg                             LAST_n_flag_WEBN1;  
  reg                             LAST_n_flag_WEBN2;  
  reg                             LAST_n_flag_WEBN3;  
  reg                             LAST_n_flag_WEBN4;  
  reg                             LAST_n_flag_WEBN5;  
  reg                             LAST_n_flag_WEBN6;  
  reg                             LAST_n_flag_WEBN7;  
  reg                             LAST_n_flag_CSA;    
  reg                             LAST_n_flag_CSB;    
  reg                             LAST_n_flag_CKA_PER;
  reg                             LAST_n_flag_CKA_MINH;
  reg                             LAST_n_flag_CKA_MINL;
  reg                             LAST_n_flag_CKB_PER;
  reg                             LAST_n_flag_CKB_MINH;
  reg                             LAST_n_flag_CKB_MINL;
  reg                             n_flag_NAP;         
  reg                             n_flag_NAP_CS;      
  reg                             Last_CKA_temp;      
  reg                             Last_CKB_temp;      
  reg                             CSA_temp;           
  reg                             CSB_temp;           

  reg        [AddressSize-1:0]    NOT_BUS_B;          
  reg        [AddressSize-1:0]    LAST_NOT_BUS_B;     
  reg        [AddressSize-1:0]    NOT_BUS_A;          
  reg        [AddressSize-1:0]    LAST_NOT_BUS_A;     
  reg        [Bits-1:0]           NOT_BUS_DIA_byte0;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte0;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte0;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte0;
  reg        [Bits-1:0]           NOT_BUS_DIA_byte1;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte1;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte1;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte1;
  reg        [Bits-1:0]           NOT_BUS_DIA_byte2;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte2;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte2;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte2;
  reg        [Bits-1:0]           NOT_BUS_DIA_byte3;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte3;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte3;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte3;
  reg        [Bits-1:0]           NOT_BUS_DIA_byte4;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte4;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte4;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte4;
  reg        [Bits-1:0]           NOT_BUS_DIA_byte5;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte5;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte5;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte5;
  reg        [Bits-1:0]           NOT_BUS_DIA_byte6;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte6;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte6;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte6;
  reg        [Bits-1:0]           NOT_BUS_DIA_byte7;  
  reg        [Bits-1:0]           NOT_BUS_DIB_byte7;  
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA_byte7;
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB_byte7;

  reg                             LAST_n_flag_DVSE;   
  reg        [DVSize-1:0]         NOT_BUS_DVS;        
  reg        [DVSize-1:0]         LAST_NOT_BUS_DVS;   

  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       
  reg        [AddressSize-1:0]    last_B;             
  reg        [AddressSize-1:0]    latch_last_B;       

  reg        [Bits-1:0]           last_DIA_byte0;     
  reg        [Bits-1:0]           latch_last_DIA_byte0;
  reg        [Bits-1:0]           last_DIA_byte1;     
  reg        [Bits-1:0]           latch_last_DIA_byte1;
  reg        [Bits-1:0]           last_DIA_byte2;     
  reg        [Bits-1:0]           latch_last_DIA_byte2;
  reg        [Bits-1:0]           last_DIA_byte3;     
  reg        [Bits-1:0]           latch_last_DIA_byte3;
  reg        [Bits-1:0]           last_DIA_byte4;     
  reg        [Bits-1:0]           latch_last_DIA_byte4;
  reg        [Bits-1:0]           last_DIA_byte5;     
  reg        [Bits-1:0]           latch_last_DIA_byte5;
  reg        [Bits-1:0]           last_DIA_byte6;     
  reg        [Bits-1:0]           latch_last_DIA_byte6;
  reg        [Bits-1:0]           last_DIA_byte7;     
  reg        [Bits-1:0]           latch_last_DIA_byte7;
  reg        [Bits-1:0]           last_DIB_byte0;     
  reg        [Bits-1:0]           latch_last_DIB_byte0;
  reg        [Bits-1:0]           last_DIB_byte1;     
  reg        [Bits-1:0]           latch_last_DIB_byte1;
  reg        [Bits-1:0]           last_DIB_byte2;     
  reg        [Bits-1:0]           latch_last_DIB_byte2;
  reg        [Bits-1:0]           last_DIB_byte3;     
  reg        [Bits-1:0]           latch_last_DIB_byte3;
  reg        [Bits-1:0]           last_DIB_byte4;     
  reg        [Bits-1:0]           latch_last_DIB_byte4;
  reg        [Bits-1:0]           last_DIB_byte5;     
  reg        [Bits-1:0]           latch_last_DIB_byte5;
  reg        [Bits-1:0]           last_DIB_byte6;     
  reg        [Bits-1:0]           latch_last_DIB_byte6;
  reg        [Bits-1:0]           last_DIB_byte7;     
  reg        [Bits-1:0]           latch_last_DIB_byte7;

  reg                             last_WEAN0;         
  reg                             latch_last_WEAN0;   
  reg                             last_WEAN1;         
  reg                             latch_last_WEAN1;   
  reg                             last_WEAN2;         
  reg                             latch_last_WEAN2;   
  reg                             last_WEAN3;         
  reg                             latch_last_WEAN3;   
  reg                             last_WEAN4;         
  reg                             latch_last_WEAN4;   
  reg                             last_WEAN5;         
  reg                             latch_last_WEAN5;   
  reg                             last_WEAN6;         
  reg                             latch_last_WEAN6;   
  reg                             last_WEAN7;         
  reg                             latch_last_WEAN7;   
  reg                             last_WEBN0;         
  reg                             latch_last_WEBN0;   
  reg                             last_WEBN1;         
  reg                             latch_last_WEBN1;   
  reg                             last_WEBN2;         
  reg                             latch_last_WEBN2;   
  reg                             last_WEBN3;         
  reg                             latch_last_WEBN3;   
  reg                             last_WEBN4;         
  reg                             latch_last_WEBN4;   
  reg                             last_WEBN5;         
  reg                             latch_last_WEBN5;   
  reg                             last_WEBN6;         
  reg                             latch_last_WEBN6;   
  reg                             last_WEBN7;         
  reg                             latch_last_WEBN7;   

  reg        [Bits-1:0]           DOA_byte0_i;        
  reg        [Bits-1:0]           DOB_byte0_i;        
  reg        [Bits-1:0]           DOA_byte1_i;        
  reg        [Bits-1:0]           DOB_byte1_i;        
  reg        [Bits-1:0]           DOA_byte2_i;        
  reg        [Bits-1:0]           DOB_byte2_i;        
  reg        [Bits-1:0]           DOA_byte3_i;        
  reg        [Bits-1:0]           DOB_byte3_i;        
  reg        [Bits-1:0]           DOA_byte4_i;        
  reg        [Bits-1:0]           DOB_byte4_i;        
  reg        [Bits-1:0]           DOA_byte5_i;        
  reg        [Bits-1:0]           DOB_byte5_i;        
  reg        [Bits-1:0]           DOA_byte6_i;        
  reg        [Bits-1:0]           DOB_byte6_i;        
  reg        [Bits-1:0]           DOA_byte7_i;        
  reg        [Bits-1:0]           DOB_byte7_i;        


  reg                             LastClkAEdge;       
  reg                             LastClkBEdge;       

  reg                             Last_WEAN0_i;       
  reg                             Last_WEAN1_i;       
  reg                             Last_WEAN2_i;       
  reg                             Last_WEAN3_i;       
  reg                             Last_WEAN4_i;       
  reg                             Last_WEAN5_i;       
  reg                             Last_WEAN6_i;       
  reg                             Last_WEAN7_i;       
  reg                             Last_WEBN0_i;       
  reg                             Last_WEBN1_i;       
  reg                             Last_WEBN2_i;       
  reg                             Last_WEBN3_i;       
  reg                             Last_WEBN4_i;       
  reg                             Last_WEBN5_i;       
  reg                             Last_WEBN6_i;       
  reg                             Last_WEBN7_i;       

  reg                             flag_A_x;           
  reg                             flag_B_x;           
  reg                             flag_CSA_x;         
  reg                             flag_CSB_x;         
  reg                             NODELAYA0;          
  reg                             NODELAYB0;          
  reg                             NODELAYA1;          
  reg                             NODELAYB1;          
  reg                             NODELAYA2;          
  reg                             NODELAYB2;          
  reg                             NODELAYA3;          
  reg                             NODELAYB3;          
  reg                             NODELAYA4;          
  reg                             NODELAYB4;          
  reg                             NODELAYA5;          
  reg                             NODELAYB5;          
  reg                             NODELAYA6;          
  reg                             NODELAYB6;          
  reg                             NODELAYA7;          
  reg                             NODELAYB7;          
  reg        [Bits-1:0]           DOA_byte0_tmp;      
  reg        [Bits-1:0]           DOB_byte0_tmp;      
  event                           EventTOHDOA_byte0;  
  event                           EventTOHDOB_byte0;  
  reg        [Bits-1:0]           DOA_byte1_tmp;      
  reg        [Bits-1:0]           DOB_byte1_tmp;      
  event                           EventTOHDOA_byte1;  
  event                           EventTOHDOB_byte1;  
  reg        [Bits-1:0]           DOA_byte2_tmp;      
  reg        [Bits-1:0]           DOB_byte2_tmp;      
  event                           EventTOHDOA_byte2;  
  event                           EventTOHDOB_byte2;  
  reg        [Bits-1:0]           DOA_byte3_tmp;      
  reg        [Bits-1:0]           DOB_byte3_tmp;      
  event                           EventTOHDOA_byte3;  
  event                           EventTOHDOB_byte3;  
  reg        [Bits-1:0]           DOA_byte4_tmp;      
  reg        [Bits-1:0]           DOB_byte4_tmp;      
  event                           EventTOHDOA_byte4;  
  event                           EventTOHDOB_byte4;  
  reg        [Bits-1:0]           DOA_byte5_tmp;      
  reg        [Bits-1:0]           DOB_byte5_tmp;      
  event                           EventTOHDOA_byte5;  
  event                           EventTOHDOB_byte5;  
  reg        [Bits-1:0]           DOA_byte6_tmp;      
  reg        [Bits-1:0]           DOB_byte6_tmp;      
  event                           EventTOHDOA_byte6;  
  event                           EventTOHDOB_byte6;  
  reg        [Bits-1:0]           DOA_byte7_tmp;      
  reg        [Bits-1:0]           DOB_byte7_tmp;      
  event                           EventTOHDOA_byte7;  
  event                           EventTOHDOB_byte7;  
  event                           EventTWDXDOA_byte0; 
  event                           EventTWDXDOA_byte1; 
  event                           EventTWDXDOA_byte2; 
  event                           EventTWDXDOA_byte3; 
  event                           EventTWDXDOA_byte4; 
  event                           EventTWDXDOA_byte5; 
  event                           EventTWDXDOA_byte6; 
  event                           EventTWDXDOA_byte7; 
  event                           EventTWDXDOB_byte0; 
  event                           EventTWDXDOB_byte1; 
  event                           EventTWDXDOB_byte2; 
  event                           EventTWDXDOB_byte3; 
  event                           EventTWDXDOB_byte4; 
  event                           EventTWDXDOB_byte5; 
  event                           EventTWDXDOB_byte6; 
  event                           EventTWDXDOB_byte7; 

`ifdef MEM_VERIFY
  reg                             taa_verifya;        
  reg                             taa_verifyb;        
`else
`endif

  reg                             NOSTANDBY;          
  reg                             CS_tri_error;       
  reg                             Violate_Hold_time;  
  reg                             nap_initial_trigger;
  wire                            CSA_CSB_temp;       
  wire                            con_NAP;            
  wire                            con_CK_NAP;         
  event                           EventNAPT;          

  time                            Last_tc_ClkA_PosEdge;
  time                            Last_tc_ClkB_PosEdge;
  assign     DOA_                 = {DOA_byte7_i,DOA_byte6_i,DOA_byte5_i,DOA_byte4_i,DOA_byte3_i,DOA_byte2_i,DOA_byte1_i,DOA_byte0_i};
  assign     DOB_                 = {DOB_byte7_i,DOB_byte6_i,DOB_byte5_i,DOB_byte4_i,DOB_byte3_i,DOB_byte2_i,DOB_byte1_i,DOB_byte0_i};
  assign     con_A                = CSA_;
  assign     con_B                = CSB_;
  assign     con_DIA_byte0        = CSA_ & (!WEAN0_);
  assign     con_DIB_byte0        = CSB_ & (!WEBN0_);
  assign     con_DIA_byte1        = CSA_ & (!WEAN1_);
  assign     con_DIB_byte1        = CSB_ & (!WEBN1_);
  assign     con_DIA_byte2        = CSA_ & (!WEAN2_);
  assign     con_DIB_byte2        = CSB_ & (!WEBN2_);
  assign     con_DIA_byte3        = CSA_ & (!WEAN3_);
  assign     con_DIB_byte3        = CSB_ & (!WEBN3_);
  assign     con_DIA_byte4        = CSA_ & (!WEAN4_);
  assign     con_DIB_byte4        = CSB_ & (!WEBN4_);
  assign     con_DIA_byte5        = CSA_ & (!WEAN5_);
  assign     con_DIB_byte5        = CSB_ & (!WEBN5_);
  assign     con_DIA_byte6        = CSA_ & (!WEAN6_);
  assign     con_DIB_byte6        = CSB_ & (!WEBN6_);
  assign     con_DIA_byte7        = CSA_ & (!WEAN7_);
  assign     con_DIB_byte7        = CSB_ & (!WEBN7_);
  assign     con_WEAN0            = CSA_;
  assign     con_WEAN1            = CSA_;
  assign     con_WEAN2            = CSA_;
  assign     con_WEAN3            = CSA_;
  assign     con_WEAN4            = CSA_;
  assign     con_WEAN5            = CSA_;
  assign     con_WEAN6            = CSA_;
  assign     con_WEAN7            = CSA_;
  assign     con_WEBN0            = CSB_;
  assign     con_WEBN1            = CSB_;
  assign     con_WEBN2            = CSB_;
  assign     con_WEBN3            = CSB_;
  assign     con_WEBN4            = CSB_;
  assign     con_WEBN5            = CSB_;
  assign     con_WEBN6            = CSB_;
  assign     con_WEBN7            = CSB_;
  assign     con_CKA              = CSA_;
  assign     con_CKB              = CSB_;
  assign     cka_per              = CSA_ & !DVSE_;
  assign     ckb_per              = CSB_ & !DVSE_;
  assign     cka_per1             = CSA_ & DVSE_ & DVS_[0] & !DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ckb_per1             = CSB_ & DVSE_ & DVS_[0] & !DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     cka_per2             = CSA_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ckb_per2             = CSB_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     cka_per3             = CSA_ & DVSE_ & DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ckb_per3             = CSB_ & DVSE_ & DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     con_DVSE_WA          = CSA_;
  assign     con_DVS_WA           = CSA_ & DVSE_;
  assign     con_DVSE_WB          = CSB_;
  assign     con_DVS_WB           = CSB_ & DVSE_;
  assign     con_NAP              = (!CSA_) & (!CSB_);
  assign     con_CK_NAP           = CSA_CSB_temp & (!NOSTANDBY);

  buf        idoa0           (DOA0, DOA_[0]);              
  buf        idob0           (DOB0, DOB_[0]);              
  buf        idoa1           (DOA1, DOA_[1]);              
  buf        idob1           (DOB1, DOB_[1]);              
  buf        idoa2           (DOA2, DOA_[2]);              
  buf        idob2           (DOB2, DOB_[2]);              
  buf        idoa3           (DOA3, DOA_[3]);              
  buf        idob3           (DOB3, DOB_[3]);              
  buf        idoa4           (DOA4, DOA_[4]);              
  buf        idob4           (DOB4, DOB_[4]);              
  buf        idoa5           (DOA5, DOA_[5]);              
  buf        idob5           (DOB5, DOB_[5]);              
  buf        idoa6           (DOA6, DOA_[6]);              
  buf        idob6           (DOB6, DOB_[6]);              
  buf        idoa7           (DOA7, DOA_[7]);              
  buf        idob7           (DOB7, DOB_[7]);              
  buf        idoa8           (DOA8, DOA_[8]);              
  buf        idob8           (DOB8, DOB_[8]);              
  buf        idoa9           (DOA9, DOA_[9]);              
  buf        idob9           (DOB9, DOB_[9]);              
  buf        idoa10          (DOA10, DOA_[10]);            
  buf        idob10          (DOB10, DOB_[10]);            
  buf        idoa11          (DOA11, DOA_[11]);            
  buf        idob11          (DOB11, DOB_[11]);            
  buf        idoa12          (DOA12, DOA_[12]);            
  buf        idob12          (DOB12, DOB_[12]);            
  buf        idoa13          (DOA13, DOA_[13]);            
  buf        idob13          (DOB13, DOB_[13]);            
  buf        idoa14          (DOA14, DOA_[14]);            
  buf        idob14          (DOB14, DOB_[14]);            
  buf        idoa15          (DOA15, DOA_[15]);            
  buf        idob15          (DOB15, DOB_[15]);            
  buf        idoa16          (DOA16, DOA_[16]);            
  buf        idob16          (DOB16, DOB_[16]);            
  buf        idoa17          (DOA17, DOA_[17]);            
  buf        idob17          (DOB17, DOB_[17]);            
  buf        idoa18          (DOA18, DOA_[18]);            
  buf        idob18          (DOB18, DOB_[18]);            
  buf        idoa19          (DOA19, DOA_[19]);            
  buf        idob19          (DOB19, DOB_[19]);            
  buf        idoa20          (DOA20, DOA_[20]);            
  buf        idob20          (DOB20, DOB_[20]);            
  buf        idoa21          (DOA21, DOA_[21]);            
  buf        idob21          (DOB21, DOB_[21]);            
  buf        idoa22          (DOA22, DOA_[22]);            
  buf        idob22          (DOB22, DOB_[22]);            
  buf        idoa23          (DOA23, DOA_[23]);            
  buf        idob23          (DOB23, DOB_[23]);            
  buf        idoa24          (DOA24, DOA_[24]);            
  buf        idob24          (DOB24, DOB_[24]);            
  buf        idoa25          (DOA25, DOA_[25]);            
  buf        idob25          (DOB25, DOB_[25]);            
  buf        idoa26          (DOA26, DOA_[26]);            
  buf        idob26          (DOB26, DOB_[26]);            
  buf        idoa27          (DOA27, DOA_[27]);            
  buf        idob27          (DOB27, DOB_[27]);            
  buf        idoa28          (DOA28, DOA_[28]);            
  buf        idob28          (DOB28, DOB_[28]);            
  buf        idoa29          (DOA29, DOA_[29]);            
  buf        idob29          (DOB29, DOB_[29]);            
  buf        idoa30          (DOA30, DOA_[30]);            
  buf        idob30          (DOB30, DOB_[30]);            
  buf        idoa31          (DOA31, DOA_[31]);            
  buf        idob31          (DOB31, DOB_[31]);            
  buf        idoa32          (DOA32, DOA_[32]);            
  buf        idob32          (DOB32, DOB_[32]);            
  buf        idoa33          (DOA33, DOA_[33]);            
  buf        idob33          (DOB33, DOB_[33]);            
  buf        idoa34          (DOA34, DOA_[34]);            
  buf        idob34          (DOB34, DOB_[34]);            
  buf        idoa35          (DOA35, DOA_[35]);            
  buf        idob35          (DOB35, DOB_[35]);            
  buf        idoa36          (DOA36, DOA_[36]);            
  buf        idob36          (DOB36, DOB_[36]);            
  buf        idoa37          (DOA37, DOA_[37]);            
  buf        idob37          (DOB37, DOB_[37]);            
  buf        idoa38          (DOA38, DOA_[38]);            
  buf        idob38          (DOB38, DOB_[38]);            
  buf        idoa39          (DOA39, DOA_[39]);            
  buf        idob39          (DOB39, DOB_[39]);            
  buf        idoa40          (DOA40, DOA_[40]);            
  buf        idob40          (DOB40, DOB_[40]);            
  buf        idoa41          (DOA41, DOA_[41]);            
  buf        idob41          (DOB41, DOB_[41]);            
  buf        idoa42          (DOA42, DOA_[42]);            
  buf        idob42          (DOB42, DOB_[42]);            
  buf        idoa43          (DOA43, DOA_[43]);            
  buf        idob43          (DOB43, DOB_[43]);            
  buf        idoa44          (DOA44, DOA_[44]);            
  buf        idob44          (DOB44, DOB_[44]);            
  buf        idoa45          (DOA45, DOA_[45]);            
  buf        idob45          (DOB45, DOB_[45]);            
  buf        idoa46          (DOA46, DOA_[46]);            
  buf        idob46          (DOB46, DOB_[46]);            
  buf        idoa47          (DOA47, DOA_[47]);            
  buf        idob47          (DOB47, DOB_[47]);            
  buf        idoa48          (DOA48, DOA_[48]);            
  buf        idob48          (DOB48, DOB_[48]);            
  buf        idoa49          (DOA49, DOA_[49]);            
  buf        idob49          (DOB49, DOB_[49]);            
  buf        idoa50          (DOA50, DOA_[50]);            
  buf        idob50          (DOB50, DOB_[50]);            
  buf        idoa51          (DOA51, DOA_[51]);            
  buf        idob51          (DOB51, DOB_[51]);            
  buf        idoa52          (DOA52, DOA_[52]);            
  buf        idob52          (DOB52, DOB_[52]);            
  buf        idoa53          (DOA53, DOA_[53]);            
  buf        idob53          (DOB53, DOB_[53]);            
  buf        idoa54          (DOA54, DOA_[54]);            
  buf        idob54          (DOB54, DOB_[54]);            
  buf        idoa55          (DOA55, DOA_[55]);            
  buf        idob55          (DOB55, DOB_[55]);            
  buf        idoa56          (DOA56, DOA_[56]);            
  buf        idob56          (DOB56, DOB_[56]);            
  buf        idoa57          (DOA57, DOA_[57]);            
  buf        idob57          (DOB57, DOB_[57]);            
  buf        idoa58          (DOA58, DOA_[58]);            
  buf        idob58          (DOB58, DOB_[58]);            
  buf        idoa59          (DOA59, DOA_[59]);            
  buf        idob59          (DOB59, DOB_[59]);            
  buf        idoa60          (DOA60, DOA_[60]);            
  buf        idob60          (DOB60, DOB_[60]);            
  buf        idoa61          (DOA61, DOA_[61]);            
  buf        idob61          (DOB61, DOB_[61]);            
  buf        idoa62          (DOA62, DOA_[62]);            
  buf        idob62          (DOB62, DOB_[62]);            
  buf        idoa63          (DOA63, DOA_[63]);            
  buf        idob63          (DOB63, DOB_[63]);            
  buf        ia0             (A_[0], A0);                  
  buf        ia1             (A_[1], A1);                  
  buf        ia2             (A_[2], A2);                  
  buf        ia3             (A_[3], A3);                  
  buf        ia4             (A_[4], A4);                  
  buf        ia5             (A_[5], A5);                  
  buf        ia6             (A_[6], A6);                  
  buf        ia7             (A_[7], A7);                  
  buf        ia8             (A_[8], A8);                  
  buf        ia9             (A_[9], A9);                  
  buf        ia10            (A_[10], A10);                
  buf        ia11            (A_[11], A11);                
  buf        ia12            (A_[12], A12);                
  buf        ib0             (B_[0], B0);                  
  buf        ib1             (B_[1], B1);                  
  buf        ib2             (B_[2], B2);                  
  buf        ib3             (B_[3], B3);                  
  buf        ib4             (B_[4], B4);                  
  buf        ib5             (B_[5], B5);                  
  buf        ib6             (B_[6], B6);                  
  buf        ib7             (B_[7], B7);                  
  buf        ib8             (B_[8], B8);                  
  buf        ib9             (B_[9], B9);                  
  buf        ib10            (B_[10], B10);                
  buf        ib11            (B_[11], B11);                
  buf        ib12            (B_[12], B12);                
  buf        idia_byte0_0    (DIA_byte0_[0], DIA0);        
  buf        idib_byte0_0    (DIB_byte0_[0], DIB0);        
  buf        idia_byte0_1    (DIA_byte0_[1], DIA1);        
  buf        idib_byte0_1    (DIB_byte0_[1], DIB1);        
  buf        idia_byte0_2    (DIA_byte0_[2], DIA2);        
  buf        idib_byte0_2    (DIB_byte0_[2], DIB2);        
  buf        idia_byte0_3    (DIA_byte0_[3], DIA3);        
  buf        idib_byte0_3    (DIB_byte0_[3], DIB3);        
  buf        idia_byte0_4    (DIA_byte0_[4], DIA4);        
  buf        idib_byte0_4    (DIB_byte0_[4], DIB4);        
  buf        idia_byte0_5    (DIA_byte0_[5], DIA5);        
  buf        idib_byte0_5    (DIB_byte0_[5], DIB5);        
  buf        idia_byte0_6    (DIA_byte0_[6], DIA6);        
  buf        idib_byte0_6    (DIB_byte0_[6], DIB6);        
  buf        idia_byte0_7    (DIA_byte0_[7], DIA7);        
  buf        idib_byte0_7    (DIB_byte0_[7], DIB7);        
  buf        idia_byte1_0    (DIA_byte1_[0], DIA8);        
  buf        idib_byte1_0    (DIB_byte1_[0], DIB8);        
  buf        idia_byte1_1    (DIA_byte1_[1], DIA9);        
  buf        idib_byte1_1    (DIB_byte1_[1], DIB9);        
  buf        idia_byte1_2    (DIA_byte1_[2], DIA10);       
  buf        idib_byte1_2    (DIB_byte1_[2], DIB10);       
  buf        idia_byte1_3    (DIA_byte1_[3], DIA11);       
  buf        idib_byte1_3    (DIB_byte1_[3], DIB11);       
  buf        idia_byte1_4    (DIA_byte1_[4], DIA12);       
  buf        idib_byte1_4    (DIB_byte1_[4], DIB12);       
  buf        idia_byte1_5    (DIA_byte1_[5], DIA13);       
  buf        idib_byte1_5    (DIB_byte1_[5], DIB13);       
  buf        idia_byte1_6    (DIA_byte1_[6], DIA14);       
  buf        idib_byte1_6    (DIB_byte1_[6], DIB14);       
  buf        idia_byte1_7    (DIA_byte1_[7], DIA15);       
  buf        idib_byte1_7    (DIB_byte1_[7], DIB15);       
  buf        idia_byte2_0    (DIA_byte2_[0], DIA16);       
  buf        idib_byte2_0    (DIB_byte2_[0], DIB16);       
  buf        idia_byte2_1    (DIA_byte2_[1], DIA17);       
  buf        idib_byte2_1    (DIB_byte2_[1], DIB17);       
  buf        idia_byte2_2    (DIA_byte2_[2], DIA18);       
  buf        idib_byte2_2    (DIB_byte2_[2], DIB18);       
  buf        idia_byte2_3    (DIA_byte2_[3], DIA19);       
  buf        idib_byte2_3    (DIB_byte2_[3], DIB19);       
  buf        idia_byte2_4    (DIA_byte2_[4], DIA20);       
  buf        idib_byte2_4    (DIB_byte2_[4], DIB20);       
  buf        idia_byte2_5    (DIA_byte2_[5], DIA21);       
  buf        idib_byte2_5    (DIB_byte2_[5], DIB21);       
  buf        idia_byte2_6    (DIA_byte2_[6], DIA22);       
  buf        idib_byte2_6    (DIB_byte2_[6], DIB22);       
  buf        idia_byte2_7    (DIA_byte2_[7], DIA23);       
  buf        idib_byte2_7    (DIB_byte2_[7], DIB23);       
  buf        idia_byte3_0    (DIA_byte3_[0], DIA24);       
  buf        idib_byte3_0    (DIB_byte3_[0], DIB24);       
  buf        idia_byte3_1    (DIA_byte3_[1], DIA25);       
  buf        idib_byte3_1    (DIB_byte3_[1], DIB25);       
  buf        idia_byte3_2    (DIA_byte3_[2], DIA26);       
  buf        idib_byte3_2    (DIB_byte3_[2], DIB26);       
  buf        idia_byte3_3    (DIA_byte3_[3], DIA27);       
  buf        idib_byte3_3    (DIB_byte3_[3], DIB27);       
  buf        idia_byte3_4    (DIA_byte3_[4], DIA28);       
  buf        idib_byte3_4    (DIB_byte3_[4], DIB28);       
  buf        idia_byte3_5    (DIA_byte3_[5], DIA29);       
  buf        idib_byte3_5    (DIB_byte3_[5], DIB29);       
  buf        idia_byte3_6    (DIA_byte3_[6], DIA30);       
  buf        idib_byte3_6    (DIB_byte3_[6], DIB30);       
  buf        idia_byte3_7    (DIA_byte3_[7], DIA31);       
  buf        idib_byte3_7    (DIB_byte3_[7], DIB31);       
  buf        idia_byte4_0    (DIA_byte4_[0], DIA32);       
  buf        idib_byte4_0    (DIB_byte4_[0], DIB32);       
  buf        idia_byte4_1    (DIA_byte4_[1], DIA33);       
  buf        idib_byte4_1    (DIB_byte4_[1], DIB33);       
  buf        idia_byte4_2    (DIA_byte4_[2], DIA34);       
  buf        idib_byte4_2    (DIB_byte4_[2], DIB34);       
  buf        idia_byte4_3    (DIA_byte4_[3], DIA35);       
  buf        idib_byte4_3    (DIB_byte4_[3], DIB35);       
  buf        idia_byte4_4    (DIA_byte4_[4], DIA36);       
  buf        idib_byte4_4    (DIB_byte4_[4], DIB36);       
  buf        idia_byte4_5    (DIA_byte4_[5], DIA37);       
  buf        idib_byte4_5    (DIB_byte4_[5], DIB37);       
  buf        idia_byte4_6    (DIA_byte4_[6], DIA38);       
  buf        idib_byte4_6    (DIB_byte4_[6], DIB38);       
  buf        idia_byte4_7    (DIA_byte4_[7], DIA39);       
  buf        idib_byte4_7    (DIB_byte4_[7], DIB39);       
  buf        idia_byte5_0    (DIA_byte5_[0], DIA40);       
  buf        idib_byte5_0    (DIB_byte5_[0], DIB40);       
  buf        idia_byte5_1    (DIA_byte5_[1], DIA41);       
  buf        idib_byte5_1    (DIB_byte5_[1], DIB41);       
  buf        idia_byte5_2    (DIA_byte5_[2], DIA42);       
  buf        idib_byte5_2    (DIB_byte5_[2], DIB42);       
  buf        idia_byte5_3    (DIA_byte5_[3], DIA43);       
  buf        idib_byte5_3    (DIB_byte5_[3], DIB43);       
  buf        idia_byte5_4    (DIA_byte5_[4], DIA44);       
  buf        idib_byte5_4    (DIB_byte5_[4], DIB44);       
  buf        idia_byte5_5    (DIA_byte5_[5], DIA45);       
  buf        idib_byte5_5    (DIB_byte5_[5], DIB45);       
  buf        idia_byte5_6    (DIA_byte5_[6], DIA46);       
  buf        idib_byte5_6    (DIB_byte5_[6], DIB46);       
  buf        idia_byte5_7    (DIA_byte5_[7], DIA47);       
  buf        idib_byte5_7    (DIB_byte5_[7], DIB47);       
  buf        idia_byte6_0    (DIA_byte6_[0], DIA48);       
  buf        idib_byte6_0    (DIB_byte6_[0], DIB48);       
  buf        idia_byte6_1    (DIA_byte6_[1], DIA49);       
  buf        idib_byte6_1    (DIB_byte6_[1], DIB49);       
  buf        idia_byte6_2    (DIA_byte6_[2], DIA50);       
  buf        idib_byte6_2    (DIB_byte6_[2], DIB50);       
  buf        idia_byte6_3    (DIA_byte6_[3], DIA51);       
  buf        idib_byte6_3    (DIB_byte6_[3], DIB51);       
  buf        idia_byte6_4    (DIA_byte6_[4], DIA52);       
  buf        idib_byte6_4    (DIB_byte6_[4], DIB52);       
  buf        idia_byte6_5    (DIA_byte6_[5], DIA53);       
  buf        idib_byte6_5    (DIB_byte6_[5], DIB53);       
  buf        idia_byte6_6    (DIA_byte6_[6], DIA54);       
  buf        idib_byte6_6    (DIB_byte6_[6], DIB54);       
  buf        idia_byte6_7    (DIA_byte6_[7], DIA55);       
  buf        idib_byte6_7    (DIB_byte6_[7], DIB55);       
  buf        idia_byte7_0    (DIA_byte7_[0], DIA56);       
  buf        idib_byte7_0    (DIB_byte7_[0], DIB56);       
  buf        idia_byte7_1    (DIA_byte7_[1], DIA57);       
  buf        idib_byte7_1    (DIB_byte7_[1], DIB57);       
  buf        idia_byte7_2    (DIA_byte7_[2], DIA58);       
  buf        idib_byte7_2    (DIB_byte7_[2], DIB58);       
  buf        idia_byte7_3    (DIA_byte7_[3], DIA59);       
  buf        idib_byte7_3    (DIB_byte7_[3], DIB59);       
  buf        idia_byte7_4    (DIA_byte7_[4], DIA60);       
  buf        idib_byte7_4    (DIB_byte7_[4], DIB60);       
  buf        idia_byte7_5    (DIA_byte7_[5], DIA61);       
  buf        idib_byte7_5    (DIB_byte7_[5], DIB61);       
  buf        idia_byte7_6    (DIA_byte7_[6], DIA62);       
  buf        idib_byte7_6    (DIB_byte7_[6], DIB62);       
  buf        idia_byte7_7    (DIA_byte7_[7], DIA63);       
  buf        idib_byte7_7    (DIB_byte7_[7], DIB63);       
  buf        icka            (CKA_, CKA);                  
  buf        ickb            (CKB_, CKB);                  
  not        icsa            (CSA_, CSAN);                 
  not        icsb            (CSB_, CSBN);                 
  buf        iwea0           (WEAN0_, WEAN0);              
  buf        iwea1           (WEAN1_, WEAN1);              
  buf        iwea2           (WEAN2_, WEAN2);              
  buf        iwea3           (WEAN3_, WEAN3);              
  buf        iwea4           (WEAN4_, WEAN4);              
  buf        iwea5           (WEAN5_, WEAN5);              
  buf        iwea6           (WEAN6_, WEAN6);              
  buf        iwea7           (WEAN7_, WEAN7);              
  buf        iweb0           (WEBN0_, WEBN0);              
  buf        iweb1           (WEBN1_, WEBN1);              
  buf        iweb2           (WEBN2_, WEBN2);              
  buf        iweb3           (WEBN3_, WEBN3);              
  buf        iweb4           (WEBN4_, WEBN4);              
  buf        iweb5           (WEBN5_, WEBN5);              
  buf        iweb6           (WEBN6_, WEBN6);              
  buf        iweb7           (WEBN7_, WEBN7);              

  buf        idvs0           (DVS_[0], DVS0);              
  buf        idvs1           (DVS_[1], DVS1);              
  buf        idvs2           (DVS_[2], DVS2);              
  buf        idvs3           (DVS_[3], DVS3);              
  buf        idvse           (DVSE_, DVSE);                
  buf        inap0           (NAP_, NAP);                  

  initial begin
    $timeformat (-12, 0, " ps", 20);
    flag_A_x = `FALSE;
    flag_B_x = `FALSE;
    NODELAYA0 = 1'b0;
    NODELAYB0 = 1'b0;
    NODELAYA1 = 1'b0;
    NODELAYB1 = 1'b0;
    NODELAYA2 = 1'b0;
    NODELAYB2 = 1'b0;
    NODELAYA3 = 1'b0;
    NODELAYB3 = 1'b0;
    NODELAYA4 = 1'b0;
    NODELAYB4 = 1'b0;
    NODELAYA5 = 1'b0;
    NODELAYB5 = 1'b0;
    NODELAYA6 = 1'b0;
    NODELAYB6 = 1'b0;
    NODELAYA7 = 1'b0;
    NODELAYB7 = 1'b0;
    LastClkAEdge = 1'b0;
    LastClkBEdge = 1'b0;
    DVSA_TRIGGER = 1'b0;
    DVSB_TRIGGER = 1'b0;
  `ifdef MEM_INIT_ZERO
       all_core_xA(0,0);
       all_core_xA(1,0);
       all_core_xA(2,0);
       all_core_xA(3,0);
       all_core_xA(4,0);
       all_core_xA(5,0);
       all_core_xA(6,0);
       all_core_xA(7,0);
       all_core_xB(0,0);
       all_core_xB(1,0);
       all_core_xB(2,0);
       all_core_xB(3,0);
       all_core_xB(4,0);
       all_core_xB(5,0);
       all_core_xB(6,0);
       all_core_xB(7,0);
  `else
  `endif
  `ifdef MEM_VERIFY
    taa_verifya = 0;
    taa_verifyb = 0;
  `else
  `endif
   NOSTANDBY = 1'b0;
   NAPREG = 1'b0;
   nap_initial_trigger = 1'b0;
  end



  assign CSA_CSB_temp = CSA_temp & CSB_temp;

  always @(CKA_) begin
    if (CSA_ === 1'b0) begin
      CSA_temp = 1'b1;
    end
    NOSTANDBY = 1'b0;
  end
  always @(CKB_) begin
    if (CSB_ === 1'b0) begin
      CSB_temp = 1'b1;
    end
    NOSTANDBY = 1'b0;
  end

  always @(posedge CSA_CSB_temp) begin
    if (NAP_ === 1'bx || NAP_ === 1'bz) begin
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
    end
  end

  always @(posedge CSA_) begin
    CSA_temp = 1'b0;
    if ($time !== 1'b0 && NAP_ === 1'b1 && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(7);
`endif
      disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz) && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
    end
  end

  always @(posedge CSB_) begin
    CSB_temp = 1'b0;
    if ($time !== 1'b0 && NAP_ === 1'b1 && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(7);
`endif
      disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz) && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
    end
  end


  always @(posedge NAP_) begin
    if ($time === 0) begin
      disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
      nap_initial_trigger = 1'b1;
    end
    if ($time !== 1'b0 && NAP_ === 1'b1 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0 && NOSTANDBY === 1'b0) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
        -> EventNAPT;
      end
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
        ErrorMessage(8);
`endif
        disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
      end
    end
  end

  always @(negedge NAP_) begin
    if ($time !== 1'b0 && NAP_ === 1'b0 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
        disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
      end
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
        ErrorMessage(8);
`endif
        disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
      end
    end
    #TNAP_Wakeup
    Violate_Hold_time = 1'b0;
    CS_tri_error = 1'b0;
  end

  always @(negedge NAP_) begin
    #TNAP_Wakeup nap_initial_trigger = 1'b0;
  end

  always @(n_flag_CSA) begin
    if ($time !== 1'b0 && CSB_ === 1'b0) begin
      disable NAPT;
      NOSTANDBY = 1'b1;
    end
  end
  always @(n_flag_CSB) begin
    if ($time !== 1'b0 && CSA_ === 1'b0) begin
      disable NAPT;
      NOSTANDBY = 1'b1;
    end
  end

  always @(n_flag_NAP) begin
    if ($time !== 1'b0) begin
      disable NAPT;
    end
  end

  always @(n_flag_NAP_CS) begin
`ifdef NO_MEM_MSG
`else
    ErrorMessage(6);
`endif
    Violate_Hold_time = 1'b1;
    disable NAPT;
      DOA_byte0_i = DOA_byte0_tmp;
      DOB_byte0_i = DOB_byte0_tmp;
      DOA_byte1_i = DOA_byte1_tmp;
      DOB_byte1_i = DOB_byte1_tmp;
      DOA_byte2_i = DOA_byte2_tmp;
      DOB_byte2_i = DOB_byte2_tmp;
      DOA_byte3_i = DOA_byte3_tmp;
      DOB_byte3_i = DOB_byte3_tmp;
      DOA_byte4_i = DOA_byte4_tmp;
      DOB_byte4_i = DOB_byte4_tmp;
      DOA_byte5_i = DOA_byte5_tmp;
      DOB_byte5_i = DOB_byte5_tmp;
      DOA_byte6_i = DOA_byte6_tmp;
      DOB_byte6_i = DOB_byte6_tmp;
      DOA_byte7_i = DOA_byte7_tmp;
      DOB_byte7_i = DOB_byte7_tmp;
  end


  always @(CKA_) begin
    casez ({LastClkAEdge,CKA_})
      2'b01:
        #0
         if (NAP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
            -> EventNAPT;
         end else begin
           last_A = latch_last_A;
           last_DIA_byte0 = latch_last_DIA_byte0;
           last_DIA_byte1 = latch_last_DIA_byte1;
           last_DIA_byte2 = latch_last_DIA_byte2;
           last_DIA_byte3 = latch_last_DIA_byte3;
           last_DIA_byte4 = latch_last_DIA_byte4;
           last_DIA_byte5 = latch_last_DIA_byte5;
           last_DIA_byte6 = latch_last_DIA_byte6;
           last_DIA_byte7 = latch_last_DIA_byte7;
           last_WEAN0 = latch_last_WEAN0;
           last_WEAN1 = latch_last_WEAN1;
           last_WEAN2 = latch_last_WEAN2;
           last_WEAN3 = latch_last_WEAN3;
           last_WEAN4 = latch_last_WEAN4;
           last_WEAN5 = latch_last_WEAN5;
           last_WEAN6 = latch_last_WEAN6;
           last_WEAN7 = latch_last_WEAN7;
           CSA_monitor;
           pre_latch_dataA;
           reada0 = WEAN0_;
           writea0 = !WEAN0_;
           reada1 = WEAN1_;
           writea1 = !WEAN1_;
           reada2 = WEAN2_;
           writea2 = !WEAN2_;
           reada3 = WEAN3_;
           writea3 = !WEAN3_;
           reada4 = WEAN4_;
           writea4 = !WEAN4_;
           reada5 = WEAN5_;
           writea5 = !WEAN5_;
           reada6 = WEAN6_;
           writea6 = !WEAN6_;
           reada7 = WEAN7_;
           writea7 = !WEAN7_;
           if (CSA_ !== 0 && DVSE_ === 1'b1) begin
             DVSA_TRIGGER = 1'b1;
           end else begin
             DVSA_TRIGGER = 1'b0;
           end
           con_dvsea   = !DVSA_TRIGGER;
           wrong_dvsa0 = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           con_dvsa1   = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           con_dvsa2   = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           con_dvsa3   = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa4 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa5 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa6 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa7 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa8 = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa9 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa10 = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa11 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa12 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa13 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa14 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           wrong_dvsa15 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSA_TRIGGER;
           memory_functionA;
`ifdef TRC_CHECK
           trc_timing_monitorA;
`else
`endif
           if (CSA_==1'b1) Last_tc_ClkA_PosEdge = $time;
           latch_last_A = A_;
           latch_last_DIA_byte0 = DIA_byte0_;
           latch_last_DIA_byte1 = DIA_byte1_;
           latch_last_DIA_byte2 = DIA_byte2_;
           latch_last_DIA_byte3 = DIA_byte3_;
           latch_last_DIA_byte4 = DIA_byte4_;
           latch_last_DIA_byte5 = DIA_byte5_;
           latch_last_DIA_byte6 = DIA_byte6_;
           latch_last_DIA_byte7 = DIA_byte7_;
           latch_last_WEAN0 = WEAN0_;
           latch_last_WEAN1 = WEAN1_;
           latch_last_WEAN2 = WEAN2_;
           latch_last_WEAN3 = WEAN3_;
           latch_last_WEAN4 = WEAN4_;
           latch_last_WEAN5 = WEAN5_;
           latch_last_WEAN6 = WEAN6_;
           latch_last_WEAN7 = WEAN7_;
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CSA_ !== 0) begin
              if (WEAN0_ !== 1'b1) begin
                 all_core_xA(0,1);
              end else begin
                 #0 disable TOHDOA_byte0;
                    disable TWDXDOA_byte0;
                 NODELAYA0 = 1'b1;
                 DOA_byte0_i = {Bits{1'bX}};
              end
              if (WEAN1_ !== 1'b1) begin
                 all_core_xA(1,1);
              end else begin
                 #0 disable TOHDOA_byte1;
                    disable TWDXDOA_byte1;
                 NODELAYA1 = 1'b1;
                 DOA_byte1_i = {Bits{1'bX}};
              end
              if (WEAN2_ !== 1'b1) begin
                 all_core_xA(2,1);
              end else begin
                 #0 disable TOHDOA_byte2;
                    disable TWDXDOA_byte2;
                 NODELAYA2 = 1'b1;
                 DOA_byte2_i = {Bits{1'bX}};
              end
              if (WEAN3_ !== 1'b1) begin
                 all_core_xA(3,1);
              end else begin
                 #0 disable TOHDOA_byte3;
                    disable TWDXDOA_byte3;
                 NODELAYA3 = 1'b1;
                 DOA_byte3_i = {Bits{1'bX}};
              end
              if (WEAN4_ !== 1'b1) begin
                 all_core_xA(4,1);
              end else begin
                 #0 disable TOHDOA_byte4;
                    disable TWDXDOA_byte4;
                 NODELAYA4 = 1'b1;
                 DOA_byte4_i = {Bits{1'bX}};
              end
              if (WEAN5_ !== 1'b1) begin
                 all_core_xA(5,1);
              end else begin
                 #0 disable TOHDOA_byte5;
                    disable TWDXDOA_byte5;
                 NODELAYA5 = 1'b1;
                 DOA_byte5_i = {Bits{1'bX}};
              end
              if (WEAN6_ !== 1'b1) begin
                 all_core_xA(6,1);
              end else begin
                 #0 disable TOHDOA_byte6;
                    disable TWDXDOA_byte6;
                 NODELAYA6 = 1'b1;
                 DOA_byte6_i = {Bits{1'bX}};
              end
              if (WEAN7_ !== 1'b1) begin
                 all_core_xA(7,1);
              end else begin
                 #0 disable TOHDOA_byte7;
                    disable TWDXDOA_byte7;
                 NODELAYA7 = 1'b1;
                 DOA_byte7_i = {Bits{1'bX}};
              end
           end
         end
    endcase
    LastClkAEdge = CKA_;
  end

  always @(CKB_) begin
    casez ({LastClkBEdge,CKB_})
      2'b01:
        #0
         if (NAP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
            -> EventNAPT;
         end else begin
           last_B = latch_last_B;
           last_DIB_byte0 = latch_last_DIB_byte0;
           last_DIB_byte1 = latch_last_DIB_byte1;
           last_DIB_byte2 = latch_last_DIB_byte2;
           last_DIB_byte3 = latch_last_DIB_byte3;
           last_DIB_byte4 = latch_last_DIB_byte4;
           last_DIB_byte5 = latch_last_DIB_byte5;
           last_DIB_byte6 = latch_last_DIB_byte6;
           last_DIB_byte7 = latch_last_DIB_byte7;
           last_WEBN0 = latch_last_WEBN0;
           last_WEBN1 = latch_last_WEBN1;
           last_WEBN2 = latch_last_WEBN2;
           last_WEBN3 = latch_last_WEBN3;
           last_WEBN4 = latch_last_WEBN4;
           last_WEBN5 = latch_last_WEBN5;
           last_WEBN6 = latch_last_WEBN6;
           last_WEBN7 = latch_last_WEBN7;
           CSB_monitor;
           pre_latch_dataB;
           readb0 = WEBN0_;
           writeb0 = !WEBN0_;
           readb1 = WEBN1_;
           writeb1 = !WEBN1_;
           readb2 = WEBN2_;
           writeb2 = !WEBN2_;
           readb3 = WEBN3_;
           writeb3 = !WEBN3_;
           readb4 = WEBN4_;
           writeb4 = !WEBN4_;
           readb5 = WEBN5_;
           writeb5 = !WEBN5_;
           readb6 = WEBN6_;
           writeb6 = !WEBN6_;
           readb7 = WEBN7_;
           writeb7 = !WEBN7_;
           if (CSB_ !== 0 && DVSE_ === 1'b1) begin
             DVSB_TRIGGER = 1'b1;
           end else begin
             DVSB_TRIGGER = 1'b0;
           end
           con_dvseb   = !DVSB_TRIGGER;
           wrong_dvsb0 = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           con_dvsb1   = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           con_dvsb2   = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           con_dvsb3   = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb4 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb5 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb6 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb7 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb8 = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb9 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb10 = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb11 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb12 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb13 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb14 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           wrong_dvsb15 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVSB_TRIGGER;
           memory_functionB;
`ifdef TRC_CHECK
           trc_timing_monitorB;
`else
`endif
           if (CSB_==1'b1) Last_tc_ClkB_PosEdge = $time;
           latch_last_B = B_;
           latch_last_DIB_byte0 = DIB_byte0_;
           latch_last_DIB_byte1 = DIB_byte1_;
           latch_last_DIB_byte2 = DIB_byte2_;
           latch_last_DIB_byte3 = DIB_byte3_;
           latch_last_DIB_byte4 = DIB_byte4_;
           latch_last_DIB_byte5 = DIB_byte5_;
           latch_last_DIB_byte6 = DIB_byte6_;
           latch_last_DIB_byte7 = DIB_byte7_;
           latch_last_WEBN0 = WEBN0_;
           latch_last_WEBN1 = WEBN1_;
           latch_last_WEBN2 = WEBN2_;
           latch_last_WEBN3 = WEBN3_;
           latch_last_WEBN4 = WEBN4_;
           latch_last_WEBN5 = WEBN5_;
           latch_last_WEBN6 = WEBN6_;
           latch_last_WEBN7 = WEBN7_;
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CSB_ !== 0) begin
              if (WEBN0_ !== 1'b1) begin
                 all_core_xB(0,1);
              end else begin
                 #0 disable TOHDOB_byte0;
                    disable TWDXDOB_byte0;
                 NODELAYB0 = 1'b1;
                 DOB_byte0_i = {Bits{1'bX}};
              end
              if (WEBN1_ !== 1'b1) begin
                 all_core_xB(1,1);
              end else begin
                 #0 disable TOHDOB_byte1;
                    disable TWDXDOB_byte1;
                 NODELAYB1 = 1'b1;
                 DOB_byte1_i = {Bits{1'bX}};
              end
              if (WEBN2_ !== 1'b1) begin
                 all_core_xB(2,1);
              end else begin
                 #0 disable TOHDOB_byte2;
                    disable TWDXDOB_byte2;
                 NODELAYB2 = 1'b1;
                 DOB_byte2_i = {Bits{1'bX}};
              end
              if (WEBN3_ !== 1'b1) begin
                 all_core_xB(3,1);
              end else begin
                 #0 disable TOHDOB_byte3;
                    disable TWDXDOB_byte3;
                 NODELAYB3 = 1'b1;
                 DOB_byte3_i = {Bits{1'bX}};
              end
              if (WEBN4_ !== 1'b1) begin
                 all_core_xB(4,1);
              end else begin
                 #0 disable TOHDOB_byte4;
                    disable TWDXDOB_byte4;
                 NODELAYB4 = 1'b1;
                 DOB_byte4_i = {Bits{1'bX}};
              end
              if (WEBN5_ !== 1'b1) begin
                 all_core_xB(5,1);
              end else begin
                 #0 disable TOHDOB_byte5;
                    disable TWDXDOB_byte5;
                 NODELAYB5 = 1'b1;
                 DOB_byte5_i = {Bits{1'bX}};
              end
              if (WEBN6_ !== 1'b1) begin
                 all_core_xB(6,1);
              end else begin
                 #0 disable TOHDOB_byte6;
                    disable TWDXDOB_byte6;
                 NODELAYB6 = 1'b1;
                 DOB_byte6_i = {Bits{1'bX}};
              end
              if (WEBN7_ !== 1'b1) begin
                 all_core_xB(7,1);
              end else begin
                 #0 disable TOHDOB_byte7;
                    disable TWDXDOB_byte7;
                 NODELAYB7 = 1'b1;
                 DOB_byte7_i = {Bits{1'bX}};
              end
           end
         end
    endcase
    LastClkBEdge = CKB_;
  end

  always @(
           n_flag_A0 or
           n_flag_A1 or
           n_flag_A2 or
           n_flag_A3 or
           n_flag_A4 or
           n_flag_A5 or
           n_flag_A6 or
           n_flag_A7 or
           n_flag_A8 or
           n_flag_A9 or
           n_flag_A10 or
           n_flag_A11 or
           n_flag_A12 or
           n_flag_DIA0 or
           n_flag_DIA1 or
           n_flag_DIA2 or
           n_flag_DIA3 or
           n_flag_DIA4 or
           n_flag_DIA5 or
           n_flag_DIA6 or
           n_flag_DIA7 or
           n_flag_DIA8 or
           n_flag_DIA9 or
           n_flag_DIA10 or
           n_flag_DIA11 or
           n_flag_DIA12 or
           n_flag_DIA13 or
           n_flag_DIA14 or
           n_flag_DIA15 or
           n_flag_DIA16 or
           n_flag_DIA17 or
           n_flag_DIA18 or
           n_flag_DIA19 or
           n_flag_DIA20 or
           n_flag_DIA21 or
           n_flag_DIA22 or
           n_flag_DIA23 or
           n_flag_DIA24 or
           n_flag_DIA25 or
           n_flag_DIA26 or
           n_flag_DIA27 or
           n_flag_DIA28 or
           n_flag_DIA29 or
           n_flag_DIA30 or
           n_flag_DIA31 or
           n_flag_DIA32 or
           n_flag_DIA33 or
           n_flag_DIA34 or
           n_flag_DIA35 or
           n_flag_DIA36 or
           n_flag_DIA37 or
           n_flag_DIA38 or
           n_flag_DIA39 or
           n_flag_DIA40 or
           n_flag_DIA41 or
           n_flag_DIA42 or
           n_flag_DIA43 or
           n_flag_DIA44 or
           n_flag_DIA45 or
           n_flag_DIA46 or
           n_flag_DIA47 or
           n_flag_DIA48 or
           n_flag_DIA49 or
           n_flag_DIA50 or
           n_flag_DIA51 or
           n_flag_DIA52 or
           n_flag_DIA53 or
           n_flag_DIA54 or
           n_flag_DIA55 or
           n_flag_DIA56 or
           n_flag_DIA57 or
           n_flag_DIA58 or
           n_flag_DIA59 or
           n_flag_DIA60 or
           n_flag_DIA61 or
           n_flag_DIA62 or
           n_flag_DIA63 or
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_WEAN0 or
           n_flag_WEAN1 or
           n_flag_WEAN2 or
           n_flag_WEAN3 or
           n_flag_WEAN4 or
           n_flag_WEAN5 or
           n_flag_WEAN6 or
           n_flag_WEAN7 or
           n_flag_CSA or
           n_flag_CKA_PER or
           n_flag_CKA_MINH or
           n_flag_CKA_MINL
          )
     begin
       timingcheck_violationA;
     end

  always @(
           n_flag_B0 or
           n_flag_B1 or
           n_flag_B2 or
           n_flag_B3 or
           n_flag_B4 or
           n_flag_B5 or
           n_flag_B6 or
           n_flag_B7 or
           n_flag_B8 or
           n_flag_B9 or
           n_flag_B10 or
           n_flag_B11 or
           n_flag_B12 or
           n_flag_DIB0 or
           n_flag_DIB1 or
           n_flag_DIB2 or
           n_flag_DIB3 or
           n_flag_DIB4 or
           n_flag_DIB5 or
           n_flag_DIB6 or
           n_flag_DIB7 or
           n_flag_DIB8 or
           n_flag_DIB9 or
           n_flag_DIB10 or
           n_flag_DIB11 or
           n_flag_DIB12 or
           n_flag_DIB13 or
           n_flag_DIB14 or
           n_flag_DIB15 or
           n_flag_DIB16 or
           n_flag_DIB17 or
           n_flag_DIB18 or
           n_flag_DIB19 or
           n_flag_DIB20 or
           n_flag_DIB21 or
           n_flag_DIB22 or
           n_flag_DIB23 or
           n_flag_DIB24 or
           n_flag_DIB25 or
           n_flag_DIB26 or
           n_flag_DIB27 or
           n_flag_DIB28 or
           n_flag_DIB29 or
           n_flag_DIB30 or
           n_flag_DIB31 or
           n_flag_DIB32 or
           n_flag_DIB33 or
           n_flag_DIB34 or
           n_flag_DIB35 or
           n_flag_DIB36 or
           n_flag_DIB37 or
           n_flag_DIB38 or
           n_flag_DIB39 or
           n_flag_DIB40 or
           n_flag_DIB41 or
           n_flag_DIB42 or
           n_flag_DIB43 or
           n_flag_DIB44 or
           n_flag_DIB45 or
           n_flag_DIB46 or
           n_flag_DIB47 or
           n_flag_DIB48 or
           n_flag_DIB49 or
           n_flag_DIB50 or
           n_flag_DIB51 or
           n_flag_DIB52 or
           n_flag_DIB53 or
           n_flag_DIB54 or
           n_flag_DIB55 or
           n_flag_DIB56 or
           n_flag_DIB57 or
           n_flag_DIB58 or
           n_flag_DIB59 or
           n_flag_DIB60 or
           n_flag_DIB61 or
           n_flag_DIB62 or
           n_flag_DIB63 or
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_WEBN0 or
           n_flag_WEBN1 or
           n_flag_WEBN2 or
           n_flag_WEBN3 or
           n_flag_WEBN4 or
           n_flag_WEBN5 or
           n_flag_WEBN6 or
           n_flag_WEBN7 or
           n_flag_CSB or
           n_flag_CKB_PER or
           n_flag_CKB_MINH or
           n_flag_CKB_MINL
          )
     begin
       timingcheck_violationB;
     end

  always @(EventNAPT)
    begin: NAPT
     NODELAYA0 <= 1'b1;
     NODELAYB0 <= 1'b1;
     DOA_byte0_i <= DOA_byte0_tmp;
     DOB_byte0_i <= DOB_byte0_tmp;
     NODELAYA1 <= 1'b1;
     NODELAYB1 <= 1'b1;
     DOA_byte1_i <= DOA_byte1_tmp;
     DOB_byte1_i <= DOB_byte1_tmp;
     NODELAYA2 <= 1'b1;
     NODELAYB2 <= 1'b1;
     DOA_byte2_i <= DOA_byte2_tmp;
     DOB_byte2_i <= DOB_byte2_tmp;
     NODELAYA3 <= 1'b1;
     NODELAYB3 <= 1'b1;
     DOA_byte3_i <= DOA_byte3_tmp;
     DOB_byte3_i <= DOB_byte3_tmp;
     NODELAYA4 <= 1'b1;
     NODELAYB4 <= 1'b1;
     DOA_byte4_i <= DOA_byte4_tmp;
     DOB_byte4_i <= DOB_byte4_tmp;
     NODELAYA5 <= 1'b1;
     NODELAYB5 <= 1'b1;
     DOA_byte5_i <= DOA_byte5_tmp;
     DOB_byte5_i <= DOB_byte5_tmp;
     NODELAYA6 <= 1'b1;
     NODELAYB6 <= 1'b1;
     DOA_byte6_i <= DOA_byte6_tmp;
     DOB_byte6_i <= DOB_byte6_tmp;
     NODELAYA7 <= 1'b1;
     NODELAYB7 <= 1'b1;
     DOA_byte7_i <= DOA_byte7_tmp;
     DOB_byte7_i <= DOB_byte7_tmp;
  end

  always @(EventTOHDOA_byte0) 
    begin:TOHDOA_byte0 
      if (con_dvsea) begin
        #TOH 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte0) 
    begin:TOHDOB_byte0 
      if (con_dvseb) begin
        #TOH 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end 
  end 

  always @(EventTOHDOA_byte1) 
    begin:TOHDOA_byte1 
      if (con_dvsea) begin
        #TOH 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte1) 
    begin:TOHDOB_byte1 
      if (con_dvseb) begin
        #TOH 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end 
  end 

  always @(EventTOHDOA_byte2) 
    begin:TOHDOA_byte2 
      if (con_dvsea) begin
        #TOH 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte2) 
    begin:TOHDOB_byte2 
      if (con_dvseb) begin
        #TOH 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end 
  end 

  always @(EventTOHDOA_byte3) 
    begin:TOHDOA_byte3 
      if (con_dvsea) begin
        #TOH 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte3) 
    begin:TOHDOB_byte3 
      if (con_dvseb) begin
        #TOH 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end 
  end 

  always @(EventTOHDOA_byte4) 
    begin:TOHDOA_byte4 
      if (con_dvsea) begin
        #TOH 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte4) 
    begin:TOHDOB_byte4 
      if (con_dvseb) begin
        #TOH 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end 
  end 

  always @(EventTOHDOA_byte5) 
    begin:TOHDOA_byte5 
      if (con_dvsea) begin
        #TOH 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte5) 
    begin:TOHDOB_byte5 
      if (con_dvseb) begin
        #TOH 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end 
  end 

  always @(EventTOHDOA_byte6) 
    begin:TOHDOA_byte6 
      if (con_dvsea) begin
        #TOH 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte6) 
    begin:TOHDOB_byte6 
      if (con_dvseb) begin
        #TOH 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end 
  end 

  always @(EventTOHDOA_byte7) 
    begin:TOHDOA_byte7 
      if (con_dvsea) begin
        #TOH 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end 
  end 

  always @(EventTOHDOB_byte7) 
    begin:TOHDOB_byte7 
      if (con_dvseb) begin
        #TOH 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end 
  end 


  always @(EventTWDXDOA_byte0) 
    begin:TWDXDOA_byte0 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA0 <= 1'b0; 
        DOA_byte0_i              =  {Bits{1'bX}}; 
        DOA_byte0_i              <= DOA_byte0_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte0) 
    begin:TWDXDOB_byte0 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB0 <= 1'b0; 
        DOB_byte0_i              =  {Bits{1'bX}}; 
        DOB_byte0_i              <= DOB_byte0_tmp; 
      end 
  end 

  always @(EventTWDXDOA_byte1) 
    begin:TWDXDOA_byte1 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA1 <= 1'b0; 
        DOA_byte1_i              =  {Bits{1'bX}}; 
        DOA_byte1_i              <= DOA_byte1_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte1) 
    begin:TWDXDOB_byte1 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB1 <= 1'b0; 
        DOB_byte1_i              =  {Bits{1'bX}}; 
        DOB_byte1_i              <= DOB_byte1_tmp; 
      end 
  end 

  always @(EventTWDXDOA_byte2) 
    begin:TWDXDOA_byte2 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA2 <= 1'b0; 
        DOA_byte2_i              =  {Bits{1'bX}}; 
        DOA_byte2_i              <= DOA_byte2_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte2) 
    begin:TWDXDOB_byte2 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB2 <= 1'b0; 
        DOB_byte2_i              =  {Bits{1'bX}}; 
        DOB_byte2_i              <= DOB_byte2_tmp; 
      end 
  end 

  always @(EventTWDXDOA_byte3) 
    begin:TWDXDOA_byte3 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA3 <= 1'b0; 
        DOA_byte3_i              =  {Bits{1'bX}}; 
        DOA_byte3_i              <= DOA_byte3_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte3) 
    begin:TWDXDOB_byte3 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB3 <= 1'b0; 
        DOB_byte3_i              =  {Bits{1'bX}}; 
        DOB_byte3_i              <= DOB_byte3_tmp; 
      end 
  end 

  always @(EventTWDXDOA_byte4) 
    begin:TWDXDOA_byte4 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA4 <= 1'b0; 
        DOA_byte4_i              =  {Bits{1'bX}}; 
        DOA_byte4_i              <= DOA_byte4_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte4) 
    begin:TWDXDOB_byte4 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB4 <= 1'b0; 
        DOB_byte4_i              =  {Bits{1'bX}}; 
        DOB_byte4_i              <= DOB_byte4_tmp; 
      end 
  end 

  always @(EventTWDXDOA_byte5) 
    begin:TWDXDOA_byte5 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA5 <= 1'b0; 
        DOA_byte5_i              =  {Bits{1'bX}}; 
        DOA_byte5_i              <= DOA_byte5_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte5) 
    begin:TWDXDOB_byte5 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB5 <= 1'b0; 
        DOB_byte5_i              =  {Bits{1'bX}}; 
        DOB_byte5_i              <= DOB_byte5_tmp; 
      end 
  end 

  always @(EventTWDXDOA_byte6) 
    begin:TWDXDOA_byte6 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA6 <= 1'b0; 
        DOA_byte6_i              =  {Bits{1'bX}}; 
        DOA_byte6_i              <= DOA_byte6_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte6) 
    begin:TWDXDOB_byte6 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB6 <= 1'b0; 
        DOB_byte6_i              =  {Bits{1'bX}}; 
        DOB_byte6_i              <= DOB_byte6_tmp; 
      end 
  end 

  always @(EventTWDXDOA_byte7) 
    begin:TWDXDOA_byte7 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA7 <= 1'b0; 
        DOA_byte7_i              =  {Bits{1'bX}}; 
        DOA_byte7_i              <= DOA_byte7_tmp; 
      end 
  end 


  always @(EventTWDXDOB_byte7) 
    begin:TWDXDOB_byte7 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB7 <= 1'b0; 
        DOB_byte7_i              =  {Bits{1'bX}}; 
        DOB_byte7_i              <= DOB_byte7_tmp; 
      end 
  end 


  task timingcheck_violationA;
    integer i;
    begin
      // PORT A
      if ((n_flag_CKA_PER  !== LAST_n_flag_CKA_PER)  ||
          (n_flag_CKA_MINH !== LAST_n_flag_CKA_MINH) ||
          (n_flag_CKA_MINL !== LAST_n_flag_CKA_MINL)) begin
          if (CSA_ !== 1'b0) begin
             if (WEAN0_ !== 1'b1) begin
                all_core_xA(0,1);
             end
             else begin
                #0 disable TOHDOA_byte0;
                      disable TWDXDOA_byte0;
                NODELAYA0 = 1'b1;
                DOA_byte0_i = {Bits{1'bX}};
             end
             if (WEAN1_ !== 1'b1) begin
                all_core_xA(1,1);
             end
             else begin
                #0 disable TOHDOA_byte1;
                      disable TWDXDOA_byte1;
                NODELAYA1 = 1'b1;
                DOA_byte1_i = {Bits{1'bX}};
             end
             if (WEAN2_ !== 1'b1) begin
                all_core_xA(2,1);
             end
             else begin
                #0 disable TOHDOA_byte2;
                      disable TWDXDOA_byte2;
                NODELAYA2 = 1'b1;
                DOA_byte2_i = {Bits{1'bX}};
             end
             if (WEAN3_ !== 1'b1) begin
                all_core_xA(3,1);
             end
             else begin
                #0 disable TOHDOA_byte3;
                      disable TWDXDOA_byte3;
                NODELAYA3 = 1'b1;
                DOA_byte3_i = {Bits{1'bX}};
             end
             if (WEAN4_ !== 1'b1) begin
                all_core_xA(4,1);
             end
             else begin
                #0 disable TOHDOA_byte4;
                      disable TWDXDOA_byte4;
                NODELAYA4 = 1'b1;
                DOA_byte4_i = {Bits{1'bX}};
             end
             if (WEAN5_ !== 1'b1) begin
                all_core_xA(5,1);
             end
             else begin
                #0 disable TOHDOA_byte5;
                      disable TWDXDOA_byte5;
                NODELAYA5 = 1'b1;
                DOA_byte5_i = {Bits{1'bX}};
             end
             if (WEAN6_ !== 1'b1) begin
                all_core_xA(6,1);
             end
             else begin
                #0 disable TOHDOA_byte6;
                      disable TWDXDOA_byte6;
                NODELAYA6 = 1'b1;
                DOA_byte6_i = {Bits{1'bX}};
             end
             if (WEAN7_ !== 1'b1) begin
                all_core_xA(7,1);
             end
             else begin
                #0 disable TOHDOA_byte7;
                      disable TWDXDOA_byte7;
                NODELAYA7 = 1'b1;
                DOA_byte7_i = {Bits{1'bX}};
             end
          end
      end
      else begin
          NOT_BUS_A  = {
                         n_flag_A12,
                         n_flag_A11,
                         n_flag_A10,
                         n_flag_A9,
                         n_flag_A8,
                         n_flag_A7,
                         n_flag_A6,
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

          NOT_BUS_DIA_byte0  = {
                         n_flag_DIA7,
                         n_flag_DIA6,
                         n_flag_DIA5,
                         n_flag_DIA4,
                         n_flag_DIA3,
                         n_flag_DIA2,
                         n_flag_DIA1,
                         n_flag_DIA0};

          NOT_BUS_DIA_byte1  = {
                         n_flag_DIA15,
                         n_flag_DIA14,
                         n_flag_DIA13,
                         n_flag_DIA12,
                         n_flag_DIA11,
                         n_flag_DIA10,
                         n_flag_DIA9,
                         n_flag_DIA8};

          NOT_BUS_DIA_byte2  = {
                         n_flag_DIA23,
                         n_flag_DIA22,
                         n_flag_DIA21,
                         n_flag_DIA20,
                         n_flag_DIA19,
                         n_flag_DIA18,
                         n_flag_DIA17,
                         n_flag_DIA16};

          NOT_BUS_DIA_byte3  = {
                         n_flag_DIA31,
                         n_flag_DIA30,
                         n_flag_DIA29,
                         n_flag_DIA28,
                         n_flag_DIA27,
                         n_flag_DIA26,
                         n_flag_DIA25,
                         n_flag_DIA24};

          NOT_BUS_DIA_byte4  = {
                         n_flag_DIA39,
                         n_flag_DIA38,
                         n_flag_DIA37,
                         n_flag_DIA36,
                         n_flag_DIA35,
                         n_flag_DIA34,
                         n_flag_DIA33,
                         n_flag_DIA32};

          NOT_BUS_DIA_byte5  = {
                         n_flag_DIA47,
                         n_flag_DIA46,
                         n_flag_DIA45,
                         n_flag_DIA44,
                         n_flag_DIA43,
                         n_flag_DIA42,
                         n_flag_DIA41,
                         n_flag_DIA40};

          NOT_BUS_DIA_byte6  = {
                         n_flag_DIA55,
                         n_flag_DIA54,
                         n_flag_DIA53,
                         n_flag_DIA52,
                         n_flag_DIA51,
                         n_flag_DIA50,
                         n_flag_DIA49,
                         n_flag_DIA48};

          NOT_BUS_DIA_byte7  = {
                         n_flag_DIA63,
                         n_flag_DIA62,
                         n_flag_DIA61,
                         n_flag_DIA60,
                         n_flag_DIA59,
                         n_flag_DIA58,
                         n_flag_DIA57,
                         n_flag_DIA56};

          NOT_BUS_DVS  = {
                         n_flag_DVS3,
                         n_flag_DVS2,
                         n_flag_DVS1,
                         n_flag_DVS0};


          for (i=0; i<AddressSize; i=i+1) begin
             Latch_A[i] = (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) ? 1'bx : Latch_A[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DIA_byte0[i] = (NOT_BUS_DIA_byte0[i] !== LAST_NOT_BUS_DIA_byte0[i]) ? 1'bx : Latch_DIA_byte0[i];
             Latch_DIA_byte1[i] = (NOT_BUS_DIA_byte1[i] !== LAST_NOT_BUS_DIA_byte1[i]) ? 1'bx : Latch_DIA_byte1[i];
             Latch_DIA_byte2[i] = (NOT_BUS_DIA_byte2[i] !== LAST_NOT_BUS_DIA_byte2[i]) ? 1'bx : Latch_DIA_byte2[i];
             Latch_DIA_byte3[i] = (NOT_BUS_DIA_byte3[i] !== LAST_NOT_BUS_DIA_byte3[i]) ? 1'bx : Latch_DIA_byte3[i];
             Latch_DIA_byte4[i] = (NOT_BUS_DIA_byte4[i] !== LAST_NOT_BUS_DIA_byte4[i]) ? 1'bx : Latch_DIA_byte4[i];
             Latch_DIA_byte5[i] = (NOT_BUS_DIA_byte5[i] !== LAST_NOT_BUS_DIA_byte5[i]) ? 1'bx : Latch_DIA_byte5[i];
             Latch_DIA_byte6[i] = (NOT_BUS_DIA_byte6[i] !== LAST_NOT_BUS_DIA_byte6[i]) ? 1'bx : Latch_DIA_byte6[i];
             Latch_DIA_byte7[i] = (NOT_BUS_DIA_byte7[i] !== LAST_NOT_BUS_DIA_byte7[i]) ? 1'bx : Latch_DIA_byte7[i];
          end
          for (i=0; i<DVSize; i=i+1) begin
             Latch_DVS[i] = (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) ? 1'bx : Latch_DVS[i];
          end

          Latch_DVSE  =  (n_flag_DVSE  !== LAST_n_flag_DVSE)  ? 1'bx : Latch_DVSE;
          Latch_CSA  =  (n_flag_CSA  !== LAST_n_flag_CSA)  ? 1'bx : Latch_CSA;
          Latch_WEAN0 = (n_flag_WEAN0 !== LAST_n_flag_WEAN0)  ? 1'bx : Latch_WEAN0;
          Latch_WEAN1 = (n_flag_WEAN1 !== LAST_n_flag_WEAN1)  ? 1'bx : Latch_WEAN1;
          Latch_WEAN2 = (n_flag_WEAN2 !== LAST_n_flag_WEAN2)  ? 1'bx : Latch_WEAN2;
          Latch_WEAN3 = (n_flag_WEAN3 !== LAST_n_flag_WEAN3)  ? 1'bx : Latch_WEAN3;
          Latch_WEAN4 = (n_flag_WEAN4 !== LAST_n_flag_WEAN4)  ? 1'bx : Latch_WEAN4;
          Latch_WEAN5 = (n_flag_WEAN5 !== LAST_n_flag_WEAN5)  ? 1'bx : Latch_WEAN5;
          Latch_WEAN6 = (n_flag_WEAN6 !== LAST_n_flag_WEAN6)  ? 1'bx : Latch_WEAN6;
          Latch_WEAN7 = (n_flag_WEAN7 !== LAST_n_flag_WEAN7)  ? 1'bx : Latch_WEAN7;
          memory_functionA;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DIA_byte0         = NOT_BUS_DIA_byte0;
      LAST_NOT_BUS_DIA_byte1         = NOT_BUS_DIA_byte1;
      LAST_NOT_BUS_DIA_byte2         = NOT_BUS_DIA_byte2;
      LAST_NOT_BUS_DIA_byte3         = NOT_BUS_DIA_byte3;
      LAST_NOT_BUS_DIA_byte4         = NOT_BUS_DIA_byte4;
      LAST_NOT_BUS_DIA_byte5         = NOT_BUS_DIA_byte5;
      LAST_NOT_BUS_DIA_byte6         = NOT_BUS_DIA_byte6;
      LAST_NOT_BUS_DIA_byte7         = NOT_BUS_DIA_byte7;
      LAST_n_flag_WEAN0              = n_flag_WEAN0;
      LAST_n_flag_WEAN1              = n_flag_WEAN1;
      LAST_n_flag_WEAN2              = n_flag_WEAN2;
      LAST_n_flag_WEAN3              = n_flag_WEAN3;
      LAST_n_flag_WEAN4              = n_flag_WEAN4;
      LAST_n_flag_WEAN5              = n_flag_WEAN5;
      LAST_n_flag_WEAN6              = n_flag_WEAN6;
      LAST_n_flag_WEAN7              = n_flag_WEAN7;
      LAST_NOT_BUS_DVS               = NOT_BUS_DVS;
      LAST_n_flag_DVSE               = n_flag_DVSE;
      LAST_n_flag_CSA                = n_flag_CSA;
      LAST_n_flag_CKA_PER            = n_flag_CKA_PER;
      LAST_n_flag_CKA_MINH           = n_flag_CKA_MINH;
      LAST_n_flag_CKA_MINL           = n_flag_CKA_MINL;
    end
  endtask // end timingcheck_violationA;

  task timingcheck_violationB;
    integer i;
    begin
      // PORT B
      if ((n_flag_CKB_PER  !== LAST_n_flag_CKB_PER)  ||
          (n_flag_CKB_MINH !== LAST_n_flag_CKB_MINH) ||
          (n_flag_CKB_MINL !== LAST_n_flag_CKB_MINL)) begin
          if (CSB_ !== 1'b0) begin
             if (WEBN0_ !== 1'b1) begin
                all_core_xB(0,1);
             end
             else begin
                #0 disable TOHDOB_byte0;
                   disable TWDXDOB_byte0;
                NODELAYB0 = 1'b1;
                DOB_byte0_i = {Bits{1'bX}};
             end
             if (WEBN1_ !== 1'b1) begin
                all_core_xB(1,1);
             end
             else begin
                #0 disable TOHDOB_byte1;
                   disable TWDXDOB_byte1;
                NODELAYB1 = 1'b1;
                DOB_byte1_i = {Bits{1'bX}};
             end
             if (WEBN2_ !== 1'b1) begin
                all_core_xB(2,1);
             end
             else begin
                #0 disable TOHDOB_byte2;
                   disable TWDXDOB_byte2;
                NODELAYB2 = 1'b1;
                DOB_byte2_i = {Bits{1'bX}};
             end
             if (WEBN3_ !== 1'b1) begin
                all_core_xB(3,1);
             end
             else begin
                #0 disable TOHDOB_byte3;
                   disable TWDXDOB_byte3;
                NODELAYB3 = 1'b1;
                DOB_byte3_i = {Bits{1'bX}};
             end
             if (WEBN4_ !== 1'b1) begin
                all_core_xB(4,1);
             end
             else begin
                #0 disable TOHDOB_byte4;
                   disable TWDXDOB_byte4;
                NODELAYB4 = 1'b1;
                DOB_byte4_i = {Bits{1'bX}};
             end
             if (WEBN5_ !== 1'b1) begin
                all_core_xB(5,1);
             end
             else begin
                #0 disable TOHDOB_byte5;
                   disable TWDXDOB_byte5;
                NODELAYB5 = 1'b1;
                DOB_byte5_i = {Bits{1'bX}};
             end
             if (WEBN6_ !== 1'b1) begin
                all_core_xB(6,1);
             end
             else begin
                #0 disable TOHDOB_byte6;
                   disable TWDXDOB_byte6;
                NODELAYB6 = 1'b1;
                DOB_byte6_i = {Bits{1'bX}};
             end
             if (WEBN7_ !== 1'b1) begin
                all_core_xB(7,1);
             end
             else begin
                #0 disable TOHDOB_byte7;
                   disable TWDXDOB_byte7;
                NODELAYB7 = 1'b1;
                DOB_byte7_i = {Bits{1'bX}};
             end
          end
      end
      else begin
          NOT_BUS_B  = {
                         n_flag_B12,
                         n_flag_B11,
                         n_flag_B10,
                         n_flag_B9,
                         n_flag_B8,
                         n_flag_B7,
                         n_flag_B6,
                         n_flag_B5,
                         n_flag_B4,
                         n_flag_B3,
                         n_flag_B2,
                         n_flag_B1,
                         n_flag_B0};

          NOT_BUS_DIB_byte0  = {
                         n_flag_DIB7,
                         n_flag_DIB6,
                         n_flag_DIB5,
                         n_flag_DIB4,
                         n_flag_DIB3,
                         n_flag_DIB2,
                         n_flag_DIB1,
                         n_flag_DIB0};

          NOT_BUS_DIB_byte1  = {
                         n_flag_DIB15,
                         n_flag_DIB14,
                         n_flag_DIB13,
                         n_flag_DIB12,
                         n_flag_DIB11,
                         n_flag_DIB10,
                         n_flag_DIB9,
                         n_flag_DIB8};

          NOT_BUS_DIB_byte2  = {
                         n_flag_DIB23,
                         n_flag_DIB22,
                         n_flag_DIB21,
                         n_flag_DIB20,
                         n_flag_DIB19,
                         n_flag_DIB18,
                         n_flag_DIB17,
                         n_flag_DIB16};

          NOT_BUS_DIB_byte3  = {
                         n_flag_DIB31,
                         n_flag_DIB30,
                         n_flag_DIB29,
                         n_flag_DIB28,
                         n_flag_DIB27,
                         n_flag_DIB26,
                         n_flag_DIB25,
                         n_flag_DIB24};

          NOT_BUS_DIB_byte4  = {
                         n_flag_DIB39,
                         n_flag_DIB38,
                         n_flag_DIB37,
                         n_flag_DIB36,
                         n_flag_DIB35,
                         n_flag_DIB34,
                         n_flag_DIB33,
                         n_flag_DIB32};

          NOT_BUS_DIB_byte5  = {
                         n_flag_DIB47,
                         n_flag_DIB46,
                         n_flag_DIB45,
                         n_flag_DIB44,
                         n_flag_DIB43,
                         n_flag_DIB42,
                         n_flag_DIB41,
                         n_flag_DIB40};

          NOT_BUS_DIB_byte6  = {
                         n_flag_DIB55,
                         n_flag_DIB54,
                         n_flag_DIB53,
                         n_flag_DIB52,
                         n_flag_DIB51,
                         n_flag_DIB50,
                         n_flag_DIB49,
                         n_flag_DIB48};

          NOT_BUS_DIB_byte7  = {
                         n_flag_DIB63,
                         n_flag_DIB62,
                         n_flag_DIB61,
                         n_flag_DIB60,
                         n_flag_DIB59,
                         n_flag_DIB58,
                         n_flag_DIB57,
                         n_flag_DIB56};

          NOT_BUS_DVS  = {
                         n_flag_DVS3,
                         n_flag_DVS2,
                         n_flag_DVS1,
                         n_flag_DVS0};


          for (i=0; i<AddressSize; i=i+1) begin
             Latch_B[i] = (NOT_BUS_B[i] !== LAST_NOT_BUS_B[i]) ? 1'bx : Latch_B[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DIB_byte0[i] = (NOT_BUS_DIB_byte0[i] !== LAST_NOT_BUS_DIB_byte0[i]) ? 1'bx : Latch_DIB_byte0[i];
             Latch_DIB_byte1[i] = (NOT_BUS_DIB_byte1[i] !== LAST_NOT_BUS_DIB_byte1[i]) ? 1'bx : Latch_DIB_byte1[i];
             Latch_DIB_byte2[i] = (NOT_BUS_DIB_byte2[i] !== LAST_NOT_BUS_DIB_byte2[i]) ? 1'bx : Latch_DIB_byte2[i];
             Latch_DIB_byte3[i] = (NOT_BUS_DIB_byte3[i] !== LAST_NOT_BUS_DIB_byte3[i]) ? 1'bx : Latch_DIB_byte3[i];
             Latch_DIB_byte4[i] = (NOT_BUS_DIB_byte4[i] !== LAST_NOT_BUS_DIB_byte4[i]) ? 1'bx : Latch_DIB_byte4[i];
             Latch_DIB_byte5[i] = (NOT_BUS_DIB_byte5[i] !== LAST_NOT_BUS_DIB_byte5[i]) ? 1'bx : Latch_DIB_byte5[i];
             Latch_DIB_byte6[i] = (NOT_BUS_DIB_byte6[i] !== LAST_NOT_BUS_DIB_byte6[i]) ? 1'bx : Latch_DIB_byte6[i];
             Latch_DIB_byte7[i] = (NOT_BUS_DIB_byte7[i] !== LAST_NOT_BUS_DIB_byte7[i]) ? 1'bx : Latch_DIB_byte7[i];
          end
          for (i=0; i<DVSize; i=i+1) begin
             Latch_DVS[i] = (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) ? 1'bx : Latch_DVS[i];
          end

          Latch_DVSE  =  (n_flag_DVSE  !== LAST_n_flag_DVSE)  ? 1'bx : Latch_DVSE;
          Latch_CSB  =  (n_flag_CSB  !== LAST_n_flag_CSB)  ? 1'bx : Latch_CSB;
          Latch_WEBN0 = (n_flag_WEBN0 !== LAST_n_flag_WEBN0)  ? 1'bx : Latch_WEBN0;
          Latch_WEBN1 = (n_flag_WEBN1 !== LAST_n_flag_WEBN1)  ? 1'bx : Latch_WEBN1;
          Latch_WEBN2 = (n_flag_WEBN2 !== LAST_n_flag_WEBN2)  ? 1'bx : Latch_WEBN2;
          Latch_WEBN3 = (n_flag_WEBN3 !== LAST_n_flag_WEBN3)  ? 1'bx : Latch_WEBN3;
          Latch_WEBN4 = (n_flag_WEBN4 !== LAST_n_flag_WEBN4)  ? 1'bx : Latch_WEBN4;
          Latch_WEBN5 = (n_flag_WEBN5 !== LAST_n_flag_WEBN5)  ? 1'bx : Latch_WEBN5;
          Latch_WEBN6 = (n_flag_WEBN6 !== LAST_n_flag_WEBN6)  ? 1'bx : Latch_WEBN6;
          Latch_WEBN7 = (n_flag_WEBN7 !== LAST_n_flag_WEBN7)  ? 1'bx : Latch_WEBN7;
          memory_functionB;
      end

      LAST_NOT_BUS_B                 = NOT_BUS_B;
      LAST_NOT_BUS_DIB_byte0         = NOT_BUS_DIB_byte0;
      LAST_NOT_BUS_DIB_byte1         = NOT_BUS_DIB_byte1;
      LAST_NOT_BUS_DIB_byte2         = NOT_BUS_DIB_byte2;
      LAST_NOT_BUS_DIB_byte3         = NOT_BUS_DIB_byte3;
      LAST_NOT_BUS_DIB_byte4         = NOT_BUS_DIB_byte4;
      LAST_NOT_BUS_DIB_byte5         = NOT_BUS_DIB_byte5;
      LAST_NOT_BUS_DIB_byte6         = NOT_BUS_DIB_byte6;
      LAST_NOT_BUS_DIB_byte7         = NOT_BUS_DIB_byte7;
      LAST_n_flag_WEBN0              = n_flag_WEBN0;
      LAST_n_flag_WEBN1              = n_flag_WEBN1;
      LAST_n_flag_WEBN2              = n_flag_WEBN2;
      LAST_n_flag_WEBN3              = n_flag_WEBN3;
      LAST_n_flag_WEBN4              = n_flag_WEBN4;
      LAST_n_flag_WEBN5              = n_flag_WEBN5;
      LAST_n_flag_WEBN6              = n_flag_WEBN6;
      LAST_n_flag_WEBN7              = n_flag_WEBN7;
      LAST_NOT_BUS_DVS               = NOT_BUS_DVS;
      LAST_n_flag_DVSE               = n_flag_DVSE;
      LAST_n_flag_CSB                = n_flag_CSB;
      LAST_n_flag_CKB_PER            = n_flag_CKB_PER;
      LAST_n_flag_CKB_MINH           = n_flag_CKB_MINH;
      LAST_n_flag_CKB_MINL           = n_flag_CKB_MINL;
    end
  endtask // end timingcheck_violationB;

  task pre_latch_dataA;
    begin
      Latch_A                        = A_;
      Latch_DIA_byte0                = DIA_byte0_;
      Latch_DIA_byte1                = DIA_byte1_;
      Latch_DIA_byte2                = DIA_byte2_;
      Latch_DIA_byte3                = DIA_byte3_;
      Latch_DIA_byte4                = DIA_byte4_;
      Latch_DIA_byte5                = DIA_byte5_;
      Latch_DIA_byte6                = DIA_byte6_;
      Latch_DIA_byte7                = DIA_byte7_;
      Latch_CSA                      = CSA_;
      Latch_WEAN0                    = WEAN0_;
      Latch_WEAN1                    = WEAN1_;
      Latch_WEAN2                    = WEAN2_;
      Latch_WEAN3                    = WEAN3_;
      Latch_WEAN4                    = WEAN4_;
      Latch_WEAN5                    = WEAN5_;
      Latch_WEAN6                    = WEAN6_;
      Latch_WEAN7                    = WEAN7_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_dataA

  task pre_latch_dataB;
    begin
      Latch_B                        = B_;
      Latch_DIB_byte0                = DIB_byte0_;
      Latch_DIB_byte1                = DIB_byte1_;
      Latch_DIB_byte2                = DIB_byte2_;
      Latch_DIB_byte3                = DIB_byte3_;
      Latch_DIB_byte4                = DIB_byte4_;
      Latch_DIB_byte5                = DIB_byte5_;
      Latch_DIB_byte6                = DIB_byte6_;
      Latch_DIB_byte7                = DIB_byte7_;
      Latch_CSB                      = CSB_;
      Latch_WEBN0                    = WEBN0_;
      Latch_WEBN1                    = WEBN1_;
      Latch_WEBN2                    = WEBN2_;
      Latch_WEBN3                    = WEBN3_;
      Latch_WEBN4                    = WEBN4_;
      Latch_WEBN5                    = WEBN5_;
      Latch_WEBN6                    = WEBN6_;
      Latch_WEBN7                    = WEBN7_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_dataB

  task memory_functionA;
    begin
      A_i                            = Latch_A;
      DIA_byte0_i                    = Latch_DIA_byte0;
      DIA_byte1_i                    = Latch_DIA_byte1;
      DIA_byte2_i                    = Latch_DIA_byte2;
      DIA_byte3_i                    = Latch_DIA_byte3;
      DIA_byte4_i                    = Latch_DIA_byte4;
      DIA_byte5_i                    = Latch_DIA_byte5;
      DIA_byte6_i                    = Latch_DIA_byte6;
      DIA_byte7_i                    = Latch_DIA_byte7;
      WEAN0_i                        = Latch_WEAN0;
      WEAN1_i                        = Latch_WEAN1;
      WEAN2_i                        = Latch_WEAN2;
      WEAN3_i                        = Latch_WEAN3;
      WEAN4_i                        = Latch_WEAN4;
      WEAN5_i                        = Latch_WEAN5;
      WEAN6_i                        = Latch_WEAN6;
      WEAN7_i                        = Latch_WEAN7;
      CSA_i                          = Latch_CSA;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CSA_ == 1'b1) A_monitor;


      casez({WEAN0_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN0_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte0;
                     disable TWDXDOA_byte0;
                  NODELAYA0 = 1'b1;
                  DOA_byte0_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte0_tmp = Memory_byte0[A_i];
                       NODELAYA0 = 1'b1;
                       ->EventTOHDOA_byte0;
		      end
                     end else begin
                        if (WEAN0_i !== last_WEAN0) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte0_tmp = Memory_byte0[A_i];
                          NODELAYA0 = 1'b1;
                          ->EventTOHDOA_byte0;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA0 = 1'b0;
                          DOA_byte0_tmp = Memory_byte0[A_i];
                          DOA_byte0_i = DOA_byte0_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte0_tmp = Memory_byte0[A_i];
                    NODELAYA0 = 1'b1;
                    ->EventTOHDOA_byte0;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte0;
                   disable TWDXDOA_byte0;
                NODELAYA0 = 1'b1;
                DOA_byte0_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN0_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte0;
                       disable TWDXDOB_byte0;
                    NODELAYB0 = 1'b1;
                    DOB_byte0_i = {Bits{1'bX}};
                   Memory_byte0[A_i] = DIA_byte0_i;
                 end else if ((Last_WEBN0_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte0[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte0[A_i] = DIA_byte0_i;
                 end
              end else begin
                   Memory_byte0[A_i] = DIA_byte0_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA0 = 1'b1;
                         all_core_xA(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA0 = 1'b1;
                    DOA_byte0_tmp = Memory_byte0[A_i];
                    ->EventTWDXDOA_byte0;
		      end
                 end else begin
                    if (WEAN0_i !== last_WEAN0) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA0 = 1'b1;
                         all_core_xA(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA0 = 1'b1;
                       DOA_byte0_tmp = Memory_byte0[A_i];
                       ->EventTWDXDOA_byte0;
		      end
                    end else begin
                       if (DIA_byte0_i !== last_DIA_byte0) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA0 = 1'b1;
                         all_core_xA(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA0 = 1'b1;
                          DOA_byte0_tmp = Memory_byte0[A_i];
                          ->EventTWDXDOA_byte0;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA0 = 1'b1;
                         all_core_xA(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA0 = 1'b0;
                          DOA_byte0_tmp = Memory_byte0[A_i];
                          DOA_byte0_i = DOA_byte0_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte0;
                         disable TWDXDOA_byte0;
                         NODELAYA0 = 1'b1;
                         Memory_byte0[A_i] = {Bits{1'bX}};
                         DOA_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA0 = 1'b1;
                         all_core_xA(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA0 = 1'b1;
                 DOA_byte0_tmp = Memory_byte0[A_i];
                 ->EventTWDXDOA_byte0;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte0;
                disable TWDXDOA_byte0;
             NODELAYA0 = 1'b1;
             DOA_byte0_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(0,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte0;
              disable TWDXDOA_byte0;
           NODELAYA0 = 1'b1;
           DOA_byte0_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte0[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte0;
                   disable TWDXDOA_byte0;
                NODELAYA0 = 1'b1;
                DOA_byte0_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte0;
                disable TWDXDOA_byte0;
             NODELAYA0 = 1'b1;
             DOA_byte0_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(0,1);
             end
           end
        end
      endcase
      Last_WEAN0_i = WEAN0_i;

      casez({WEAN1_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN1_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte1;
                     disable TWDXDOA_byte1;
                  NODELAYA1 = 1'b1;
                  DOA_byte1_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte1_tmp = Memory_byte1[A_i];
                       NODELAYA1 = 1'b1;
                       ->EventTOHDOA_byte1;
		      end
                     end else begin
                        if (WEAN1_i !== last_WEAN1) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte1_tmp = Memory_byte1[A_i];
                          NODELAYA1 = 1'b1;
                          ->EventTOHDOA_byte1;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA1 = 1'b0;
                          DOA_byte1_tmp = Memory_byte1[A_i];
                          DOA_byte1_i = DOA_byte1_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte1_tmp = Memory_byte1[A_i];
                    NODELAYA1 = 1'b1;
                    ->EventTOHDOA_byte1;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte1;
                   disable TWDXDOA_byte1;
                NODELAYA1 = 1'b1;
                DOA_byte1_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN1_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte1;
                       disable TWDXDOB_byte1;
                    NODELAYB1 = 1'b1;
                    DOB_byte1_i = {Bits{1'bX}};
                   Memory_byte1[A_i] = DIA_byte1_i;
                 end else if ((Last_WEBN1_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte1[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte1[A_i] = DIA_byte1_i;
                 end
              end else begin
                   Memory_byte1[A_i] = DIA_byte1_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA1 = 1'b1;
                         all_core_xA(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA1 = 1'b1;
                    DOA_byte1_tmp = Memory_byte1[A_i];
                    ->EventTWDXDOA_byte1;
		      end
                 end else begin
                    if (WEAN1_i !== last_WEAN1) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA1 = 1'b1;
                         all_core_xA(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA1 = 1'b1;
                       DOA_byte1_tmp = Memory_byte1[A_i];
                       ->EventTWDXDOA_byte1;
		      end
                    end else begin
                       if (DIA_byte1_i !== last_DIA_byte1) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA1 = 1'b1;
                         all_core_xA(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA1 = 1'b1;
                          DOA_byte1_tmp = Memory_byte1[A_i];
                          ->EventTWDXDOA_byte1;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA1 = 1'b1;
                         all_core_xA(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA1 = 1'b0;
                          DOA_byte1_tmp = Memory_byte1[A_i];
                          DOA_byte1_i = DOA_byte1_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte1;
                         disable TWDXDOA_byte1;
                         NODELAYA1 = 1'b1;
                         Memory_byte1[A_i] = {Bits{1'bX}};
                         DOA_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA1 = 1'b1;
                         all_core_xA(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA1 = 1'b1;
                 DOA_byte1_tmp = Memory_byte1[A_i];
                 ->EventTWDXDOA_byte1;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte1;
                disable TWDXDOA_byte1;
             NODELAYA1 = 1'b1;
             DOA_byte1_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(1,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte1;
              disable TWDXDOA_byte1;
           NODELAYA1 = 1'b1;
           DOA_byte1_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte1[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte1;
                   disable TWDXDOA_byte1;
                NODELAYA1 = 1'b1;
                DOA_byte1_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte1;
                disable TWDXDOA_byte1;
             NODELAYA1 = 1'b1;
             DOA_byte1_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(1,1);
             end
           end
        end
      endcase
      Last_WEAN1_i = WEAN1_i;

      casez({WEAN2_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN2_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte2;
                     disable TWDXDOA_byte2;
                  NODELAYA2 = 1'b1;
                  DOA_byte2_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte2_tmp = Memory_byte2[A_i];
                       NODELAYA2 = 1'b1;
                       ->EventTOHDOA_byte2;
		      end
                     end else begin
                        if (WEAN2_i !== last_WEAN2) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte2_tmp = Memory_byte2[A_i];
                          NODELAYA2 = 1'b1;
                          ->EventTOHDOA_byte2;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA2 = 1'b0;
                          DOA_byte2_tmp = Memory_byte2[A_i];
                          DOA_byte2_i = DOA_byte2_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte2_tmp = Memory_byte2[A_i];
                    NODELAYA2 = 1'b1;
                    ->EventTOHDOA_byte2;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte2;
                   disable TWDXDOA_byte2;
                NODELAYA2 = 1'b1;
                DOA_byte2_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN2_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte2;
                       disable TWDXDOB_byte2;
                    NODELAYB2 = 1'b1;
                    DOB_byte2_i = {Bits{1'bX}};
                   Memory_byte2[A_i] = DIA_byte2_i;
                 end else if ((Last_WEBN2_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte2[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte2[A_i] = DIA_byte2_i;
                 end
              end else begin
                   Memory_byte2[A_i] = DIA_byte2_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA2 = 1'b1;
                         all_core_xA(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA2 = 1'b1;
                    DOA_byte2_tmp = Memory_byte2[A_i];
                    ->EventTWDXDOA_byte2;
		      end
                 end else begin
                    if (WEAN2_i !== last_WEAN2) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA2 = 1'b1;
                         all_core_xA(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA2 = 1'b1;
                       DOA_byte2_tmp = Memory_byte2[A_i];
                       ->EventTWDXDOA_byte2;
		      end
                    end else begin
                       if (DIA_byte2_i !== last_DIA_byte2) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA2 = 1'b1;
                         all_core_xA(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA2 = 1'b1;
                          DOA_byte2_tmp = Memory_byte2[A_i];
                          ->EventTWDXDOA_byte2;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA2 = 1'b1;
                         all_core_xA(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA2 = 1'b0;
                          DOA_byte2_tmp = Memory_byte2[A_i];
                          DOA_byte2_i = DOA_byte2_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte2;
                         disable TWDXDOA_byte2;
                         NODELAYA2 = 1'b1;
                         Memory_byte2[A_i] = {Bits{1'bX}};
                         DOA_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA2 = 1'b1;
                         all_core_xA(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA2 = 1'b1;
                 DOA_byte2_tmp = Memory_byte2[A_i];
                 ->EventTWDXDOA_byte2;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte2;
                disable TWDXDOA_byte2;
             NODELAYA2 = 1'b1;
             DOA_byte2_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(2,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte2;
              disable TWDXDOA_byte2;
           NODELAYA2 = 1'b1;
           DOA_byte2_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte2[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte2;
                   disable TWDXDOA_byte2;
                NODELAYA2 = 1'b1;
                DOA_byte2_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte2;
                disable TWDXDOA_byte2;
             NODELAYA2 = 1'b1;
             DOA_byte2_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(2,1);
             end
           end
        end
      endcase
      Last_WEAN2_i = WEAN2_i;

      casez({WEAN3_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN3_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte3;
                     disable TWDXDOA_byte3;
                  NODELAYA3 = 1'b1;
                  DOA_byte3_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte3_tmp = Memory_byte3[A_i];
                       NODELAYA3 = 1'b1;
                       ->EventTOHDOA_byte3;
		      end
                     end else begin
                        if (WEAN3_i !== last_WEAN3) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte3_tmp = Memory_byte3[A_i];
                          NODELAYA3 = 1'b1;
                          ->EventTOHDOA_byte3;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA3 = 1'b0;
                          DOA_byte3_tmp = Memory_byte3[A_i];
                          DOA_byte3_i = DOA_byte3_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte3_tmp = Memory_byte3[A_i];
                    NODELAYA3 = 1'b1;
                    ->EventTOHDOA_byte3;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte3;
                   disable TWDXDOA_byte3;
                NODELAYA3 = 1'b1;
                DOA_byte3_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN3_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte3;
                       disable TWDXDOB_byte3;
                    NODELAYB3 = 1'b1;
                    DOB_byte3_i = {Bits{1'bX}};
                   Memory_byte3[A_i] = DIA_byte3_i;
                 end else if ((Last_WEBN3_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte3[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte3[A_i] = DIA_byte3_i;
                 end
              end else begin
                   Memory_byte3[A_i] = DIA_byte3_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA3 = 1'b1;
                         all_core_xA(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA3 = 1'b1;
                    DOA_byte3_tmp = Memory_byte3[A_i];
                    ->EventTWDXDOA_byte3;
		      end
                 end else begin
                    if (WEAN3_i !== last_WEAN3) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA3 = 1'b1;
                         all_core_xA(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA3 = 1'b1;
                       DOA_byte3_tmp = Memory_byte3[A_i];
                       ->EventTWDXDOA_byte3;
		      end
                    end else begin
                       if (DIA_byte3_i !== last_DIA_byte3) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA3 = 1'b1;
                         all_core_xA(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA3 = 1'b1;
                          DOA_byte3_tmp = Memory_byte3[A_i];
                          ->EventTWDXDOA_byte3;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA3 = 1'b1;
                         all_core_xA(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA3 = 1'b0;
                          DOA_byte3_tmp = Memory_byte3[A_i];
                          DOA_byte3_i = DOA_byte3_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte3;
                         disable TWDXDOA_byte3;
                         NODELAYA3 = 1'b1;
                         Memory_byte3[A_i] = {Bits{1'bX}};
                         DOA_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA3 = 1'b1;
                         all_core_xA(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA3 = 1'b1;
                 DOA_byte3_tmp = Memory_byte3[A_i];
                 ->EventTWDXDOA_byte3;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte3;
                disable TWDXDOA_byte3;
             NODELAYA3 = 1'b1;
             DOA_byte3_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(3,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte3;
              disable TWDXDOA_byte3;
           NODELAYA3 = 1'b1;
           DOA_byte3_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte3[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte3;
                   disable TWDXDOA_byte3;
                NODELAYA3 = 1'b1;
                DOA_byte3_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte3;
                disable TWDXDOA_byte3;
             NODELAYA3 = 1'b1;
             DOA_byte3_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(3,1);
             end
           end
        end
      endcase
      Last_WEAN3_i = WEAN3_i;

      casez({WEAN4_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN4_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte4;
                     disable TWDXDOA_byte4;
                  NODELAYA4 = 1'b1;
                  DOA_byte4_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte4_tmp = Memory_byte4[A_i];
                       NODELAYA4 = 1'b1;
                       ->EventTOHDOA_byte4;
		      end
                     end else begin
                        if (WEAN4_i !== last_WEAN4) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte4_tmp = Memory_byte4[A_i];
                          NODELAYA4 = 1'b1;
                          ->EventTOHDOA_byte4;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA4 = 1'b0;
                          DOA_byte4_tmp = Memory_byte4[A_i];
                          DOA_byte4_i = DOA_byte4_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte4_tmp = Memory_byte4[A_i];
                    NODELAYA4 = 1'b1;
                    ->EventTOHDOA_byte4;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte4;
                   disable TWDXDOA_byte4;
                NODELAYA4 = 1'b1;
                DOA_byte4_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN4_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte4;
                       disable TWDXDOB_byte4;
                    NODELAYB4 = 1'b1;
                    DOB_byte4_i = {Bits{1'bX}};
                   Memory_byte4[A_i] = DIA_byte4_i;
                 end else if ((Last_WEBN4_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte4[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte4[A_i] = DIA_byte4_i;
                 end
              end else begin
                   Memory_byte4[A_i] = DIA_byte4_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA4 = 1'b1;
                         all_core_xA(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA4 = 1'b1;
                    DOA_byte4_tmp = Memory_byte4[A_i];
                    ->EventTWDXDOA_byte4;
		      end
                 end else begin
                    if (WEAN4_i !== last_WEAN4) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA4 = 1'b1;
                         all_core_xA(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA4 = 1'b1;
                       DOA_byte4_tmp = Memory_byte4[A_i];
                       ->EventTWDXDOA_byte4;
		      end
                    end else begin
                       if (DIA_byte4_i !== last_DIA_byte4) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA4 = 1'b1;
                         all_core_xA(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA4 = 1'b1;
                          DOA_byte4_tmp = Memory_byte4[A_i];
                          ->EventTWDXDOA_byte4;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA4 = 1'b1;
                         all_core_xA(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA4 = 1'b0;
                          DOA_byte4_tmp = Memory_byte4[A_i];
                          DOA_byte4_i = DOA_byte4_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte4;
                         disable TWDXDOA_byte4;
                         NODELAYA4 = 1'b1;
                         Memory_byte4[A_i] = {Bits{1'bX}};
                         DOA_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA4 = 1'b1;
                         all_core_xA(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA4 = 1'b1;
                 DOA_byte4_tmp = Memory_byte4[A_i];
                 ->EventTWDXDOA_byte4;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte4;
                disable TWDXDOA_byte4;
             NODELAYA4 = 1'b1;
             DOA_byte4_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(4,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte4;
              disable TWDXDOA_byte4;
           NODELAYA4 = 1'b1;
           DOA_byte4_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte4[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte4;
                   disable TWDXDOA_byte4;
                NODELAYA4 = 1'b1;
                DOA_byte4_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte4;
                disable TWDXDOA_byte4;
             NODELAYA4 = 1'b1;
             DOA_byte4_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(4,1);
             end
           end
        end
      endcase
      Last_WEAN4_i = WEAN4_i;

      casez({WEAN5_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN5_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte5;
                     disable TWDXDOA_byte5;
                  NODELAYA5 = 1'b1;
                  DOA_byte5_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte5_tmp = Memory_byte5[A_i];
                       NODELAYA5 = 1'b1;
                       ->EventTOHDOA_byte5;
		      end
                     end else begin
                        if (WEAN5_i !== last_WEAN5) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte5_tmp = Memory_byte5[A_i];
                          NODELAYA5 = 1'b1;
                          ->EventTOHDOA_byte5;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA5 = 1'b0;
                          DOA_byte5_tmp = Memory_byte5[A_i];
                          DOA_byte5_i = DOA_byte5_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte5_tmp = Memory_byte5[A_i];
                    NODELAYA5 = 1'b1;
                    ->EventTOHDOA_byte5;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte5;
                   disable TWDXDOA_byte5;
                NODELAYA5 = 1'b1;
                DOA_byte5_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN5_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte5;
                       disable TWDXDOB_byte5;
                    NODELAYB5 = 1'b1;
                    DOB_byte5_i = {Bits{1'bX}};
                   Memory_byte5[A_i] = DIA_byte5_i;
                 end else if ((Last_WEBN5_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte5[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte5[A_i] = DIA_byte5_i;
                 end
              end else begin
                   Memory_byte5[A_i] = DIA_byte5_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA5 = 1'b1;
                         all_core_xA(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA5 = 1'b1;
                    DOA_byte5_tmp = Memory_byte5[A_i];
                    ->EventTWDXDOA_byte5;
		      end
                 end else begin
                    if (WEAN5_i !== last_WEAN5) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA5 = 1'b1;
                         all_core_xA(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA5 = 1'b1;
                       DOA_byte5_tmp = Memory_byte5[A_i];
                       ->EventTWDXDOA_byte5;
		      end
                    end else begin
                       if (DIA_byte5_i !== last_DIA_byte5) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA5 = 1'b1;
                         all_core_xA(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA5 = 1'b1;
                          DOA_byte5_tmp = Memory_byte5[A_i];
                          ->EventTWDXDOA_byte5;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA5 = 1'b1;
                         all_core_xA(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA5 = 1'b0;
                          DOA_byte5_tmp = Memory_byte5[A_i];
                          DOA_byte5_i = DOA_byte5_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte5;
                         disable TWDXDOA_byte5;
                         NODELAYA5 = 1'b1;
                         Memory_byte5[A_i] = {Bits{1'bX}};
                         DOA_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA5 = 1'b1;
                         all_core_xA(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA5 = 1'b1;
                 DOA_byte5_tmp = Memory_byte5[A_i];
                 ->EventTWDXDOA_byte5;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte5;
                disable TWDXDOA_byte5;
             NODELAYA5 = 1'b1;
             DOA_byte5_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(5,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte5;
              disable TWDXDOA_byte5;
           NODELAYA5 = 1'b1;
           DOA_byte5_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte5[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte5;
                   disable TWDXDOA_byte5;
                NODELAYA5 = 1'b1;
                DOA_byte5_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte5;
                disable TWDXDOA_byte5;
             NODELAYA5 = 1'b1;
             DOA_byte5_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(5,1);
             end
           end
        end
      endcase
      Last_WEAN5_i = WEAN5_i;

      casez({WEAN6_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN6_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte6;
                     disable TWDXDOA_byte6;
                  NODELAYA6 = 1'b1;
                  DOA_byte6_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte6_tmp = Memory_byte6[A_i];
                       NODELAYA6 = 1'b1;
                       ->EventTOHDOA_byte6;
		      end
                     end else begin
                        if (WEAN6_i !== last_WEAN6) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte6_tmp = Memory_byte6[A_i];
                          NODELAYA6 = 1'b1;
                          ->EventTOHDOA_byte6;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA6 = 1'b0;
                          DOA_byte6_tmp = Memory_byte6[A_i];
                          DOA_byte6_i = DOA_byte6_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte6_tmp = Memory_byte6[A_i];
                    NODELAYA6 = 1'b1;
                    ->EventTOHDOA_byte6;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte6;
                   disable TWDXDOA_byte6;
                NODELAYA6 = 1'b1;
                DOA_byte6_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN6_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte6;
                       disable TWDXDOB_byte6;
                    NODELAYB6 = 1'b1;
                    DOB_byte6_i = {Bits{1'bX}};
                   Memory_byte6[A_i] = DIA_byte6_i;
                 end else if ((Last_WEBN6_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte6[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte6[A_i] = DIA_byte6_i;
                 end
              end else begin
                   Memory_byte6[A_i] = DIA_byte6_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA6 = 1'b1;
                         all_core_xA(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA6 = 1'b1;
                    DOA_byte6_tmp = Memory_byte6[A_i];
                    ->EventTWDXDOA_byte6;
		      end
                 end else begin
                    if (WEAN6_i !== last_WEAN6) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA6 = 1'b1;
                         all_core_xA(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA6 = 1'b1;
                       DOA_byte6_tmp = Memory_byte6[A_i];
                       ->EventTWDXDOA_byte6;
		      end
                    end else begin
                       if (DIA_byte6_i !== last_DIA_byte6) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA6 = 1'b1;
                         all_core_xA(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA6 = 1'b1;
                          DOA_byte6_tmp = Memory_byte6[A_i];
                          ->EventTWDXDOA_byte6;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA6 = 1'b1;
                         all_core_xA(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA6 = 1'b0;
                          DOA_byte6_tmp = Memory_byte6[A_i];
                          DOA_byte6_i = DOA_byte6_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte6;
                         disable TWDXDOA_byte6;
                         NODELAYA6 = 1'b1;
                         Memory_byte6[A_i] = {Bits{1'bX}};
                         DOA_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA6 = 1'b1;
                         all_core_xA(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA6 = 1'b1;
                 DOA_byte6_tmp = Memory_byte6[A_i];
                 ->EventTWDXDOA_byte6;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte6;
                disable TWDXDOA_byte6;
             NODELAYA6 = 1'b1;
             DOA_byte6_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(6,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte6;
              disable TWDXDOA_byte6;
           NODELAYA6 = 1'b1;
           DOA_byte6_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte6[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte6;
                   disable TWDXDOA_byte6;
                NODELAYA6 = 1'b1;
                DOA_byte6_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte6;
                disable TWDXDOA_byte6;
             NODELAYA6 = 1'b1;
             DOA_byte6_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(6,1);
             end
           end
        end
      endcase
      Last_WEAN6_i = WEAN6_i;

      casez({WEAN7_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN7_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA_byte7;
                     disable TWDXDOA_byte7;
                  NODELAYA7 = 1'b1;
                  DOA_byte7_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOA_byte7_tmp = Memory_byte7[A_i];
                       NODELAYA7 = 1'b1;
                       ->EventTOHDOA_byte7;
		      end
                     end else begin
                        if (WEAN7_i !== last_WEAN7) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOA_byte7_tmp = Memory_byte7[A_i];
                          NODELAYA7 = 1'b1;
                          ->EventTOHDOA_byte7;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA7 = 1'b0;
                          DOA_byte7_tmp = Memory_byte7[A_i];
                          DOA_byte7_i = DOA_byte7_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOA_byte7_tmp = Memory_byte7[A_i];
                    NODELAYA7 = 1'b1;
                    ->EventTOHDOA_byte7;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA_byte7;
                   disable TWDXDOA_byte7;
                NODELAYA7 = 1'b1;
                DOA_byte7_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN7_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOB_byte7;
                       disable TWDXDOB_byte7;
                    NODELAYB7 = 1'b1;
                    DOB_byte7_i = {Bits{1'bX}};
                   Memory_byte7[A_i] = DIA_byte7_i;
                 end else if ((Last_WEBN7_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte7[A_i] = {Bits{1'bX}};
                 end else begin
                   Memory_byte7[A_i] = DIA_byte7_i;
                 end
              end else begin
                   Memory_byte7[A_i] = DIA_byte7_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA7 = 1'b1;
                         all_core_xA(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA7 = 1'b1;
                    DOA_byte7_tmp = Memory_byte7[A_i];
                    ->EventTWDXDOA_byte7;
		      end
                 end else begin
                    if (WEAN7_i !== last_WEAN7) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA7 = 1'b1;
                         all_core_xA(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA7 = 1'b1;
                       DOA_byte7_tmp = Memory_byte7[A_i];
                       ->EventTWDXDOA_byte7;
		      end
                    end else begin
                       if (DIA_byte7_i !== last_DIA_byte7) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA7 = 1'b1;
                         all_core_xA(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA7 = 1'b1;
                          DOA_byte7_tmp = Memory_byte7[A_i];
                          ->EventTWDXDOA_byte7;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA7 = 1'b1;
                         all_core_xA(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYA7 = 1'b0;
                          DOA_byte7_tmp = Memory_byte7[A_i];
                          DOA_byte7_i = DOA_byte7_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA_byte7;
                         disable TWDXDOA_byte7;
                         NODELAYA7 = 1'b1;
                         Memory_byte7[A_i] = {Bits{1'bX}};
                         DOA_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA7 = 1'b1;
                         all_core_xA(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYA7 = 1'b1;
                 DOA_byte7_tmp = Memory_byte7[A_i];
                 ->EventTWDXDOA_byte7;
		      end

              end
           end else begin
             #0 disable TOHDOA_byte7;
                disable TWDXDOA_byte7;
             NODELAYA7 = 1'b1;
             DOA_byte7_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(7,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           #0 disable TOHDOA_byte7;
              disable TWDXDOA_byte7;
           NODELAYA7 = 1'b1;
           DOA_byte7_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte7[A_i] = {Bits{1'bX}};
                #0 disable TOHDOA_byte7;
                   disable TWDXDOA_byte7;
                NODELAYA7 = 1'b1;
                DOA_byte7_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA_byte7;
                disable TWDXDOA_byte7;
             NODELAYA7 = 1'b1;
             DOA_byte7_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
               all_core_xA(7,1);
             end
           end
        end
      endcase
      Last_WEAN7_i = WEAN7_i;
  end
  endtask //memory_functionA;

  task memory_functionB;
    begin
      B_i                            = Latch_B;
      DIB_byte0_i                    = Latch_DIB_byte0;
      DIB_byte1_i                    = Latch_DIB_byte1;
      DIB_byte2_i                    = Latch_DIB_byte2;
      DIB_byte3_i                    = Latch_DIB_byte3;
      DIB_byte4_i                    = Latch_DIB_byte4;
      DIB_byte5_i                    = Latch_DIB_byte5;
      DIB_byte6_i                    = Latch_DIB_byte6;
      DIB_byte7_i                    = Latch_DIB_byte7;
      WEBN0_i                        = Latch_WEBN0;
      WEBN1_i                        = Latch_WEBN1;
      WEBN2_i                        = Latch_WEBN2;
      WEBN3_i                        = Latch_WEBN3;
      WEBN4_i                        = Latch_WEBN4;
      WEBN5_i                        = Latch_WEBN5;
      WEBN6_i                        = Latch_WEBN6;
      WEBN7_i                        = Latch_WEBN7;
      CSB_i                          = Latch_CSB;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CSB_ == 1'b1) B_monitor;


      casez({WEBN0_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN0_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte0;
                     disable TWDXDOB_byte0;
                  NODELAYB0 = 1'b1;
                  DOB_byte0_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte0_tmp = Memory_byte0[B_i];
                       NODELAYB0 = 1'b1;
                       ->EventTOHDOB_byte0;
		      end
                     end else begin
                        if (WEBN0_i !== last_WEBN0) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte0_tmp = Memory_byte0[B_i];
                          NODELAYB0 = 1'b1;
                          ->EventTOHDOB_byte0;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB0 = 1'b0;
                          DOB_byte0_tmp = Memory_byte0[B_i];
                          DOB_byte0_i = DOB_byte0_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte0_tmp = Memory_byte0[B_i];
                    NODELAYB0 = 1'b1;
                    ->EventTOHDOB_byte0;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte0;
                   disable TWDXDOB_byte0;
                NODELAYB0 = 1'b1;
                DOB_byte0_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN0_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte0;
                       disable TWDXDOA_byte0;
                    NODELAYA0 = 1'b1;
                    DOA_byte0_i = {Bits{1'bX}};
                    Memory_byte0[B_i] = DIB_byte0_i;
                 end else if ((Last_WEAN0_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte0[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte0[B_i] = DIB_byte0_i;
                 end
              end else begin
                   Memory_byte0[B_i] = DIB_byte0_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB0 = 1'b1;
                         all_core_xB(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB0 = 1'b1;
                    DOB_byte0_tmp = Memory_byte0[B_i];
                    ->EventTWDXDOB_byte0;
		      end
                 end else begin
                    if (WEBN0_i !== last_WEBN0) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB0 = 1'b1;
                         all_core_xB(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB0 = 1'b1;
                       DOB_byte0_tmp = Memory_byte0[B_i];
                       ->EventTWDXDOB_byte0;
		      end
                    end else begin
                       if (DIB_byte0_i !== last_DIB_byte0) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB0 = 1'b1;
                         all_core_xB(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB0 = 1'b1;
                          DOB_byte0_tmp = Memory_byte0[B_i];
                          ->EventTWDXDOB_byte0;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB0 = 1'b1;
                         all_core_xB(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB0 = 1'b0;
                          DOB_byte0_tmp = Memory_byte0[B_i];
                          DOB_byte0_i = DOB_byte0_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte0;
                         disable TWDXDOB_byte0;
                         NODELAYB0 = 1'b1;
                         Memory_byte0[B_i] = {Bits{1'bX}};
                         DOB_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB0 = 1'b1;
                         all_core_xB(0,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB0 = 1'b1;
                 DOB_byte0_tmp = Memory_byte0[B_i];
                 ->EventTWDXDOB_byte0;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte0;
                disable TWDXDOB_byte0;
             NODELAYB0 = 1'b1;
             DOB_byte0_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(0,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte0;
              disable TWDXDOB_byte0;
           NODELAYB0 = 1'b1;
           DOB_byte0_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte0[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte0;
                   disable TWDXDOB_byte0;
                NODELAYB0 = 1'b1;
                DOB_byte0_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte0;
                disable TWDXDOB_byte0;
             NODELAYB0 = 1'b1;
             DOB_byte0_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(0,1);
             end
           end
        end
      endcase
      Last_WEBN0_i = WEBN0_i;

      casez({WEBN1_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN1_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte1;
                     disable TWDXDOB_byte1;
                  NODELAYB1 = 1'b1;
                  DOB_byte1_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte1_tmp = Memory_byte1[B_i];
                       NODELAYB1 = 1'b1;
                       ->EventTOHDOB_byte1;
		      end
                     end else begin
                        if (WEBN1_i !== last_WEBN1) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte1_tmp = Memory_byte1[B_i];
                          NODELAYB1 = 1'b1;
                          ->EventTOHDOB_byte1;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB1 = 1'b0;
                          DOB_byte1_tmp = Memory_byte1[B_i];
                          DOB_byte1_i = DOB_byte1_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte1_tmp = Memory_byte1[B_i];
                    NODELAYB1 = 1'b1;
                    ->EventTOHDOB_byte1;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte1;
                   disable TWDXDOB_byte1;
                NODELAYB1 = 1'b1;
                DOB_byte1_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN1_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte1;
                       disable TWDXDOA_byte1;
                    NODELAYA1 = 1'b1;
                    DOA_byte1_i = {Bits{1'bX}};
                    Memory_byte1[B_i] = DIB_byte1_i;
                 end else if ((Last_WEAN1_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte1[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte1[B_i] = DIB_byte1_i;
                 end
              end else begin
                   Memory_byte1[B_i] = DIB_byte1_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB1 = 1'b1;
                         all_core_xB(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB1 = 1'b1;
                    DOB_byte1_tmp = Memory_byte1[B_i];
                    ->EventTWDXDOB_byte1;
		      end
                 end else begin
                    if (WEBN1_i !== last_WEBN1) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB1 = 1'b1;
                         all_core_xB(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB1 = 1'b1;
                       DOB_byte1_tmp = Memory_byte1[B_i];
                       ->EventTWDXDOB_byte1;
		      end
                    end else begin
                       if (DIB_byte1_i !== last_DIB_byte1) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB1 = 1'b1;
                         all_core_xB(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB1 = 1'b1;
                          DOB_byte1_tmp = Memory_byte1[B_i];
                          ->EventTWDXDOB_byte1;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB1 = 1'b1;
                         all_core_xB(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB1 = 1'b0;
                          DOB_byte1_tmp = Memory_byte1[B_i];
                          DOB_byte1_i = DOB_byte1_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte1;
                         disable TWDXDOB_byte1;
                         NODELAYB1 = 1'b1;
                         Memory_byte1[B_i] = {Bits{1'bX}};
                         DOB_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB1 = 1'b1;
                         all_core_xB(1,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB1 = 1'b1;
                 DOB_byte1_tmp = Memory_byte1[B_i];
                 ->EventTWDXDOB_byte1;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte1;
                disable TWDXDOB_byte1;
             NODELAYB1 = 1'b1;
             DOB_byte1_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(1,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte1;
              disable TWDXDOB_byte1;
           NODELAYB1 = 1'b1;
           DOB_byte1_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte1[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte1;
                   disable TWDXDOB_byte1;
                NODELAYB1 = 1'b1;
                DOB_byte1_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte1;
                disable TWDXDOB_byte1;
             NODELAYB1 = 1'b1;
             DOB_byte1_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(1,1);
             end
           end
        end
      endcase
      Last_WEBN1_i = WEBN1_i;

      casez({WEBN2_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN2_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte2;
                     disable TWDXDOB_byte2;
                  NODELAYB2 = 1'b1;
                  DOB_byte2_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte2_tmp = Memory_byte2[B_i];
                       NODELAYB2 = 1'b1;
                       ->EventTOHDOB_byte2;
		      end
                     end else begin
                        if (WEBN2_i !== last_WEBN2) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte2_tmp = Memory_byte2[B_i];
                          NODELAYB2 = 1'b1;
                          ->EventTOHDOB_byte2;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB2 = 1'b0;
                          DOB_byte2_tmp = Memory_byte2[B_i];
                          DOB_byte2_i = DOB_byte2_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte2_tmp = Memory_byte2[B_i];
                    NODELAYB2 = 1'b1;
                    ->EventTOHDOB_byte2;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte2;
                   disable TWDXDOB_byte2;
                NODELAYB2 = 1'b1;
                DOB_byte2_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN2_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte2;
                       disable TWDXDOA_byte2;
                    NODELAYA2 = 1'b1;
                    DOA_byte2_i = {Bits{1'bX}};
                    Memory_byte2[B_i] = DIB_byte2_i;
                 end else if ((Last_WEAN2_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte2[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte2[B_i] = DIB_byte2_i;
                 end
              end else begin
                   Memory_byte2[B_i] = DIB_byte2_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB2 = 1'b1;
                         all_core_xB(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB2 = 1'b1;
                    DOB_byte2_tmp = Memory_byte2[B_i];
                    ->EventTWDXDOB_byte2;
		      end
                 end else begin
                    if (WEBN2_i !== last_WEBN2) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB2 = 1'b1;
                         all_core_xB(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB2 = 1'b1;
                       DOB_byte2_tmp = Memory_byte2[B_i];
                       ->EventTWDXDOB_byte2;
		      end
                    end else begin
                       if (DIB_byte2_i !== last_DIB_byte2) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB2 = 1'b1;
                         all_core_xB(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB2 = 1'b1;
                          DOB_byte2_tmp = Memory_byte2[B_i];
                          ->EventTWDXDOB_byte2;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB2 = 1'b1;
                         all_core_xB(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB2 = 1'b0;
                          DOB_byte2_tmp = Memory_byte2[B_i];
                          DOB_byte2_i = DOB_byte2_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte2;
                         disable TWDXDOB_byte2;
                         NODELAYB2 = 1'b1;
                         Memory_byte2[B_i] = {Bits{1'bX}};
                         DOB_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB2 = 1'b1;
                         all_core_xB(2,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB2 = 1'b1;
                 DOB_byte2_tmp = Memory_byte2[B_i];
                 ->EventTWDXDOB_byte2;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte2;
                disable TWDXDOB_byte2;
             NODELAYB2 = 1'b1;
             DOB_byte2_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(2,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte2;
              disable TWDXDOB_byte2;
           NODELAYB2 = 1'b1;
           DOB_byte2_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte2[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte2;
                   disable TWDXDOB_byte2;
                NODELAYB2 = 1'b1;
                DOB_byte2_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte2;
                disable TWDXDOB_byte2;
             NODELAYB2 = 1'b1;
             DOB_byte2_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(2,1);
             end
           end
        end
      endcase
      Last_WEBN2_i = WEBN2_i;

      casez({WEBN3_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN3_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte3;
                     disable TWDXDOB_byte3;
                  NODELAYB3 = 1'b1;
                  DOB_byte3_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte3_tmp = Memory_byte3[B_i];
                       NODELAYB3 = 1'b1;
                       ->EventTOHDOB_byte3;
		      end
                     end else begin
                        if (WEBN3_i !== last_WEBN3) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte3_tmp = Memory_byte3[B_i];
                          NODELAYB3 = 1'b1;
                          ->EventTOHDOB_byte3;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB3 = 1'b0;
                          DOB_byte3_tmp = Memory_byte3[B_i];
                          DOB_byte3_i = DOB_byte3_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte3_tmp = Memory_byte3[B_i];
                    NODELAYB3 = 1'b1;
                    ->EventTOHDOB_byte3;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte3;
                   disable TWDXDOB_byte3;
                NODELAYB3 = 1'b1;
                DOB_byte3_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN3_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte3;
                       disable TWDXDOA_byte3;
                    NODELAYA3 = 1'b1;
                    DOA_byte3_i = {Bits{1'bX}};
                    Memory_byte3[B_i] = DIB_byte3_i;
                 end else if ((Last_WEAN3_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte3[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte3[B_i] = DIB_byte3_i;
                 end
              end else begin
                   Memory_byte3[B_i] = DIB_byte3_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB3 = 1'b1;
                         all_core_xB(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB3 = 1'b1;
                    DOB_byte3_tmp = Memory_byte3[B_i];
                    ->EventTWDXDOB_byte3;
		      end
                 end else begin
                    if (WEBN3_i !== last_WEBN3) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB3 = 1'b1;
                         all_core_xB(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB3 = 1'b1;
                       DOB_byte3_tmp = Memory_byte3[B_i];
                       ->EventTWDXDOB_byte3;
		      end
                    end else begin
                       if (DIB_byte3_i !== last_DIB_byte3) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB3 = 1'b1;
                         all_core_xB(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB3 = 1'b1;
                          DOB_byte3_tmp = Memory_byte3[B_i];
                          ->EventTWDXDOB_byte3;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB3 = 1'b1;
                         all_core_xB(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB3 = 1'b0;
                          DOB_byte3_tmp = Memory_byte3[B_i];
                          DOB_byte3_i = DOB_byte3_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte3;
                         disable TWDXDOB_byte3;
                         NODELAYB3 = 1'b1;
                         Memory_byte3[B_i] = {Bits{1'bX}};
                         DOB_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB3 = 1'b1;
                         all_core_xB(3,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB3 = 1'b1;
                 DOB_byte3_tmp = Memory_byte3[B_i];
                 ->EventTWDXDOB_byte3;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte3;
                disable TWDXDOB_byte3;
             NODELAYB3 = 1'b1;
             DOB_byte3_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(3,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte3;
              disable TWDXDOB_byte3;
           NODELAYB3 = 1'b1;
           DOB_byte3_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte3[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte3;
                   disable TWDXDOB_byte3;
                NODELAYB3 = 1'b1;
                DOB_byte3_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte3;
                disable TWDXDOB_byte3;
             NODELAYB3 = 1'b1;
             DOB_byte3_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(3,1);
             end
           end
        end
      endcase
      Last_WEBN3_i = WEBN3_i;

      casez({WEBN4_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN4_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte4;
                     disable TWDXDOB_byte4;
                  NODELAYB4 = 1'b1;
                  DOB_byte4_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte4_tmp = Memory_byte4[B_i];
                       NODELAYB4 = 1'b1;
                       ->EventTOHDOB_byte4;
		      end
                     end else begin
                        if (WEBN4_i !== last_WEBN4) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte4_tmp = Memory_byte4[B_i];
                          NODELAYB4 = 1'b1;
                          ->EventTOHDOB_byte4;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB4 = 1'b0;
                          DOB_byte4_tmp = Memory_byte4[B_i];
                          DOB_byte4_i = DOB_byte4_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte4_tmp = Memory_byte4[B_i];
                    NODELAYB4 = 1'b1;
                    ->EventTOHDOB_byte4;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte4;
                   disable TWDXDOB_byte4;
                NODELAYB4 = 1'b1;
                DOB_byte4_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN4_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte4;
                       disable TWDXDOA_byte4;
                    NODELAYA4 = 1'b1;
                    DOA_byte4_i = {Bits{1'bX}};
                    Memory_byte4[B_i] = DIB_byte4_i;
                 end else if ((Last_WEAN4_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte4[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte4[B_i] = DIB_byte4_i;
                 end
              end else begin
                   Memory_byte4[B_i] = DIB_byte4_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB4 = 1'b1;
                         all_core_xB(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB4 = 1'b1;
                    DOB_byte4_tmp = Memory_byte4[B_i];
                    ->EventTWDXDOB_byte4;
		      end
                 end else begin
                    if (WEBN4_i !== last_WEBN4) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB4 = 1'b1;
                         all_core_xB(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB4 = 1'b1;
                       DOB_byte4_tmp = Memory_byte4[B_i];
                       ->EventTWDXDOB_byte4;
		      end
                    end else begin
                       if (DIB_byte4_i !== last_DIB_byte4) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB4 = 1'b1;
                         all_core_xB(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB4 = 1'b1;
                          DOB_byte4_tmp = Memory_byte4[B_i];
                          ->EventTWDXDOB_byte4;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB4 = 1'b1;
                         all_core_xB(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB4 = 1'b0;
                          DOB_byte4_tmp = Memory_byte4[B_i];
                          DOB_byte4_i = DOB_byte4_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte4;
                         disable TWDXDOB_byte4;
                         NODELAYB4 = 1'b1;
                         Memory_byte4[B_i] = {Bits{1'bX}};
                         DOB_byte4_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB4 = 1'b1;
                         all_core_xB(4,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB4 = 1'b1;
                 DOB_byte4_tmp = Memory_byte4[B_i];
                 ->EventTWDXDOB_byte4;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte4;
                disable TWDXDOB_byte4;
             NODELAYB4 = 1'b1;
             DOB_byte4_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(4,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte4;
              disable TWDXDOB_byte4;
           NODELAYB4 = 1'b1;
           DOB_byte4_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte4[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte4;
                   disable TWDXDOB_byte4;
                NODELAYB4 = 1'b1;
                DOB_byte4_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte4;
                disable TWDXDOB_byte4;
             NODELAYB4 = 1'b1;
             DOB_byte4_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(4,1);
             end
           end
        end
      endcase
      Last_WEBN4_i = WEBN4_i;

      casez({WEBN5_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN5_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte5;
                     disable TWDXDOB_byte5;
                  NODELAYB5 = 1'b1;
                  DOB_byte5_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte5_tmp = Memory_byte5[B_i];
                       NODELAYB5 = 1'b1;
                       ->EventTOHDOB_byte5;
		      end
                     end else begin
                        if (WEBN5_i !== last_WEBN5) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte5_tmp = Memory_byte5[B_i];
                          NODELAYB5 = 1'b1;
                          ->EventTOHDOB_byte5;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB5 = 1'b0;
                          DOB_byte5_tmp = Memory_byte5[B_i];
                          DOB_byte5_i = DOB_byte5_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte5_tmp = Memory_byte5[B_i];
                    NODELAYB5 = 1'b1;
                    ->EventTOHDOB_byte5;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte5;
                   disable TWDXDOB_byte5;
                NODELAYB5 = 1'b1;
                DOB_byte5_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN5_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte5;
                       disable TWDXDOA_byte5;
                    NODELAYA5 = 1'b1;
                    DOA_byte5_i = {Bits{1'bX}};
                    Memory_byte5[B_i] = DIB_byte5_i;
                 end else if ((Last_WEAN5_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte5[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte5[B_i] = DIB_byte5_i;
                 end
              end else begin
                   Memory_byte5[B_i] = DIB_byte5_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB5 = 1'b1;
                         all_core_xB(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB5 = 1'b1;
                    DOB_byte5_tmp = Memory_byte5[B_i];
                    ->EventTWDXDOB_byte5;
		      end
                 end else begin
                    if (WEBN5_i !== last_WEBN5) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB5 = 1'b1;
                         all_core_xB(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB5 = 1'b1;
                       DOB_byte5_tmp = Memory_byte5[B_i];
                       ->EventTWDXDOB_byte5;
		      end
                    end else begin
                       if (DIB_byte5_i !== last_DIB_byte5) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB5 = 1'b1;
                         all_core_xB(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB5 = 1'b1;
                          DOB_byte5_tmp = Memory_byte5[B_i];
                          ->EventTWDXDOB_byte5;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB5 = 1'b1;
                         all_core_xB(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB5 = 1'b0;
                          DOB_byte5_tmp = Memory_byte5[B_i];
                          DOB_byte5_i = DOB_byte5_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte5;
                         disable TWDXDOB_byte5;
                         NODELAYB5 = 1'b1;
                         Memory_byte5[B_i] = {Bits{1'bX}};
                         DOB_byte5_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB5 = 1'b1;
                         all_core_xB(5,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB5 = 1'b1;
                 DOB_byte5_tmp = Memory_byte5[B_i];
                 ->EventTWDXDOB_byte5;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte5;
                disable TWDXDOB_byte5;
             NODELAYB5 = 1'b1;
             DOB_byte5_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(5,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte5;
              disable TWDXDOB_byte5;
           NODELAYB5 = 1'b1;
           DOB_byte5_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte5[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte5;
                   disable TWDXDOB_byte5;
                NODELAYB5 = 1'b1;
                DOB_byte5_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte5;
                disable TWDXDOB_byte5;
             NODELAYB5 = 1'b1;
             DOB_byte5_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(5,1);
             end
           end
        end
      endcase
      Last_WEBN5_i = WEBN5_i;

      casez({WEBN6_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN6_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte6;
                     disable TWDXDOB_byte6;
                  NODELAYB6 = 1'b1;
                  DOB_byte6_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte6_tmp = Memory_byte6[B_i];
                       NODELAYB6 = 1'b1;
                       ->EventTOHDOB_byte6;
		      end
                     end else begin
                        if (WEBN6_i !== last_WEBN6) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte6_tmp = Memory_byte6[B_i];
                          NODELAYB6 = 1'b1;
                          ->EventTOHDOB_byte6;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB6 = 1'b0;
                          DOB_byte6_tmp = Memory_byte6[B_i];
                          DOB_byte6_i = DOB_byte6_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte6_tmp = Memory_byte6[B_i];
                    NODELAYB6 = 1'b1;
                    ->EventTOHDOB_byte6;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte6;
                   disable TWDXDOB_byte6;
                NODELAYB6 = 1'b1;
                DOB_byte6_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN6_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte6;
                       disable TWDXDOA_byte6;
                    NODELAYA6 = 1'b1;
                    DOA_byte6_i = {Bits{1'bX}};
                    Memory_byte6[B_i] = DIB_byte6_i;
                 end else if ((Last_WEAN6_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte6[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte6[B_i] = DIB_byte6_i;
                 end
              end else begin
                   Memory_byte6[B_i] = DIB_byte6_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB6 = 1'b1;
                         all_core_xB(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB6 = 1'b1;
                    DOB_byte6_tmp = Memory_byte6[B_i];
                    ->EventTWDXDOB_byte6;
		      end
                 end else begin
                    if (WEBN6_i !== last_WEBN6) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB6 = 1'b1;
                         all_core_xB(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB6 = 1'b1;
                       DOB_byte6_tmp = Memory_byte6[B_i];
                       ->EventTWDXDOB_byte6;
		      end
                    end else begin
                       if (DIB_byte6_i !== last_DIB_byte6) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB6 = 1'b1;
                         all_core_xB(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB6 = 1'b1;
                          DOB_byte6_tmp = Memory_byte6[B_i];
                          ->EventTWDXDOB_byte6;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB6 = 1'b1;
                         all_core_xB(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB6 = 1'b0;
                          DOB_byte6_tmp = Memory_byte6[B_i];
                          DOB_byte6_i = DOB_byte6_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte6;
                         disable TWDXDOB_byte6;
                         NODELAYB6 = 1'b1;
                         Memory_byte6[B_i] = {Bits{1'bX}};
                         DOB_byte6_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB6 = 1'b1;
                         all_core_xB(6,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB6 = 1'b1;
                 DOB_byte6_tmp = Memory_byte6[B_i];
                 ->EventTWDXDOB_byte6;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte6;
                disable TWDXDOB_byte6;
             NODELAYB6 = 1'b1;
             DOB_byte6_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(6,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte6;
              disable TWDXDOB_byte6;
           NODELAYB6 = 1'b1;
           DOB_byte6_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte6[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte6;
                   disable TWDXDOB_byte6;
                NODELAYB6 = 1'b1;
                DOB_byte6_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte6;
                disable TWDXDOB_byte6;
             NODELAYB6 = 1'b1;
             DOB_byte6_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(6,1);
             end
           end
        end
      endcase
      Last_WEBN6_i = WEBN6_i;

      casez({WEBN7_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN7_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB_byte7;
                     disable TWDXDOB_byte7;
                  NODELAYB7 = 1'b1;
                  DOB_byte7_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                     if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       DOB_byte7_tmp = Memory_byte7[B_i];
                       NODELAYB7 = 1'b1;
                       ->EventTOHDOB_byte7;
		      end
                     end else begin
                        if (WEBN7_i !== last_WEBN7) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          DOB_byte7_tmp = Memory_byte7[B_i];
                          NODELAYB7 = 1'b1;
                          ->EventTOHDOB_byte7;
		      end
                        end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB7 = 1'b0;
                          DOB_byte7_tmp = Memory_byte7[B_i];
                          DOB_byte7_i = DOB_byte7_tmp;
		      end
                        end
                     end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    DOB_byte7_tmp = Memory_byte7[B_i];
                    NODELAYB7 = 1'b1;
                    ->EventTOHDOB_byte7;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB_byte7;
                   disable TWDXDOB_byte7;
                NODELAYB7 = 1'b1;
                DOB_byte7_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN7_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA_byte7;
                       disable TWDXDOA_byte7;
                    NODELAYA7 = 1'b1;
                    DOA_byte7_i = {Bits{1'bX}};
                    Memory_byte7[B_i] = DIB_byte7_i;
                 end else if ((Last_WEAN7_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory_byte7[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory_byte7[B_i] = DIB_byte7_i;
                 end
              end else begin
                   Memory_byte7[B_i] = DIB_byte7_i;
              end
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB7 = 1'b1;
                         all_core_xB(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB7 = 1'b1;
                    DOB_byte7_tmp = Memory_byte7[B_i];
                    ->EventTWDXDOB_byte7;
		      end
                 end else begin
                    if (WEBN7_i !== last_WEBN7) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB7 = 1'b1;
                         all_core_xB(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB7 = 1'b1;
                       DOB_byte7_tmp = Memory_byte7[B_i];
                       ->EventTWDXDOB_byte7;
		      end
                    end else begin
                       if (DIB_byte7_i !== last_DIB_byte7) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB7 = 1'b1;
                         all_core_xB(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB7 = 1'b1;
                          DOB_byte7_tmp = Memory_byte7[B_i];
                          ->EventTWDXDOB_byte7;
		      end
                       end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB7 = 1'b1;
                         all_core_xB(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                          NODELAYB7 = 1'b0;
                          DOB_byte7_tmp = Memory_byte7[B_i];
                          DOB_byte7_i = DOB_byte7_tmp;
		      end
                       end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB_byte7;
                         disable TWDXDOB_byte7;
                         NODELAYB7 = 1'b1;
                         Memory_byte7[B_i] = {Bits{1'bX}};
                         DOB_byte7_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB7 = 1'b1;
                         all_core_xB(7,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                 NODELAYB7 = 1'b1;
                 DOB_byte7_tmp = Memory_byte7[B_i];
                 ->EventTWDXDOB_byte7;
		      end

              end
           end else begin
             #0 disable TOHDOB_byte7;
                disable TWDXDOB_byte7;
             NODELAYB7 = 1'b1;
             DOB_byte7_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(7,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB_byte7;
              disable TWDXDOB_byte7;
           NODELAYB7 = 1'b1;
           DOB_byte7_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte7[B_i] = {Bits{1'bX}};
                #0 disable TOHDOB_byte7;
                   disable TWDXDOB_byte7;
                NODELAYB7 = 1'b1;
                DOB_byte7_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB_byte7;
                disable TWDXDOB_byte7;
             NODELAYB7 = 1'b1;
             DOB_byte7_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
                all_core_xB(7,1);
             end
           end
        end
      endcase
      Last_WEBN7_i = WEBN7_i;
  end
  endtask //memory_functionB;

  task all_core_xA;
     input byte_num;
     input do_x;

     integer byte_num;
     integer do_x;
     integer LoopCount_Address;
     begin
       LoopCount_Address=Words-1;
       while(LoopCount_Address >=0) begin
          case (byte_num)
             0       : begin
                         if (do_x == 1) Memory_byte0[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte0[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte0;
                               disable TWDXDOA_byte0;
                            NODELAYA0 = 1'b1;
                            DOA_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte0;
                               disable TWDXDOA_byte0;
                            NODELAYA0 = 1'b1;
                            DOA_byte0_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             1       : begin
                         if (do_x == 1) Memory_byte1[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte1[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte1;
                               disable TWDXDOA_byte1;
                            NODELAYA1 = 1'b1;
                            DOA_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte1;
                               disable TWDXDOA_byte1;
                            NODELAYA1 = 1'b1;
                            DOA_byte1_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             2       : begin
                         if (do_x == 1) Memory_byte2[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte2[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte2;
                               disable TWDXDOA_byte2;
                            NODELAYA2 = 1'b1;
                            DOA_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte2;
                               disable TWDXDOA_byte2;
                            NODELAYA2 = 1'b1;
                            DOA_byte2_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             3       : begin
                         if (do_x == 1) Memory_byte3[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte3[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte3;
                               disable TWDXDOA_byte3;
                            NODELAYA3 = 1'b1;
                            DOA_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte3;
                               disable TWDXDOA_byte3;
                            NODELAYA3 = 1'b1;
                            DOA_byte3_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             4       : begin
                         if (do_x == 1) Memory_byte4[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte4[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte4;
                               disable TWDXDOA_byte4;
                            NODELAYA4 = 1'b1;
                            DOA_byte4_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte4;
                               disable TWDXDOA_byte4;
                            NODELAYA4 = 1'b1;
                            DOA_byte4_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             5       : begin
                         if (do_x == 1) Memory_byte5[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte5[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte5;
                               disable TWDXDOA_byte5;
                            NODELAYA5 = 1'b1;
                            DOA_byte5_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte5;
                               disable TWDXDOA_byte5;
                            NODELAYA5 = 1'b1;
                            DOA_byte5_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             6       : begin
                         if (do_x == 1) Memory_byte6[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte6[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte6;
                               disable TWDXDOA_byte6;
                            NODELAYA6 = 1'b1;
                            DOA_byte6_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte6;
                               disable TWDXDOA_byte6;
                            NODELAYA6 = 1'b1;
                            DOA_byte6_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             7       : begin
                         if (do_x == 1) Memory_byte7[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte7[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte7;
                               disable TWDXDOA_byte7;
                            NODELAYA7 = 1'b1;
                            DOA_byte7_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte7;
                               disable TWDXDOA_byte7;
                            NODELAYA7 = 1'b1;
                            DOA_byte7_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             default : begin
                         if (do_x == 1) Memory_byte0[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte0[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte0;
                               disable TWDXDOA_byte0;
                            NODELAYA0 = 1'b1;
                            DOA_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte0;
                               disable TWDXDOA_byte0;
                            NODELAYA0 = 1'b1;
                            DOA_byte0_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte1[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte1[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte1;
                               disable TWDXDOA_byte1;
                            NODELAYA1 = 1'b1;
                            DOA_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte1;
                               disable TWDXDOA_byte1;
                            NODELAYA1 = 1'b1;
                            DOA_byte1_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte2[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte2[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte2;
                               disable TWDXDOA_byte2;
                            NODELAYA2 = 1'b1;
                            DOA_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte2;
                               disable TWDXDOA_byte2;
                            NODELAYA2 = 1'b1;
                            DOA_byte2_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte3[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte3[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte3;
                               disable TWDXDOA_byte3;
                            NODELAYA3 = 1'b1;
                            DOA_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte3;
                               disable TWDXDOA_byte3;
                            NODELAYA3 = 1'b1;
                            DOA_byte3_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte4[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte4[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte4;
                               disable TWDXDOA_byte4;
                            NODELAYA4 = 1'b1;
                            DOA_byte4_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte4;
                               disable TWDXDOA_byte4;
                            NODELAYA4 = 1'b1;
                            DOA_byte4_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte5[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte5[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte5;
                               disable TWDXDOA_byte5;
                            NODELAYA5 = 1'b1;
                            DOA_byte5_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte5;
                               disable TWDXDOA_byte5;
                            NODELAYA5 = 1'b1;
                            DOA_byte5_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte6[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte6[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte6;
                               disable TWDXDOA_byte6;
                            NODELAYA6 = 1'b1;
                            DOA_byte6_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte6;
                               disable TWDXDOA_byte6;
                            NODELAYA6 = 1'b1;
                            DOA_byte6_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte7[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte7[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOA_byte7;
                               disable TWDXDOA_byte7;
                            NODELAYA7 = 1'b1;
                            DOA_byte7_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOA_byte7;
                               disable TWDXDOA_byte7;
                            NODELAYA7 = 1'b1;
                            DOA_byte7_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
         endcase
         LoopCount_Address=LoopCount_Address-1;
      end
    end
  endtask //end all_core_xA;

  task all_core_xB;
     input byte_num;
     input do_x;

     integer byte_num;
     integer do_x;
     integer LoopCount_Address;
     begin
       LoopCount_Address=Words-1;
       while(LoopCount_Address >=0) begin
          case (byte_num)
             0       : begin
                         if (do_x == 1) Memory_byte0[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte0[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte0;
                               disable TWDXDOB_byte0;
                            NODELAYB0 = 1'b1;
                            DOB_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte0;
                               disable TWDXDOB_byte0;
                            NODELAYB0 = 1'b1;
                            DOB_byte0_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             1       : begin
                         if (do_x == 1) Memory_byte1[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte1[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte1;
                               disable TWDXDOB_byte1;
                            NODELAYB1 = 1'b1;
                            DOB_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte1;
                               disable TWDXDOB_byte1;
                            NODELAYB1 = 1'b1;
                            DOB_byte1_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             2       : begin
                         if (do_x == 1) Memory_byte2[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte2[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte2;
                               disable TWDXDOB_byte2;
                            NODELAYB2 = 1'b1;
                            DOB_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte2;
                               disable TWDXDOB_byte2;
                            NODELAYB2 = 1'b1;
                            DOB_byte2_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             3       : begin
                         if (do_x == 1) Memory_byte3[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte3[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte3;
                               disable TWDXDOB_byte3;
                            NODELAYB3 = 1'b1;
                            DOB_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte3;
                               disable TWDXDOB_byte3;
                            NODELAYB3 = 1'b1;
                            DOB_byte3_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             4       : begin
                         if (do_x == 1) Memory_byte4[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte4[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte4;
                               disable TWDXDOB_byte4;
                            NODELAYB4 = 1'b1;
                            DOB_byte4_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte4;
                               disable TWDXDOB_byte4;
                            NODELAYB4 = 1'b1;
                            DOB_byte4_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             5       : begin
                         if (do_x == 1) Memory_byte5[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte5[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte5;
                               disable TWDXDOB_byte5;
                            NODELAYB5 = 1'b1;
                            DOB_byte5_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte5;
                               disable TWDXDOB_byte5;
                            NODELAYB5 = 1'b1;
                            DOB_byte5_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             6       : begin
                         if (do_x == 1) Memory_byte6[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte6[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte6;
                               disable TWDXDOB_byte6;
                            NODELAYB6 = 1'b1;
                            DOB_byte6_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte6;
                               disable TWDXDOB_byte6;
                            NODELAYB6 = 1'b1;
                            DOB_byte6_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             7       : begin
                         if (do_x == 1) Memory_byte7[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte7[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte7;
                               disable TWDXDOB_byte7;
                            NODELAYB7 = 1'b1;
                            DOB_byte7_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte7;
                               disable TWDXDOB_byte7;
                            NODELAYB7 = 1'b1;
                            DOB_byte7_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             default : begin
                         if (do_x == 1) Memory_byte0[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte0[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte0;
                               disable TWDXDOB_byte0;
                            NODELAYB0 = 1'b1;
                            DOB_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte0;
                               disable TWDXDOB_byte0;
                            NODELAYB0 = 1'b1;
                            DOB_byte0_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte1[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte1[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte1;
                               disable TWDXDOB_byte1;
                            NODELAYB1 = 1'b1;
                            DOB_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte1;
                               disable TWDXDOB_byte1;
                            NODELAYB1 = 1'b1;
                            DOB_byte1_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte2[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte2[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte2;
                               disable TWDXDOB_byte2;
                            NODELAYB2 = 1'b1;
                            DOB_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte2;
                               disable TWDXDOB_byte2;
                            NODELAYB2 = 1'b1;
                            DOB_byte2_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte3[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte3[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte3;
                               disable TWDXDOB_byte3;
                            NODELAYB3 = 1'b1;
                            DOB_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte3;
                               disable TWDXDOB_byte3;
                            NODELAYB3 = 1'b1;
                            DOB_byte3_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte4[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte4[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte4;
                               disable TWDXDOB_byte4;
                            NODELAYB4 = 1'b1;
                            DOB_byte4_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte4;
                               disable TWDXDOB_byte4;
                            NODELAYB4 = 1'b1;
                            DOB_byte4_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte5[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte5[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte5;
                               disable TWDXDOB_byte5;
                            NODELAYB5 = 1'b1;
                            DOB_byte5_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte5;
                               disable TWDXDOB_byte5;
                            NODELAYB5 = 1'b1;
                            DOB_byte5_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte6[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte6[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte6;
                               disable TWDXDOB_byte6;
                            NODELAYB6 = 1'b1;
                            DOB_byte6_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte6;
                               disable TWDXDOB_byte6;
                            NODELAYB6 = 1'b1;
                            DOB_byte6_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte7[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte7[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDOB_byte7;
                               disable TWDXDOB_byte7;
                            NODELAYB7 = 1'b1;
                            DOB_byte7_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDOB_byte7;
                               disable TWDXDOB_byte7;
                            NODELAYB7 = 1'b1;
                            DOB_byte7_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
         endcase
         LoopCount_Address=LoopCount_Address-1;
      end
    end
  endtask //end all_core_xB;



  task A_monitor;
     begin
       if (^(A_) !== 1'bX) begin
          flag_A_x = `FALSE;
       end
       else begin
          if (flag_A_x == `FALSE) begin
              flag_A_x = `TRUE;
`ifdef NO_MEM_MSG
`else
              ErrorMessage(2);
`endif
          end
       end
     end
  endtask //end A_monitor;

  task B_monitor;
     begin
       if (^(B_) !== 1'bX) begin
          flag_B_x = `FALSE;
       end
       else begin
          if (flag_B_x == `FALSE) begin
              flag_B_x = `TRUE;
`ifdef NO_MEM_MSG
`else
              ErrorMessage(2);
`endif
          end
       end
     end
  endtask //end B_monitor;

  task CSA_monitor;
     begin
       if (^(CSA_) !== 1'bX) begin
          flag_CSA_x = `FALSE;
       end
       else begin
          if (flag_CSA_x == `FALSE) begin
              flag_CSA_x = `TRUE;
`ifdef NO_MEM_MSG
`else
              ErrorMessage(3);
`endif
          end
       end
     end
  endtask //end CSA_monitor;

  task CSB_monitor;
     begin
       if (^(CSB_) !== 1'bX) begin
          flag_CSB_x = `FALSE;
       end
       else begin
          if (flag_CSB_x == `FALSE) begin
              flag_CSB_x = `TRUE;
`ifdef NO_MEM_MSG
`else
              ErrorMessage(3);
`endif
          end
       end
     end
  endtask //end CSB_monitor;

`ifdef TRC_CHECK
  task trc_timing_monitorA;
       integer trc1;
       integer trc2;
       integer trc_check;
     begin
       if (trc1 != 0) begin
         trc2 = trc1;
       end else begin
         trc2 = 0;
       end
         trc1 = $time;
	 trc_check = trc1 - trc2;
       if (trc_check < TRC_PERIOD) begin
          if (CSA_ !== 1'b0) begin
             if (WEAN0_ !== 1'b1) begin
                all_core_xA(0,1);
             end
             else begin
                #0 disable TOHDOA_byte0;
                      disable TWDXDOA_byte0;
                NODELAYA0 = 1'b1;
                DOA_byte0_i = {Bits{1'bX}};
             end
             if (WEAN1_ !== 1'b1) begin
                all_core_xA(1,1);
             end
             else begin
                #0 disable TOHDOA_byte1;
                      disable TWDXDOA_byte1;
                NODELAYA1 = 1'b1;
                DOA_byte1_i = {Bits{1'bX}};
             end
             if (WEAN2_ !== 1'b1) begin
                all_core_xA(2,1);
             end
             else begin
                #0 disable TOHDOA_byte2;
                      disable TWDXDOA_byte2;
                NODELAYA2 = 1'b1;
                DOA_byte2_i = {Bits{1'bX}};
             end
             if (WEAN3_ !== 1'b1) begin
                all_core_xA(3,1);
             end
             else begin
                #0 disable TOHDOA_byte3;
                      disable TWDXDOA_byte3;
                NODELAYA3 = 1'b1;
                DOA_byte3_i = {Bits{1'bX}};
             end
             if (WEAN4_ !== 1'b1) begin
                all_core_xA(4,1);
             end
             else begin
                #0 disable TOHDOA_byte4;
                      disable TWDXDOA_byte4;
                NODELAYA4 = 1'b1;
                DOA_byte4_i = {Bits{1'bX}};
             end
             if (WEAN5_ !== 1'b1) begin
                all_core_xA(5,1);
             end
             else begin
                #0 disable TOHDOA_byte5;
                      disable TWDXDOA_byte5;
                NODELAYA5 = 1'b1;
                DOA_byte5_i = {Bits{1'bX}};
             end
             if (WEAN6_ !== 1'b1) begin
                all_core_xA(6,1);
             end
             else begin
                #0 disable TOHDOA_byte6;
                      disable TWDXDOA_byte6;
                NODELAYA6 = 1'b1;
                DOA_byte6_i = {Bits{1'bX}};
             end
             if (WEAN7_ !== 1'b1) begin
                all_core_xA(7,1);
             end
             else begin
                #0 disable TOHDOA_byte7;
                      disable TWDXDOA_byte7;
                NODELAYA7 = 1'b1;
                DOA_byte7_i = {Bits{1'bX}};
             end
          end
       end
     end
  endtask //end trc_timing_monitorA;

  task trc_timing_monitorB;
       integer trc1;
       integer trc2;
       integer trc_check;
     begin
       if (trc1 != 0) begin
         trc2 = trc1;
       end else begin
         trc2 = 0;
       end
         trc1 = $time;
	       trc_check = trc1 - trc2;
       if (trc_check < TRC_PERIOD) begin
          if (CSB_ !== 1'b0) begin
             if (WEBN0_ !== 1'b1) begin
                all_core_xB(0,1);
             end
             else begin
                #0 disable TOHDOB_byte0;
                   disable TWDXDOB_byte0;
                NODELAYB0 = 1'b1;
                DOB_byte0_i = {Bits{1'bX}};
             end
             if (WEBN1_ !== 1'b1) begin
                all_core_xB(1,1);
             end
             else begin
                #0 disable TOHDOB_byte1;
                   disable TWDXDOB_byte1;
                NODELAYB1 = 1'b1;
                DOB_byte1_i = {Bits{1'bX}};
             end
             if (WEBN2_ !== 1'b1) begin
                all_core_xB(2,1);
             end
             else begin
                #0 disable TOHDOB_byte2;
                   disable TWDXDOB_byte2;
                NODELAYB2 = 1'b1;
                DOB_byte2_i = {Bits{1'bX}};
             end
             if (WEBN3_ !== 1'b1) begin
                all_core_xB(3,1);
             end
             else begin
                #0 disable TOHDOB_byte3;
                   disable TWDXDOB_byte3;
                NODELAYB3 = 1'b1;
                DOB_byte3_i = {Bits{1'bX}};
             end
             if (WEBN4_ !== 1'b1) begin
                all_core_xB(4,1);
             end
             else begin
                #0 disable TOHDOB_byte4;
                   disable TWDXDOB_byte4;
                NODELAYB4 = 1'b1;
                DOB_byte4_i = {Bits{1'bX}};
             end
             if (WEBN5_ !== 1'b1) begin
                all_core_xB(5,1);
             end
             else begin
                #0 disable TOHDOB_byte5;
                   disable TWDXDOB_byte5;
                NODELAYB5 = 1'b1;
                DOB_byte5_i = {Bits{1'bX}};
             end
             if (WEBN6_ !== 1'b1) begin
                all_core_xB(6,1);
             end
             else begin
                #0 disable TOHDOB_byte6;
                   disable TWDXDOB_byte6;
                NODELAYB6 = 1'b1;
                DOB_byte6_i = {Bits{1'bX}};
             end
             if (WEBN7_ !== 1'b1) begin
                all_core_xB(7,1);
             end
             else begin
                #0 disable TOHDOB_byte7;
                   disable TWDXDOB_byte7;
                NODELAYB7 = 1'b1;
                DOB_byte7_i = {Bits{1'bX}};
             end
          end
       end
     end
  endtask //end trc_timing_monitorB;
`else
`endif

  task ErrorMessage;
     input error_type;
     integer error_type;

     begin
       case (error_type)
         0: $display("** MEM_Error: Abnormal transition occurred (%t) in Clock of %m",$time);
         1: $display("** MEM_Warning: Read and Write the same Address, DO is unknown (%t) in clock of %m",$time);
         2: $display("** MEM_Error: Unknown value occurred (%t) in Address of %m",$time);
         3: $display("** MEM_Error: Unknown value occurred (%t) in ChipSelect of %m",$time);
         4: $display("** MEM_Error: Port A and B write the same Address, core is unknown (%t) in clock of %m",$time);
         5: $display("** MEM_Error: Clear all memory core to unknown (%t) in clock of %m",$time);
         6: $display("** MEM_Error: NAP turn off, CSB must operate in the TNAP_CSH later %m",$time);
         7: $display("** MEM_Error: CSB negedge trigger, NAP be operated high, so DO keep data, all memory core keep data %m",$time);
         8: $display("** MEM_Error: NAP is unknow or high-z, DO keep data, all memory core keep data %m",$time);
         9: $display("** MEM_Error: DVS or DVSE appear unknown state (%t) in clock of %m",$time);
        10: $display("** MEM_Error: DVSA or DVSEA appear unknown state (%t) in clock of %m",$time);
        11: $display("** MEM_Error: DVSB or DVSEB appear unknown state (%t) in clock of %m",$time);
        13: $display("** MEM_Error: DVS doesn't operate the status (%t) in clock of %m",$time);
       endcase
     end
  endtask

  function AddressRangeCheck;
      input  [AddressSize-1:0] AddressItem;
      reg    UnaryResult;
      begin
        UnaryResult = ^AddressItem;
        if(UnaryResult!==1'bX) begin
           if (AddressItem >= Words) begin
              $display("** MEM_Error: Out of range occurred (%t) in Address of %m",$time);
              AddressRangeCheck = `FALSE;
           end else begin
              AddressRangeCheck = `TRUE;
           end
        end
        else begin
           AddressRangeCheck = `FALSE;
        end
      end
  endfunction //end AddressRangeCheck;

   specify
      specparam TAA    = (223.7:374.2:760.6);
      specparam TAA_1  = (264.9:449.4:926.8);
      specparam TAA_2  = (223.7:374.2:760.6);
      specparam TAA_3  = (202.5:335.4:675.2);
      specparam TWDV    = (150.4:369.6:627.2);
      specparam TWDV_1  = (150.4:392.7:626.2);
      specparam TWDV_2  = (150.4:369.6:627.2);
      specparam TWDV_3  = (150.4:331.6:628.0);
      specparam TRC  = (233.5:394.3:798.8);
      specparam TRC_1    = (276.3:470.1:965.8);
      specparam TRC_2    = (233.5:394.3:798.8);
      specparam TRC_3    = (211.6:355.7:713.7);
      specparam THPW = (23.1:32.3:45.1);
      specparam TLPW = (31.5:52.3:81.9);
      specparam TAS  = (12.5:23.2:41.9);
      specparam TAH  = (14.7:20.3:28.4);
      specparam TWS  = (16.4:26.8:43.5);
      specparam TWH  = (3.6:3.5:6.1);
      specparam TDS  = (3.2:6.9:15.1);
      specparam TDH  = (17.2:21.9:29.7);
      specparam TCSS = (23.3:39.7:65.2);
      specparam TCSH = (26.1:33.0:48.1);
      specparam TNAPH  = (16.9:30.9:53.5);
      specparam TNAP_CSH  = (143.9:234.6:356.6);
      specparam TDVSES  = (12.5:23.2:41.9);
      specparam TDVSEH  = (213.3:359.3:727.9);
      specparam TDVSS   = (12.5:23.2:41.9);
      specparam TDVSH   = (213.3:359.3:727.9);
      specparam TCR2W   = (0:0:0);


      $setuphold ( posedge CKA &&& con_A,         posedge A0, TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CKA &&& con_A,         negedge A0, TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CKA &&& con_A,         posedge A1, TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CKA &&& con_A,         negedge A1, TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CKA &&& con_A,         posedge A2, TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CKA &&& con_A,         negedge A2, TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CKA &&& con_A,         posedge A3, TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CKA &&& con_A,         negedge A3, TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CKA &&& con_A,         posedge A4, TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CKA &&& con_A,         negedge A4, TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CKA &&& con_A,         posedge A5, TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CKA &&& con_A,         negedge A5, TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CKA &&& con_A,         posedge A6, TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CKA &&& con_A,         negedge A6, TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CKA &&& con_A,         posedge A7, TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CKA &&& con_A,         negedge A7, TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CKA &&& con_A,         posedge A8, TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CKA &&& con_A,         negedge A8, TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CKA &&& con_A,         posedge A9, TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CKA &&& con_A,         negedge A9, TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CKA &&& con_A,         posedge A10, TAS,     TAH,     n_flag_A10     );
      $setuphold ( posedge CKA &&& con_A,         negedge A10, TAS,     TAH,     n_flag_A10     );
      $setuphold ( posedge CKA &&& con_A,         posedge A11, TAS,     TAH,     n_flag_A11     );
      $setuphold ( posedge CKA &&& con_A,         negedge A11, TAS,     TAH,     n_flag_A11     );
      $setuphold ( posedge CKA &&& con_A,         posedge A12, TAS,     TAH,     n_flag_A12     );
      $setuphold ( posedge CKA &&& con_A,         negedge A12, TAS,     TAH,     n_flag_A12     );
      $setuphold ( posedge CKB &&& con_B,         posedge B0, TAS,     TAH,     n_flag_B0      );
      $setuphold ( posedge CKB &&& con_B,         negedge B0, TAS,     TAH,     n_flag_B0      );
      $setuphold ( posedge CKB &&& con_B,         posedge B1, TAS,     TAH,     n_flag_B1      );
      $setuphold ( posedge CKB &&& con_B,         negedge B1, TAS,     TAH,     n_flag_B1      );
      $setuphold ( posedge CKB &&& con_B,         posedge B2, TAS,     TAH,     n_flag_B2      );
      $setuphold ( posedge CKB &&& con_B,         negedge B2, TAS,     TAH,     n_flag_B2      );
      $setuphold ( posedge CKB &&& con_B,         posedge B3, TAS,     TAH,     n_flag_B3      );
      $setuphold ( posedge CKB &&& con_B,         negedge B3, TAS,     TAH,     n_flag_B3      );
      $setuphold ( posedge CKB &&& con_B,         posedge B4, TAS,     TAH,     n_flag_B4      );
      $setuphold ( posedge CKB &&& con_B,         negedge B4, TAS,     TAH,     n_flag_B4      );
      $setuphold ( posedge CKB &&& con_B,         posedge B5, TAS,     TAH,     n_flag_B5      );
      $setuphold ( posedge CKB &&& con_B,         negedge B5, TAS,     TAH,     n_flag_B5      );
      $setuphold ( posedge CKB &&& con_B,         posedge B6, TAS,     TAH,     n_flag_B6      );
      $setuphold ( posedge CKB &&& con_B,         negedge B6, TAS,     TAH,     n_flag_B6      );
      $setuphold ( posedge CKB &&& con_B,         posedge B7, TAS,     TAH,     n_flag_B7      );
      $setuphold ( posedge CKB &&& con_B,         negedge B7, TAS,     TAH,     n_flag_B7      );
      $setuphold ( posedge CKB &&& con_B,         posedge B8, TAS,     TAH,     n_flag_B8      );
      $setuphold ( posedge CKB &&& con_B,         negedge B8, TAS,     TAH,     n_flag_B8      );
      $setuphold ( posedge CKB &&& con_B,         posedge B9, TAS,     TAH,     n_flag_B9      );
      $setuphold ( posedge CKB &&& con_B,         negedge B9, TAS,     TAH,     n_flag_B9      );
      $setuphold ( posedge CKB &&& con_B,         posedge B10, TAS,     TAH,     n_flag_B10     );
      $setuphold ( posedge CKB &&& con_B,         negedge B10, TAS,     TAH,     n_flag_B10     );
      $setuphold ( posedge CKB &&& con_B,         posedge B11, TAS,     TAH,     n_flag_B11     );
      $setuphold ( posedge CKB &&& con_B,         negedge B11, TAS,     TAH,     n_flag_B11     );
      $setuphold ( posedge CKB &&& con_B,         posedge B12, TAS,     TAH,     n_flag_B12     );
      $setuphold ( posedge CKB &&& con_B,         negedge B12, TAS,     TAH,     n_flag_B12     );

      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA0, TDS,     TDH,     n_flag_DIA0    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA0, TDS,     TDH,     n_flag_DIA0    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB0, TDS,     TDH,     n_flag_DIB0    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB0, TDS,     TDH,     n_flag_DIB0    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA1, TDS,     TDH,     n_flag_DIA1    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA1, TDS,     TDH,     n_flag_DIA1    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB1, TDS,     TDH,     n_flag_DIB1    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB1, TDS,     TDH,     n_flag_DIB1    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA2, TDS,     TDH,     n_flag_DIA2    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA2, TDS,     TDH,     n_flag_DIA2    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB2, TDS,     TDH,     n_flag_DIB2    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB2, TDS,     TDH,     n_flag_DIB2    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA3, TDS,     TDH,     n_flag_DIA3    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA3, TDS,     TDH,     n_flag_DIA3    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB3, TDS,     TDH,     n_flag_DIB3    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB3, TDS,     TDH,     n_flag_DIB3    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA4, TDS,     TDH,     n_flag_DIA4    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA4, TDS,     TDH,     n_flag_DIA4    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB4, TDS,     TDH,     n_flag_DIB4    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB4, TDS,     TDH,     n_flag_DIB4    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA5, TDS,     TDH,     n_flag_DIA5    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA5, TDS,     TDH,     n_flag_DIA5    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB5, TDS,     TDH,     n_flag_DIB5    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB5, TDS,     TDH,     n_flag_DIB5    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA6, TDS,     TDH,     n_flag_DIA6    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA6, TDS,     TDH,     n_flag_DIA6    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB6, TDS,     TDH,     n_flag_DIB6    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB6, TDS,     TDH,     n_flag_DIB6    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, posedge DIA7, TDS,     TDH,     n_flag_DIA7    );
      $setuphold ( posedge CKA &&& con_DIA_byte0, negedge DIA7, TDS,     TDH,     n_flag_DIA7    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, posedge DIB7, TDS,     TDH,     n_flag_DIB7    );
      $setuphold ( posedge CKB &&& con_DIB_byte0, negedge DIB7, TDS,     TDH,     n_flag_DIB7    );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA8, TDS,     TDH,     n_flag_DIA8    );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA8, TDS,     TDH,     n_flag_DIA8    );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB8, TDS,     TDH,     n_flag_DIB8    );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB8, TDS,     TDH,     n_flag_DIB8    );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA9, TDS,     TDH,     n_flag_DIA9    );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA9, TDS,     TDH,     n_flag_DIA9    );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB9, TDS,     TDH,     n_flag_DIB9    );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB9, TDS,     TDH,     n_flag_DIB9    );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA10, TDS,     TDH,     n_flag_DIA10   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA10, TDS,     TDH,     n_flag_DIA10   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB10, TDS,     TDH,     n_flag_DIB10   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB10, TDS,     TDH,     n_flag_DIB10   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA11, TDS,     TDH,     n_flag_DIA11   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA11, TDS,     TDH,     n_flag_DIA11   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB11, TDS,     TDH,     n_flag_DIB11   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB11, TDS,     TDH,     n_flag_DIB11   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA12, TDS,     TDH,     n_flag_DIA12   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA12, TDS,     TDH,     n_flag_DIA12   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB12, TDS,     TDH,     n_flag_DIB12   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB12, TDS,     TDH,     n_flag_DIB12   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA13, TDS,     TDH,     n_flag_DIA13   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA13, TDS,     TDH,     n_flag_DIA13   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB13, TDS,     TDH,     n_flag_DIB13   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB13, TDS,     TDH,     n_flag_DIB13   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA14, TDS,     TDH,     n_flag_DIA14   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA14, TDS,     TDH,     n_flag_DIA14   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB14, TDS,     TDH,     n_flag_DIB14   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB14, TDS,     TDH,     n_flag_DIB14   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, posedge DIA15, TDS,     TDH,     n_flag_DIA15   );
      $setuphold ( posedge CKA &&& con_DIA_byte1, negedge DIA15, TDS,     TDH,     n_flag_DIA15   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, posedge DIB15, TDS,     TDH,     n_flag_DIB15   );
      $setuphold ( posedge CKB &&& con_DIB_byte1, negedge DIB15, TDS,     TDH,     n_flag_DIB15   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA16, TDS,     TDH,     n_flag_DIA16   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA16, TDS,     TDH,     n_flag_DIA16   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB16, TDS,     TDH,     n_flag_DIB16   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB16, TDS,     TDH,     n_flag_DIB16   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA17, TDS,     TDH,     n_flag_DIA17   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA17, TDS,     TDH,     n_flag_DIA17   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB17, TDS,     TDH,     n_flag_DIB17   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB17, TDS,     TDH,     n_flag_DIB17   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA18, TDS,     TDH,     n_flag_DIA18   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA18, TDS,     TDH,     n_flag_DIA18   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB18, TDS,     TDH,     n_flag_DIB18   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB18, TDS,     TDH,     n_flag_DIB18   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA19, TDS,     TDH,     n_flag_DIA19   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA19, TDS,     TDH,     n_flag_DIA19   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB19, TDS,     TDH,     n_flag_DIB19   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB19, TDS,     TDH,     n_flag_DIB19   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA20, TDS,     TDH,     n_flag_DIA20   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA20, TDS,     TDH,     n_flag_DIA20   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB20, TDS,     TDH,     n_flag_DIB20   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB20, TDS,     TDH,     n_flag_DIB20   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA21, TDS,     TDH,     n_flag_DIA21   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA21, TDS,     TDH,     n_flag_DIA21   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB21, TDS,     TDH,     n_flag_DIB21   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB21, TDS,     TDH,     n_flag_DIB21   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA22, TDS,     TDH,     n_flag_DIA22   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA22, TDS,     TDH,     n_flag_DIA22   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB22, TDS,     TDH,     n_flag_DIB22   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB22, TDS,     TDH,     n_flag_DIB22   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, posedge DIA23, TDS,     TDH,     n_flag_DIA23   );
      $setuphold ( posedge CKA &&& con_DIA_byte2, negedge DIA23, TDS,     TDH,     n_flag_DIA23   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, posedge DIB23, TDS,     TDH,     n_flag_DIB23   );
      $setuphold ( posedge CKB &&& con_DIB_byte2, negedge DIB23, TDS,     TDH,     n_flag_DIB23   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA24, TDS,     TDH,     n_flag_DIA24   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA24, TDS,     TDH,     n_flag_DIA24   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB24, TDS,     TDH,     n_flag_DIB24   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB24, TDS,     TDH,     n_flag_DIB24   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA25, TDS,     TDH,     n_flag_DIA25   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA25, TDS,     TDH,     n_flag_DIA25   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB25, TDS,     TDH,     n_flag_DIB25   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB25, TDS,     TDH,     n_flag_DIB25   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA26, TDS,     TDH,     n_flag_DIA26   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA26, TDS,     TDH,     n_flag_DIA26   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB26, TDS,     TDH,     n_flag_DIB26   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB26, TDS,     TDH,     n_flag_DIB26   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA27, TDS,     TDH,     n_flag_DIA27   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA27, TDS,     TDH,     n_flag_DIA27   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB27, TDS,     TDH,     n_flag_DIB27   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB27, TDS,     TDH,     n_flag_DIB27   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA28, TDS,     TDH,     n_flag_DIA28   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA28, TDS,     TDH,     n_flag_DIA28   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB28, TDS,     TDH,     n_flag_DIB28   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB28, TDS,     TDH,     n_flag_DIB28   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA29, TDS,     TDH,     n_flag_DIA29   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA29, TDS,     TDH,     n_flag_DIA29   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB29, TDS,     TDH,     n_flag_DIB29   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB29, TDS,     TDH,     n_flag_DIB29   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA30, TDS,     TDH,     n_flag_DIA30   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA30, TDS,     TDH,     n_flag_DIA30   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB30, TDS,     TDH,     n_flag_DIB30   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB30, TDS,     TDH,     n_flag_DIB30   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, posedge DIA31, TDS,     TDH,     n_flag_DIA31   );
      $setuphold ( posedge CKA &&& con_DIA_byte3, negedge DIA31, TDS,     TDH,     n_flag_DIA31   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, posedge DIB31, TDS,     TDH,     n_flag_DIB31   );
      $setuphold ( posedge CKB &&& con_DIB_byte3, negedge DIB31, TDS,     TDH,     n_flag_DIB31   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA32, TDS,     TDH,     n_flag_DIA32   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA32, TDS,     TDH,     n_flag_DIA32   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB32, TDS,     TDH,     n_flag_DIB32   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB32, TDS,     TDH,     n_flag_DIB32   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA33, TDS,     TDH,     n_flag_DIA33   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA33, TDS,     TDH,     n_flag_DIA33   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB33, TDS,     TDH,     n_flag_DIB33   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB33, TDS,     TDH,     n_flag_DIB33   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA34, TDS,     TDH,     n_flag_DIA34   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA34, TDS,     TDH,     n_flag_DIA34   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB34, TDS,     TDH,     n_flag_DIB34   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB34, TDS,     TDH,     n_flag_DIB34   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA35, TDS,     TDH,     n_flag_DIA35   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA35, TDS,     TDH,     n_flag_DIA35   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB35, TDS,     TDH,     n_flag_DIB35   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB35, TDS,     TDH,     n_flag_DIB35   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA36, TDS,     TDH,     n_flag_DIA36   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA36, TDS,     TDH,     n_flag_DIA36   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB36, TDS,     TDH,     n_flag_DIB36   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB36, TDS,     TDH,     n_flag_DIB36   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA37, TDS,     TDH,     n_flag_DIA37   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA37, TDS,     TDH,     n_flag_DIA37   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB37, TDS,     TDH,     n_flag_DIB37   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB37, TDS,     TDH,     n_flag_DIB37   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA38, TDS,     TDH,     n_flag_DIA38   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA38, TDS,     TDH,     n_flag_DIA38   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB38, TDS,     TDH,     n_flag_DIB38   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB38, TDS,     TDH,     n_flag_DIB38   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, posedge DIA39, TDS,     TDH,     n_flag_DIA39   );
      $setuphold ( posedge CKA &&& con_DIA_byte4, negedge DIA39, TDS,     TDH,     n_flag_DIA39   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, posedge DIB39, TDS,     TDH,     n_flag_DIB39   );
      $setuphold ( posedge CKB &&& con_DIB_byte4, negedge DIB39, TDS,     TDH,     n_flag_DIB39   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA40, TDS,     TDH,     n_flag_DIA40   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA40, TDS,     TDH,     n_flag_DIA40   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB40, TDS,     TDH,     n_flag_DIB40   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB40, TDS,     TDH,     n_flag_DIB40   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA41, TDS,     TDH,     n_flag_DIA41   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA41, TDS,     TDH,     n_flag_DIA41   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB41, TDS,     TDH,     n_flag_DIB41   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB41, TDS,     TDH,     n_flag_DIB41   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA42, TDS,     TDH,     n_flag_DIA42   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA42, TDS,     TDH,     n_flag_DIA42   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB42, TDS,     TDH,     n_flag_DIB42   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB42, TDS,     TDH,     n_flag_DIB42   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA43, TDS,     TDH,     n_flag_DIA43   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA43, TDS,     TDH,     n_flag_DIA43   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB43, TDS,     TDH,     n_flag_DIB43   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB43, TDS,     TDH,     n_flag_DIB43   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA44, TDS,     TDH,     n_flag_DIA44   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA44, TDS,     TDH,     n_flag_DIA44   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB44, TDS,     TDH,     n_flag_DIB44   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB44, TDS,     TDH,     n_flag_DIB44   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA45, TDS,     TDH,     n_flag_DIA45   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA45, TDS,     TDH,     n_flag_DIA45   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB45, TDS,     TDH,     n_flag_DIB45   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB45, TDS,     TDH,     n_flag_DIB45   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA46, TDS,     TDH,     n_flag_DIA46   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA46, TDS,     TDH,     n_flag_DIA46   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB46, TDS,     TDH,     n_flag_DIB46   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB46, TDS,     TDH,     n_flag_DIB46   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, posedge DIA47, TDS,     TDH,     n_flag_DIA47   );
      $setuphold ( posedge CKA &&& con_DIA_byte5, negedge DIA47, TDS,     TDH,     n_flag_DIA47   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, posedge DIB47, TDS,     TDH,     n_flag_DIB47   );
      $setuphold ( posedge CKB &&& con_DIB_byte5, negedge DIB47, TDS,     TDH,     n_flag_DIB47   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA48, TDS,     TDH,     n_flag_DIA48   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA48, TDS,     TDH,     n_flag_DIA48   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB48, TDS,     TDH,     n_flag_DIB48   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB48, TDS,     TDH,     n_flag_DIB48   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA49, TDS,     TDH,     n_flag_DIA49   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA49, TDS,     TDH,     n_flag_DIA49   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB49, TDS,     TDH,     n_flag_DIB49   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB49, TDS,     TDH,     n_flag_DIB49   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA50, TDS,     TDH,     n_flag_DIA50   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA50, TDS,     TDH,     n_flag_DIA50   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB50, TDS,     TDH,     n_flag_DIB50   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB50, TDS,     TDH,     n_flag_DIB50   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA51, TDS,     TDH,     n_flag_DIA51   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA51, TDS,     TDH,     n_flag_DIA51   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB51, TDS,     TDH,     n_flag_DIB51   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB51, TDS,     TDH,     n_flag_DIB51   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA52, TDS,     TDH,     n_flag_DIA52   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA52, TDS,     TDH,     n_flag_DIA52   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB52, TDS,     TDH,     n_flag_DIB52   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB52, TDS,     TDH,     n_flag_DIB52   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA53, TDS,     TDH,     n_flag_DIA53   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA53, TDS,     TDH,     n_flag_DIA53   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB53, TDS,     TDH,     n_flag_DIB53   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB53, TDS,     TDH,     n_flag_DIB53   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA54, TDS,     TDH,     n_flag_DIA54   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA54, TDS,     TDH,     n_flag_DIA54   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB54, TDS,     TDH,     n_flag_DIB54   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB54, TDS,     TDH,     n_flag_DIB54   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, posedge DIA55, TDS,     TDH,     n_flag_DIA55   );
      $setuphold ( posedge CKA &&& con_DIA_byte6, negedge DIA55, TDS,     TDH,     n_flag_DIA55   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, posedge DIB55, TDS,     TDH,     n_flag_DIB55   );
      $setuphold ( posedge CKB &&& con_DIB_byte6, negedge DIB55, TDS,     TDH,     n_flag_DIB55   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA56, TDS,     TDH,     n_flag_DIA56   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA56, TDS,     TDH,     n_flag_DIA56   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB56, TDS,     TDH,     n_flag_DIB56   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB56, TDS,     TDH,     n_flag_DIB56   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA57, TDS,     TDH,     n_flag_DIA57   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA57, TDS,     TDH,     n_flag_DIA57   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB57, TDS,     TDH,     n_flag_DIB57   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB57, TDS,     TDH,     n_flag_DIB57   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA58, TDS,     TDH,     n_flag_DIA58   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA58, TDS,     TDH,     n_flag_DIA58   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB58, TDS,     TDH,     n_flag_DIB58   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB58, TDS,     TDH,     n_flag_DIB58   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA59, TDS,     TDH,     n_flag_DIA59   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA59, TDS,     TDH,     n_flag_DIA59   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB59, TDS,     TDH,     n_flag_DIB59   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB59, TDS,     TDH,     n_flag_DIB59   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA60, TDS,     TDH,     n_flag_DIA60   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA60, TDS,     TDH,     n_flag_DIA60   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB60, TDS,     TDH,     n_flag_DIB60   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB60, TDS,     TDH,     n_flag_DIB60   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA61, TDS,     TDH,     n_flag_DIA61   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA61, TDS,     TDH,     n_flag_DIA61   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB61, TDS,     TDH,     n_flag_DIB61   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB61, TDS,     TDH,     n_flag_DIB61   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA62, TDS,     TDH,     n_flag_DIA62   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA62, TDS,     TDH,     n_flag_DIA62   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB62, TDS,     TDH,     n_flag_DIB62   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB62, TDS,     TDH,     n_flag_DIB62   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, posedge DIA63, TDS,     TDH,     n_flag_DIA63   );
      $setuphold ( posedge CKA &&& con_DIA_byte7, negedge DIA63, TDS,     TDH,     n_flag_DIA63   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, posedge DIB63, TDS,     TDH,     n_flag_DIB63   );
      $setuphold ( posedge CKB &&& con_DIB_byte7, negedge DIB63, TDS,     TDH,     n_flag_DIB63   );

      $setuphold ( posedge CKA &&& con_WEAN0,     posedge WEAN0, TWS,     TWH,     n_flag_WEAN0   );
      $setuphold ( posedge CKA &&& con_WEAN0,     negedge WEAN0, TWS,     TWH,     n_flag_WEAN0   );
      $setuphold ( posedge CKA &&& con_WEAN1,     posedge WEAN1, TWS,     TWH,     n_flag_WEAN1   );
      $setuphold ( posedge CKA &&& con_WEAN1,     negedge WEAN1, TWS,     TWH,     n_flag_WEAN1   );
      $setuphold ( posedge CKA &&& con_WEAN2,     posedge WEAN2, TWS,     TWH,     n_flag_WEAN2   );
      $setuphold ( posedge CKA &&& con_WEAN2,     negedge WEAN2, TWS,     TWH,     n_flag_WEAN2   );
      $setuphold ( posedge CKA &&& con_WEAN3,     posedge WEAN3, TWS,     TWH,     n_flag_WEAN3   );
      $setuphold ( posedge CKA &&& con_WEAN3,     negedge WEAN3, TWS,     TWH,     n_flag_WEAN3   );
      $setuphold ( posedge CKA &&& con_WEAN4,     posedge WEAN4, TWS,     TWH,     n_flag_WEAN4   );
      $setuphold ( posedge CKA &&& con_WEAN4,     negedge WEAN4, TWS,     TWH,     n_flag_WEAN4   );
      $setuphold ( posedge CKA &&& con_WEAN5,     posedge WEAN5, TWS,     TWH,     n_flag_WEAN5   );
      $setuphold ( posedge CKA &&& con_WEAN5,     negedge WEAN5, TWS,     TWH,     n_flag_WEAN5   );
      $setuphold ( posedge CKA &&& con_WEAN6,     posedge WEAN6, TWS,     TWH,     n_flag_WEAN6   );
      $setuphold ( posedge CKA &&& con_WEAN6,     negedge WEAN6, TWS,     TWH,     n_flag_WEAN6   );
      $setuphold ( posedge CKA &&& con_WEAN7,     posedge WEAN7, TWS,     TWH,     n_flag_WEAN7   );
      $setuphold ( posedge CKA &&& con_WEAN7,     negedge WEAN7, TWS,     TWH,     n_flag_WEAN7   );
      $setuphold ( posedge CKB &&& con_WEBN0,     posedge WEBN0, TWS,     TWH,     n_flag_WEBN0   );
      $setuphold ( posedge CKB &&& con_WEBN0,     negedge WEBN0, TWS,     TWH,     n_flag_WEBN0   );
      $setuphold ( posedge CKB &&& con_WEBN1,     posedge WEBN1, TWS,     TWH,     n_flag_WEBN1   );
      $setuphold ( posedge CKB &&& con_WEBN1,     negedge WEBN1, TWS,     TWH,     n_flag_WEBN1   );
      $setuphold ( posedge CKB &&& con_WEBN2,     posedge WEBN2, TWS,     TWH,     n_flag_WEBN2   );
      $setuphold ( posedge CKB &&& con_WEBN2,     negedge WEBN2, TWS,     TWH,     n_flag_WEBN2   );
      $setuphold ( posedge CKB &&& con_WEBN3,     posedge WEBN3, TWS,     TWH,     n_flag_WEBN3   );
      $setuphold ( posedge CKB &&& con_WEBN3,     negedge WEBN3, TWS,     TWH,     n_flag_WEBN3   );
      $setuphold ( posedge CKB &&& con_WEBN4,     posedge WEBN4, TWS,     TWH,     n_flag_WEBN4   );
      $setuphold ( posedge CKB &&& con_WEBN4,     negedge WEBN4, TWS,     TWH,     n_flag_WEBN4   );
      $setuphold ( posedge CKB &&& con_WEBN5,     posedge WEBN5, TWS,     TWH,     n_flag_WEBN5   );
      $setuphold ( posedge CKB &&& con_WEBN5,     negedge WEBN5, TWS,     TWH,     n_flag_WEBN5   );
      $setuphold ( posedge CKB &&& con_WEBN6,     posedge WEBN6, TWS,     TWH,     n_flag_WEBN6   );
      $setuphold ( posedge CKB &&& con_WEBN6,     negedge WEBN6, TWS,     TWH,     n_flag_WEBN6   );
      $setuphold ( posedge CKB &&& con_WEBN7,     posedge WEBN7, TWS,     TWH,     n_flag_WEBN7   );
      $setuphold ( posedge CKB &&& con_WEBN7,     negedge WEBN7, TWS,     TWH,     n_flag_WEBN7   );
      $setuphold ( posedge CKA &&& con_DVSE_WA,   posedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKA &&& con_DVSE_WA,   negedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS0, TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS0, TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS1, TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS1, TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS2, TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS2, TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS3, TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS3, TDVSS,   TDVSH,   n_flag_DVS3    );

      $setuphold ( posedge CKB &&& con_DVSE_WB,   posedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKB &&& con_DVSE_WB,   negedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS0, TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS0, TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS1, TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS1, TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS2, TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS2, TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS3, TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS3, TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CKA,                   posedge CSAN, TCSS,    TCSH,    n_flag_CSA     );
      $setuphold ( posedge CKA,                   negedge CSAN, TCSS,    TCSH,    n_flag_CSA     );
      $setuphold ( posedge CKB,                   posedge CSBN, TCSS,    TCSH,    n_flag_CSB     );
      $setuphold ( posedge CKB,                   negedge CSBN, TCSS,    TCSH,    n_flag_CSB     );
      $setuphold ( posedge CKB &&& CKA_CKB_SKEW,  posedge CKA, TCR2W,   0,       n_flag_TR2W    );
      $setuphold ( posedge CKA &&& CKB_CKA_SKEW,  posedge CKB, TCR2W,   0,       n_flag_TR2W    );
      $period    ( posedge CKA &&& cka_per,       TRC,                       n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per1,      TRC_1,                     n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per2,      TRC_2,                     n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per3,      TRC_3,                     n_flag_CKA_PER );
      $width     ( posedge CKA &&& con_CKA,       THPW,    0,                n_flag_CKA_MINH);
      $width     ( negedge CKA &&& con_CKA,       TLPW,    0,                n_flag_CKA_MINL);
      $period    ( posedge CKB &&& ckb_per,       TRC,                       n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per1,      TRC_1,                     n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per2,      TRC_2,                     n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per3,      TRC_3,                     n_flag_CKB_PER );
      $width     ( posedge CKB &&& con_CKB,       THPW,    0,                n_flag_CKB_MINH);
      $width     ( negedge CKB &&& con_CKB,       TLPW,    0,                n_flag_CKB_MINL);
      $setuphold ( posedge CKA,                   posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );
      $setuphold ( posedge CKB,                   posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );

      $setuphold ( negedge NAP &&& CSBN,          negedge CSAN, 0,       TNAP_CSH, n_flag_NAP_CS  );
      $setuphold ( negedge NAP &&& CSAN,          negedge CSBN, 0,       TNAP_CSH, n_flag_NAP_CS  );


      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA0:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA1:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA2:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA3:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA4:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA5:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA6:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsea && reada0)  (posedge CKA => (DOA7:1'bx)) = TAA  ;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA0 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA1 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA2 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA3 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA4 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA5 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA6 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa1 && reada0)  (posedge CKA => (DOA7 :1'bx)) = TAA_1;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA0 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA1 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA2 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA3 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA4 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA5 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA6 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa2 && reada0)  (posedge CKA => (DOA7 :1'bx)) = TAA_2;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA0 :1'bx)) = TAA_3;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA1 :1'bx)) = TAA_3;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA2 :1'bx)) = TAA_3;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA3 :1'bx)) = TAA_3;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA4 :1'bx)) = TAA_3;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA5 :1'bx)) = TAA_3;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA6 :1'bx)) = TAA_3;
      if (NODELAYA0 == 0 && con_dvsa3 && reada0)  (posedge CKA => (DOA7 :1'bx)) = TAA_3;

      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA8:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA9:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA10:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA11:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA12:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA13:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA14:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsea && reada1)  (posedge CKA => (DOA15:1'bx)) = TAA  ;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA8 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA9 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA10 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA11 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA12 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA13 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA14 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa1 && reada1)  (posedge CKA => (DOA15 :1'bx)) = TAA_1;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA8 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA9 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA10 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA11 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA12 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA13 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA14 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa2 && reada1)  (posedge CKA => (DOA15 :1'bx)) = TAA_2;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA8 :1'bx)) = TAA_3;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA9 :1'bx)) = TAA_3;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA10 :1'bx)) = TAA_3;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA11 :1'bx)) = TAA_3;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA12 :1'bx)) = TAA_3;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA13 :1'bx)) = TAA_3;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA14 :1'bx)) = TAA_3;
      if (NODELAYA1 == 0 && con_dvsa3 && reada1)  (posedge CKA => (DOA15 :1'bx)) = TAA_3;

      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA16:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA17:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA18:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA19:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA20:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA21:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA22:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsea && reada2)  (posedge CKA => (DOA23:1'bx)) = TAA  ;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA16 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA17 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA18 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA19 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA20 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA21 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA22 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa1 && reada2)  (posedge CKA => (DOA23 :1'bx)) = TAA_1;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA16 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA17 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA18 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA19 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA20 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA21 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA22 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa2 && reada2)  (posedge CKA => (DOA23 :1'bx)) = TAA_2;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA16 :1'bx)) = TAA_3;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA17 :1'bx)) = TAA_3;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA18 :1'bx)) = TAA_3;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA19 :1'bx)) = TAA_3;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA20 :1'bx)) = TAA_3;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA21 :1'bx)) = TAA_3;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA22 :1'bx)) = TAA_3;
      if (NODELAYA2 == 0 && con_dvsa3 && reada2)  (posedge CKA => (DOA23 :1'bx)) = TAA_3;

      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA24:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA25:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA26:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA27:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA28:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA29:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA30:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsea && reada3)  (posedge CKA => (DOA31:1'bx)) = TAA  ;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA24 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA25 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA26 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA27 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA28 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA29 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA30 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa1 && reada3)  (posedge CKA => (DOA31 :1'bx)) = TAA_1;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA24 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA25 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA26 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA27 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA28 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA29 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA30 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa2 && reada3)  (posedge CKA => (DOA31 :1'bx)) = TAA_2;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA24 :1'bx)) = TAA_3;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA25 :1'bx)) = TAA_3;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA26 :1'bx)) = TAA_3;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA27 :1'bx)) = TAA_3;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA28 :1'bx)) = TAA_3;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA29 :1'bx)) = TAA_3;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA30 :1'bx)) = TAA_3;
      if (NODELAYA3 == 0 && con_dvsa3 && reada3)  (posedge CKA => (DOA31 :1'bx)) = TAA_3;

      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA32:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA33:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA34:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA35:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA36:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA37:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA38:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsea && reada4)  (posedge CKA => (DOA39:1'bx)) = TAA  ;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA32 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA33 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA34 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA35 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA36 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA37 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA38 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa1 && reada4)  (posedge CKA => (DOA39 :1'bx)) = TAA_1;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA32 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA33 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA34 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA35 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA36 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA37 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA38 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa2 && reada4)  (posedge CKA => (DOA39 :1'bx)) = TAA_2;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA32 :1'bx)) = TAA_3;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA33 :1'bx)) = TAA_3;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA34 :1'bx)) = TAA_3;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA35 :1'bx)) = TAA_3;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA36 :1'bx)) = TAA_3;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA37 :1'bx)) = TAA_3;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA38 :1'bx)) = TAA_3;
      if (NODELAYA4 == 0 && con_dvsa3 && reada4)  (posedge CKA => (DOA39 :1'bx)) = TAA_3;

      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA40:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA41:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA42:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA43:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA44:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA45:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA46:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsea && reada5)  (posedge CKA => (DOA47:1'bx)) = TAA  ;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA40 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA41 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA42 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA43 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA44 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA45 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA46 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa1 && reada5)  (posedge CKA => (DOA47 :1'bx)) = TAA_1;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA40 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA41 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA42 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA43 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA44 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA45 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA46 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa2 && reada5)  (posedge CKA => (DOA47 :1'bx)) = TAA_2;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA40 :1'bx)) = TAA_3;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA41 :1'bx)) = TAA_3;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA42 :1'bx)) = TAA_3;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA43 :1'bx)) = TAA_3;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA44 :1'bx)) = TAA_3;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA45 :1'bx)) = TAA_3;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA46 :1'bx)) = TAA_3;
      if (NODELAYA5 == 0 && con_dvsa3 && reada5)  (posedge CKA => (DOA47 :1'bx)) = TAA_3;

      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA48:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA49:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA50:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA51:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA52:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA53:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA54:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsea && reada6)  (posedge CKA => (DOA55:1'bx)) = TAA  ;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA48 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA49 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA50 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA51 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA52 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA53 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA54 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa1 && reada6)  (posedge CKA => (DOA55 :1'bx)) = TAA_1;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA48 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA49 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA50 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA51 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA52 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA53 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA54 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa2 && reada6)  (posedge CKA => (DOA55 :1'bx)) = TAA_2;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA48 :1'bx)) = TAA_3;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA49 :1'bx)) = TAA_3;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA50 :1'bx)) = TAA_3;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA51 :1'bx)) = TAA_3;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA52 :1'bx)) = TAA_3;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA53 :1'bx)) = TAA_3;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA54 :1'bx)) = TAA_3;
      if (NODELAYA6 == 0 && con_dvsa3 && reada6)  (posedge CKA => (DOA55 :1'bx)) = TAA_3;

      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA56:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA57:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA58:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA59:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA60:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA61:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA62:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsea && reada7)  (posedge CKA => (DOA63:1'bx)) = TAA  ;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA56 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA57 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA58 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA59 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA60 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA61 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA62 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa1 && reada7)  (posedge CKA => (DOA63 :1'bx)) = TAA_1;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA56 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA57 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA58 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA59 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA60 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA61 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA62 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa2 && reada7)  (posedge CKA => (DOA63 :1'bx)) = TAA_2;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA56 :1'bx)) = TAA_3;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA57 :1'bx)) = TAA_3;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA58 :1'bx)) = TAA_3;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA59 :1'bx)) = TAA_3;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA60 :1'bx)) = TAA_3;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA61 :1'bx)) = TAA_3;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA62 :1'bx)) = TAA_3;
      if (NODELAYA7 == 0 && con_dvsa3 && reada7)  (posedge CKA => (DOA63 :1'bx)) = TAA_3;



      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB0:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB1:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB2:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB3:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB4:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB5:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB6:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvseb && readb0)  (posedge CKB => (DOB7:1'bx)) = TAA  ;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB0 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB1 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB2 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB3 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB4 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB5 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB6 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb1 && readb0)  (posedge CKB => (DOB7 :1'bx)) = TAA_1;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB0 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB1 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB2 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB3 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB4 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB5 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB6 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb2 && readb0)  (posedge CKB => (DOB7 :1'bx)) = TAA_2;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB0 :1'bx)) = TAA_3;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB1 :1'bx)) = TAA_3;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB2 :1'bx)) = TAA_3;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB3 :1'bx)) = TAA_3;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB4 :1'bx)) = TAA_3;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB5 :1'bx)) = TAA_3;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB6 :1'bx)) = TAA_3;
      if (NODELAYB0 == 0 && con_dvsb3 && readb0)  (posedge CKB => (DOB7 :1'bx)) = TAA_3;

      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB8:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB9:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB10:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB11:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB12:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB13:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB14:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvseb && readb1)  (posedge CKB => (DOB15:1'bx)) = TAA  ;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB8 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB9 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB10 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB11 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB12 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB13 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB14 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb1 && readb1)  (posedge CKB => (DOB15 :1'bx)) = TAA_1;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB8 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB9 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB10 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB11 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB12 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB13 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB14 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb2 && readb1)  (posedge CKB => (DOB15 :1'bx)) = TAA_2;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB8 :1'bx)) = TAA_3;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB9 :1'bx)) = TAA_3;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB10 :1'bx)) = TAA_3;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB11 :1'bx)) = TAA_3;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB12 :1'bx)) = TAA_3;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB13 :1'bx)) = TAA_3;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB14 :1'bx)) = TAA_3;
      if (NODELAYB1 == 0 && con_dvsb3 && readb1)  (posedge CKB => (DOB15 :1'bx)) = TAA_3;

      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB16:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB17:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB18:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB19:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB20:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB21:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB22:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvseb && readb2)  (posedge CKB => (DOB23:1'bx)) = TAA  ;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB16 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB17 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB18 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB19 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB20 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB21 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB22 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb1 && readb2)  (posedge CKB => (DOB23 :1'bx)) = TAA_1;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB16 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB17 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB18 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB19 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB20 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB21 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB22 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb2 && readb2)  (posedge CKB => (DOB23 :1'bx)) = TAA_2;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB16 :1'bx)) = TAA_3;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB17 :1'bx)) = TAA_3;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB18 :1'bx)) = TAA_3;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB19 :1'bx)) = TAA_3;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB20 :1'bx)) = TAA_3;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB21 :1'bx)) = TAA_3;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB22 :1'bx)) = TAA_3;
      if (NODELAYB2 == 0 && con_dvsb3 && readb2)  (posedge CKB => (DOB23 :1'bx)) = TAA_3;

      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB24:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB25:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB26:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB27:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB28:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB29:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB30:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvseb && readb3)  (posedge CKB => (DOB31:1'bx)) = TAA  ;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB24 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB25 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB26 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB27 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB28 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB29 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB30 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb1 && readb3)  (posedge CKB => (DOB31 :1'bx)) = TAA_1;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB24 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB25 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB26 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB27 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB28 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB29 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB30 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb2 && readb3)  (posedge CKB => (DOB31 :1'bx)) = TAA_2;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB24 :1'bx)) = TAA_3;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB25 :1'bx)) = TAA_3;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB26 :1'bx)) = TAA_3;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB27 :1'bx)) = TAA_3;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB28 :1'bx)) = TAA_3;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB29 :1'bx)) = TAA_3;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB30 :1'bx)) = TAA_3;
      if (NODELAYB3 == 0 && con_dvsb3 && readb3)  (posedge CKB => (DOB31 :1'bx)) = TAA_3;

      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB32:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB33:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB34:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB35:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB36:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB37:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB38:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvseb && readb4)  (posedge CKB => (DOB39:1'bx)) = TAA  ;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB32 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB33 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB34 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB35 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB36 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB37 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB38 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb1 && readb4)  (posedge CKB => (DOB39 :1'bx)) = TAA_1;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB32 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB33 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB34 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB35 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB36 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB37 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB38 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb2 && readb4)  (posedge CKB => (DOB39 :1'bx)) = TAA_2;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB32 :1'bx)) = TAA_3;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB33 :1'bx)) = TAA_3;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB34 :1'bx)) = TAA_3;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB35 :1'bx)) = TAA_3;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB36 :1'bx)) = TAA_3;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB37 :1'bx)) = TAA_3;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB38 :1'bx)) = TAA_3;
      if (NODELAYB4 == 0 && con_dvsb3 && readb4)  (posedge CKB => (DOB39 :1'bx)) = TAA_3;

      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB40:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB41:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB42:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB43:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB44:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB45:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB46:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvseb && readb5)  (posedge CKB => (DOB47:1'bx)) = TAA  ;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB40 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB41 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB42 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB43 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB44 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB45 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB46 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb1 && readb5)  (posedge CKB => (DOB47 :1'bx)) = TAA_1;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB40 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB41 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB42 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB43 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB44 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB45 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB46 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb2 && readb5)  (posedge CKB => (DOB47 :1'bx)) = TAA_2;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB40 :1'bx)) = TAA_3;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB41 :1'bx)) = TAA_3;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB42 :1'bx)) = TAA_3;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB43 :1'bx)) = TAA_3;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB44 :1'bx)) = TAA_3;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB45 :1'bx)) = TAA_3;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB46 :1'bx)) = TAA_3;
      if (NODELAYB5 == 0 && con_dvsb3 && readb5)  (posedge CKB => (DOB47 :1'bx)) = TAA_3;

      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB48:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB49:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB50:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB51:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB52:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB53:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB54:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvseb && readb6)  (posedge CKB => (DOB55:1'bx)) = TAA  ;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB48 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB49 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB50 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB51 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB52 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB53 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB54 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb1 && readb6)  (posedge CKB => (DOB55 :1'bx)) = TAA_1;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB48 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB49 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB50 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB51 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB52 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB53 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB54 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb2 && readb6)  (posedge CKB => (DOB55 :1'bx)) = TAA_2;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB48 :1'bx)) = TAA_3;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB49 :1'bx)) = TAA_3;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB50 :1'bx)) = TAA_3;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB51 :1'bx)) = TAA_3;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB52 :1'bx)) = TAA_3;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB53 :1'bx)) = TAA_3;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB54 :1'bx)) = TAA_3;
      if (NODELAYB6 == 0 && con_dvsb3 && readb6)  (posedge CKB => (DOB55 :1'bx)) = TAA_3;

      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB56:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB57:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB58:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB59:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB60:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB61:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB62:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvseb && readb7)  (posedge CKB => (DOB63:1'bx)) = TAA  ;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB56 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB57 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB58 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB59 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB60 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB61 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB62 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb1 && readb7)  (posedge CKB => (DOB63 :1'bx)) = TAA_1;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB56 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB57 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB58 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB59 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB60 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB61 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB62 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb2 && readb7)  (posedge CKB => (DOB63 :1'bx)) = TAA_2;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB56 :1'bx)) = TAA_3;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB57 :1'bx)) = TAA_3;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB58 :1'bx)) = TAA_3;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB59 :1'bx)) = TAA_3;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB60 :1'bx)) = TAA_3;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB61 :1'bx)) = TAA_3;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB62 :1'bx)) = TAA_3;
      if (NODELAYB7 == 0 && con_dvsb3 && readb7)  (posedge CKB => (DOB63 :1'bx)) = TAA_3;



      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA0:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA1:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA2:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA3:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA4:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA5:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA6:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsea && writea0)  (posedge CKA => (DOA7:1'bx)) = TWDV ;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA0 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA1 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA2 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA3 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA4 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA5 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA6 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa1 && writea0)  (posedge CKA => (DOA7 :1'bx)) = TWDV_1;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA0 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA1 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA2 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA3 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA4 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA5 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA6 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa2 && writea0)  (posedge CKA => (DOA7 :1'bx)) = TWDV_2;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA0 :1'bx)) = TWDV_3;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA1 :1'bx)) = TWDV_3;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA2 :1'bx)) = TWDV_3;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA3 :1'bx)) = TWDV_3;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA4 :1'bx)) = TWDV_3;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA5 :1'bx)) = TWDV_3;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA6 :1'bx)) = TWDV_3;
      if (NODELAYA0 == 0 && con_dvsa3 && writea0)  (posedge CKA => (DOA7 :1'bx)) = TWDV_3;

      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA8:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA9:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA10:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA11:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA12:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA13:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA14:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsea && writea1)  (posedge CKA => (DOA15:1'bx)) = TWDV ;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA8 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA9 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA10 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA11 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA12 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA13 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA14 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa1 && writea1)  (posedge CKA => (DOA15 :1'bx)) = TWDV_1;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA8 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA9 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA10 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA11 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA12 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA13 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA14 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa2 && writea1)  (posedge CKA => (DOA15 :1'bx)) = TWDV_2;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA8 :1'bx)) = TWDV_3;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA9 :1'bx)) = TWDV_3;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA10 :1'bx)) = TWDV_3;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA11 :1'bx)) = TWDV_3;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA12 :1'bx)) = TWDV_3;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA13 :1'bx)) = TWDV_3;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA14 :1'bx)) = TWDV_3;
      if (NODELAYA1 == 0 && con_dvsa3 && writea1)  (posedge CKA => (DOA15 :1'bx)) = TWDV_3;

      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA16:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA17:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA18:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA19:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA20:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA21:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA22:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsea && writea2)  (posedge CKA => (DOA23:1'bx)) = TWDV ;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA16 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA17 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA18 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA19 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA20 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA21 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA22 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa1 && writea2)  (posedge CKA => (DOA23 :1'bx)) = TWDV_1;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA16 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA17 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA18 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA19 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA20 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA21 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA22 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa2 && writea2)  (posedge CKA => (DOA23 :1'bx)) = TWDV_2;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA16 :1'bx)) = TWDV_3;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA17 :1'bx)) = TWDV_3;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA18 :1'bx)) = TWDV_3;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA19 :1'bx)) = TWDV_3;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA20 :1'bx)) = TWDV_3;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA21 :1'bx)) = TWDV_3;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA22 :1'bx)) = TWDV_3;
      if (NODELAYA2 == 0 && con_dvsa3 && writea2)  (posedge CKA => (DOA23 :1'bx)) = TWDV_3;

      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA24:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA25:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA26:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA27:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA28:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA29:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA30:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsea && writea3)  (posedge CKA => (DOA31:1'bx)) = TWDV ;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA24 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA25 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA26 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA27 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA28 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA29 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA30 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa1 && writea3)  (posedge CKA => (DOA31 :1'bx)) = TWDV_1;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA24 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA25 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA26 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA27 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA28 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA29 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA30 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa2 && writea3)  (posedge CKA => (DOA31 :1'bx)) = TWDV_2;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA24 :1'bx)) = TWDV_3;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA25 :1'bx)) = TWDV_3;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA26 :1'bx)) = TWDV_3;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA27 :1'bx)) = TWDV_3;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA28 :1'bx)) = TWDV_3;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA29 :1'bx)) = TWDV_3;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA30 :1'bx)) = TWDV_3;
      if (NODELAYA3 == 0 && con_dvsa3 && writea3)  (posedge CKA => (DOA31 :1'bx)) = TWDV_3;

      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA32:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA33:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA34:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA35:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA36:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA37:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA38:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsea && writea4)  (posedge CKA => (DOA39:1'bx)) = TWDV ;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA32 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA33 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA34 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA35 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA36 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA37 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA38 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa1 && writea4)  (posedge CKA => (DOA39 :1'bx)) = TWDV_1;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA32 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA33 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA34 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA35 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA36 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA37 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA38 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa2 && writea4)  (posedge CKA => (DOA39 :1'bx)) = TWDV_2;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA32 :1'bx)) = TWDV_3;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA33 :1'bx)) = TWDV_3;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA34 :1'bx)) = TWDV_3;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA35 :1'bx)) = TWDV_3;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA36 :1'bx)) = TWDV_3;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA37 :1'bx)) = TWDV_3;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA38 :1'bx)) = TWDV_3;
      if (NODELAYA4 == 0 && con_dvsa3 && writea4)  (posedge CKA => (DOA39 :1'bx)) = TWDV_3;

      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA40:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA41:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA42:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA43:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA44:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA45:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA46:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsea && writea5)  (posedge CKA => (DOA47:1'bx)) = TWDV ;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA40 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA41 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA42 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA43 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA44 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA45 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA46 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa1 && writea5)  (posedge CKA => (DOA47 :1'bx)) = TWDV_1;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA40 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA41 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA42 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA43 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA44 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA45 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA46 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa2 && writea5)  (posedge CKA => (DOA47 :1'bx)) = TWDV_2;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA40 :1'bx)) = TWDV_3;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA41 :1'bx)) = TWDV_3;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA42 :1'bx)) = TWDV_3;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA43 :1'bx)) = TWDV_3;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA44 :1'bx)) = TWDV_3;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA45 :1'bx)) = TWDV_3;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA46 :1'bx)) = TWDV_3;
      if (NODELAYA5 == 0 && con_dvsa3 && writea5)  (posedge CKA => (DOA47 :1'bx)) = TWDV_3;

      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA48:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA49:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA50:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA51:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA52:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA53:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA54:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsea && writea6)  (posedge CKA => (DOA55:1'bx)) = TWDV ;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA48 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA49 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA50 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA51 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA52 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA53 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA54 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa1 && writea6)  (posedge CKA => (DOA55 :1'bx)) = TWDV_1;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA48 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA49 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA50 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA51 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA52 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA53 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA54 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa2 && writea6)  (posedge CKA => (DOA55 :1'bx)) = TWDV_2;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA48 :1'bx)) = TWDV_3;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA49 :1'bx)) = TWDV_3;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA50 :1'bx)) = TWDV_3;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA51 :1'bx)) = TWDV_3;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA52 :1'bx)) = TWDV_3;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA53 :1'bx)) = TWDV_3;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA54 :1'bx)) = TWDV_3;
      if (NODELAYA6 == 0 && con_dvsa3 && writea6)  (posedge CKA => (DOA55 :1'bx)) = TWDV_3;

      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA56:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA57:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA58:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA59:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA60:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA61:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA62:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsea && writea7)  (posedge CKA => (DOA63:1'bx)) = TWDV ;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA56 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA57 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA58 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA59 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA60 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA61 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA62 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa1 && writea7)  (posedge CKA => (DOA63 :1'bx)) = TWDV_1;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA56 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA57 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA58 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA59 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA60 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA61 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA62 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa2 && writea7)  (posedge CKA => (DOA63 :1'bx)) = TWDV_2;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA56 :1'bx)) = TWDV_3;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA57 :1'bx)) = TWDV_3;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA58 :1'bx)) = TWDV_3;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA59 :1'bx)) = TWDV_3;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA60 :1'bx)) = TWDV_3;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA61 :1'bx)) = TWDV_3;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA62 :1'bx)) = TWDV_3;
      if (NODELAYA7 == 0 && con_dvsa3 && writea7)  (posedge CKA => (DOA63 :1'bx)) = TWDV_3;



      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB0:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB1:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB2:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB3:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB4:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB5:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB6:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvseb && writeb0)  (posedge CKB => (DOB7:1'bx)) = TWDV ;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB0 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB1 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB2 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB3 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB4 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB5 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB6 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb1 && writeb0)  (posedge CKB => (DOB7 :1'bx)) = TWDV_1;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB0 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB1 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB2 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB3 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB4 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB5 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB6 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb2 && writeb0)  (posedge CKB => (DOB7 :1'bx)) = TWDV_2;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB0 :1'bx)) = TWDV_3;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB1 :1'bx)) = TWDV_3;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB2 :1'bx)) = TWDV_3;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB3 :1'bx)) = TWDV_3;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB4 :1'bx)) = TWDV_3;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB5 :1'bx)) = TWDV_3;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB6 :1'bx)) = TWDV_3;
      if (NODELAYB0 == 0 && con_dvsb3 && writeb0)  (posedge CKB => (DOB7 :1'bx)) = TWDV_3;

      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB8:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB9:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB10:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB11:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB12:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB13:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB14:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvseb && writeb1)  (posedge CKB => (DOB15:1'bx)) = TWDV ;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB8 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB9 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB10 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB11 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB12 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB13 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB14 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb1 && writeb1)  (posedge CKB => (DOB15 :1'bx)) = TWDV_1;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB8 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB9 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB10 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB11 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB12 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB13 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB14 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb2 && writeb1)  (posedge CKB => (DOB15 :1'bx)) = TWDV_2;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB8 :1'bx)) = TWDV_3;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB9 :1'bx)) = TWDV_3;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB10 :1'bx)) = TWDV_3;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB11 :1'bx)) = TWDV_3;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB12 :1'bx)) = TWDV_3;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB13 :1'bx)) = TWDV_3;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB14 :1'bx)) = TWDV_3;
      if (NODELAYB1 == 0 && con_dvsb3 && writeb1)  (posedge CKB => (DOB15 :1'bx)) = TWDV_3;

      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB16:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB17:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB18:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB19:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB20:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB21:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB22:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvseb && writeb2)  (posedge CKB => (DOB23:1'bx)) = TWDV ;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB16 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB17 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB18 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB19 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB20 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB21 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB22 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb1 && writeb2)  (posedge CKB => (DOB23 :1'bx)) = TWDV_1;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB16 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB17 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB18 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB19 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB20 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB21 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB22 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb2 && writeb2)  (posedge CKB => (DOB23 :1'bx)) = TWDV_2;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB16 :1'bx)) = TWDV_3;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB17 :1'bx)) = TWDV_3;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB18 :1'bx)) = TWDV_3;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB19 :1'bx)) = TWDV_3;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB20 :1'bx)) = TWDV_3;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB21 :1'bx)) = TWDV_3;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB22 :1'bx)) = TWDV_3;
      if (NODELAYB2 == 0 && con_dvsb3 && writeb2)  (posedge CKB => (DOB23 :1'bx)) = TWDV_3;

      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB24:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB25:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB26:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB27:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB28:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB29:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB30:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvseb && writeb3)  (posedge CKB => (DOB31:1'bx)) = TWDV ;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB24 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB25 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB26 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB27 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB28 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB29 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB30 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb1 && writeb3)  (posedge CKB => (DOB31 :1'bx)) = TWDV_1;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB24 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB25 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB26 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB27 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB28 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB29 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB30 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb2 && writeb3)  (posedge CKB => (DOB31 :1'bx)) = TWDV_2;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB24 :1'bx)) = TWDV_3;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB25 :1'bx)) = TWDV_3;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB26 :1'bx)) = TWDV_3;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB27 :1'bx)) = TWDV_3;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB28 :1'bx)) = TWDV_3;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB29 :1'bx)) = TWDV_3;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB30 :1'bx)) = TWDV_3;
      if (NODELAYB3 == 0 && con_dvsb3 && writeb3)  (posedge CKB => (DOB31 :1'bx)) = TWDV_3;

      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB32:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB33:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB34:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB35:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB36:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB37:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB38:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvseb && writeb4)  (posedge CKB => (DOB39:1'bx)) = TWDV ;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB32 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB33 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB34 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB35 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB36 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB37 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB38 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb1 && writeb4)  (posedge CKB => (DOB39 :1'bx)) = TWDV_1;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB32 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB33 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB34 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB35 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB36 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB37 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB38 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb2 && writeb4)  (posedge CKB => (DOB39 :1'bx)) = TWDV_2;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB32 :1'bx)) = TWDV_3;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB33 :1'bx)) = TWDV_3;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB34 :1'bx)) = TWDV_3;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB35 :1'bx)) = TWDV_3;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB36 :1'bx)) = TWDV_3;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB37 :1'bx)) = TWDV_3;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB38 :1'bx)) = TWDV_3;
      if (NODELAYB4 == 0 && con_dvsb3 && writeb4)  (posedge CKB => (DOB39 :1'bx)) = TWDV_3;

      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB40:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB41:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB42:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB43:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB44:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB45:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB46:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvseb && writeb5)  (posedge CKB => (DOB47:1'bx)) = TWDV ;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB40 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB41 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB42 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB43 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB44 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB45 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB46 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb1 && writeb5)  (posedge CKB => (DOB47 :1'bx)) = TWDV_1;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB40 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB41 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB42 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB43 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB44 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB45 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB46 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb2 && writeb5)  (posedge CKB => (DOB47 :1'bx)) = TWDV_2;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB40 :1'bx)) = TWDV_3;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB41 :1'bx)) = TWDV_3;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB42 :1'bx)) = TWDV_3;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB43 :1'bx)) = TWDV_3;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB44 :1'bx)) = TWDV_3;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB45 :1'bx)) = TWDV_3;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB46 :1'bx)) = TWDV_3;
      if (NODELAYB5 == 0 && con_dvsb3 && writeb5)  (posedge CKB => (DOB47 :1'bx)) = TWDV_3;

      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB48:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB49:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB50:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB51:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB52:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB53:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB54:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvseb && writeb6)  (posedge CKB => (DOB55:1'bx)) = TWDV ;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB48 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB49 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB50 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB51 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB52 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB53 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB54 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb1 && writeb6)  (posedge CKB => (DOB55 :1'bx)) = TWDV_1;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB48 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB49 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB50 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB51 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB52 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB53 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB54 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb2 && writeb6)  (posedge CKB => (DOB55 :1'bx)) = TWDV_2;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB48 :1'bx)) = TWDV_3;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB49 :1'bx)) = TWDV_3;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB50 :1'bx)) = TWDV_3;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB51 :1'bx)) = TWDV_3;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB52 :1'bx)) = TWDV_3;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB53 :1'bx)) = TWDV_3;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB54 :1'bx)) = TWDV_3;
      if (NODELAYB6 == 0 && con_dvsb3 && writeb6)  (posedge CKB => (DOB55 :1'bx)) = TWDV_3;

      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB56:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB57:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB58:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB59:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB60:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB61:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB62:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvseb && writeb7)  (posedge CKB => (DOB63:1'bx)) = TWDV ;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB56 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB57 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB58 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB59 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB60 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB61 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB62 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb1 && writeb7)  (posedge CKB => (DOB63 :1'bx)) = TWDV_1;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB56 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB57 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB58 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB59 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB60 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB61 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB62 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb2 && writeb7)  (posedge CKB => (DOB63 :1'bx)) = TWDV_2;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB56 :1'bx)) = TWDV_3;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB57 :1'bx)) = TWDV_3;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB58 :1'bx)) = TWDV_3;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB59 :1'bx)) = TWDV_3;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB60 :1'bx)) = TWDV_3;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB61 :1'bx)) = TWDV_3;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB62 :1'bx)) = TWDV_3;
      if (NODELAYB7 == 0 && con_dvsb3 && writeb7)  (posedge CKB => (DOB63 :1'bx)) = TWDV_3;


   endspecify

`endprotect
endmodule
