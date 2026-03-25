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
       Word               :  512                             
       Bit                :  32                              
       Byte               :  1                               
       Mux                :  4                               
       Output Loading     :  0.3                             
       Clock Input Slew   :  0.4                             
       Data Input Slew    :  0.4                             
       Ring Type          :  Ringless Model                  
       Ring Width         :  0                               
       Bus Format         :  0                               
       Memaker Path       :  /home/autumn/pdk/memory/ftclib  
       GUI Version        :  m20130120                       
       Date               :  2024/08/21 03:24:08             
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


module SJLA40_512X32X1CM4 (DOA0,DOA1,DOA2,DOA3,DOA4,DOA5,DOA6,DOA7,DOA8,
                           DOA9,DOA10,DOA11,DOA12,DOA13,DOA14,DOA15,
                           DOA16,DOA17,DOA18,DOA19,DOA20,DOA21,DOA22,
                           DOA23,DOA24,DOA25,DOA26,DOA27,DOA28,DOA29,
                           DOA30,DOA31,DOB0,DOB1,DOB2,DOB3,DOB4,
                           DOB5,DOB6,DOB7,DOB8,DOB9,DOB10,DOB11,DOB12,
                           DOB13,DOB14,DOB15,DOB16,DOB17,DOB18,DOB19,
                           DOB20,DOB21,DOB22,DOB23,DOB24,DOB25,DOB26,
                           DOB27,DOB28,DOB29,DOB30,DOB31,A0,A1,
                           A2,A3,A4,A5,A6,A7,A8,B0,B1,B2,B3,B4,B5,B6,B7,B8,
                           DIA0,DIA1,DIA2,DIA3,DIA4,DIA5,DIA6,DIA7,DIA8,
                           DIA9,DIA10,DIA11,DIA12,DIA13,DIA14,DIA15,
                           DIA16,DIA17,DIA18,DIA19,DIA20,DIA21,DIA22,
                           DIA23,DIA24,DIA25,DIA26,DIA27,DIA28,DIA29,
                           DIA30,DIA31,DIB0,DIB1,DIB2,DIB3,DIB4,
                           DIB5,DIB6,DIB7,DIB8,DIB9,DIB10,DIB11,DIB12,
                           DIB13,DIB14,DIB15,DIB16,DIB17,DIB18,DIB19,
                           DIB20,DIB21,DIB22,DIB23,DIB24,DIB25,DIB26,
                           DIB27,DIB28,DIB29,DIB30,DIB31,WEAN,WEBN,CSAN,
                           CSBN,CKA,DVSE,DVS0,DVS1,DVS2,DVS3,
                           CKB,NAP);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 9;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 32;               
  parameter  Words                = 512;              
  parameter  Bytes                = 1;                
  parameter  AspectRatio          = 4;                
  parameter  Tr2w                 = (103.4:185.6:383.1);
  parameter  Tw2r                 = (103.4:187.4:383.1);
  parameter  TOH                  = (79.1:131.1:273.5);
  parameter  TOH_1                = (90.9:152.6:325.8);
  parameter  TOH_2                = (79.1:131.1:273.5);
  parameter  TOH_3                = (73.7:121.5:251.1);
  parameter  TWDX                 = (63.8:105.7:221.2);
  parameter  TWDX_1               = (73.0:122.8:262.8);
  parameter  TWDX_2               = (63.8:105.7:221.2);
  parameter  TWDX_3               = (59.5:97.9:203.2);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (103.4:187.4:383.1);
`else
`endif
  parameter  TNAP_Wakeup          = 0;                

  output     DOA0,DOA1,DOA2,DOA3,DOA4,DOA5,DOA6,DOA7,DOA8,
             DOA9,DOA10,DOA11,DOA12,DOA13,DOA14,DOA15,DOA16,DOA17,DOA18,
             DOA19,DOA20,DOA21,DOA22,DOA23,DOA24,DOA25,DOA26,DOA27,DOA28,
             DOA29,DOA30,DOA31;
  output     DOB0,DOB1,DOB2,DOB3,DOB4,DOB5,DOB6,DOB7,DOB8,
             DOB9,DOB10,DOB11,DOB12,DOB13,DOB14,DOB15,DOB16,DOB17,DOB18,
             DOB19,DOB20,DOB21,DOB22,DOB23,DOB24,DOB25,DOB26,DOB27,DOB28,
             DOB29,DOB30,DOB31;
  input      DIA0,DIA1,DIA2,DIA3,DIA4,DIA5,DIA6,DIA7,DIA8,
             DIA9,DIA10,DIA11,DIA12,DIA13,DIA14,DIA15,DIA16,DIA17,DIA18,
             DIA19,DIA20,DIA21,DIA22,DIA23,DIA24,DIA25,DIA26,DIA27,DIA28,
             DIA29,DIA30,DIA31;
  input      DIB0,DIB1,DIB2,DIB3,DIB4,DIB5,DIB6,DIB7,DIB8,
             DIB9,DIB10,DIB11,DIB12,DIB13,DIB14,DIB15,DIB16,DIB17,DIB18,
             DIB19,DIB20,DIB21,DIB22,DIB23,DIB24,DIB25,DIB26,DIB27,DIB28,
             DIB29,DIB30,DIB31;
  input      A0,A1,A2,A3,A4,A5,A6,A7,A8;
  input      B0,B1,B2,B3,B4,B5,B6,B7,B8;
  input      DVSE;                                    
  input      DVS0,DVS1,DVS2,DVS3;
  input      WEAN;                                    
  input      WEBN;                                    
  input      CKA;                                     
  input      CKB;                                     
  input      CSAN;                                    
  input      CSBN;                                    
  input      NAP;                                     

`protect
  reg        [Bits-1:0]           Memory [Words-1:0];           


  wire       [Bytes*Bits-1:0]     DOA_;               
  wire       [Bytes*Bits-1:0]     DOB_;               
  wire       [AddressSize-1:0]    A_;                 
  wire       [AddressSize-1:0]    B_;                 
  wire       [Bits-1:0]           DIA_;               
  wire       [Bits-1:0]           DIB_;               
  wire                            WEBN_;              
  wire                            WEAN_;              
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

  reg                             reada;              
  reg                             writea;             
  reg                             readb;              
  reg                             writeb;             

  wire                            NAP_;               



  wire                            con_A;              
  wire                            con_B;              
  wire                            con_DIA;            
  wire                            con_DIB;            
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
  wire                            con_WEAN;           
  wire                            con_WEBN;           
  wire                            con_DVSE_WA;        
  wire                            con_DVS_WA;         
  wire                            con_DVSE_WB;        
  wire                            con_DVS_WB;         

  reg        [AddressSize-1:0]    Latch_A;            
  reg        [AddressSize-1:0]    Latch_B;            
  reg        [Bits-1:0]           Latch_DIA;          
  reg        [Bits-1:0]           Latch_DIB;          
  reg                             Latch_WEAN;         
  reg                             Latch_WEBN;         
  reg                             Latch_CSA;          
  reg                             Latch_CSB;          
  reg                             Latch_DVSE;         
  reg        [DVSize-1:0]         Latch_DVS;          
  reg        [AddressSize-1:0]    LastCycleAAddress;  
  reg        [AddressSize-1:0]    LastCycleBAddress;  

  reg        [AddressSize-1:0]    A_i;                
  reg        [AddressSize-1:0]    B_i;                
  reg        [Bits-1:0]           DIA_i;              
  reg        [Bits-1:0]           DIB_i;              
  reg                             WEAN_i;             
  reg                             WEBN_i;             
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
  reg                             n_flag_WEAN;        
  reg                             n_flag_WEBN;        
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
  reg                             LAST_n_flag_WEAN;   
  reg                             LAST_n_flag_WEBN;   
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
  reg        [Bits-1:0]           NOT_BUS_DIA;        
  reg        [Bits-1:0]           NOT_BUS_DIB;        
  reg        [Bits-1:0]           LAST_NOT_BUS_DIA;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DIB;   

  reg                             LAST_n_flag_DVSE;   
  reg        [DVSize-1:0]         NOT_BUS_DVS;        
  reg        [DVSize-1:0]         LAST_NOT_BUS_DVS;   

  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       
  reg        [AddressSize-1:0]    last_B;             
  reg        [AddressSize-1:0]    latch_last_B;       

  reg        [Bits-1:0]           last_DIA;           
  reg        [Bits-1:0]           latch_last_DIA;     
  reg        [Bits-1:0]           last_DIB;           
  reg        [Bits-1:0]           latch_last_DIB;     

  reg                             last_WEAN;          
  reg                             latch_last_WEAN;    
  reg                             last_WEBN;          
  reg                             latch_last_WEBN;    

  reg        [Bits-1:0]           DOA_i;              
  reg        [Bits-1:0]           DOB_i;              


  reg                             LastClkAEdge;       
  reg                             LastClkBEdge;       

  reg                             Last_WEAN_i;        
  reg                             Last_WEBN_i;        

  reg                             flag_A_x;           
  reg                             flag_B_x;           
  reg                             flag_CSA_x;         
  reg                             flag_CSB_x;         
  reg                             NODELAYA;           
  reg                             NODELAYB;           
  reg        [Bits-1:0]           DOA_tmp;            
  reg        [Bits-1:0]           DOB_tmp;            
  event                           EventTOHDOA;        
  event                           EventTOHDOB;        
  event                           EventTWDXDOA;       
  event                           EventTWDXDOB;       

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
  assign     DOA_                 = {DOA_i};
  assign     DOB_                 = {DOB_i};
  assign     con_A                = CSA_;
  assign     con_B                = CSB_;
  assign     con_DIA              = CSA_ & (!WEAN_);
  assign     con_DIB              = CSB_ & (!WEBN_);
  assign     con_WEAN             = CSA_;
  assign     con_WEBN             = CSB_;
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
  buf        idia_0          (DIA_[0], DIA0);              
  buf        idib_0          (DIB_[0], DIB0);              
  buf        idia_1          (DIA_[1], DIA1);              
  buf        idib_1          (DIB_[1], DIB1);              
  buf        idia_2          (DIA_[2], DIA2);              
  buf        idib_2          (DIB_[2], DIB2);              
  buf        idia_3          (DIA_[3], DIA3);              
  buf        idib_3          (DIB_[3], DIB3);              
  buf        idia_4          (DIA_[4], DIA4);              
  buf        idib_4          (DIB_[4], DIB4);              
  buf        idia_5          (DIA_[5], DIA5);              
  buf        idib_5          (DIB_[5], DIB5);              
  buf        idia_6          (DIA_[6], DIA6);              
  buf        idib_6          (DIB_[6], DIB6);              
  buf        idia_7          (DIA_[7], DIA7);              
  buf        idib_7          (DIB_[7], DIB7);              
  buf        idia_8          (DIA_[8], DIA8);              
  buf        idib_8          (DIB_[8], DIB8);              
  buf        idia_9          (DIA_[9], DIA9);              
  buf        idib_9          (DIB_[9], DIB9);              
  buf        idia_10         (DIA_[10], DIA10);            
  buf        idib_10         (DIB_[10], DIB10);            
  buf        idia_11         (DIA_[11], DIA11);            
  buf        idib_11         (DIB_[11], DIB11);            
  buf        idia_12         (DIA_[12], DIA12);            
  buf        idib_12         (DIB_[12], DIB12);            
  buf        idia_13         (DIA_[13], DIA13);            
  buf        idib_13         (DIB_[13], DIB13);            
  buf        idia_14         (DIA_[14], DIA14);            
  buf        idib_14         (DIB_[14], DIB14);            
  buf        idia_15         (DIA_[15], DIA15);            
  buf        idib_15         (DIB_[15], DIB15);            
  buf        idia_16         (DIA_[16], DIA16);            
  buf        idib_16         (DIB_[16], DIB16);            
  buf        idia_17         (DIA_[17], DIA17);            
  buf        idib_17         (DIB_[17], DIB17);            
  buf        idia_18         (DIA_[18], DIA18);            
  buf        idib_18         (DIB_[18], DIB18);            
  buf        idia_19         (DIA_[19], DIA19);            
  buf        idib_19         (DIB_[19], DIB19);            
  buf        idia_20         (DIA_[20], DIA20);            
  buf        idib_20         (DIB_[20], DIB20);            
  buf        idia_21         (DIA_[21], DIA21);            
  buf        idib_21         (DIB_[21], DIB21);            
  buf        idia_22         (DIA_[22], DIA22);            
  buf        idib_22         (DIB_[22], DIB22);            
  buf        idia_23         (DIA_[23], DIA23);            
  buf        idib_23         (DIB_[23], DIB23);            
  buf        idia_24         (DIA_[24], DIA24);            
  buf        idib_24         (DIB_[24], DIB24);            
  buf        idia_25         (DIA_[25], DIA25);            
  buf        idib_25         (DIB_[25], DIB25);            
  buf        idia_26         (DIA_[26], DIA26);            
  buf        idib_26         (DIB_[26], DIB26);            
  buf        idia_27         (DIA_[27], DIA27);            
  buf        idib_27         (DIB_[27], DIB27);            
  buf        idia_28         (DIA_[28], DIA28);            
  buf        idib_28         (DIB_[28], DIB28);            
  buf        idia_29         (DIA_[29], DIA29);            
  buf        idib_29         (DIB_[29], DIB29);            
  buf        idia_30         (DIA_[30], DIA30);            
  buf        idib_30         (DIB_[30], DIB30);            
  buf        idia_31         (DIA_[31], DIA31);            
  buf        idib_31         (DIB_[31], DIB31);            
  buf        icka            (CKA_, CKA);                  
  buf        ickb            (CKB_, CKB);                  
  not        icsa            (CSA_, CSAN);                 
  not        icsb            (CSB_, CSBN);                 
  buf        iwea0           (WEAN_, WEAN);                
  buf        iweb0           (WEBN_, WEBN);                

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
    NODELAYA = 1'b0;
    NODELAYB = 1'b0;
    LastClkAEdge = 1'b0;
    LastClkBEdge = 1'b0;
    DVSA_TRIGGER = 1'b0;
    DVSB_TRIGGER = 1'b0;
  `ifdef MEM_INIT_ZERO
       all_core_xA(9999,0);
       all_core_xB(9999,0);
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
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
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
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz) && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
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
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz) && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
    end
  end


  always @(posedge NAP_) begin
    if ($time === 0) begin
      disable NAPT;
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
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
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
      end
    end
  end

  always @(negedge NAP_) begin
    if ($time !== 1'b0 && NAP_ === 1'b0 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
        disable NAPT;
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
      end
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
        ErrorMessage(8);
`endif
        disable NAPT;
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
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
      DOA_i    = DOA_tmp;
      DOB_i    = DOB_tmp;
  end


  always @(CKA_) begin
    casez ({LastClkAEdge,CKA_})
      2'b01:
        #0
         if (NAP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
            -> EventNAPT;
         end else begin
           last_A = latch_last_A;
           last_DIA = latch_last_DIA;
           last_WEAN = latch_last_WEAN;
           CSA_monitor;
           pre_latch_dataA;
           reada = WEAN_;
           writea = !WEAN_;
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
           latch_last_DIA = DIA_;
           latch_last_WEAN = WEAN_;
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CSA_ !== 0) begin
              if (WEAN_ !== 1'b1) begin
                 all_core_xA(9999,1);
              end else begin
                 #0 disable TOHDOA;
                    disable TWDXDOA;
                 NODELAYA = 1'b1;
                 DOA_i = {Bits{1'bX}};
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
           last_DIB = latch_last_DIB;
           last_WEBN = latch_last_WEBN;
           CSB_monitor;
           pre_latch_dataB;
           readb = WEBN_;
           writeb = !WEBN_;
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
           latch_last_DIB = DIB_;
           latch_last_WEBN = WEBN_;
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CSB_ !== 0) begin
              if (WEBN_ !== 1'b1) begin
                 all_core_xB(9999,1);
              end else begin
                 #0 disable TOHDOB;
                    disable TWDXDOB;
                 NODELAYB = 1'b1;
                 DOB_i = {Bits{1'bX}};
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
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_WEAN or
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
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_WEBN or
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
      NODELAYA <= 1'b1;
      NODELAYB <= 1'b1;
      DOA_i    <= DOA_tmp;
      DOB_i    <= DOB_tmp;
  end

  always @(EventTOHDOA) 
    begin:TOHDOA 
      if (con_dvsea) begin
        #TOH 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end else if (con_dvsa1) begin
        #TOH_1 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end else if (con_dvsa2) begin
        #TOH_2 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end else if (con_dvsa3) begin
        #TOH_3 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end 
  end 

  always @(EventTOHDOB) 
    begin:TOHDOB 
      if (con_dvseb) begin
        #TOH 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
      end else if (con_dvsb1) begin
        #TOH_1 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
      end else if (con_dvsb2) begin
        #TOH_2 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
      end else if (con_dvsb3) begin
        #TOH_3 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
      end 
  end 


  always @(EventTWDXDOA) 
    begin:TWDXDOA 
      if (con_dvsea) begin
        #TWDX 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end else if (con_dvsa1) begin
        #TWDX_1 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end else if (con_dvsa2) begin
        #TWDX_2 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end else if (con_dvsa3) begin
        #TWDX_3 
        NODELAYA <= 1'b0; 
        DOA_i              =  {Bits{1'bX}}; 
        DOA_i              <= DOA_tmp; 
      end 
  end 


  always @(EventTWDXDOB) 
    begin:TWDXDOB 
      if (con_dvseb) begin
        #TWDX 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
      end else if (con_dvsb1) begin
        #TWDX_1 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
      end else if (con_dvsb2) begin
        #TWDX_2 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
      end else if (con_dvsb3) begin
        #TWDX_3 
        NODELAYB <= 1'b0; 
        DOB_i              =  {Bits{1'bX}}; 
        DOB_i              <= DOB_tmp; 
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
             if (WEAN_ !== 1'b1) begin
                all_core_xA(9999,1);
             end
             else begin
                #0 disable TOHDOA;
                   disable TWDXDOA;
                NODELAYA = 1'b1;
                DOA_i = {Bits{1'bX}};
             end
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

          NOT_BUS_DIA  = {
                         n_flag_DIA31,
                         n_flag_DIA30,
                         n_flag_DIA29,
                         n_flag_DIA28,
                         n_flag_DIA27,
                         n_flag_DIA26,
                         n_flag_DIA25,
                         n_flag_DIA24,
                         n_flag_DIA23,
                         n_flag_DIA22,
                         n_flag_DIA21,
                         n_flag_DIA20,
                         n_flag_DIA19,
                         n_flag_DIA18,
                         n_flag_DIA17,
                         n_flag_DIA16,
                         n_flag_DIA15,
                         n_flag_DIA14,
                         n_flag_DIA13,
                         n_flag_DIA12,
                         n_flag_DIA11,
                         n_flag_DIA10,
                         n_flag_DIA9,
                         n_flag_DIA8,
                         n_flag_DIA7,
                         n_flag_DIA6,
                         n_flag_DIA5,
                         n_flag_DIA4,
                         n_flag_DIA3,
                         n_flag_DIA2,
                         n_flag_DIA1,
                         n_flag_DIA0};

          NOT_BUS_DVS  = {
                         n_flag_DVS3,
                         n_flag_DVS2,
                         n_flag_DVS1,
                         n_flag_DVS0};


          for (i=0; i<AddressSize; i=i+1) begin
             Latch_A[i] = (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) ? 1'bx : Latch_A[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DIA[i] = (NOT_BUS_DIA[i] !== LAST_NOT_BUS_DIA[i]) ? 1'bx : Latch_DIA[i];
          end
          for (i=0; i<DVSize; i=i+1) begin
             Latch_DVS[i] = (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) ? 1'bx : Latch_DVS[i];
          end

          Latch_DVSE  =  (n_flag_DVSE  !== LAST_n_flag_DVSE)  ? 1'bx : Latch_DVSE;
          Latch_CSA  =  (n_flag_CSA  !== LAST_n_flag_CSA)  ? 1'bx : Latch_CSA;
          Latch_WEAN = (n_flag_WEAN !== LAST_n_flag_WEAN)  ? 1'bx : Latch_WEAN;
          memory_functionA;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DIA               = NOT_BUS_DIA;
      LAST_n_flag_WEAN               = n_flag_WEAN;
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
             if (WEBN_ !== 1'b1) begin
                all_core_xB(9999,1);
             end
             else begin
                #0 disable TOHDOB;
                   disable TWDXDOB;
                NODELAYB = 1'b1;
                DOB_i = {Bits{1'bX}};
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

          NOT_BUS_DIB  = {
                         n_flag_DIB31,
                         n_flag_DIB30,
                         n_flag_DIB29,
                         n_flag_DIB28,
                         n_flag_DIB27,
                         n_flag_DIB26,
                         n_flag_DIB25,
                         n_flag_DIB24,
                         n_flag_DIB23,
                         n_flag_DIB22,
                         n_flag_DIB21,
                         n_flag_DIB20,
                         n_flag_DIB19,
                         n_flag_DIB18,
                         n_flag_DIB17,
                         n_flag_DIB16,
                         n_flag_DIB15,
                         n_flag_DIB14,
                         n_flag_DIB13,
                         n_flag_DIB12,
                         n_flag_DIB11,
                         n_flag_DIB10,
                         n_flag_DIB9,
                         n_flag_DIB8,
                         n_flag_DIB7,
                         n_flag_DIB6,
                         n_flag_DIB5,
                         n_flag_DIB4,
                         n_flag_DIB3,
                         n_flag_DIB2,
                         n_flag_DIB1,
                         n_flag_DIB0};

          NOT_BUS_DVS  = {
                         n_flag_DVS3,
                         n_flag_DVS2,
                         n_flag_DVS1,
                         n_flag_DVS0};


          for (i=0; i<AddressSize; i=i+1) begin
             Latch_B[i] = (NOT_BUS_B[i] !== LAST_NOT_BUS_B[i]) ? 1'bx : Latch_B[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DIB[i] = (NOT_BUS_DIB[i] !== LAST_NOT_BUS_DIB[i]) ? 1'bx : Latch_DIB[i];
          end
          for (i=0; i<DVSize; i=i+1) begin
             Latch_DVS[i] = (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) ? 1'bx : Latch_DVS[i];
          end

          Latch_DVSE  =  (n_flag_DVSE  !== LAST_n_flag_DVSE)  ? 1'bx : Latch_DVSE;
          Latch_CSB  =  (n_flag_CSB  !== LAST_n_flag_CSB)  ? 1'bx : Latch_CSB;
          Latch_WEBN = (n_flag_WEBN !== LAST_n_flag_WEBN)  ? 1'bx : Latch_WEBN;
          memory_functionB;
      end

      LAST_NOT_BUS_B                 = NOT_BUS_B;
      LAST_NOT_BUS_DIB               = NOT_BUS_DIB;
      LAST_n_flag_WEBN               = n_flag_WEBN;
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
      Latch_DIA                      = DIA_;
      Latch_CSA                      = CSA_;
      Latch_WEAN                     = WEAN_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_dataA

  task pre_latch_dataB;
    begin
      Latch_B                        = B_;
      Latch_DIB                      = DIB_;
      Latch_CSB                      = CSB_;
      Latch_WEBN                     = WEBN_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_dataB

  task memory_functionA;
    begin
      A_i                            = Latch_A;
      DIA_i                          = Latch_DIA;
      WEAN_i                         = Latch_WEAN;
      CSA_i                          = Latch_CSA;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CSA_ == 1'b1) A_monitor;

      casez({WEAN_i,CSA_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if ((A_i == LastCycleBAddress)&&
                  (Last_WEBN_i == 1'b0) &&
                  ($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOA;
                     disable TWDXDOA;
                  NODELAYA = 1'b1;
                  DOA_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                    if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                         NODELAYA = 1'b1;
                         DOA_tmp = Memory[A_i];
                         ->EventTOHDOA;
		      end
                    end else begin
                      if (WEAN_i !== last_WEAN) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                        DOA_tmp = Memory[A_i];
                        NODELAYA = 1'b1;
                        ->EventTOHDOA;
		      end
                      end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                        NODELAYA = 1'b0;
                        DOA_tmp = Memory[A_i];
                        DOA_i = DOA_tmp;
		      end
                      end
                    end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYA = 1'b1;
                    DOA_tmp = Memory[A_i];
                    ->EventTOHDOA;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOA;
                   disable TWDXDOA;
                NODELAYA = 1'b1;
                DOA_i = {Bits{1'bX}};
           end
           LastCycleAAddress = A_i;
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
              if (A_i == LastCycleBAddress) begin
                 if ((Last_WEBN_i == 1'b1)&&($time-Last_tc_ClkB_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    //DOB_i = {Bits{1'bX}};
                    #0 disable TOHDOB;
                       disable TWDXDOB;
                    NODELAYB = 1'b1;
                    DOB_i = {Bits{1'bX}};
                    Memory[A_i] = DIA_i;
                 end else if ((Last_WEBN_i == 1'b0)&&($time-Last_tc_ClkB_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory[A_i] = {Bits{1'bX}};
                 end else begin
                    Memory[A_i] = DIA_i;
                 end
              end else begin
                   Memory[A_i] = DIA_i;
              end
              DOA_tmp = Memory[A_i];
              if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA = 1'b1;
                         all_core_xA(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                     NODELAYA = 1'b1;
                     ->EventTWDXDOA;
		      end
                 end else begin
                    if (WEAN_i !== last_WEAN) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA = 1'b1;
                         all_core_xA(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYA = 1'b1;
                       ->EventTWDXDOA;
		      end
                    end else begin
                      if (DIA_i !== last_DIA) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA = 1'b1;
                         all_core_xA(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                         NODELAYA = 1'b1;
                         ->EventTWDXDOA;
		      end
                      end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA = 1'b1;
                         all_core_xA(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                         NODELAYA = 1'b0;
                         DOA_i = DOA_tmp;
		      end
                      end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOA;
                         disable TWDXDOA;
                         NODELAYA = 1'b1;
                         Memory[A_i] = {Bits{1'bX}};
                         DOA_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsa0 || wrong_dvsa4 || wrong_dvsa5 || wrong_dvsa6 || wrong_dvsa7 || wrong_dvsa8 || wrong_dvsa9 || wrong_dvsa10 || wrong_dvsa11 || wrong_dvsa12 || wrong_dvsa13 || wrong_dvsa14 || wrong_dvsa15) begin
                         NODELAYA = 1'b1;
                         all_core_xA(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                  NODELAYA = 1'b1;
                  ->EventTWDXDOA;
		      end

              end
           end else begin
             #0 disable TOHDOA;
                disable TWDXDOA;
             NODELAYA = 1'b1;
             DOA_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
                all_core_xA(9999,1);
             end
           end
           LastCycleAAddress = A_i;
        end
        2'b1x: begin
           //DOA_i = {Bits{1'bX}};
           #0 disable TOHDOA;
              disable TWDXDOA;
           NODELAYA = 1'b1;
           DOA_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory[A_i] = {Bits{1'bX}};
                //DOA_i = {Bits{1'bX}};
                #0 disable TOHDOA;
                   disable TWDXDOA;
                NODELAYA = 1'b1;
                DOA_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOA;
                disable TWDXDOA;
             NODELAYA = 1'b1;
             DOA_i = {Bits{1'bX}};
             if (^(A_i) === 1'bX) begin
                all_core_xA(9999,1);
             end
           end
        end
      endcase
      Last_WEAN_i = WEAN_i;
  end
  endtask //memory_functionA;

  task memory_functionB;
    begin
      B_i                            = Latch_B;
      DIB_i                          = Latch_DIB;
      WEBN_i                         = Latch_WEBN;
      CSB_i                          = Latch_CSB;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CSB_ == 1'b1) B_monitor;

      casez({WEBN_i,CSB_i})
        2'b11: begin
           if (AddressRangeCheck(B_i)) begin
              if ((B_i == LastCycleAAddress)&&
                  (Last_WEAN_i == 1'b0) &&
                  ($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                  ErrorMessage(1);
`endif
                  #0 disable TOHDOB;
                     disable TWDXDOB;
                  NODELAYB = 1'b1;
                  DOB_i = {Bits{1'bX}};
              end else begin
                  if (NO_SER_TOH == `TRUE) begin
                    if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                         NODELAYB = 1'b1;
                         DOB_tmp = Memory[B_i];
                         ->EventTOHDOB;
		      end
                    end else begin
                      if (WEBN_i !== last_WEBN) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                        DOB_tmp = Memory[B_i];
                        NODELAYB = 1'b1;
                        ->EventTOHDOB;
		      end
                      end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                        NODELAYB = 1'b0;
                        DOB_tmp = Memory[B_i];
                        DOB_i = DOB_tmp;
		      end
                      end
                    end
                  end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                    NODELAYB = 1'b1;
                    DOB_tmp = Memory[B_i];
                    ->EventTOHDOB;
		      end

                  end
              end
           end
           else begin
                #0 disable TOHDOB;
                   disable TWDXDOB;
                NODELAYB = 1'b1;
                DOB_i = {Bits{1'bX}};
           end
           LastCycleBAddress = B_i;
        end
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
              if (B_i == LastCycleAAddress) begin
                 if ((Last_WEAN_i == 1'b1)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(1);
`endif
                    #0 disable TOHDOA;
                       disable TWDXDOA;
                    NODELAYA = 1'b1;
                    DOA_i = {Bits{1'bX}};
                    Memory[B_i] = DIB_i;
                 end else if ((Last_WEAN_i == 1'b0)&&($time-Last_tc_ClkA_PosEdge<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                    ErrorMessage(4);
`endif
                    Memory[B_i] = {Bits{1'bX}};
                 end else begin
                    Memory[B_i] = DIB_i;
                 end
              end else begin
                    Memory[B_i] = DIB_i;
              end
              DOB_tmp = Memory[B_i];
              if (NO_SER_TOH == `TRUE) begin
                 if (B_i !== last_B) begin

                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB = 1'b1;
                         all_core_xB(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                     NODELAYB = 1'b1;
                     ->EventTWDXDOB;
		      end
                 end else begin
                    if (WEBN_i !== last_WEBN) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB = 1'b1;
                         all_core_xB(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                       NODELAYB = 1'b1;
                       ->EventTWDXDOB;
		      end
                    end else begin
                      if (DIB_i !== last_DIB) begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB = 1'b1;
                         all_core_xB(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                         NODELAYB = 1'b1;
                         ->EventTWDXDOB;
		      end
                      end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (wrong_dvsb0 || wrong_dvsb4 || wrong_dvsb5 || wrong_dvsb6 || wrong_dvsb7 || wrong_dvsb8 || wrong_dvsb9 || wrong_dvsb10 || wrong_dvsb11 || wrong_dvsb12 || wrong_dvsb13 || wrong_dvsb14 || wrong_dvsb15) begin
                         NODELAYB = 1'b1;
                         all_core_xB(9999,1);
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(13);
`endif
		      end else begin
                         NODELAYB = 1'b0;
                         DOB_i = DOB_tmp;
		      end
                      end
                    end
                 end
              end else begin
                      if (DVSE_i === 1'bX) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                      #0 disable TOHDOB;
                         disable TWDXDOB;
                         NODELAYB = 1'b1;
                         Memory[B_i] = {Bits{1'bX}};
                         DOB_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                         ErrorMessage(9);
`endif
		      end else begin
                  NODELAYB = 1'b1;
                  ->EventTWDXDOB;
		      end

              end
           end else begin
             #0 disable TOHDOB;
                disable TWDXDOB;
             NODELAYB = 1'b1;
             DOB_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
               all_core_xB(9999,1);
             end
           end
           LastCycleBAddress = B_i;
        end
        2'b1x: begin
           #0 disable TOHDOB;
              disable TWDXDOB;
           NODELAYB = 1'b1;
           DOB_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory[B_i] = {Bits{1'bX}};
                //DOB_i = {Bits{1'bX}};
                #0 disable TOHDOB;
                   disable TWDXDOB;
                NODELAYB = 1'b1;
                DOB_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDOB;
                disable TWDXDOB;
             NODELAYB = 1'b1;
             DOB_i = {Bits{1'bX}};
             if (^(B_i) === 1'bX) begin
               all_core_xB(9999,1);
             end
           end
        end
      endcase
      Last_WEBN_i = WEBN_i;
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
       if (do_x == 1) Memory[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
       else           Memory[LoopCount_Address]={Bits{1'b0}};
`else
`endif
       if (do_x == 1) begin
          #0 disable TOHDOA;
             disable TWDXDOA;
          NODELAYA = 1'b1;
          DOA_i = {Bits{1'bX}};
       end
`ifdef MEM_INIT_ZERO
       else begin
          #0 disable TOHDOA;
             disable TWDXDOA;
          NODELAYA = 1'b1;
          DOA_i = {Bits{1'b0}};
       end
`else
`endif
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
       if (do_x == 1) Memory[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
       else           Memory[LoopCount_Address]={Bits{1'b0}};
`else
`endif
       if (do_x == 1) begin
          #0 disable TOHDOB;
             disable TWDXDOB;
          NODELAYB = 1'b1;
          DOB_i = {Bits{1'bX}};
       end
`ifdef MEM_INIT_ZERO
       else begin
          #0 disable TOHDOB;
             disable TWDXDOB;
          NODELAYB = 1'b1;
          DOB_i = {Bits{1'b0}};
       end
`else
`endif
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
             if (WEAN_ !== 1'b1) begin
                all_core_xA(9999,1);
             end
             else begin
                #0 disable TOHDOA;
                   disable TWDXDOA;
                NODELAYA = 1'b1;
                DOA_i = {Bits{1'bX}};
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
             if (WEBN_ !== 1'b1) begin
                all_core_xB(9999,1);
             end
             else begin
                #0 disable TOHDOB;
                   disable TWDXDOB;
                NODELAYB = 1'b1;
                DOB_i = {Bits{1'bX}};
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
      specparam TAA    = (104.5:170.2:334.5);
      specparam TAA_1  = (115.5:190.7:381.6);
      specparam TAA_2  = (104.5:170.2:334.5);
      specparam TAA_3  = (98.6:159.1:308.5);
      specparam TWDV    = (102.7:168.8:332.3);
      specparam TWDV_1  = (113.4:189.5:379.4);
      specparam TWDV_2  = (102.7:168.8:332.3);
      specparam TWDV_3  = (96.8:157.6:306.3);
      specparam TRC  = (103.4:187.4:383.1);
      specparam TRC_1    = (114.8:209.4:430.8);
      specparam TRC_2    = (103.4:187.4:383.1);
      specparam TRC_3    = (97.3:175.9:356.8);
      specparam THPW = (21.6:28.3:44.2);
      specparam TLPW = (29.6:49.3:76.4);
      specparam TAS  = (11.1:20.3:36.6);
      specparam TAH  = (14.7:20.3:28.4);
      specparam TWS  = (17.3:27.9:44.5);
      specparam TWH  = (1.0:0.0:0.0);
      specparam TDS  = (6.0:11.6:24.0);
      specparam TDH  = (9.9:11.8:14.1);
      specparam TCSS = (21.6:36.8:59.9);
      specparam TCSH = (26.0:33.0:48.1);
      specparam TNAPH  = (16.9:30.8:53.3);
      specparam TNAP_CSH  = (38.8:59.7:89.4);
      specparam TDVSES  = (11.1:20.3:36.6);
      specparam TDVSEH  = (99.4:163.2:317.3);
      specparam TDVSS   = (11.1:20.3:36.6);
      specparam TDVSH   = (99.4:163.2:317.3);
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

      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA0, TDS,     TDH,     n_flag_DIA0    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA0, TDS,     TDH,     n_flag_DIA0    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB0, TDS,     TDH,     n_flag_DIB0    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB0, TDS,     TDH,     n_flag_DIB0    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA1, TDS,     TDH,     n_flag_DIA1    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA1, TDS,     TDH,     n_flag_DIA1    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB1, TDS,     TDH,     n_flag_DIB1    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB1, TDS,     TDH,     n_flag_DIB1    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA2, TDS,     TDH,     n_flag_DIA2    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA2, TDS,     TDH,     n_flag_DIA2    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB2, TDS,     TDH,     n_flag_DIB2    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB2, TDS,     TDH,     n_flag_DIB2    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA3, TDS,     TDH,     n_flag_DIA3    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA3, TDS,     TDH,     n_flag_DIA3    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB3, TDS,     TDH,     n_flag_DIB3    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB3, TDS,     TDH,     n_flag_DIB3    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA4, TDS,     TDH,     n_flag_DIA4    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA4, TDS,     TDH,     n_flag_DIA4    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB4, TDS,     TDH,     n_flag_DIB4    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB4, TDS,     TDH,     n_flag_DIB4    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA5, TDS,     TDH,     n_flag_DIA5    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA5, TDS,     TDH,     n_flag_DIA5    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB5, TDS,     TDH,     n_flag_DIB5    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB5, TDS,     TDH,     n_flag_DIB5    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA6, TDS,     TDH,     n_flag_DIA6    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA6, TDS,     TDH,     n_flag_DIA6    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB6, TDS,     TDH,     n_flag_DIB6    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB6, TDS,     TDH,     n_flag_DIB6    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA7, TDS,     TDH,     n_flag_DIA7    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA7, TDS,     TDH,     n_flag_DIA7    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB7, TDS,     TDH,     n_flag_DIB7    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB7, TDS,     TDH,     n_flag_DIB7    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA8, TDS,     TDH,     n_flag_DIA8    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA8, TDS,     TDH,     n_flag_DIA8    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB8, TDS,     TDH,     n_flag_DIB8    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB8, TDS,     TDH,     n_flag_DIB8    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA9, TDS,     TDH,     n_flag_DIA9    );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA9, TDS,     TDH,     n_flag_DIA9    );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB9, TDS,     TDH,     n_flag_DIB9    );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB9, TDS,     TDH,     n_flag_DIB9    );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA10, TDS,     TDH,     n_flag_DIA10   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA10, TDS,     TDH,     n_flag_DIA10   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB10, TDS,     TDH,     n_flag_DIB10   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB10, TDS,     TDH,     n_flag_DIB10   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA11, TDS,     TDH,     n_flag_DIA11   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA11, TDS,     TDH,     n_flag_DIA11   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB11, TDS,     TDH,     n_flag_DIB11   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB11, TDS,     TDH,     n_flag_DIB11   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA12, TDS,     TDH,     n_flag_DIA12   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA12, TDS,     TDH,     n_flag_DIA12   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB12, TDS,     TDH,     n_flag_DIB12   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB12, TDS,     TDH,     n_flag_DIB12   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA13, TDS,     TDH,     n_flag_DIA13   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA13, TDS,     TDH,     n_flag_DIA13   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB13, TDS,     TDH,     n_flag_DIB13   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB13, TDS,     TDH,     n_flag_DIB13   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA14, TDS,     TDH,     n_flag_DIA14   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA14, TDS,     TDH,     n_flag_DIA14   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB14, TDS,     TDH,     n_flag_DIB14   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB14, TDS,     TDH,     n_flag_DIB14   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA15, TDS,     TDH,     n_flag_DIA15   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA15, TDS,     TDH,     n_flag_DIA15   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB15, TDS,     TDH,     n_flag_DIB15   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB15, TDS,     TDH,     n_flag_DIB15   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA16, TDS,     TDH,     n_flag_DIA16   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA16, TDS,     TDH,     n_flag_DIA16   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB16, TDS,     TDH,     n_flag_DIB16   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB16, TDS,     TDH,     n_flag_DIB16   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA17, TDS,     TDH,     n_flag_DIA17   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA17, TDS,     TDH,     n_flag_DIA17   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB17, TDS,     TDH,     n_flag_DIB17   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB17, TDS,     TDH,     n_flag_DIB17   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA18, TDS,     TDH,     n_flag_DIA18   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA18, TDS,     TDH,     n_flag_DIA18   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB18, TDS,     TDH,     n_flag_DIB18   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB18, TDS,     TDH,     n_flag_DIB18   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA19, TDS,     TDH,     n_flag_DIA19   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA19, TDS,     TDH,     n_flag_DIA19   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB19, TDS,     TDH,     n_flag_DIB19   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB19, TDS,     TDH,     n_flag_DIB19   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA20, TDS,     TDH,     n_flag_DIA20   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA20, TDS,     TDH,     n_flag_DIA20   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB20, TDS,     TDH,     n_flag_DIB20   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB20, TDS,     TDH,     n_flag_DIB20   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA21, TDS,     TDH,     n_flag_DIA21   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA21, TDS,     TDH,     n_flag_DIA21   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB21, TDS,     TDH,     n_flag_DIB21   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB21, TDS,     TDH,     n_flag_DIB21   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA22, TDS,     TDH,     n_flag_DIA22   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA22, TDS,     TDH,     n_flag_DIA22   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB22, TDS,     TDH,     n_flag_DIB22   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB22, TDS,     TDH,     n_flag_DIB22   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA23, TDS,     TDH,     n_flag_DIA23   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA23, TDS,     TDH,     n_flag_DIA23   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB23, TDS,     TDH,     n_flag_DIB23   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB23, TDS,     TDH,     n_flag_DIB23   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA24, TDS,     TDH,     n_flag_DIA24   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA24, TDS,     TDH,     n_flag_DIA24   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB24, TDS,     TDH,     n_flag_DIB24   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB24, TDS,     TDH,     n_flag_DIB24   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA25, TDS,     TDH,     n_flag_DIA25   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA25, TDS,     TDH,     n_flag_DIA25   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB25, TDS,     TDH,     n_flag_DIB25   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB25, TDS,     TDH,     n_flag_DIB25   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA26, TDS,     TDH,     n_flag_DIA26   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA26, TDS,     TDH,     n_flag_DIA26   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB26, TDS,     TDH,     n_flag_DIB26   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB26, TDS,     TDH,     n_flag_DIB26   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA27, TDS,     TDH,     n_flag_DIA27   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA27, TDS,     TDH,     n_flag_DIA27   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB27, TDS,     TDH,     n_flag_DIB27   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB27, TDS,     TDH,     n_flag_DIB27   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA28, TDS,     TDH,     n_flag_DIA28   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA28, TDS,     TDH,     n_flag_DIA28   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB28, TDS,     TDH,     n_flag_DIB28   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB28, TDS,     TDH,     n_flag_DIB28   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA29, TDS,     TDH,     n_flag_DIA29   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA29, TDS,     TDH,     n_flag_DIA29   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB29, TDS,     TDH,     n_flag_DIB29   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB29, TDS,     TDH,     n_flag_DIB29   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA30, TDS,     TDH,     n_flag_DIA30   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA30, TDS,     TDH,     n_flag_DIA30   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB30, TDS,     TDH,     n_flag_DIB30   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB30, TDS,     TDH,     n_flag_DIB30   );
      $setuphold ( posedge CKA &&& con_DIA,       posedge DIA31, TDS,     TDH,     n_flag_DIA31   );
      $setuphold ( posedge CKA &&& con_DIA,       negedge DIA31, TDS,     TDH,     n_flag_DIA31   );
      $setuphold ( posedge CKB &&& con_DIB,       posedge DIB31, TDS,     TDH,     n_flag_DIB31   );
      $setuphold ( posedge CKB &&& con_DIB,       negedge DIB31, TDS,     TDH,     n_flag_DIB31   );

      $setuphold ( posedge CKA &&& con_WEAN,      posedge WEAN, TWS,     TWH,     n_flag_WEAN    );
      $setuphold ( posedge CKA &&& con_WEAN,      negedge WEAN, TWS,     TWH,     n_flag_WEAN    );
      $setuphold ( posedge CKB &&& con_WEBN,      posedge WEBN, TWS,     TWH,     n_flag_WEBN    );
      $setuphold ( posedge CKB &&& con_WEBN,      negedge WEBN, TWS,     TWH,     n_flag_WEBN    );
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

      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA0:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA1:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA2:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA3:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA4:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA5:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA6:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA7:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA8:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA9:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA10:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA11:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA12:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA13:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA14:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA15:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA16:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA17:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA18:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA19:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA20:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA21:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA22:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA23:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA24:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA25:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA26:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA27:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA28:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA29:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA30:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsea && reada)  (posedge CKA => (DOA31:1'bx)) = TAA  ;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA0 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA1 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA2 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA3 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA4 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA5 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA6 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA7 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA8 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA9 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA10 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA11 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA12 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA13 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA14 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA15 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA16 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA17 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA18 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA19 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA20 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA21 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA22 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA23 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA24 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA25 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA26 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA27 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA28 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA29 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA30 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa1 && reada)  (posedge CKA => (DOA31 :1'bx)) = TAA_1;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA0 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA1 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA2 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA3 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA4 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA5 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA6 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA7 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA8 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA9 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA10 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA11 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA12 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA13 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA14 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA15 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA16 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA17 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA18 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA19 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA20 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA21 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA22 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA23 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA24 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA25 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA26 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA27 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA28 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA29 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA30 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa2 && reada)  (posedge CKA => (DOA31 :1'bx)) = TAA_2;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA0 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA1 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA2 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA3 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA4 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA5 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA6 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA7 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA8 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA9 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA10 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA11 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA12 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA13 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA14 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA15 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA16 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA17 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA18 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA19 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA20 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA21 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA22 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA23 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA24 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA25 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA26 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA27 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA28 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA29 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA30 :1'bx)) = TAA_3;
      if (NODELAYA == 0 && con_dvsa3 && reada)  (posedge CKA => (DOA31 :1'bx)) = TAA_3;


      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB0:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB1:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB2:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB3:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB4:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB5:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB6:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB7:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB8:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB9:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB10:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB11:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB12:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB13:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB14:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB15:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB16:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB17:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB18:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB19:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB20:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB21:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB22:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB23:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB24:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB25:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB26:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB27:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB28:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB29:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB30:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvseb && readb)  (posedge CKB => (DOB31:1'bx)) = TAA  ;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB0 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB1 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB2 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB3 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB4 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB5 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB6 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB7 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB8 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB9 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB10 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB11 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB12 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB13 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB14 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB15 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB16 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB17 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB18 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB19 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB20 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB21 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB22 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB23 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB24 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB25 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB26 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB27 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB28 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB29 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB30 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb1 && readb)  (posedge CKB => (DOB31 :1'bx)) = TAA_1;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB0 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB1 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB2 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB3 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB4 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB5 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB6 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB7 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB8 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB9 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB10 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB11 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB12 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB13 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB14 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB15 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB16 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB17 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB18 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB19 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB20 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB21 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB22 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB23 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB24 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB25 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB26 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB27 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB28 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB29 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB30 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb2 && readb)  (posedge CKB => (DOB31 :1'bx)) = TAA_2;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB0 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB1 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB2 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB3 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB4 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB5 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB6 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB7 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB8 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB9 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB10 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB11 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB12 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB13 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB14 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB15 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB16 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB17 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB18 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB19 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB20 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB21 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB22 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB23 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB24 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB25 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB26 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB27 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB28 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB29 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB30 :1'bx)) = TAA_3;
      if (NODELAYB == 0 && con_dvsb3 && readb)  (posedge CKB => (DOB31 :1'bx)) = TAA_3;


      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA0:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA1:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA2:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA3:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA4:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA5:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA6:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA7:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA8:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA9:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA10:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA11:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA12:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA13:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA14:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA15:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA16:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA17:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA18:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA19:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA20:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA21:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA22:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA23:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA24:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA25:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA26:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA27:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA28:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA29:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA30:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsea && writea)  (posedge CKA => (DOA31:1'bx)) = TWDV ;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA0 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA1 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA2 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA3 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA4 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA5 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA6 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA7 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA8 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA9 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA10 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA11 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA12 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA13 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA14 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA15 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA16 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA17 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA18 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA19 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA20 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA21 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA22 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA23 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA24 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA25 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA26 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA27 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA28 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA29 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA30 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa1 && writea)  (posedge CKA => (DOA31 :1'bx)) = TWDV_1;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA0 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA1 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA2 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA3 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA4 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA5 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA6 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA7 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA8 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA9 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA10 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA11 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA12 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA13 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA14 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA15 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA16 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA17 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA18 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA19 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA20 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA21 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA22 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA23 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA24 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA25 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA26 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA27 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA28 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA29 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA30 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa2 && writea)  (posedge CKA => (DOA31 :1'bx)) = TWDV_2;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA0 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA1 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA2 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA3 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA4 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA5 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA6 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA7 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA8 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA9 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA10 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA11 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA12 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA13 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA14 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA15 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA16 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA17 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA18 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA19 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA20 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA21 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA22 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA23 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA24 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA25 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA26 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA27 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA28 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA29 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA30 :1'bx)) = TWDV_3;
      if (NODELAYA == 0 && con_dvsa3 && writea)  (posedge CKA => (DOA31 :1'bx)) = TWDV_3;


      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB0:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB1:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB2:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB3:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB4:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB5:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB6:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB7:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB8:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB9:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB10:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB11:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB12:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB13:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB14:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB15:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB16:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB17:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB18:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB19:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB20:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB21:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB22:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB23:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB24:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB25:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB26:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB27:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB28:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB29:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB30:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvseb && writeb)  (posedge CKB => (DOB31:1'bx)) = TWDV ;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB0 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB1 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB2 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB3 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB4 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB5 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB6 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB7 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB8 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB9 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB10 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB11 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB12 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB13 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB14 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB15 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB16 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB17 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB18 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB19 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB20 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB21 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB22 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB23 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB24 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB25 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB26 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB27 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB28 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB29 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB30 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb1 && writeb)  (posedge CKB => (DOB31 :1'bx)) = TWDV_1;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB0 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB1 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB2 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB3 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB4 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB5 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB6 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB7 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB8 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB9 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB10 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB11 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB12 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB13 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB14 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB15 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB16 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB17 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB18 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB19 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB20 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB21 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB22 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB23 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB24 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB25 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB26 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB27 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB28 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB29 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB30 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb2 && writeb)  (posedge CKB => (DOB31 :1'bx)) = TWDV_2;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB0 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB1 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB2 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB3 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB4 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB5 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB6 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB7 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB8 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB9 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB10 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB11 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB12 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB13 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB14 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB15 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB16 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB17 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB18 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB19 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB20 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB21 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB22 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB23 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB24 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB25 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB26 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB27 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB28 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB29 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB30 :1'bx)) = TWDV_3;
      if (NODELAYB == 0 && con_dvsb3 && writeb)  (posedge CKB => (DOB31 :1'bx)) = TWDV_3;


   endspecify

`endprotect
endmodule
