/*******************************************************************************
________________________________________________________________________________________________


            Synchronous RVT+LVT Periphery Two-Port Register File Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________

       IP Name            :  FSH0L_B_SZLVT                   
       IP Version         :  1.6.0                           
       IP Release Status  :  Active                          
       Word               :  64                              
       Bit                :  64                              
       Byte               :  1                               
       Mux                :  1                               
       Output Loading     :  0.3                             
       Clock Input Slew   :  0.4                             
       Data Input Slew    :  0.4                             
       Ring Type          :  Ringless Model                  
       Ring Width         :  0                               
       Bus Format         :  1                               
       Memaker Path       :  /home/autumn/pdk/memory/ftclib  
       GUI Version        :  m20130120                       
       Date               :  2024/11/21 10:16:11             
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


module SZLVTLB40_64X64X1CM1b1 (A,B,DO,DI,CKA,CKB,CSAN,DVSE,DVS,WEB,CSBN,NAP);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 6;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 64;               
  parameter  Words                = 64;               
  parameter  Bytes                = 1;                
  parameter  AspectRatio          = 1;                
  parameter  Tr2w                 = (49.7:72.6:144.5);
  parameter  Tw2r                 = (56.9:85.7:179.7);
  parameter  TOH                  = (39.7:61.4:109.0);
  parameter  TOH_2                = (41.2:64.1:114.9);
  parameter  TOH_3                = (39.7:61.4:109.0);
  parameter  TOH_4                = (38.0:58.4:102.7);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (56.9:85.7:158.5);
`else
`endif
  parameter  TNAP_Wakeup          = 0;                

  output     [Bytes*Bits-1:0]     DO;                 
  input      [Bytes*Bits-1:0]     DI;                 
  input      [AddressSize-1:0]    A;                  
  input      [AddressSize-1:0]    B;                  
  input      DVSE;                                    
  input      [DVSize-1:0]         DVS;                
  input      WEB;                                     
  input      CKA;                                     
  input      CKB;                                     
  input      CSAN;                                    
  input      CSBN;                                    
  input      NAP;                                     

`protect
  reg        [Bits-1:0]           Memory [Words-1:0];           

  wire       [Bytes*Bits-1:0]     DO_;                
  wire       [AddressSize-1:0]    A_;                 
  wire       [Bits-1:0]           DI_;                
  wire                            WEB_;               
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
  reg                             wrong_dvs1;         
  reg                             wrong_dvs1_ckb;     
  reg                             con_dvs2;           
  reg                             con_dvs3;           
  reg                             con_dvs4;           
  reg                             wrong_dvs5;         
  reg                             wrong_dvs5_ckb;     
  reg                             wrong_dvs6;         
  reg                             wrong_dvs6_ckb;     
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
  wire                            con_DI;             
  wire                            con_B;              
  wire                            con_CKA;            
  wire                            con_CKB;            
  wire                            cka_per;            
  wire                            ckb_per;            
  wire                            cka_per2;           
  wire                            cka_per3;           
  wire                            cka_per4;           
  wire                            ckb_per2;           
  wire                            ckb_per3;           
  wire                            ckb_per4;           
  wire                            con_WEB;            
  wire                            con_DVSE_WA;        
  wire                            con_DVS_WA;         
  wire                            con_DVSE_WB;        
  wire                            con_DVS_WB;         

  reg        [AddressSize-1:0]    Latch_A;            
  reg        [Bits-1:0]           Latch_DI;           
  reg                             Latch_WEB;          
  reg        [AddressSize-1:0]    Latch_B;            
  reg                             Latch_CSA;          
  reg                             Latch_CSB;          
  reg                             Latch_DVSE;         
  reg        [DVSize-1:0]         Latch_DVS;          
  reg        [AddressSize-1:0]    LastCycleRAddress;  
  reg        [AddressSize-1:0]    LastCycleWAddress;  

  reg        [AddressSize-1:0]    A_i;                
  reg        [Bits-1:0]           DI_i;               
  reg                             WEB_i;              
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
  reg                             n_flag_B0;          
  reg                             n_flag_B1;          
  reg                             n_flag_B2;          
  reg                             n_flag_B3;          
  reg                             n_flag_B4;          
  reg                             n_flag_B5;          
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
  reg                             n_flag_DI32;        
  reg                             n_flag_DI33;        
  reg                             n_flag_DI34;        
  reg                             n_flag_DI35;        
  reg                             n_flag_DI36;        
  reg                             n_flag_DI37;        
  reg                             n_flag_DI38;        
  reg                             n_flag_DI39;        
  reg                             n_flag_DI40;        
  reg                             n_flag_DI41;        
  reg                             n_flag_DI42;        
  reg                             n_flag_DI43;        
  reg                             n_flag_DI44;        
  reg                             n_flag_DI45;        
  reg                             n_flag_DI46;        
  reg                             n_flag_DI47;        
  reg                             n_flag_DI48;        
  reg                             n_flag_DI49;        
  reg                             n_flag_DI50;        
  reg                             n_flag_DI51;        
  reg                             n_flag_DI52;        
  reg                             n_flag_DI53;        
  reg                             n_flag_DI54;        
  reg                             n_flag_DI55;        
  reg                             n_flag_DI56;        
  reg                             n_flag_DI57;        
  reg                             n_flag_DI58;        
  reg                             n_flag_DI59;        
  reg                             n_flag_DI60;        
  reg                             n_flag_DI61;        
  reg                             n_flag_DI62;        
  reg                             n_flag_DI63;        
  reg                             n_flag_WEB;         
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
  reg                             LAST_n_flag_WEB;    
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
  reg        [Bits-1:0]           NOT_BUS_DI;         
  reg        [Bits-1:0]           LAST_NOT_BUS_DI;    

  reg                             LAST_n_flag_DVSE;   
  reg        [DVSize-1:0]         NOT_BUS_DVS;        
  reg        [DVSize-1:0]         LAST_NOT_BUS_DVS;   

  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       

  reg        [Bits-1:0]           DO_i;               



  reg                             LastClkAEdge;       
  reg                             LastClkBEdge;       

  reg                             flag_A_x;           
  reg                             flag_B_x;           
  reg                             flag_CSA_x;         
  reg                             flag_CSB_x;         
  reg                             NODELAY;            
  reg        [Bits-1:0]           DO_tmp;             
  event                           EventTOHDO;         
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
  time                            Last_tc_ClkB_PosEdge_WEB;

  assign     DO_                  = {DO_i};
  assign     con_A                = CSA_;
  assign     con_B                = CSB_ & (!WEB_);
  assign     con_DI               = CSB_ & (!WEB_);
  assign     con_WEB              = CSB_;
  assign     con_CKA              = CSA_;
  assign     con_CKB              = CSB_;
  assign     cka_per              = CSA_ & !DVSE_;
  assign     ckb_per              = CSB_ & !DVSE_;
  assign     cka_per2             = CSA_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ckb_per2             = CSB_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     cka_per3             = CSA_ & DVSE_ & DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ckb_per3             = CSB_ & DVSE_ & DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     cka_per4             = CSA_ & DVSE_ & !DVS_[0] & !DVS_[1] & DVS_[2] & !DVS_[3];
  assign     ckb_per4             = CSB_ & DVSE_ & !DVS_[0] & !DVS_[1] & DVS_[2] & !DVS_[3];
  assign     con_DVSE_WA          = CSA_;
  assign     con_DVS_WA           = CSA_ & DVSE_;
  assign     con_DVSE_WB          = CSB_;
  assign     con_DVS_WB           = CSB_ & DVSE_;
  assign     con_NAP              = (!CSA_) & (!CSB_);
  assign     con_CK_NAP           = CSA_CSB_temp & (!NOSTANDBY);

  buf        ido0            (DO[0], DO_[0]);              
  buf        ido1            (DO[1], DO_[1]);              
  buf        ido2            (DO[2], DO_[2]);              
  buf        ido3            (DO[3], DO_[3]);              
  buf        ido4            (DO[4], DO_[4]);              
  buf        ido5            (DO[5], DO_[5]);              
  buf        ido6            (DO[6], DO_[6]);              
  buf        ido7            (DO[7], DO_[7]);              
  buf        ido8            (DO[8], DO_[8]);              
  buf        ido9            (DO[9], DO_[9]);              
  buf        ido10           (DO[10], DO_[10]);            
  buf        ido11           (DO[11], DO_[11]);            
  buf        ido12           (DO[12], DO_[12]);            
  buf        ido13           (DO[13], DO_[13]);            
  buf        ido14           (DO[14], DO_[14]);            
  buf        ido15           (DO[15], DO_[15]);            
  buf        ido16           (DO[16], DO_[16]);            
  buf        ido17           (DO[17], DO_[17]);            
  buf        ido18           (DO[18], DO_[18]);            
  buf        ido19           (DO[19], DO_[19]);            
  buf        ido20           (DO[20], DO_[20]);            
  buf        ido21           (DO[21], DO_[21]);            
  buf        ido22           (DO[22], DO_[22]);            
  buf        ido23           (DO[23], DO_[23]);            
  buf        ido24           (DO[24], DO_[24]);            
  buf        ido25           (DO[25], DO_[25]);            
  buf        ido26           (DO[26], DO_[26]);            
  buf        ido27           (DO[27], DO_[27]);            
  buf        ido28           (DO[28], DO_[28]);            
  buf        ido29           (DO[29], DO_[29]);            
  buf        ido30           (DO[30], DO_[30]);            
  buf        ido31           (DO[31], DO_[31]);            
  buf        ido32           (DO[32], DO_[32]);            
  buf        ido33           (DO[33], DO_[33]);            
  buf        ido34           (DO[34], DO_[34]);            
  buf        ido35           (DO[35], DO_[35]);            
  buf        ido36           (DO[36], DO_[36]);            
  buf        ido37           (DO[37], DO_[37]);            
  buf        ido38           (DO[38], DO_[38]);            
  buf        ido39           (DO[39], DO_[39]);            
  buf        ido40           (DO[40], DO_[40]);            
  buf        ido41           (DO[41], DO_[41]);            
  buf        ido42           (DO[42], DO_[42]);            
  buf        ido43           (DO[43], DO_[43]);            
  buf        ido44           (DO[44], DO_[44]);            
  buf        ido45           (DO[45], DO_[45]);            
  buf        ido46           (DO[46], DO_[46]);            
  buf        ido47           (DO[47], DO_[47]);            
  buf        ido48           (DO[48], DO_[48]);            
  buf        ido49           (DO[49], DO_[49]);            
  buf        ido50           (DO[50], DO_[50]);            
  buf        ido51           (DO[51], DO_[51]);            
  buf        ido52           (DO[52], DO_[52]);            
  buf        ido53           (DO[53], DO_[53]);            
  buf        ido54           (DO[54], DO_[54]);            
  buf        ido55           (DO[55], DO_[55]);            
  buf        ido56           (DO[56], DO_[56]);            
  buf        ido57           (DO[57], DO_[57]);            
  buf        ido58           (DO[58], DO_[58]);            
  buf        ido59           (DO[59], DO_[59]);            
  buf        ido60           (DO[60], DO_[60]);            
  buf        ido61           (DO[61], DO_[61]);            
  buf        ido62           (DO[62], DO_[62]);            
  buf        ido63           (DO[63], DO_[63]);            
  buf        ia0             (A_[0], A[0]);                
  buf        ia1             (A_[1], A[1]);                
  buf        ia2             (A_[2], A[2]);                
  buf        ia3             (A_[3], A[3]);                
  buf        ia4             (A_[4], A[4]);                
  buf        ia5             (A_[5], A[5]);                
  buf        ib0             (B_[0], B[0]);                
  buf        ib1             (B_[1], B[1]);                
  buf        ib2             (B_[2], B[2]);                
  buf        ib3             (B_[3], B[3]);                
  buf        ib4             (B_[4], B[4]);                
  buf        ib5             (B_[5], B[5]);                
  buf        idi_0           (DI_[0], DI[0]);              
  buf        idi_1           (DI_[1], DI[1]);              
  buf        idi_2           (DI_[2], DI[2]);              
  buf        idi_3           (DI_[3], DI[3]);              
  buf        idi_4           (DI_[4], DI[4]);              
  buf        idi_5           (DI_[5], DI[5]);              
  buf        idi_6           (DI_[6], DI[6]);              
  buf        idi_7           (DI_[7], DI[7]);              
  buf        idi_8           (DI_[8], DI[8]);              
  buf        idi_9           (DI_[9], DI[9]);              
  buf        idi_10          (DI_[10], DI[10]);            
  buf        idi_11          (DI_[11], DI[11]);            
  buf        idi_12          (DI_[12], DI[12]);            
  buf        idi_13          (DI_[13], DI[13]);            
  buf        idi_14          (DI_[14], DI[14]);            
  buf        idi_15          (DI_[15], DI[15]);            
  buf        idi_16          (DI_[16], DI[16]);            
  buf        idi_17          (DI_[17], DI[17]);            
  buf        idi_18          (DI_[18], DI[18]);            
  buf        idi_19          (DI_[19], DI[19]);            
  buf        idi_20          (DI_[20], DI[20]);            
  buf        idi_21          (DI_[21], DI[21]);            
  buf        idi_22          (DI_[22], DI[22]);            
  buf        idi_23          (DI_[23], DI[23]);            
  buf        idi_24          (DI_[24], DI[24]);            
  buf        idi_25          (DI_[25], DI[25]);            
  buf        idi_26          (DI_[26], DI[26]);            
  buf        idi_27          (DI_[27], DI[27]);            
  buf        idi_28          (DI_[28], DI[28]);            
  buf        idi_29          (DI_[29], DI[29]);            
  buf        idi_30          (DI_[30], DI[30]);            
  buf        idi_31          (DI_[31], DI[31]);            
  buf        idi_32          (DI_[32], DI[32]);            
  buf        idi_33          (DI_[33], DI[33]);            
  buf        idi_34          (DI_[34], DI[34]);            
  buf        idi_35          (DI_[35], DI[35]);            
  buf        idi_36          (DI_[36], DI[36]);            
  buf        idi_37          (DI_[37], DI[37]);            
  buf        idi_38          (DI_[38], DI[38]);            
  buf        idi_39          (DI_[39], DI[39]);            
  buf        idi_40          (DI_[40], DI[40]);            
  buf        idi_41          (DI_[41], DI[41]);            
  buf        idi_42          (DI_[42], DI[42]);            
  buf        idi_43          (DI_[43], DI[43]);            
  buf        idi_44          (DI_[44], DI[44]);            
  buf        idi_45          (DI_[45], DI[45]);            
  buf        idi_46          (DI_[46], DI[46]);            
  buf        idi_47          (DI_[47], DI[47]);            
  buf        idi_48          (DI_[48], DI[48]);            
  buf        idi_49          (DI_[49], DI[49]);            
  buf        idi_50          (DI_[50], DI[50]);            
  buf        idi_51          (DI_[51], DI[51]);            
  buf        idi_52          (DI_[52], DI[52]);            
  buf        idi_53          (DI_[53], DI[53]);            
  buf        idi_54          (DI_[54], DI[54]);            
  buf        idi_55          (DI_[55], DI[55]);            
  buf        idi_56          (DI_[56], DI[56]);            
  buf        idi_57          (DI_[57], DI[57]);            
  buf        idi_58          (DI_[58], DI[58]);            
  buf        idi_59          (DI_[59], DI[59]);            
  buf        idi_60          (DI_[60], DI[60]);            
  buf        idi_61          (DI_[61], DI[61]);            
  buf        idi_62          (DI_[62], DI[62]);            
  buf        idi_63          (DI_[63], DI[63]);            
  buf        icka            (CKA_, CKA);                  
  buf        ickb            (CKB_, CKB);                  
  not        icsa            (CSA_, CSAN);                 
  not        icsb            (CSB_, CSBN);                 
  buf        iweb            (WEB_, WEB);                  

  buf        idvs0           (DVS_[0], DVS[0]);            
  buf        idvs1           (DVS_[1], DVS[1]);            
  buf        idvs2           (DVS_[2], DVS[2]);            
  buf        idvs3           (DVS_[3], DVS[3]);            
  buf        idvse           (DVSE_, DVSE);                
  buf        inap0           (NAP_, NAP);                  


  initial begin
    $timeformat (-12, 0, " ps", 20);
    flag_A_x = `FALSE;
    flag_B_x = `FALSE;
    NODELAY = 1'b0;
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
      DO_i    = DO_tmp;
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
      DO_i    = DO_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DO_i    = DO_tmp;
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
      DO_i    = DO_tmp;
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      disable NAPT;
      DO_i    = DO_tmp;
    end
  end

  always @(posedge NAP_) begin
    if ($time === 0) begin
      disable NAPT;
      DO_i    = DO_tmp;
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
        DO_i    = DO_tmp;
      end
    end
  end

  always @(negedge NAP_) begin
    if ($time !== 1'b0 && NAP_ === 1'b0 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
        disable NAPT;
        DO_i    = DO_tmp;
      end
    end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
        ErrorMessage(8);
`endif
        disable NAPT;
      DO_i    = DO_tmp;
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
    DO_i    = DO_tmp;
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
           wrong_dvs1 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs2   = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs3   = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs4   = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs5 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs6 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
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
           #0 disable TOHDO;
           NODELAY = 1'b1;
           DO_i    = {Bits{1'bX}};
           DO_tmp  = {Bits{1'bX}};
          end
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           #0 disable TOHDO;
           NODELAY = 1'b1;
           DO_i = {Bits{1'bX}};
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
           wrong_dvs1_ckb = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs5_ckb = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs6_ckb = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs7_ckb = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs8_ckb = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs9_ckb = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs10_ckb = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs11_ckb = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs12_ckb = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs13_ckb = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs14_ckb = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs15_ckb = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           if ((WEB_==1'b0)&&(CSB_==1'b1)) Last_tc_ClkB_PosEdge_WEB = $time;
           write_memory_function;
`ifdef TRC_CHECK
           trc_timiming_monitorB;
`else
`endif
         end else begin
            all_core_x(9999,0);
         end
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if ((WEB_ !== 1'b1)&&(CSB_ !== 1'b0)) begin
              all_core_x(9999,0);
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
           n_flag_B0 or
           n_flag_B1 or
           n_flag_B2 or
           n_flag_B3 or
           n_flag_B4 or
           n_flag_B5 or
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
           n_flag_DI32 or
           n_flag_DI33 or
           n_flag_DI34 or
           n_flag_DI35 or
           n_flag_DI36 or
           n_flag_DI37 or
           n_flag_DI38 or
           n_flag_DI39 or
           n_flag_DI40 or
           n_flag_DI41 or
           n_flag_DI42 or
           n_flag_DI43 or
           n_flag_DI44 or
           n_flag_DI45 or
           n_flag_DI46 or
           n_flag_DI47 or
           n_flag_DI48 or
           n_flag_DI49 or
           n_flag_DI50 or
           n_flag_DI51 or
           n_flag_DI52 or
           n_flag_DI53 or
           n_flag_DI54 or
           n_flag_DI55 or
           n_flag_DI56 or
           n_flag_DI57 or
           n_flag_DI58 or
           n_flag_DI59 or
           n_flag_DI60 or
           n_flag_DI61 or
           n_flag_DI62 or
           n_flag_DI63 or
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_WEB or
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
      NODELAY = 1'b1;
      DO_i    = DO_tmp;
     end


  always @(EventTOHDO) 
    begin:TOHDO 
      if (con_dvse) begin
        #TOH
        NODELAY <= 1'b0; 
        DO_i              =  {Bits{1'bX}}; 
        DO_i              <= DO_tmp; 
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY <= 1'b0; 
        DO_i              =  {Bits{1'bX}}; 
        DO_i              <= DO_tmp; 
      end else if (con_dvs3) begin
        #TOH_3 
        NODELAY <= 1'b0; 
        DO_i              =  {Bits{1'bX}}; 
        DO_i              <= DO_tmp; 
      end else if (con_dvs4) begin
        #TOH_4 
        NODELAY <= 1'b0; 
        DO_i              =  {Bits{1'bX}}; 
        DO_i              <= DO_tmp; 
      end 
  end 

  always @(EventNegCS) 
    begin:NegCS
      #TOH 
      disable TOHDO;
      NODELAY = 1'b0; 
      DO_i              =  {Bits{1'bX}}; 
  end 

  task timingcheck_violation;
    integer i;
    begin
      // READ PORT
      if ((n_flag_CKA_PER  !== LAST_n_flag_CKA_PER)  ||
          (n_flag_CKA_MINH !== LAST_n_flag_CKA_MINH) ||
          (n_flag_CKA_MINL !== LAST_n_flag_CKA_MINL)) begin
          if (CSA_ !== 1'b0) begin
           #0 disable TOHDO;
           NODELAY = 1'b1;
           DO_i = {Bits{1'bX}};
          end
      end
      else begin
          NOT_BUS_A  = {
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
             if (WEB_ !== 1'b1) begin
                all_core_x(9999,0);
             end
          end
      end
      else begin
          NOT_BUS_B  = {
                         n_flag_B5,
                         n_flag_B4,
                         n_flag_B3,
                         n_flag_B2,
                         n_flag_B1,
                         n_flag_B0};

          NOT_BUS_DI  = {
                         n_flag_DI63,
                         n_flag_DI62,
                         n_flag_DI61,
                         n_flag_DI60,
                         n_flag_DI59,
                         n_flag_DI58,
                         n_flag_DI57,
                         n_flag_DI56,
                         n_flag_DI55,
                         n_flag_DI54,
                         n_flag_DI53,
                         n_flag_DI52,
                         n_flag_DI51,
                         n_flag_DI50,
                         n_flag_DI49,
                         n_flag_DI48,
                         n_flag_DI47,
                         n_flag_DI46,
                         n_flag_DI45,
                         n_flag_DI44,
                         n_flag_DI43,
                         n_flag_DI42,
                         n_flag_DI41,
                         n_flag_DI40,
                         n_flag_DI39,
                         n_flag_DI38,
                         n_flag_DI37,
                         n_flag_DI36,
                         n_flag_DI35,
                         n_flag_DI34,
                         n_flag_DI33,
                         n_flag_DI32,
                         n_flag_DI31,
                         n_flag_DI30,
                         n_flag_DI29,
                         n_flag_DI28,
                         n_flag_DI27,
                         n_flag_DI26,
                         n_flag_DI25,
                         n_flag_DI24,
                         n_flag_DI23,
                         n_flag_DI22,
                         n_flag_DI21,
                         n_flag_DI20,
                         n_flag_DI19,
                         n_flag_DI18,
                         n_flag_DI17,
                         n_flag_DI16,
                         n_flag_DI15,
                         n_flag_DI14,
                         n_flag_DI13,
                         n_flag_DI12,
                         n_flag_DI11,
                         n_flag_DI10,
                         n_flag_DI9,
                         n_flag_DI8,
                         n_flag_DI7,
                         n_flag_DI6,
                         n_flag_DI5,
                         n_flag_DI4,
                         n_flag_DI3,
                         n_flag_DI2,
                         n_flag_DI1,
                         n_flag_DI0};

          NOT_BUS_DVS  = {
                         n_flag_DVS3,
                         n_flag_DVS2,
                         n_flag_DVS1,
                         n_flag_DVS0};

          for (i=0; i<AddressSize; i=i+1) begin
             Latch_B[i] = (NOT_BUS_B[i] !== LAST_NOT_BUS_B[i]) ? 1'bx : Latch_B[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DI[i] = (NOT_BUS_DI[i] !== LAST_NOT_BUS_DI[i]) ? 1'bx : Latch_DI[i];
          end
          for (i=0; i<DVSize; i=i+1) begin
             Latch_DVS[i] = (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) ? 1'bx : Latch_DVS[i];
          end

          Latch_DVSE  =  (n_flag_DVSE  !== LAST_n_flag_DVSE)  ? 1'bx : Latch_DVSE;
          Latch_CSB  =  (n_flag_CSB  !== LAST_n_flag_CSB)  ? 1'bx : Latch_CSB;
          Latch_WEB = (n_flag_WEB !== LAST_n_flag_WEB)  ? 1'bx : Latch_WEB;
          write_memory_function;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DI                = NOT_BUS_DI;
      LAST_n_flag_WEB                = n_flag_WEB;
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
      Latch_DI                       = DI_;
      Latch_CSB                      = CSB_;
      Latch_WEB                      = WEB_;
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
             if ((A_i == LastCycleWAddress)&&($time-Last_tc_ClkB_PosEdge_WEB<Tw2r)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
             end
             else begin
               if (NO_SER_TOH == `TRUE) begin
                 if (A_i !== last_A) begin
                   if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(9);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(9);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
		      end else begin
                    NODELAY = 1'b1;
                    DO_tmp = Memory[A_i];
                  ->EventTOHDO;
                 `ifdef MEM_VERIFY
                    taa_verify = 0;
                 `else
                 `endif
                   end
                 end else begin
                   if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(9);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(9);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
		      end else begin
                    NODELAY = 1'b0;
                    DO_tmp  = Memory[A_i];
                    DO_i    = DO_tmp;
                 `ifdef MEM_VERIFY
                    taa_verify = 1;
                 `else
                 `endif
                   end
                 end
               end else begin
                   if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(9);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(9);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
		      end else begin
                 NODELAY = 1'b1;
                 DO_tmp = Memory[A_i];
                 ->EventTOHDO;
              `ifdef MEM_VERIFY
                 taa_verify = 0;
              `else
              `endif
                   end
               end
             end
           end
           else begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
             `ifdef MEM_VERIFY
                taa_verify = 0;
             `else
             `endif
           end
           LastCycleRAddress = A_i;
        end
        1'bx: begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
        end
      endcase
  end
  endtask //read_memory_function;


  task write_memory_function;
    begin
      B_i                            = Latch_B;
      DI_i                           = Latch_DI;
      CSB_i                          = Latch_CSB;
      WEB_i                          = Latch_WEB;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CSB_ == 1'b1) B_monitor;

      casez({WEB_i,CSB_i})
        2'b01: begin
           if (AddressRangeCheck(B_i)) begin
             Memory[B_i] = DI_i;
             if ((B_i == LastCycleRAddress)&&($time-Last_tc_ClkA_PosEdge<Tr2w)) begin
`ifdef NO_MEM_MSG
`else
                ErrorMessage(1);
`endif
                #TOH
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
             end else if (wrong_dvs0_ckb || wrong_dvs1_ckb || wrong_dvs5_ckb || wrong_dvs6_ckb || wrong_dvs7_ckb || wrong_dvs8_ckb || wrong_dvs9_ckb || wrong_dvs10_ckb || wrong_dvs11_ckb || wrong_dvs12_ckb || wrong_dvs13_ckb || wrong_dvs14_ckb || wrong_dvs15_ckb) begin
                NODELAY = 1'b1;
                all_core_x(9999,1);
`ifdef NO_MEM_MSG
`else
                ErrorMessage(11);
`endif
             end else if (DVSE_i === 1'bX) begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
                Memory[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
                Memory[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(9);
`endif
             end
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(9999,0);
                end
           end
           LastCycleWAddress = B_i;
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(B_i)) begin
                Memory[B_i] = {Bits{1'bX}};
           end else begin
                if (^(B_i) === 1'bX) begin
                  all_core_x(9999,0);
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
       if (do_x == 1) begin
          #0 disable TOHDO;
          NODELAY = 1'b1;
          DO_i = {Bits{1'bX}};
       end
       LoopCount_Address=Words-1;
       while(LoopCount_Address >=0) begin
         Memory[LoopCount_Address]={Bits{1'bX}};
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
           #0 disable TOHDO;
           NODELAY = 1'b1;
           DO_i = {Bits{1'bX}};
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
             if (WEB_ !== 1'b1) begin
                all_core_x(9999,0);
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
       Memory[LoopCount_Address]={Bits{1'b0}};
          #0 disable TOHDO;
          NODELAY = 1'b1;
          DO_i = {Bits{1'b0}};
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
      specparam TAA    = (58.0:89.0:153.5);
      specparam TAA_2  = (59.5:91.7:159.4);
      specparam TAA_3  = (58.0:89.0:153.5);
      specparam TAA_4  = (56.2:86.0:147.1);
      specparam TRC  = (56.9:85.7:158.5);
      specparam TRC_2    = (56.9:85.7:158.5);
      specparam TRC_3    = (56.9:85.7:158.5);
      specparam TRC_4    = (56.9:85.7:158.5);
      specparam THPW = (9.3:15.2:25.1);
      specparam TLPW = (19.7:22.5:35.7);
      specparam TAS  = (13.1:15.1:22.5);
      specparam TAH  = (13.1:16.5:23.0);
      specparam TWS  = (10.9:14.1:25.4);
      specparam TWH  = (9.1:12.3:19.1);
      specparam TDS  = (15.8:20.0:35.1);
      specparam TDH  = (6.6:5.4:5.2);
      specparam TCSS = (20.0:24.1:39.5);
      specparam TCSH = (17.2:23.3:39.1);
      specparam TNAPH  = (8.4:18.6:35.8);
      specparam TNAP_CSH  = (22.5:31.1:49.5);
      specparam TDVSES  = (13.1:15.1:22.5);
      specparam TDVSEH  = (32.0:54.1:98.1);
      specparam TDVSS   = (13.1:15.1:22.5);
      specparam TDVSH   = (32.0:54.1:98.1);
      specparam TCR2W   = (0:0:0);


      $setuphold ( posedge CKA &&& con_A,         posedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[4], TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[4], TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[5], TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[5], TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[0], TAS,     TAH,     n_flag_B0      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[0], TAS,     TAH,     n_flag_B0      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[1], TAS,     TAH,     n_flag_B1      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[1], TAS,     TAH,     n_flag_B1      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[2], TAS,     TAH,     n_flag_B2      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[2], TAS,     TAH,     n_flag_B2      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[3], TAS,     TAH,     n_flag_B3      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[3], TAS,     TAH,     n_flag_B3      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[4], TAS,     TAH,     n_flag_B4      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[4], TAS,     TAH,     n_flag_B4      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[5], TAS,     TAH,     n_flag_B5      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[5], TAS,     TAH,     n_flag_B5      );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[0], TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[0], TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[1], TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[1], TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[2], TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[2], TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[3], TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[3], TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[4], TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[4], TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[5], TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[5], TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[6], TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[6], TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[7], TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[7], TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[8], TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[8], TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[9], TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[9], TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[10], TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[10], TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[11], TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[11], TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[12], TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[12], TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[13], TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[13], TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[14], TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[14], TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[15], TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[15], TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[16], TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[16], TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[17], TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[17], TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[18], TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[18], TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[19], TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[19], TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[20], TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[20], TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[21], TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[21], TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[22], TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[22], TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[23], TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[23], TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[24], TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[24], TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[25], TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[25], TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[26], TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[26], TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[27], TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[27], TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[28], TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[28], TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[29], TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[29], TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[30], TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[30], TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[31], TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[31], TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[32], TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[32], TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[33], TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[33], TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[34], TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[34], TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[35], TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[35], TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[36], TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[36], TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[37], TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[37], TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[38], TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[38], TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[39], TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[39], TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[40], TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[40], TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[41], TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[41], TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[42], TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[42], TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[43], TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[43], TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[44], TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[44], TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[45], TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[45], TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[46], TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[46], TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[47], TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[47], TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[48], TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[48], TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[49], TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[49], TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[50], TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[50], TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[51], TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[51], TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[52], TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[52], TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[53], TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[53], TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[54], TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[54], TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[55], TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[55], TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[56], TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[56], TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[57], TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[57], TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[58], TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[58], TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[59], TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[59], TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[60], TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[60], TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[61], TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[61], TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[62], TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[62], TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[63], TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[63], TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CKB &&& con_WEB,       posedge WEB, TWS,     TWH,     n_flag_WEB     );
      $setuphold ( posedge CKB &&& con_WEB,       negedge WEB, TWS,     TWH,     n_flag_WEB     );
      $setuphold ( posedge CKA &&& con_DVSE_WA,   posedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKA &&& con_DVSE_WA,   negedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS[0], TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS[0], TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS[1], TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS[1], TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS[2], TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS[2], TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    posedge DVS[3], TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CKA &&& con_DVS_WA,    negedge DVS[3], TDVSS,   TDVSH,   n_flag_DVS3    );

      $setuphold ( posedge CKB &&& con_DVSE_WB,   posedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKB &&& con_DVSE_WB,   negedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS[0], TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS[0], TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS[1], TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS[1], TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS[2], TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS[2], TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    posedge DVS[3], TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CKB &&& con_DVS_WB,    negedge DVS[3], TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CKA,                   posedge CSAN, TCSS,    TCSH,    n_flag_CSA     );
      $setuphold ( posedge CKA,                   negedge CSAN, TCSS,    TCSH,    n_flag_CSA     );
      $setuphold ( posedge CKB,                   posedge CSBN, TCSS,    TCSH,    n_flag_CSB     );
      $setuphold ( posedge CKB,                   negedge CSBN, TCSS,    TCSH,    n_flag_CSB     );
      $setuphold ( posedge CKB &&& CKA_CKB_SKEW,  posedge CKA, TCR2W,   0,       n_flag_TR2W    );
      $setuphold ( posedge CKA &&& CKB_CKA_SKEW,  posedge CKB, TCR2W,   0,       n_flag_TR2W    );
      $period    ( posedge CKA &&& cka_per,       TRC,                       n_flag_CKA_PER );
      $period    ( negedge CKA &&& cka_per,       TRC,                       n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per2,      TRC_2,                     n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per3,      TRC_3,                     n_flag_CKA_PER );
      $period    ( posedge CKA &&& cka_per4,      TRC_4,                     n_flag_CKA_PER );
      $period    ( negedge CKA &&& cka_per2,      TRC_2,                     n_flag_CKA_PER );
      $period    ( negedge CKA &&& cka_per3,      TRC_3,                     n_flag_CKA_PER );
      $period    ( negedge CKA &&& cka_per4,      TRC_4,                     n_flag_CKA_PER );
      $width     ( posedge CKA &&& con_CKA,       THPW,    0,                n_flag_CKA_MINH);
      $width     ( negedge CKA &&& con_CKA,       TLPW,    0,                n_flag_CKA_MINL);
      $period    ( posedge CKB &&& ckb_per,       TRC,                       n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per,       TRC,                       n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per2,      TRC_2,                     n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per3,      TRC_3,                     n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per4,      TRC_4,                     n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per2,      TRC_2,                     n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per3,      TRC_3,                     n_flag_CKB_PER );
      $period    ( negedge CKB &&& ckb_per4,      TRC_4,                     n_flag_CKB_PER );
      $width     ( posedge CKB &&& con_CKB,       THPW,    0,                n_flag_CKB_MINH);
      $width     ( negedge CKB &&& con_CKB,       TLPW,    0,                n_flag_CKB_MINL);
      $setuphold ( posedge CKA,                   posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );
      $setuphold ( posedge CKB,                   posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );

      $setuphold ( negedge NAP &&& CSBN,          negedge CSAN, 0,       TNAP_CSH, n_flag_NAP_CS  );
      $setuphold ( negedge NAP &&& CSAN,          negedge CSBN, 0,       TNAP_CSH, n_flag_NAP_CS  );


      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[0] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[1] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[2] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[3] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[4] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[5] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[6] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[7] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[8] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[9] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[10] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[11] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[12] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[13] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[14] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[15] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[16] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[17] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[18] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[19] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[20] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[21] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[22] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[23] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[24] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[25] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[26] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[27] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[28] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[29] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[30] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[31] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[32] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[33] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[34] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[35] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[36] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[37] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[38] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[39] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[40] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[41] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[42] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[43] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[44] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[45] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[46] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[47] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[48] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[49] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[50] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[51] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[52] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[53] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[54] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[55] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[56] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[57] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[58] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[59] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[60] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[61] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[62] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[63] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[0] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[1] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[2] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[3] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[4] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[5] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[6] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[7] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[8] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[9] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[10] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[11] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[12] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[13] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[14] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[15] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[16] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[17] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[18] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[19] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[20] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[21] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[22] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[23] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[24] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[25] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[26] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[27] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[28] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[29] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[30] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[31] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[32] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[33] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[34] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[35] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[36] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[37] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[38] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[39] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[40] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[41] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[42] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[43] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[44] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[45] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[46] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[47] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[48] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[49] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[50] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[51] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[52] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[53] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[54] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[55] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[56] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[57] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[58] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[59] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[60] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[61] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[62] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[63] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[0] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[1] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[2] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[3] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[4] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[5] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[6] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[7] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[8] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[9] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[10] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[11] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[12] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[13] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[14] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[15] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[16] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[17] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[18] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[19] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[20] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[21] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[22] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[23] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[24] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[25] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[26] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[27] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[28] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[29] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[30] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[31] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[32] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[33] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[34] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[35] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[36] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[37] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[38] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[39] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[40] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[41] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[42] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[43] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[44] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[45] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[46] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[47] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[48] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[49] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[50] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[51] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[52] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[53] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[54] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[55] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[56] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[57] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[58] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[59] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[60] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[61] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[62] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[63] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[0] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[1] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[2] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[3] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[4] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[5] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[6] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[7] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[8] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[9] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[10] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[11] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[12] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[13] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[14] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[15] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[16] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[17] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[18] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[19] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[20] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[21] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[22] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[23] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[24] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[25] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[26] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[27] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[28] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[29] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[30] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[31] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[32] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[33] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[34] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[35] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[36] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[37] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[38] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[39] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[40] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[41] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[42] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[43] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[44] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[45] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[46] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[47] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[48] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[49] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[50] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[51] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[52] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[53] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[54] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[55] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[56] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[57] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[58] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[59] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[60] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[61] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[62] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[63] :1'bx)) = TAA_4;



   endspecify

`endprotect
endmodule
