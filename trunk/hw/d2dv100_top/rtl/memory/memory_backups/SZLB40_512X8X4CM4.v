/*******************************************************************************
________________________________________________________________________________________________


            Synchronous RVT Periphery Two-Port Register File Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________

       IP Name            :  FSH0L_B_SZ                      
       IP Version         :  1.6.0                           
       IP Release Status  :  Active                          
       Word               :  512                             
       Bit                :  8                               
       Byte               :  4                               
       Mux                :  4                               
       Output Loading     :  0.3                             
       Clock Input Slew   :  0.4                             
       Data Input Slew    :  0.4                             
       Ring Type          :  Ringless Model                  
       Ring Width         :  0                               
       Bus Format         :  0                               
       Memaker Path       :  /home/autumn/pdk/memory/ftclib  
       GUI Version        :  m20130120                       
       Date               :  2024/08/07 02:56:39             
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


module SZLB40_512X8X4CM4 (A0,A1,A2,A3,A4,A5,A6,A7,A8,B0,B1,B2,B3,B4,B5,B6,
                          B7,B8,DO0,DO1,DO2,DO3,DO4,DO5,DO6,DO7,DO8,DO9,
                          DO10,DO11,DO12,DO13,DO14,DO15,DO16,DO17,
                          DO18,DO19,DO20,DO21,DO22,DO23,DO24,DO25,
                          DO26,DO27,DO28,DO29,DO30,DO31,DI0,DI1,
                          DI2,DI3,DI4,DI5,DI6,DI7,DI8,DI9,DI10,DI11,
                          DI12,DI13,DI14,DI15,DI16,DI17,DI18,DI19,
                          DI20,DI21,DI22,DI23,DI24,DI25,DI26,DI27,
                          DI28,DI29,DI30,DI31,WEB0,WEB1,WEB2,WEB3,
                          DVSE,DVS0,DVS1,DVS2,DVS3,CKA,CKB,CSAN,CSBN,NAP);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 9;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 8;                
  parameter  Words                = 512;              
  parameter  Bytes                = 4;                
  parameter  AspectRatio          = 4;                
  parameter  Tr2w                 = (82.9:132.9:256.5);
  parameter  Tw2r                 = (78.4:123.9:235.2);
  parameter  TOH                  = (67.5:109.1:195.5);
  parameter  TOH_1                = (76.1:125.3:230.0);
  parameter  TOH_2                = (67.5:109.1:195.5);
  parameter  TOH_6                = (60.1:95.3:166.3);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (82.9:132.9:238.0);
`else
`endif
  parameter  TNAP_Wakeup          = 0;                

  output     DO0,DO1,DO2,DO3,DO4,DO5,DO6,DO7,DO8,
             DO9,DO10,DO11,DO12,DO13,DO14,DO15,DO16,DO17,DO18,
             DO19,DO20,DO21,DO22,DO23,DO24,DO25,DO26,DO27,DO28,
             DO29,DO30,DO31;
  input      DI0,DI1,DI2,DI3,DI4,DI5,DI6,DI7,DI8,
             DI9,DI10,DI11,DI12,DI13,DI14,DI15,DI16,DI17,DI18,
             DI19,DI20,DI21,DI22,DI23,DI24,DI25,DI26,DI27,DI28,
             DI29,DI30,DI31;
  input      A0,A1,A2,A3,A4,A5,A6,A7,A8;
  input      B0,B1,B2,B3,B4,B5,B6,B7,B8;
  input      DVSE;                                    
  input      DVS0,DVS1,DVS2,DVS3;
  input      WEB0;                                    
  input      WEB1;                                    
  input      WEB2;                                    
  input      WEB3;                                    
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

  wire       [Bytes*Bits-1:0]     DO_;                
  wire       [AddressSize-1:0]    A_;                 
  wire       [Bits-1:0]           DI_byte0_;          
  wire       [Bits-1:0]           DI_byte1_;          
  wire       [Bits-1:0]           DI_byte2_;          
  wire       [Bits-1:0]           DI_byte3_;          
  wire                            WEB0_;              
  wire                            WEB1_;              
  wire                            WEB2_;              
  wire                            WEB3_;              
  wire       [AddressSize-1:0]    B_;                 
  wire                            CKA_;               
  wire                            CKB_;               
  wire                            CSA_;               
  wire                            CSB_;               

  wire       [DVSize-1:0]         DVS_;               
  wire                            DVSE_;              
  reg                             DVS_TRIGGER;        
  reg                             DVS_TRIGGER_CKB;    

  reg                             con_dvse;           
  reg                             wrong_dvs0;         
  reg                             wrong_dvs0_ckb;     
  reg                             con_dvs1;           
  reg                             con_dvs2;           
  reg                             wrong_dvs3;         
  reg                             wrong_dvs3_ckb;     
  reg                             wrong_dvs4;         
  reg                             wrong_dvs4_ckb;     
  reg                             wrong_dvs5;         
  reg                             wrong_dvs5_ckb;     
  reg                             con_dvs6;           
  reg                             wrong_dvs7;         
  reg                             wrong_dvs7_ckb;     
  reg                             wrong_dvs8;         
  reg                             wrong_dvs8_ckb;     
  reg                             wrong_dvs9;         
  reg                             wrong_dvs9_ckb;     
  reg                             wrong_dvs10;        
  reg                             wrong_dvs10_ckb;    
  reg                             wrong_dvs11;        
  reg                             wrong_dvs11_ckb;    
  reg                             wrong_dvs12;        
  reg                             wrong_dvs12_ckb;    
  reg                             wrong_dvs13;        
  reg                             wrong_dvs13_ckb;    
  reg                             wrong_dvs14;        
  reg                             wrong_dvs14_ckb;    
  reg                             wrong_dvs15;        
  reg                             wrong_dvs15_ckb;    
  wire                            NAP_;               




  wire                            con_A;              
  wire                            con_DI_byte0;       
  wire                            con_DI_byte1;       
  wire                            con_DI_byte2;       
  wire                            con_DI_byte3;       
  wire                            con_B;              
  wire                            con_CKA;            
  wire                            con_CKB;            
  wire                            cka_per;            
  wire                            ckb_per;            
  wire                            cka_per1;           
  wire                            cka_per2;           
  wire                            cka_per6;           
  wire                            ckb_per1;           
  wire                            ckb_per2;           
  wire                            ckb_per6;           
  wire                            con_WEB0;           
  wire                            con_WEB1;           
  wire                            con_WEB2;           
  wire                            con_WEB3;           

  wire                            con_DVSE_WA;        
  wire                            con_DVS_WA;         
  wire                            con_DVSE_WB;        
  wire                            con_DVS_WB;         

  reg        [AddressSize-1:0]    Latch_A;            
  reg        [Bits-1:0]           Latch_DI_byte0;     
  reg        [Bits-1:0]           Latch_DI_byte1;     
  reg        [Bits-1:0]           Latch_DI_byte2;     
  reg        [Bits-1:0]           Latch_DI_byte3;     
  reg                             Latch_WEB0;         
  reg                             Latch_WEB1;         
  reg                             Latch_WEB2;         
  reg                             Latch_WEB3;         
  reg        [AddressSize-1:0]    Latch_B;            
  reg                             Latch_CSA;          
  reg                             Latch_CSB;          
  reg                             Latch_DVSE;         
  reg        [DVSize-1:0]         Latch_DVS;          
  reg        [AddressSize-1:0]    LastCycleRAddress;  
  reg        [AddressSize-1:0]    LastCycleWAddress_WEB0;
  reg        [AddressSize-1:0]    LastCycleWAddress_WEB1;
  reg        [AddressSize-1:0]    LastCycleWAddress_WEB2;
  reg        [AddressSize-1:0]    LastCycleWAddress_WEB3;

  reg        [AddressSize-1:0]    A_i;                
  reg        [Bits-1:0]           DI_byte0_i;         
  reg        [Bits-1:0]           DI_byte1_i;         
  reg        [Bits-1:0]           DI_byte2_i;         
  reg        [Bits-1:0]           DI_byte3_i;         
  reg                             WEB0_i;             
  reg                             WEB1_i;             
  reg                             WEB2_i;             
  reg                             WEB3_i;             
  reg        [AddressSize-1:0]    B_i;                
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
  reg                             n_flag_B0;          
  reg                             n_flag_B1;          
  reg                             n_flag_B2;          
  reg                             n_flag_B3;          
  reg                             n_flag_B4;          
  reg                             n_flag_B5;          
  reg                             n_flag_B6;          
  reg                             n_flag_B7;          
  reg                             n_flag_B8;          
  reg                             n_flag_DI0;         
  reg                             n_flag_DI1;         
  reg                             n_flag_DI2;         
  reg                             n_flag_DI3;         
  reg                             n_flag_DI4;         
  reg                             n_flag_DI5;         
  reg                             n_flag_DI6;         
  reg                             n_flag_DI7;         
  reg                             n_flag_DI8;         
  reg                             n_flag_DI9;         
  reg                             n_flag_DI10;        
  reg                             n_flag_DI11;        
  reg                             n_flag_DI12;        
  reg                             n_flag_DI13;        
  reg                             n_flag_DI14;        
  reg                             n_flag_DI15;        
  reg                             n_flag_DI16;        
  reg                             n_flag_DI17;        
  reg                             n_flag_DI18;        
  reg                             n_flag_DI19;        
  reg                             n_flag_DI20;        
  reg                             n_flag_DI21;        
  reg                             n_flag_DI22;        
  reg                             n_flag_DI23;        
  reg                             n_flag_DI24;        
  reg                             n_flag_DI25;        
  reg                             n_flag_DI26;        
  reg                             n_flag_DI27;        
  reg                             n_flag_DI28;        
  reg                             n_flag_DI29;        
  reg                             n_flag_DI30;        
  reg                             n_flag_DI31;        
  reg                             n_flag_WEB0;        
  reg                             n_flag_WEB1;        
  reg                             n_flag_WEB2;        
  reg                             n_flag_WEB3;        
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
  reg                             LAST_n_flag_WEB0;   
  reg                             LAST_n_flag_WEB1;   
  reg                             LAST_n_flag_WEB2;   
  reg                             LAST_n_flag_WEB3;   
  reg                             n_flag_DVSE;        
  reg                             n_flag_DVS0;        
  reg                             n_flag_DVS1;        
  reg                             n_flag_DVS2;        
  reg                             n_flag_DVS3;        
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
  reg        [Bits-1:0]           NOT_BUS_DI_byte0;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte0;
  reg        [Bits-1:0]           NOT_BUS_DI_byte1;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte1;
  reg        [Bits-1:0]           NOT_BUS_DI_byte2;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte2;
  reg        [Bits-1:0]           NOT_BUS_DI_byte3;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte3;

  reg                             LAST_n_flag_DVSE;   
  reg        [DVSize-1:0]         NOT_BUS_DVS;        
  reg        [DVSize-1:0]         LAST_NOT_BUS_DVS;   

  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       

  reg        [Bits-1:0]           DO_byte0_i;         
  reg        [Bits-1:0]           DO_byte1_i;         
  reg        [Bits-1:0]           DO_byte2_i;         
  reg        [Bits-1:0]           DO_byte3_i;         



  reg                             LastClkAEdge;       
  reg                             LastClkBEdge;       

  reg                             flag_A_x;           
  reg                             flag_B_x;           
  reg                             flag_CSA_x;         
  reg                             flag_CSB_x;         
  reg                             NODELAY0;           
  reg                             NODELAY1;           
  reg                             NODELAY2;           
  reg                             NODELAY3;           
  reg        [Bits-1:0]           DO_byte0_tmp;       
  event                           EventTOHDO_byte0;   
  reg        [Bits-1:0]           DO_byte1_tmp;       
  event                           EventTOHDO_byte1;   
  reg        [Bits-1:0]           DO_byte2_tmp;       
  event                           EventTOHDO_byte2;   
  reg        [Bits-1:0]           DO_byte3_tmp;       
  event                           EventTOHDO_byte3;   
  event                           EventNegCS;         
`ifdef MEM_VERIFY
  reg                             taa_verify;         
  reg                             read_verify;        
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
  time                            Last_tc_ClkB_PosEdge_WEB0;
  time                            Last_tc_ClkB_PosEdge_WEB1;
  time                            Last_tc_ClkB_PosEdge_WEB2;
  time                            Last_tc_ClkB_PosEdge_WEB3;
  assign     DO_                  = {DO_byte3_i,DO_byte2_i,DO_byte1_i,DO_byte0_i};
  assign     con_A                = CSA_;
  assign     con_B                = CSB_;
  assign     con_DI_byte0         = CSB_ & (!WEB0_);
  assign     con_DI_byte1         = CSB_ & (!WEB1_);
  assign     con_DI_byte2         = CSB_ & (!WEB2_);
  assign     con_DI_byte3         = CSB_ & (!WEB3_);
  assign     con_WEB0             = CSB_;
  assign     con_WEB1             = CSB_;
  assign     con_WEB2             = CSB_;
  assign     con_WEB3             = CSB_;
  assign     con_CKA              = CSA_;
  assign     con_CKB              = CSB_;
  assign     cka_per              = CSA_ & !DVSE_;
  assign     ckb_per              = CSB_ & !DVSE_;
  assign     cka_per1             = CSA_ & DVSE_ & DVS_[0] & !DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ckb_per1             = CSB_ & DVSE_ & DVS_[0] & !DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     cka_per2             = CSA_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ckb_per2             = CSB_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     cka_per6             = CSA_ & DVSE_ & !DVS_[0] & DVS_[1] & DVS_[2] & !DVS_[3];
  assign     ckb_per6             = CSB_ & DVSE_ & !DVS_[0] & DVS_[1] & DVS_[2] & !DVS_[3];
  assign     con_DVSE_WA          = CSA_;
  assign     con_DVS_WA           = CSA_ & DVSE_;
  assign     con_DVSE_WB          = CSB_;
  assign     con_DVS_WB           = CSB_ & DVSE_;
  assign     con_NAP              = (!CSA_) & (!CSB_);
  assign     con_CK_NAP           = CSA_CSB_temp & (!NOSTANDBY);

  buf        ido0            (DO0, DO_[0]);                
  buf        ido1            (DO1, DO_[1]);                
  buf        ido2            (DO2, DO_[2]);                
  buf        ido3            (DO3, DO_[3]);                
  buf        ido4            (DO4, DO_[4]);                
  buf        ido5            (DO5, DO_[5]);                
  buf        ido6            (DO6, DO_[6]);                
  buf        ido7            (DO7, DO_[7]);                
  buf        ido8            (DO8, DO_[8]);                
  buf        ido9            (DO9, DO_[9]);                
  buf        ido10           (DO10, DO_[10]);              
  buf        ido11           (DO11, DO_[11]);              
  buf        ido12           (DO12, DO_[12]);              
  buf        ido13           (DO13, DO_[13]);              
  buf        ido14           (DO14, DO_[14]);              
  buf        ido15           (DO15, DO_[15]);              
  buf        ido16           (DO16, DO_[16]);              
  buf        ido17           (DO17, DO_[17]);              
  buf        ido18           (DO18, DO_[18]);              
  buf        ido19           (DO19, DO_[19]);              
  buf        ido20           (DO20, DO_[20]);              
  buf        ido21           (DO21, DO_[21]);              
  buf        ido22           (DO22, DO_[22]);              
  buf        ido23           (DO23, DO_[23]);              
  buf        ido24           (DO24, DO_[24]);              
  buf        ido25           (DO25, DO_[25]);              
  buf        ido26           (DO26, DO_[26]);              
  buf        ido27           (DO27, DO_[27]);              
  buf        ido28           (DO28, DO_[28]);              
  buf        ido29           (DO29, DO_[29]);              
  buf        ido30           (DO30, DO_[30]);              
  buf        ido31           (DO31, DO_[31]);              
  buf        ia0             (A_[0], A0);                  
  buf        ia1             (A_[1], A1);                  
  buf        ia2             (A_[2], A2);                  
  buf        ia3             (A_[3], A3);                  
  buf        ia4             (A_[4], A4);                  
  buf        ia5             (A_[5], A5);                  
  buf        ia6             (A_[6], A6);                  
  buf        ia7             (A_[7], A7);                  
  buf        ia8             (A_[8], A8);                  
  buf        ib0             (B_[0], B0);                  
  buf        ib1             (B_[1], B1);                  
  buf        ib2             (B_[2], B2);                  
  buf        ib3             (B_[3], B3);                  
  buf        ib4             (B_[4], B4);                  
  buf        ib5             (B_[5], B5);                  
  buf        ib6             (B_[6], B6);                  
  buf        ib7             (B_[7], B7);                  
  buf        ib8             (B_[8], B8);                  
  buf        idi_byte0_0     (DI_byte0_[0], DI0);          
  buf        idi_byte0_1     (DI_byte0_[1], DI1);          
  buf        idi_byte0_2     (DI_byte0_[2], DI2);          
  buf        idi_byte0_3     (DI_byte0_[3], DI3);          
  buf        idi_byte0_4     (DI_byte0_[4], DI4);          
  buf        idi_byte0_5     (DI_byte0_[5], DI5);          
  buf        idi_byte0_6     (DI_byte0_[6], DI6);          
  buf        idi_byte0_7     (DI_byte0_[7], DI7);          
  buf        idi_byte1_0     (DI_byte1_[0], DI8);          
  buf        idi_byte1_1     (DI_byte1_[1], DI9);          
  buf        idi_byte1_2     (DI_byte1_[2], DI10);         
  buf        idi_byte1_3     (DI_byte1_[3], DI11);         
  buf        idi_byte1_4     (DI_byte1_[4], DI12);         
  buf        idi_byte1_5     (DI_byte1_[5], DI13);         
  buf        idi_byte1_6     (DI_byte1_[6], DI14);         
  buf        idi_byte1_7     (DI_byte1_[7], DI15);         
  buf        idi_byte2_0     (DI_byte2_[0], DI16);         
  buf        idi_byte2_1     (DI_byte2_[1], DI17);         
  buf        idi_byte2_2     (DI_byte2_[2], DI18);         
  buf        idi_byte2_3     (DI_byte2_[3], DI19);         
  buf        idi_byte2_4     (DI_byte2_[4], DI20);         
  buf        idi_byte2_5     (DI_byte2_[5], DI21);         
  buf        idi_byte2_6     (DI_byte2_[6], DI22);         
  buf        idi_byte2_7     (DI_byte2_[7], DI23);         
  buf        idi_byte3_0     (DI_byte3_[0], DI24);         
  buf        idi_byte3_1     (DI_byte3_[1], DI25);         
  buf        idi_byte3_2     (DI_byte3_[2], DI26);         
  buf        idi_byte3_3     (DI_byte3_[3], DI27);         
  buf        idi_byte3_4     (DI_byte3_[4], DI28);         
  buf        idi_byte3_5     (DI_byte3_[5], DI29);         
  buf        idi_byte3_6     (DI_byte3_[6], DI30);         
  buf        idi_byte3_7     (DI_byte3_[7], DI31);         
  buf        icka            (CKA_, CKA);                  
  buf        ickb            (CKB_, CKB);                  
  not        icsa            (CSA_, CSAN);                 
  not        icsb            (CSB_, CSBN);                 
  buf        iweb0           (WEB0_, WEB0);                
  buf        iweb1           (WEB1_, WEB1);                
  buf        iweb2           (WEB2_, WEB2);                
  buf        iweb3           (WEB3_, WEB3);                

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
    NODELAY0 = 1'b0;
    NODELAY1 = 1'b0;
    NODELAY2 = 1'b0;
    NODELAY3 = 1'b0;
    LastClkAEdge = 1'b0;
    LastClkBEdge = 1'b0;
    DVS_TRIGGER = 1'b0;
`ifdef MEM_INIT_ZERO
    all_core_zero;
`else
`endif
  `ifdef MEM_VERIFY
    taa_verify = 0;
    read_verify = 0;
  `else
  `endif
   NOSTANDBY = 1'b0;
   NAPREG = 1'b0;
   nap_initial_trigger = 1'b0;
   CS_tri_error = 1'b0;
   Violate_Hold_time = 1'b0;
  end

  always @(negedge CSA_) begin
    if (SYN_CS == `FALSE) begin
       ->EventNegCS;
    end
  end
  always @(posedge CSA_) begin
    if (SYN_CS == `FALSE) begin
       disable NegCS;
    end
  end


`ifdef MEM_VERIFY
  always @(posedge CKA_) begin
    if ((CSA_ === 1'b1)) begin
      read_verify = 1;
    end else begin
      read_verify = 0;
    end
  end
`else
`endif

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
      DO_byte0_i = DO_byte0_tmp;
      DO_byte1_i = DO_byte1_tmp;
      DO_byte2_i = DO_byte2_tmp;
      DO_byte3_i = DO_byte3_tmp;
    end
  end

  always @(posedge CSA_) begin
    CSA_temp = 1'b0;
    if ($time !== 1'b0 && NAP_ === 1'b1) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(7);
`endif
      disable NAPT;
      DO_byte0_i = DO_byte0_tmp;
      DO_byte1_i = DO_byte1_tmp;
      DO_byte2_i = DO_byte2_tmp;
      DO_byte3_i = DO_byte3_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DO_byte0_i = DO_byte0_tmp;
      DO_byte1_i = DO_byte1_tmp;
      DO_byte2_i = DO_byte2_tmp;
      DO_byte3_i = DO_byte3_tmp;
    end
  end

  always @(posedge CSB_) begin
    CSB_temp = 1'b0;
    if ($time !== 1'b0 && NAP_ === 1'b1) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(7);
`endif
      disable NAPT;
      DO_byte0_i = DO_byte0_tmp;
      DO_byte1_i = DO_byte1_tmp;
      DO_byte2_i = DO_byte2_tmp;
      DO_byte3_i = DO_byte3_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DO_byte0_i = DO_byte0_tmp;
      DO_byte1_i = DO_byte1_tmp;
      DO_byte2_i = DO_byte2_tmp;
      DO_byte3_i = DO_byte3_tmp;
    end
  end

  always @(posedge NAP_) begin
    if ($time === 0) begin
      disable NAPT;
      DO_byte0_i = DO_byte0_tmp;
      DO_byte1_i = DO_byte1_tmp;
      DO_byte2_i = DO_byte2_tmp;
      DO_byte3_i = DO_byte3_tmp;
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
        DO_byte0_i = DO_byte0_tmp;
        DO_byte1_i = DO_byte1_tmp;
        DO_byte2_i = DO_byte2_tmp;
        DO_byte3_i = DO_byte3_tmp;
      end
    end
  end

  always @(negedge NAP_) begin
    if ($time !== 1'b0 && NAP_ === 1'b0 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
        disable NAPT;
        DO_byte0_i = DO_byte0_tmp;
        DO_byte1_i = DO_byte1_tmp;
        DO_byte2_i = DO_byte2_tmp;
        DO_byte3_i = DO_byte3_tmp;
      end
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
        ErrorMessage(8);
`endif
        disable NAPT;
        DO_byte0_i = DO_byte0_tmp;
        DO_byte1_i = DO_byte1_tmp;
        DO_byte2_i = DO_byte2_tmp;
        DO_byte3_i = DO_byte3_tmp;
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
    DO_byte0_i = DO_byte0_tmp;
    DO_byte1_i = DO_byte1_tmp;
    DO_byte2_i = DO_byte2_tmp;
    DO_byte3_i = DO_byte3_tmp;
  end


  always @(CKA_) begin
    casez ({LastClkAEdge,CKA_})
      2'b01:
        #0
         if (NAP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
           -> EventNAPT;
         end else begin
          if (CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
           last_A = latch_last_A;
           CSA_monitor;
           pre_latch_rdata;
           if (CSA_ !== 0 && DVSE_ === 1'b1) begin
             DVS_TRIGGER = 1'b1;
           end else begin
             DVS_TRIGGER = 1'b0;
           end
           con_dvse   = !DVS_TRIGGER;
           wrong_dvs0 = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs1   = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs2   = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs3 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs4 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs5 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs6   = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs7 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs8 = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs9 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs10 = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs11 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs12 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs13 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs14 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs15 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           if (CSA_==1'b1) Last_tc_ClkA_PosEdge = $time;
           read_memory_function;
`ifdef TRC_CHECK
           trc_timiming_monitorA;
`else
`endif
           latch_last_A = A_;
          end else begin
      #0 disable TOHDO_byte0;
      NODELAY0 = 1'b1;
      DO_byte0_i = {Bits{1'bX}};
      DO_byte0_tmp = {Bits{1'bX}};
      #0 disable TOHDO_byte1;
      NODELAY1 = 1'b1;
      DO_byte1_i = {Bits{1'bX}};
      DO_byte1_tmp = {Bits{1'bX}};
      #0 disable TOHDO_byte2;
      NODELAY2 = 1'b1;
      DO_byte2_i = {Bits{1'bX}};
      DO_byte2_tmp = {Bits{1'bX}};
      #0 disable TOHDO_byte3;
      NODELAY3 = 1'b1;
      DO_byte3_i = {Bits{1'bX}};
      DO_byte3_tmp = {Bits{1'bX}};
          end
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           #0 disable TOHDO_byte0;
           #0 disable TOHDO_byte1;
           #0 disable TOHDO_byte2;
           #0 disable TOHDO_byte3;
           NODELAY0 = 1'b1;
           NODELAY1 = 1'b1;
           NODELAY2 = 1'b1;
           NODELAY3 = 1'b1;
           DO_byte0_i = {Bits{1'bX}};
           DO_byte1_i = {Bits{1'bX}};
           DO_byte2_i = {Bits{1'bX}};
           DO_byte3_i = {Bits{1'bX}};
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
          if (CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
           CSB_monitor;
           pre_latch_wdata;
           if (CSB_ !== 0 && DVSE_ === 1'b1) begin
             DVS_TRIGGER_CKB = 1'b1;
           end else begin
             DVS_TRIGGER_CKB = 1'b0;
           end
           wrong_dvs0_ckb = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs3_ckb = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs4_ckb = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs5_ckb = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs7_ckb = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs8_ckb = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs9_ckb = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs10_ckb = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs11_ckb = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs12_ckb = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs13_ckb = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs14_ckb = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs15_ckb = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           if ((WEB0_==1'b0)&&(CSB_==1'b1)) Last_tc_ClkB_PosEdge_WEB0 = $time;
           if ((WEB1_==1'b0)&&(CSB_==1'b1)) Last_tc_ClkB_PosEdge_WEB1 = $time;
           if ((WEB2_==1'b0)&&(CSB_==1'b1)) Last_tc_ClkB_PosEdge_WEB2 = $time;
           if ((WEB3_==1'b0)&&(CSB_==1'b1)) Last_tc_ClkB_PosEdge_WEB3 = $time;
           write_memory_function;
`ifdef TRC_CHECK
           trc_timiming_monitorB;
`else
`endif
         end else begin
            all_core_x(0,0);
            all_core_x(1,0);
            all_core_x(2,0);
            all_core_x(3,0);
         end
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CSB_ !== 0) begin
              if (WEB0_ !== 1'b1) begin
                 all_core_x(0,0);
              end
              if (WEB1_ !== 1'b1) begin
                 all_core_x(1,0);
              end
              if (WEB2_ !== 1'b1) begin
                 all_core_x(2,0);
              end
              if (WEB3_ !== 1'b1) begin
                 all_core_x(3,0);
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
           n_flag_B0 or
           n_flag_B1 or
           n_flag_B2 or
           n_flag_B3 or
           n_flag_B4 or
           n_flag_B5 or
           n_flag_B6 or
           n_flag_B7 or
           n_flag_B8 or
           n_flag_DI0 or
           n_flag_DI1 or
           n_flag_DI2 or
           n_flag_DI3 or
           n_flag_DI4 or
           n_flag_DI5 or
           n_flag_DI6 or
           n_flag_DI7 or
           n_flag_DI8 or
           n_flag_DI9 or
           n_flag_DI10 or
           n_flag_DI11 or
           n_flag_DI12 or
           n_flag_DI13 or
           n_flag_DI14 or
           n_flag_DI15 or
           n_flag_DI16 or
           n_flag_DI17 or
           n_flag_DI18 or
           n_flag_DI19 or
           n_flag_DI20 or
           n_flag_DI21 or
           n_flag_DI22 or
           n_flag_DI23 or
           n_flag_DI24 or
           n_flag_DI25 or
           n_flag_DI26 or
           n_flag_DI27 or
           n_flag_DI28 or
           n_flag_DI29 or
           n_flag_DI30 or
           n_flag_DI31 or
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_WEB0 or
           n_flag_WEB1 or
           n_flag_WEB2 or
           n_flag_WEB3 or
           n_flag_CSA or
           n_flag_CKA_PER or
           n_flag_CKA_MINH or
           n_flag_CKA_MINL or
           n_flag_CSB or
           n_flag_CKB_PER or
           n_flag_CKB_MINH or
           n_flag_CKB_MINL
          )
     begin
       timingcheck_violation;
     end
     always @(EventNAPT)
       begin: NAPT
      NODELAY0 = 1'b1;
      DO_byte0_i = DO_byte0_tmp;
      NODELAY1 = 1'b1;
      DO_byte1_i = DO_byte1_tmp;
      NODELAY2 = 1'b1;
      DO_byte2_i = DO_byte2_tmp;
      NODELAY3 = 1'b1;
      DO_byte3_i = DO_byte3_tmp;
     end


  always @(EventTOHDO_byte0) 
    begin:TOHDO_byte0 
      if (con_dvse) begin
        #TOH
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs1) begin
        #TOH_1 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs6) begin
        #TOH_6 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end 
  end 

  always @(EventTOHDO_byte1) 
    begin:TOHDO_byte1 
      if (con_dvse) begin
        #TOH
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs1) begin
        #TOH_1 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs6) begin
        #TOH_6 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end 
  end 

  always @(EventTOHDO_byte2) 
    begin:TOHDO_byte2 
      if (con_dvse) begin
        #TOH
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs1) begin
        #TOH_1 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs6) begin
        #TOH_6 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end 
  end 

  always @(EventTOHDO_byte3) 
    begin:TOHDO_byte3 
      if (con_dvse) begin
        #TOH
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs1) begin
        #TOH_1 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs6) begin
        #TOH_6 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end 
  end 

  always @(EventNegCS) 
    begin:NegCS
      #TOH 
      disable TOHDO_byte0;
      NODELAY0 = 1'b0; 
      DO_byte0_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte1;
      NODELAY1 = 1'b0; 
      DO_byte1_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte2;
      NODELAY2 = 1'b0; 
      DO_byte2_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte3;
      NODELAY3 = 1'b0; 
      DO_byte3_i              =  {Bits{1'bX}}; 
  end 

  task timingcheck_violation;
    integer i;
    begin
      // READ PORT
      if ((n_flag_CKA_PER  !== LAST_n_flag_CKA_PER)  ||
          (n_flag_CKA_MINH !== LAST_n_flag_CKA_MINH) ||
          (n_flag_CKA_MINL !== LAST_n_flag_CKA_MINL)) begin
          if (CSA_ !== 1'b0) begin
           #0 disable TOHDO_byte0;
           #0 disable TOHDO_byte1;
           #0 disable TOHDO_byte2;
           #0 disable TOHDO_byte3;
           NODELAY0 = 1'b1;
           NODELAY1 = 1'b1;
           NODELAY2 = 1'b1;
           NODELAY3 = 1'b1;
           DO_byte0_i = {Bits{1'bX}};
           DO_byte1_i = {Bits{1'bX}};
           DO_byte2_i = {Bits{1'bX}};
           DO_byte3_i = {Bits{1'bX}};
          end
      end
      else begin
          NOT_BUS_A  = {
                         n_flag_A8,
                         n_flag_A7,
                         n_flag_A6,
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

          NOT_BUS_DVS  = {
                         n_flag_DVS3,
                         n_flag_DVS2,
                         n_flag_DVS1,
                         n_flag_DVS0};

          for (i=0; i<AddressSize; i=i+1) begin
             Latch_A[i] = (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) ? 1'bx : Latch_A[i];
          end
          for (i=0; i<DVSize; i=i+1) begin
             Latch_DVS[i] = (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) ? 1'bx : Latch_DVS[i];
          end

          Latch_DVSE  =  (n_flag_DVSE  !== LAST_n_flag_DVSE)  ? 1'bx : Latch_DVSE;
          Latch_CSA  =  (n_flag_CSA  !== LAST_n_flag_CSA)  ? 1'bx : Latch_CSA;
          read_memory_function;
      end

      // WRITE PORT
      if ((n_flag_CKB_PER  !== LAST_n_flag_CKB_PER)  ||
          (n_flag_CKB_MINH !== LAST_n_flag_CKB_MINH) ||
          (n_flag_CKB_MINL !== LAST_n_flag_CKB_MINL)) begin
          if (CSB_ !== 1'b0) begin
             if (WEB0_ !== 1'b1) begin
                all_core_x(0,0);
             end
             if (WEB1_ !== 1'b1) begin
                all_core_x(1,0);
             end
             if (WEB2_ !== 1'b1) begin
                all_core_x(2,0);
             end
             if (WEB3_ !== 1'b1) begin
                all_core_x(3,0);
             end
          end
      end
      else begin
          NOT_BUS_B  = {
                         n_flag_B8,
                         n_flag_B7,
                         n_flag_B6,
                         n_flag_B5,
                         n_flag_B4,
                         n_flag_B3,
                         n_flag_B2,
                         n_flag_B1,
                         n_flag_B0};

          NOT_BUS_DI_byte0  = {
                         n_flag_DI7,
                         n_flag_DI6,
                         n_flag_DI5,
                         n_flag_DI4,
                         n_flag_DI3,
                         n_flag_DI2,
                         n_flag_DI1,
                         n_flag_DI0};

          NOT_BUS_DI_byte1  = {
                         n_flag_DI15,
                         n_flag_DI14,
                         n_flag_DI13,
                         n_flag_DI12,
                         n_flag_DI11,
                         n_flag_DI10,
                         n_flag_DI9,
                         n_flag_DI8};

          NOT_BUS_DI_byte2  = {
                         n_flag_DI23,
                         n_flag_DI22,
                         n_flag_DI21,
                         n_flag_DI20,
                         n_flag_DI19,
                         n_flag_DI18,
                         n_flag_DI17,
                         n_flag_DI16};

          NOT_BUS_DI_byte3  = {
                         n_flag_DI31,
                         n_flag_DI30,
                         n_flag_DI29,
                         n_flag_DI28,
                         n_flag_DI27,
                         n_flag_DI26,
                         n_flag_DI25,
                         n_flag_DI24};

          NOT_BUS_DVS  = {
                         n_flag_DVS3,
                         n_flag_DVS2,
                         n_flag_DVS1,
                         n_flag_DVS0};

          for (i=0; i<AddressSize; i=i+1) begin
             Latch_B[i] = (NOT_BUS_B[i] !== LAST_NOT_BUS_B[i]) ? 1'bx : Latch_B[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DI_byte0[i] = (NOT_BUS_DI_byte0[i] !== LAST_NOT_BUS_DI_byte0[i]) ? 1'bx : Latch_DI_byte0[i];
             Latch_DI_byte1[i] = (NOT_BUS_DI_byte1[i] !== LAST_NOT_BUS_DI_byte1[i]) ? 1'bx : Latch_DI_byte1[i];
             Latch_DI_byte2[i] = (NOT_BUS_DI_byte2[i] !== LAST_NOT_BUS_DI_byte2[i]) ? 1'bx : Latch_DI_byte2[i];
             Latch_DI_byte3[i] = (NOT_BUS_DI_byte3[i] !== LAST_NOT_BUS_DI_byte3[i]) ? 1'bx : Latch_DI_byte3[i];
          end
          for (i=0; i<DVSize; i=i+1) begin
             Latch_DVS[i] = (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) ? 1'bx : Latch_DVS[i];
          end

          Latch_DVSE  =  (n_flag_DVSE  !== LAST_n_flag_DVSE)  ? 1'bx : Latch_DVSE;
          Latch_CSB  =  (n_flag_CSB  !== LAST_n_flag_CSB)  ? 1'bx : Latch_CSB;
          Latch_WEB0 = (n_flag_WEB0 !== LAST_n_flag_WEB0)  ? 1'bx : Latch_WEB0;
          Latch_WEB1 = (n_flag_WEB1 !== LAST_n_flag_WEB1)  ? 1'bx : Latch_WEB1;
          Latch_WEB2 = (n_flag_WEB2 !== LAST_n_flag_WEB2)  ? 1'bx : Latch_WEB2;
          Latch_WEB3 = (n_flag_WEB3 !== LAST_n_flag_WEB3)  ? 1'bx : Latch_WEB3;
          write_memory_function;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DI_byte0          = NOT_BUS_DI_byte0;
      LAST_NOT_BUS_DI_byte1          = NOT_BUS_DI_byte1;
      LAST_NOT_BUS_DI_byte2          = NOT_BUS_DI_byte2;
      LAST_NOT_BUS_DI_byte3          = NOT_BUS_DI_byte3;
      LAST_n_flag_WEB0               = n_flag_WEB0;
      LAST_n_flag_WEB1               = n_flag_WEB1;
      LAST_n_flag_WEB2               = n_flag_WEB2;
      LAST_n_flag_WEB3               = n_flag_WEB3;
      LAST_NOT_BUS_B                 = NOT_BUS_B;
      LAST_NOT_BUS_DVS               = NOT_BUS_DVS;
      LAST_n_flag_DVSE               = n_flag_DVSE;
      LAST_n_flag_CSA                = n_flag_CSA;
      LAST_n_flag_CSB                = n_flag_CSB;
      LAST_n_flag_CKA_PER            = n_flag_CKA_PER;
      LAST_n_flag_CKA_MINH           = n_flag_CKA_MINH;
      LAST_n_flag_CKA_MINL           = n_flag_CKA_MINL;
      LAST_n_flag_CKB_PER            = n_flag_CKB_PER;
      LAST_n_flag_CKB_MINH           = n_flag_CKB_MINH;
      LAST_n_flag_CKB_MINL           = n_flag_CKB_MINL;
    end
  endtask // end timingcheck_violation;

  task pre_latch_rdata;
    begin
      Latch_A                        = A_;
      Latch_CSA                      = CSA_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_rdata

  task pre_latch_wdata;
    begin
      Latch_B                        = B_;
      Latch_DI_byte0                 = DI_byte0_;
      Latch_DI_byte1                 = DI_byte1_;
      Latch_DI_byte2                 = DI_byte2_;
      Latch_DI_byte3                 = DI_byte3_;
      Latch_CSB                      = CSB_;
      Latch_WEB0                     = WEB0_;
      Latch_WEB1                     = WEB1_;
      Latch_WEB2                     = WEB2_;
      Latch_WEB3                     = WEB3_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_wdata

  task read_memory_function;
    begin
      A_i                            = Latch_A;
      CSA_i                          = Latch_CSA;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CSA_ == 1'b1) A_monitor;

      casez(CSA_i)
        1'b1: begin
           if (AddressRangeCheck(A_i)) begin
             if ((A_i == LastCycleWAddress_WEB0)&&($time-Last_tc_ClkB_PosEdge_WEB0<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
             end
             else begin
                if (NO_SER_TOH == `TRUE) begin
                   if (A_i !== last_A) begin

                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      DO_byte0_tmp = Memory_byte0[A_i];
                      NODELAY0 = 1'b1;
                      ->EventTOHDO_byte0;
                   `ifdef MEM_VERIFY
                      taa_verify = 0;
                   `else
                   `endif
                     end
                   end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      NODELAY0 = 1'b0;
                      DO_byte0_tmp = Memory_byte0[A_i];
                      DO_byte0_i = DO_byte0_tmp;
                   `ifdef MEM_VERIFY
                      taa_verify = 1;
                   `else
                   `endif
                     end
                   end
                end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte0;
                       NODELAY0 = 1'b1;
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                   NODELAY0 = 1'b1;
                   DO_byte0_tmp = Memory_byte0[A_i];
                   ->EventTOHDO_byte0;
                `ifdef MEM_VERIFY
                   taa_verify = 0;
                `else
                `endif
                     end
                end
             end
             if ((A_i == LastCycleWAddress_WEB1)&&($time-Last_tc_ClkB_PosEdge_WEB1<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
             end
             else begin
                if (NO_SER_TOH == `TRUE) begin
                   if (A_i !== last_A) begin

                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      DO_byte1_tmp = Memory_byte1[A_i];
                      NODELAY1 = 1'b1;
                      ->EventTOHDO_byte1;
                   `ifdef MEM_VERIFY
                      taa_verify = 0;
                   `else
                   `endif
                     end
                   end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      NODELAY1 = 1'b0;
                      DO_byte1_tmp = Memory_byte1[A_i];
                      DO_byte1_i = DO_byte1_tmp;
                   `ifdef MEM_VERIFY
                      taa_verify = 1;
                   `else
                   `endif
                     end
                   end
                end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte1;
                       NODELAY1 = 1'b1;
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                   NODELAY1 = 1'b1;
                   DO_byte1_tmp = Memory_byte1[A_i];
                   ->EventTOHDO_byte1;
                `ifdef MEM_VERIFY
                   taa_verify = 0;
                `else
                `endif
                     end
                end
             end
             if ((A_i == LastCycleWAddress_WEB2)&&($time-Last_tc_ClkB_PosEdge_WEB2<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
             end
             else begin
                if (NO_SER_TOH == `TRUE) begin
                   if (A_i !== last_A) begin

                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      DO_byte2_tmp = Memory_byte2[A_i];
                      NODELAY2 = 1'b1;
                      ->EventTOHDO_byte2;
                   `ifdef MEM_VERIFY
                      taa_verify = 0;
                   `else
                   `endif
                     end
                   end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      NODELAY2 = 1'b0;
                      DO_byte2_tmp = Memory_byte2[A_i];
                      DO_byte2_i = DO_byte2_tmp;
                   `ifdef MEM_VERIFY
                      taa_verify = 1;
                   `else
                   `endif
                     end
                   end
                end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte2;
                       NODELAY2 = 1'b1;
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                   NODELAY2 = 1'b1;
                   DO_byte2_tmp = Memory_byte2[A_i];
                   ->EventTOHDO_byte2;
                `ifdef MEM_VERIFY
                   taa_verify = 0;
                `else
                `endif
                     end
                end
             end
             if ((A_i == LastCycleWAddress_WEB3)&&($time-Last_tc_ClkB_PosEdge_WEB3<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
             end
             else begin
                if (NO_SER_TOH == `TRUE) begin
                   if (A_i !== last_A) begin

                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      DO_byte3_tmp = Memory_byte3[A_i];
                      NODELAY3 = 1'b1;
                      ->EventTOHDO_byte3;
                   `ifdef MEM_VERIFY
                      taa_verify = 0;
                   `else
                   `endif
                     end
                   end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                      NODELAY3 = 1'b0;
                      DO_byte3_tmp = Memory_byte3[A_i];
                      DO_byte3_i = DO_byte3_tmp;
                   `ifdef MEM_VERIFY
                      taa_verify = 1;
                   `else
                   `endif
                     end
                   end
                end else begin
                     if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(9);
`endif
                     end else if (wrong_dvs0 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                    #0 disable TOHDO_byte3;
                       NODELAY3 = 1'b1;
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                     end else begin
                   NODELAY3 = 1'b1;
                   DO_byte3_tmp = Memory_byte3[A_i];
                   ->EventTOHDO_byte3;
                `ifdef MEM_VERIFY
                   taa_verify = 0;
                `else
                `endif
                     end
                end
             end
           end
           else begin
           #0 disable TOHDO_byte0;
           #0 disable TOHDO_byte1;
           #0 disable TOHDO_byte2;
           #0 disable TOHDO_byte3;
           NODELAY0 = 1'b1;
           NODELAY1 = 1'b1;
           NODELAY2 = 1'b1;
           NODELAY3 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                DO_byte1_i = {Bits{1'bX}};
                DO_byte2_i = {Bits{1'bX}};
                DO_byte3_i = {Bits{1'bX}};
             `ifdef MEM_VERIFY
                taa_verify = 0;
             `else
             `endif
           end
           LastCycleRAddress = A_i;
        end
        1'bx: begin
           #0 disable TOHDO_byte0;
           #0 disable TOHDO_byte1;
           #0 disable TOHDO_byte2;
           #0 disable TOHDO_byte3;
           NODELAY0 = 1'b1;
           NODELAY1 = 1'b1;
           NODELAY2 = 1'b1;
           NODELAY3 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                DO_byte1_i = {Bits{1'bX}};
                DO_byte2_i = {Bits{1'bX}};
                DO_byte3_i = {Bits{1'bX}};
        end
      endcase
  end
  endtask //read_memory_function;


  task write_memory_function;
    begin
      B_i                            = Latch_B;
      DI_byte0_i                     = Latch_DI_byte0;
      DI_byte1_i                     = Latch_DI_byte1;
      DI_byte2_i                     = Latch_DI_byte2;
      DI_byte3_i                     = Latch_DI_byte3;
      CSB_i                          = Latch_CSB;
      WEB0_i                         = Latch_WEB0;
      WEB1_i                         = Latch_WEB1;
      WEB2_i                         = Latch_WEB2;
      WEB3_i                         = Latch_WEB3;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CSB_ == 1'b1) B_monitor;


      casez({WEB0_i,CSB_i})
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
             Memory_byte0[B_i] = DI_byte0_i;
             if ((B_i == LastCycleRAddress)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
             end else if (wrong_dvs0_ckb || wrong_dvs3_ckb || wrong_dvs4_ckb || wrong_dvs5_ckb || wrong_dvs7_ckb || wrong_dvs8_ckb || wrong_dvs9_ckb || wrong_dvs10_ckb || wrong_dvs11_ckb || wrong_dvs12_ckb || wrong_dvs13_ckb || wrong_dvs14_ckb || wrong_dvs15_ckb) begin
                NODELAY0 = 1'b1;
                all_core_x(0,1);
`ifdef NO_MEM_MSG
`else
                ErrorMessage(11);
`endif
             end else if (DVSE_i === 1'bX) begin
                #0 disable TOHDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                Memory_byte0[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end else if (^(DVS_i) === 1'bX || DVSE_i === 1'b1) begin
                #0 disable TOHDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                Memory_byte0[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(0,0);
                end
           end
           LastCycleWAddress_WEB0 = B_i;
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte0[B_i] = {Bits{1'bX}};
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(0,0);
                end
           end
        end
      endcase

      casez({WEB1_i,CSB_i})
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
             Memory_byte1[B_i] = DI_byte1_i;
             if ((B_i == LastCycleRAddress)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
             end else if (wrong_dvs0_ckb || wrong_dvs3_ckb || wrong_dvs4_ckb || wrong_dvs5_ckb || wrong_dvs7_ckb || wrong_dvs8_ckb || wrong_dvs9_ckb || wrong_dvs10_ckb || wrong_dvs11_ckb || wrong_dvs12_ckb || wrong_dvs13_ckb || wrong_dvs14_ckb || wrong_dvs15_ckb) begin
                NODELAY1 = 1'b1;
                all_core_x(1,1);
`ifdef NO_MEM_MSG
`else
                ErrorMessage(11);
`endif
             end else if (DVSE_i === 1'bX) begin
                #0 disable TOHDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
                Memory_byte1[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end else if (^(DVS_i) === 1'bX || DVSE_i === 1'b1) begin
                #0 disable TOHDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
                Memory_byte1[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(1,0);
                end
           end
           LastCycleWAddress_WEB1 = B_i;
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte1[B_i] = {Bits{1'bX}};
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(1,0);
                end
           end
        end
      endcase

      casez({WEB2_i,CSB_i})
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
             Memory_byte2[B_i] = DI_byte2_i;
             if ((B_i == LastCycleRAddress)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
             end else if (wrong_dvs0_ckb || wrong_dvs3_ckb || wrong_dvs4_ckb || wrong_dvs5_ckb || wrong_dvs7_ckb || wrong_dvs8_ckb || wrong_dvs9_ckb || wrong_dvs10_ckb || wrong_dvs11_ckb || wrong_dvs12_ckb || wrong_dvs13_ckb || wrong_dvs14_ckb || wrong_dvs15_ckb) begin
                NODELAY2 = 1'b1;
                all_core_x(2,1);
`ifdef NO_MEM_MSG
`else
                ErrorMessage(11);
`endif
             end else if (DVSE_i === 1'bX) begin
                #0 disable TOHDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
                Memory_byte2[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end else if (^(DVS_i) === 1'bX || DVSE_i === 1'b1) begin
                #0 disable TOHDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
                Memory_byte2[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(2,0);
                end
           end
           LastCycleWAddress_WEB2 = B_i;
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte2[B_i] = {Bits{1'bX}};
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(2,0);
                end
           end
        end
      endcase

      casez({WEB3_i,CSB_i})
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
             Memory_byte3[B_i] = DI_byte3_i;
             if ((B_i == LastCycleRAddress)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
             end else if (wrong_dvs0_ckb || wrong_dvs3_ckb || wrong_dvs4_ckb || wrong_dvs5_ckb || wrong_dvs7_ckb || wrong_dvs8_ckb || wrong_dvs9_ckb || wrong_dvs10_ckb || wrong_dvs11_ckb || wrong_dvs12_ckb || wrong_dvs13_ckb || wrong_dvs14_ckb || wrong_dvs15_ckb) begin
                NODELAY3 = 1'b1;
                all_core_x(3,1);
`ifdef NO_MEM_MSG
`else
                ErrorMessage(11);
`endif
             end else if (DVSE_i === 1'bX) begin
                #0 disable TOHDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
                Memory_byte3[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end else if (^(DVS_i) === 1'bX || DVSE_i === 1'b1) begin
                #0 disable TOHDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
                Memory_byte3[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(3,0);
                end
           end
           LastCycleWAddress_WEB3 = B_i;
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory_byte3[B_i] = {Bits{1'bX}};
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(3,0);
                end
           end
        end
      endcase
  end
  endtask //write_memory_function;

  task all_core_x;
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
                         Memory_byte0[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'bX}};
                         end
                       end
             1       : begin
                         Memory_byte1[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'bX}};
                         end
                       end
             2       : begin
                         Memory_byte2[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'bX}};
                         end
                       end
             3       : begin
                         Memory_byte3[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'bX}};
                         end
                       end
             default : begin
                         Memory_byte0[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'bX}};
                         end
                         Memory_byte1[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'bX}};
                         end
                         Memory_byte2[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'bX}};
                         end
                         Memory_byte3[LoopCount_Address]={Bits{1'bX}};
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'bX}};
                         end
                       end
         endcase
         LoopCount_Address=LoopCount_Address-1;
      end
    end
  endtask //end all_core_x;



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
  task trc_timiming_monitorA;
       integer trc1;
       integer trc2;
       integer trc_check;
     begin
       if (trc1 != 0) begin
         trc2 = trc1;
       end
         trc1 = $time;
	 trc_check = trc1 - trc2;
       if (trc_check < TRC_PERIOD) begin
          if (CSA_ !== 1'b0) begin
           #0 disable TOHDO_byte0;
           #0 disable TOHDO_byte1;
           #0 disable TOHDO_byte2;
           #0 disable TOHDO_byte3;
           NODELAY0 = 1'b1;
           NODELAY1 = 1'b1;
           NODELAY2 = 1'b1;
           NODELAY3 = 1'b1;
           DO_byte0_i = {Bits{1'bX}};
           DO_byte1_i = {Bits{1'bX}};
           DO_byte2_i = {Bits{1'bX}};
           DO_byte3_i = {Bits{1'bX}};
          end
       end
     end
  endtask //end trc_timiming_monitorA;

  task trc_timiming_monitorB;
       integer trc1;
       integer trc2;
       integer trc_check;
     begin
       if (trc1 != 0) begin
         trc2 = trc1;
       end
         trc1 = $time;
	 trc_check = trc1 - trc2;
       if (trc_check < TRC_PERIOD) begin
          if (CSB_ !== 1'b0) begin
             if (WEB0_ !== 1'b1) begin
                all_core_x(0,0);
             end
             if (WEB1_ !== 1'b1) begin
                all_core_x(1,0);
             end
             if (WEB2_ !== 1'b1) begin
                all_core_x(2,0);
             end
             if (WEB3_ !== 1'b1) begin
                all_core_x(3,0);
             end
          end
       end
     end
  endtask //end trc_timiming_monitorB;
`else
`endif

`ifdef MEM_INIT_ZERO
  task all_core_zero;
     integer LoopCount_Address;
     begin
       LoopCount_Address=Words-1;
       while(LoopCount_Address >=0) begin
       Memory_byte0[LoopCount_Address]={Bits{1'b0}};
          #0 disable TOHDO_byte0;
          NODELAY0 = 1'b1;
          DO_byte0_i = {Bits{1'b0}};
       Memory_byte1[LoopCount_Address]={Bits{1'b0}};
          #0 disable TOHDO_byte1;
          NODELAY1 = 1'b1;
          DO_byte1_i = {Bits{1'b0}};
       Memory_byte2[LoopCount_Address]={Bits{1'b0}};
          #0 disable TOHDO_byte2;
          NODELAY2 = 1'b1;
          DO_byte2_i = {Bits{1'b0}};
       Memory_byte3[LoopCount_Address]={Bits{1'b0}};
          #0 disable TOHDO_byte3;
          NODELAY3 = 1'b1;
          DO_byte3_i = {Bits{1'b0}};
         LoopCount_Address=LoopCount_Address-1;
       end
    end
  endtask //end all_core_zero;
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
         7: $display("** MEM_Error: CSAN or CSBN negedge trigger, NAP be operated high, so DO is unknown, all memory core is unknown %m",$time);
         8: $display("** MEM_Error: NAP is unknow or high-z, DO keep data, all memory core keep data %m",$time);
         9: $display("** MEM_Error: DVS or DVSE appear unknown state (%t) in clock of %m",$time);
        11: $display("** MEM_Error: DVS doesn't operate the status (%t) in clock of %m",$time);
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
      specparam TAA    = (95.8:152.1:269.1);
      specparam TAA_1  = (104.5:168.6:303.9);
      specparam TAA_2  = (95.8:152.1:269.1);
      specparam TAA_6  = (88.2:138.2:239.5);
      specparam TRC  = (82.9:132.9:238.0);
      specparam TRC_1    = (91.9:149.8:273.7);
      specparam TRC_2    = (82.9:132.9:238.0);
      specparam TRC_6    = (78.4:123.9:216.5);
      specparam THPW = (15.6:25.1:40.4);
      specparam TLPW = (18.0:26.5:45.7);
      specparam TAS  = (11.3:16.5:22.4);
      specparam TAH  = (14.5:18.6:24.8);
      specparam TWS  = (10.5:16.5:27.9);
      specparam TWH  = (9.9:12.7:19.5);
      specparam TDS  = (10.6:15.8:30.3);
      specparam TDH  = (7.1:7.9:8.6);
      specparam TCSS = (17.2:29.3:37.6);
      specparam TCSH = (20.4:28.7:48.7);
      specparam TNAPH  = (15.4:29.3:52.7);
      specparam TNAP_CSH  = (31.5:50.6:80.9);
      specparam TDVSES  = (11.3:16.5:22.4);
      specparam TDVSEH  = (75.1:121.3:217.3);
      specparam TDVSS   = (11.3:16.5:22.4);
      specparam TDVSH   = (75.1:121.3:217.3);
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
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  posedge DI7, TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CKB &&& con_DI_byte0,  negedge DI7, TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI8, TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI8, TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI9, TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI9, TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI10, TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI10, TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI11, TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI11, TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI12, TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI12, TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI13, TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI13, TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI14, TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI14, TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  posedge DI15, TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CKB &&& con_DI_byte1,  negedge DI15, TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI16, TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI16, TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI17, TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI17, TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI18, TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI18, TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI19, TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI19, TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI20, TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI20, TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI21, TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI21, TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI22, TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI22, TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  posedge DI23, TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CKB &&& con_DI_byte2,  negedge DI23, TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI24, TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI24, TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI25, TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI25, TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI26, TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI26, TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI27, TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI27, TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI28, TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI28, TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI29, TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI29, TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI30, TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI30, TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  posedge DI31, TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CKB &&& con_DI_byte3,  negedge DI31, TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CKB &&& con_WEB0,      posedge WEB0, TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CKB &&& con_WEB0,      negedge WEB0, TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CKB &&& con_WEB1,      posedge WEB1, TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CKB &&& con_WEB1,      negedge WEB1, TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CKB &&& con_WEB2,      posedge WEB2, TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CKB &&& con_WEB2,      negedge WEB2, TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CKB &&& con_WEB3,      posedge WEB3, TWS,     TWH,     n_flag_WEB3    );
      $setuphold ( posedge CKB &&& con_WEB3,      negedge WEB3, TWS,     TWH,     n_flag_WEB3    );
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
      $period    ( negedge CKA &&& cka_per,       TRC,                       n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per1,      TRC_1,                     n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per2,      TRC_2,                     n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per6,      TRC_6,                     n_flag_CKA_PER );
      $period    ( negedge CKA &&& cka_per1,      TRC_1,                     n_flag_CKA_PER );
      $period    ( negedge CKA &&& cka_per2,      TRC_2,                     n_flag_CKA_PER );
      $period    ( negedge CKA &&& cka_per6,      TRC_6,                     n_flag_CKA_PER );
      $width     ( posedge CKA &&& con_CKA,       THPW,    0,                n_flag_CKA_MINH);
      $width     ( negedge CKA &&& con_CKA,       TLPW,    0,                n_flag_CKA_MINL);
      $period    ( posedge CKB &&& ckb_per,       TRC,                       n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per,       TRC,                       n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per1,      TRC_1,                     n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per2,      TRC_2,                     n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per6,      TRC_6,                     n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per1,      TRC_1,                     n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per2,      TRC_2,                     n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per6,      TRC_6,                     n_flag_CKB_PER );
      $width     ( posedge CKB &&& con_CKB,       THPW,    0,                n_flag_CKB_MINH);
      $width     ( negedge CKB &&& con_CKB,       TLPW,    0,                n_flag_CKB_MINL);
      $setuphold ( posedge CKA,                   posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );
      $setuphold ( posedge CKB,                   posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );

      $setuphold ( negedge NAP &&& CSBN,          negedge CSAN, 0,       TNAP_CSH, n_flag_NAP_CS  );
      $setuphold ( negedge NAP &&& CSAN,          negedge CSBN, 0,       TNAP_CSH, n_flag_NAP_CS  );


      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO0 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO1 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO2 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO3 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO4 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO5 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO6 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse)  (posedge CKA => (DO7 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO0 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO1 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO2 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO3 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO4 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO5 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO6 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs1)  (posedge CKA => (DO7 :1'bx)) = TAA_1;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO0 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO1 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO2 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO3 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO4 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO5 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO6 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2)  (posedge CKA => (DO7 :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO0 :1'bx)) = TAA_6;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO1 :1'bx)) = TAA_6;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO2 :1'bx)) = TAA_6;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO3 :1'bx)) = TAA_6;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO4 :1'bx)) = TAA_6;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO5 :1'bx)) = TAA_6;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO6 :1'bx)) = TAA_6;
      if (NODELAY0 == 0 && con_dvs6)  (posedge CKA => (DO7 :1'bx)) = TAA_6;

      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO8 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO9 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO10 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO11 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO12 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO13 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO14 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse)  (posedge CKA => (DO15 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO8 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO9 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO10 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO11 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO12 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO13 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO14 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs1)  (posedge CKA => (DO15 :1'bx)) = TAA_1;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO8 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO9 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO10 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO11 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO12 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO13 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO14 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2)  (posedge CKA => (DO15 :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO8 :1'bx)) = TAA_6;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO9 :1'bx)) = TAA_6;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO10 :1'bx)) = TAA_6;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO11 :1'bx)) = TAA_6;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO12 :1'bx)) = TAA_6;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO13 :1'bx)) = TAA_6;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO14 :1'bx)) = TAA_6;
      if (NODELAY1 == 0 && con_dvs6)  (posedge CKA => (DO15 :1'bx)) = TAA_6;

      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO16 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO17 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO18 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO19 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO20 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO21 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO22 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse)  (posedge CKA => (DO23 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO16 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO17 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO18 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO19 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO20 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO21 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO22 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs1)  (posedge CKA => (DO23 :1'bx)) = TAA_1;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO16 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO17 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO18 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO19 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO20 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO21 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO22 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2)  (posedge CKA => (DO23 :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO16 :1'bx)) = TAA_6;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO17 :1'bx)) = TAA_6;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO18 :1'bx)) = TAA_6;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO19 :1'bx)) = TAA_6;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO20 :1'bx)) = TAA_6;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO21 :1'bx)) = TAA_6;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO22 :1'bx)) = TAA_6;
      if (NODELAY2 == 0 && con_dvs6)  (posedge CKA => (DO23 :1'bx)) = TAA_6;

      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO24 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO25 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO26 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO27 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO28 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO29 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO30 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse)  (posedge CKA => (DO31 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO24 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO25 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO26 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO27 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO28 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO29 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO30 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs1)  (posedge CKA => (DO31 :1'bx)) = TAA_1;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO24 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO25 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO26 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO27 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO28 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO29 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO30 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2)  (posedge CKA => (DO31 :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO24 :1'bx)) = TAA_6;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO25 :1'bx)) = TAA_6;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO26 :1'bx)) = TAA_6;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO27 :1'bx)) = TAA_6;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO28 :1'bx)) = TAA_6;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO29 :1'bx)) = TAA_6;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO30 :1'bx)) = TAA_6;
      if (NODELAY3 == 0 && con_dvs6)  (posedge CKA => (DO31 :1'bx)) = TAA_6;



   endspecify

`endprotect
endmodule
