/*******************************************************************************
________________________________________________________________________________________________


            Synchronous Low Power Feature LVT Periphery Two-Port Register File Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________

       IP Name            :  FSH0L_L_SZLVT                   
       IP Version         :  0.6.0                           
       IP Release Status  :  Active                          
       Word               :  128                             
       Bit                :  32                              
       Byte               :  1                               
       Mux                :  2                               
       Output Loading     :  0.3                             
       Clock Input Slew   :  0.4                             
       Data Input Slew    :  0.4                             
       Ring Type          :  Ringless Model                  
       Ring Width         :  0                               
       Bus Format         :  1                               
       Memaker Path       :  /home/autumn/pdk/memory/ftclib  
       GUI Version        :  m20130120                       
       Date               :  2024/11/21 11:01:16             
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


module SZLVTLL40_128X32X1CM2b1 (A,B,DO,DI,CKA,CKB,CSAN,DVSE,DVS,WEB,CSBN,RET,SLP,NAP);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 7;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 32;               
  parameter  Words                = 128;              
  parameter  Bytes                = 1;                
  parameter  AspectRatio          = 2;                
  parameter  Tr2w                 = (50.3:76.4:137.3);
  parameter  Tw2r                 = (55.4:82.4:166.6);
  parameter  TOH                  = (36.9:55.7:95.1); 
  parameter  TOH_12               = (36.9:55.7:95.1); 
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (55.4:82.4:146.2);
`else
`endif
  parameter  TSLP_Q               = (72.3:105.9:175.6);
  parameter  TRET_Q               = (67.5:99.8:165.2);
  parameter  TSLP_Wakeup          = 575.5;            
  parameter  TRET_Wakeup          = 538.5;            
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
  input      SLP;                                     
  input      RET;                                     
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
  reg                             wrong_dvs2;         
  reg                             wrong_dvs2_ckb;     
  reg                             wrong_dvs3;         
  reg                             wrong_dvs3_ckb;     
  reg                             wrong_dvs4;         
  reg                             wrong_dvs4_ckb;     
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
  reg                             con_dvs12;          
  reg                             wrong_dvs13;        
  reg                             wrong_dvs13_ckb;    
  reg                             wrong_dvs14;        
  reg                             wrong_dvs14_ckb;    
  reg                             wrong_dvs15;        
  reg                             wrong_dvs15_ckb;    
  wire                            SLP_;               
  wire                            RET_;               
  wire                            NAP_;               




  wire                            con_A;              
  wire                            con_DI;             
  wire                            con_B;              
  wire                            con_CKA;            
  wire                            con_CKB;            
  wire                            cka_per;            
  wire                            ckb_per;            
  wire                            cka_per12;          
  wire                            ckb_per12;          

  wire                            con_SLP;            
  wire                            con_RET;            
  wire                            con_CK_SLP;         
  wire                            con_CK_RET;         
  wire                            con_CK_NAP;         
  wire                            CSA_CSB_temp;       

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
  reg                             SLP_i;              
  reg                             RET_i;              
  reg                             RETREG;             
  reg                             NAP_i;              

  reg                             n_flag_A0;          
  reg                             n_flag_A1;          
  reg                             n_flag_A2;          
  reg                             n_flag_A3;          
  reg                             n_flag_A4;          
  reg                             n_flag_A5;          
  reg                             n_flag_A6;          
  reg                             n_flag_B0;          
  reg                             n_flag_B1;          
  reg                             n_flag_B2;          
  reg                             n_flag_B3;          
  reg                             n_flag_B4;          
  reg                             n_flag_B5;          
  reg                             n_flag_B6;          
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
  reg                             n_flag_WEB;         
  reg                             n_flag_CSA;         
  reg                             n_flag_CSB;         
  reg                             n_flag_CKA_PER;     
  reg                             n_flag_CKA_MINH;    
  reg                             n_flag_CKA_MINL;    
  reg                             n_flag_CKB_PER;     
  reg                             n_flag_CKB_MINH;    
  reg                             n_flag_CKB_MINL;    
  reg                             LAST_n_flag_WEB;    
  reg                             n_flag_DVSE;        
  reg                             n_flag_DVS0;        
  reg                             n_flag_DVS1;        
  reg                             n_flag_DVS2;        
  reg                             n_flag_DVS3;        
  reg                             n_flag_TR2W;        
  reg                             CKA_CKB_SKEW;       
  reg                             CKB_CKA_SKEW;       
  reg                             LAST_n_flag_CSA;    
  reg                             LAST_n_flag_CSB;    
  reg                             LAST_n_flag_CKA_PER;
  reg                             LAST_n_flag_CKA_MINH;
  reg                             LAST_n_flag_CKA_MINL;
  reg                             LAST_n_flag_CKB_PER;
  reg                             LAST_n_flag_CKB_MINH;
  reg                             LAST_n_flag_CKB_MINL;

  reg                             n_flag_SLP;         
  reg                             n_flag_RET;         
  reg                             n_flag_SLP_CS;      
  reg                             n_flag_RET_CS;      
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
  reg                             last_SLP;           
  reg                             latch_last_SLP;     
  reg                             last_RET;           
  reg                             latch_last_RET;     

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
  reg                             slp_initial_trigger;
  reg                             ret_initial_trigger;
  reg                             nap_initial_trigger;

  event                           EventSLPT;          
  event                           EventRETT;          
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
  assign     cka_per12            = CSA_ & DVSE_ & !DVS_[0] & !DVS_[1] & DVS_[2] & DVS_[3];
  assign     ckb_per12            = CSB_ & DVSE_ & !DVS_[0] & !DVS_[1] & DVS_[2] & DVS_[3];
  assign     con_DVSE_WA          = CSA_;
  assign     con_DVS_WA           = CSA_ & DVSE_;
  assign     con_DVSE_WB          = CSB_;
  assign     con_DVS_WB           = CSB_ & DVSE_;

  assign     con_SLP              = (!CSA_) & (!CSB_);
  assign     con_RET              = (!CSA_) & (!CSB_);
  assign     con_CK_SLP           = CSA_CSB_temp & (!NOSTANDBY);
  assign     con_CK_RET           = CSA_CSB_temp & (!NOSTANDBY) & (!SLP_);
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
  buf        ia0             (A_[0], A[0]);                
  buf        ia1             (A_[1], A[1]);                
  buf        ia2             (A_[2], A[2]);                
  buf        ia3             (A_[3], A[3]);                
  buf        ia4             (A_[4], A[4]);                
  buf        ia5             (A_[5], A[5]);                
  buf        ia6             (A_[6], A[6]);                
  buf        ib0             (B_[0], B[0]);                
  buf        ib1             (B_[1], B[1]);                
  buf        ib2             (B_[2], B[2]);                
  buf        ib3             (B_[3], B[3]);                
  buf        ib4             (B_[4], B[4]);                
  buf        ib5             (B_[5], B[5]);                
  buf        ib6             (B_[6], B[6]);                
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

  buf        islp0           (SLP_, SLP);                  
  buf        iret0           (RET_, RET);                  
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
    CS_tri_error = 1'b0;
    Violate_Hold_time = 1'b0;
    Last_CKA_temp = 1'b0;
    Last_CKB_temp = 1'b0;
    NOSTANDBY = 1'b0; 
    RETREG = 1'b0;  
    slp_initial_trigger = 1'b0;  
    ret_initial_trigger = 1'b0;  
    nap_initial_trigger = 1'b0;  
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

  always @(posedge CKA_) begin
    if (CSA_ === 1'b0) begin
      CSA_temp = 1'b1;
    end
    NOSTANDBY = 1'b0;
  end
  always @(posedge CKB_) begin
    if (CSB_ === 1'b0) begin
      CSB_temp = 1'b1;
    end
    NOSTANDBY = 1'b0;
  end

  always @(posedge CSA_CSB_temp) begin
    if (SLP_ === 1'bx || SLP_ === 1'bz) begin
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
      pin_unknow;
    end
    else if (SLP_ === 1'b0 && (RET_ === 1'bx || RET_ === 1'bz)) begin
`ifdef NO_MEM_MSG
`else
      ErrorMessage(9);
`endif
      pin_unknow;
    end
    else if (SLP_ === 1'b0 && RET_ === 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
`ifdef NO_MEM_MSG
`else
      ErrorMessage(15);
`endif
      disable NAPT;
      DO_i    = DO_tmp;
    end
  end

  always @(posedge CSA_) begin
    CSA_temp = 1'b0;
    if ($time !== 1'b0 && (SLP_ === 1'b1 || SLP_ === 1'bx || SLP_ === 1'bz) && CSA_CSB_temp === 1'b1 && slp_initial_trigger === 1'b0 && ret_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(10);
`endif
      pin_unknow;
    end else if ($time !== 1'b0 && SLP_ === 1'b0) begin
      if ((RET === 1'b1 || RET === 1'bx || RET === 1'bz) && CSA_CSB_temp === 1'b1 && slp_initial_trigger === 1'b0 && ret_initial_trigger === 1'b0) begin
        CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
        ErrorMessage(11);
`endif
        pin_unknow;
      end else if (RET_ === 1'b0) begin
        if (NAP_ === 1'b1 && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
          CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
          ErrorMessage(16);
`endif
          disable NAPT;
          DO_i    = DO_tmp;
        end else if ((NAP_ === 1'bx || NAP_ === 1'bz) && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
          CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
          ErrorMessage(15);
`endif
          disable NAPT;
          DO_i    = DO_tmp;
        end
      end
    end
  end

  always @(posedge CSB_) begin
    CSB_temp = 1'b0;
    if ($time !== 1'b0 && (SLP_ === 1'b1 || SLP_ === 1'bx || SLP_ === 1'bz) && CSA_CSB_temp === 1'b1 && slp_initial_trigger === 1'b0 && ret_initial_trigger === 1'b0) begin
      CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(10);
`endif
      pin_unknow;
    end else if ($time !== 1'b0 && SLP_ === 1'b0) begin
      if ((RET === 1'b1 || RET === 1'bx || RET === 1'bz) && CSA_CSB_temp === 1'b1 && slp_initial_trigger === 1'b0 && ret_initial_trigger === 1'b0) begin
        CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
        ErrorMessage(11);
`endif
        pin_unknow;
      end else if (RET_ === 1'b0) begin
        if (NAP_ === 1'b1 && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
          CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
          ErrorMessage(16);
`endif
          disable NAPT;
          DO_i    = DO_tmp;
        end else if ((NAP_ === 1'bx || NAP_ === 1'bz) && CSA_CSB_temp === 1'b1 && nap_initial_trigger === 1'b0) begin
          CS_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
          ErrorMessage(15);
`endif
          disable NAPT;
          DO_i    = DO_tmp;
        end
      end
    end
  end

  always @(posedge SLP_) begin
    if ($time === 0) begin
      pin_unknow;
      slp_initial_trigger = 1'b1;
    end
    if ($time !== 1'b0 && SLP_ === 1'b1 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0 && NOSTANDBY === 1'b0) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
        -> EventSLPT;
      end
    end else if ($time !== 1'b0 && (SLP_ === 1'bx || SLP_ === 1'bz)) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
         ErrorMessage(8);
`endif
         pin_unknow;
      end
    end
  end

  always @(negedge SLP_) begin
    if ($time !== 1'b0 && SLP_ === 1'b0 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
         disable SLPT;
         DO_tmp = {Bits{1'bX}};
         DO_i    = DO_tmp;
      end
    end else if ($time !== 1'b0 && (SLP_ === 1'bx || SLP_ === 1'bz)) begin
      if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
         ErrorMessage(8);
`endif
         pin_unknow;
      end
    end
    if (RET_ === 1'b0) begin
       #TSLP_Wakeup
        Violate_Hold_time = 1'b0;
        CS_tri_error = 1'b0;
    end
  end

  always @(negedge SLP_) begin
       #TSLP_Wakeup slp_initial_trigger = 1'b0;
  end

  always @(n_flag_CSA) begin
    if ($time !== 1'b0 && CSB_ === 1'b0) begin
      disable SLPT;
      disable RETT;
      disable NAPT;
      NOSTANDBY = 1'b1;
    end
  end
  always @(n_flag_CSB) begin
    if ($time !== 1'b0 && CSA_ === 1'b0) begin
      disable SLPT;
      disable RETT;
      disable NAPT;
      NOSTANDBY = 1'b1;
    end
  end

  always @(n_flag_SLP) begin
    if ($time !== 1'b0) begin
      disable SLPT;
    end
  end

  always @(n_flag_SLP_CS) begin
`ifdef NO_MEM_MSG
`else
    ErrorMessage(6);
`endif
    Violate_Hold_time = 1'b1;
    pin_unknow;
  end

  always @(posedge RET_) begin
    if ($time === 0) begin
       pin_unknow;
       ret_initial_trigger = 1'b1;
    end
    if (SLP_ === 1'b0) begin
      if ($time !== 1'b0 && RET_ === 1'b1 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0 && NOSTANDBY === 1'b0) begin
        if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
          -> EventRETT;
        end
      end else if ($time !== 1'b0 && (RET_ === 1'bx || RET_ === 1'bz)) begin
        if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
          ErrorMessage(9);
`endif
          pin_unknow;
        end
      end
    end
  end

   always @(negedge RET_) begin
     if (SLP_ === 1'b0) begin
       if ($time !== 1'b0 && RET_ === 1'b0 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0) begin
         if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
            disable RETT;
            DO_tmp = {Bits{1'bX}};
            DO_i    = DO_tmp;
         end
       end else if ($time !== 1'b0 && (RET_ === 1'bx || RET_ === 1'bz)) begin
         if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
            ErrorMessage(9);
`endif
            pin_unknow;
         end
       end
     end
     if (SLP_ === 1'b0) begin
         #TRET_Wakeup
          Violate_Hold_time = 1'b0;
          CS_tri_error = 1'b0;
     end
   end

  always @(negedge RET_) begin
        #TRET_Wakeup  ret_initial_trigger = 1'b0;
  end

   always @(n_flag_RET) begin
     if ($time !== 1'b0) begin
        disable RETT;
     end
   end

  always @(n_flag_RET_CS) begin
    if ($time !== 1'b0) begin
`ifdef NO_MEM_MSG
`else
       ErrorMessage(7);
`endif
       Violate_Hold_time = 1'b1;
       pin_unknow;
    end
  end

  always @(posedge NAP_) begin
    if ($time === 0) begin
      disable NAPT;
      DO_i    = DO_tmp;
      nap_initial_trigger = 1'b1;
    end
    if (SLP_ === 1'b0 && RET_ === 1'b0) begin
      if ($time !== 1'b0 && NAP_ === 1'b1 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0 && NOSTANDBY === 1'b0) begin
        if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
          -> EventNAPT;
        end
      end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
        if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
          ErrorMessage(15);
`endif
          disable NAPT;
          DO_i    = DO_tmp;
        end
      end
    end
  end

  always @(negedge NAP_) begin
    if (SLP_ === 1'b0 && RET_ === 1'b0) begin
      if ($time !== 1'b0 && NAP_ === 1'b0 && CS_tri_error === 1'b0 && CSA_CSB_temp === 1'b1 && Violate_Hold_time === 1'b0) begin
        if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
          disable NAPT;
          DO_i    = DO_tmp;
        end
      end else if ($time !== 1'b0 && (NAP_ === 1'bx || NAP_ === 1'bz)) begin
        if (CSA_ === 1'b0 && CSB_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
          ErrorMessage(15);
`endif
          disable NAPT;
          DO_i    = DO_tmp;
        end
      end
    end
    if (SLP_ === 1'b0 && RET_ === 1'b0) begin
     #TNAP_Wakeup
      Violate_Hold_time = 1'b0;
      CS_tri_error = 1'b0;
    end
  end

  always @(negedge NAP_) begin
    #TNAP_Wakeup nap_initial_trigger = 1'b0;
  end
  
  always @(n_flag_NAP_CS) begin
`ifdef NO_MEM_MSG
`else
    ErrorMessage(17);
`endif
    Violate_Hold_time = 1'b1;
    disable NAPT;
          DO_i    = DO_tmp;
  end



  always @(CKA_) begin
    casez ({LastClkAEdge,CKA_})
      2'b01:
         #0
         if (SLP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
            -> EventSLPT;
         end else if (SLP_ === 1'b0 && RET_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
            -> EventRETT;
         end else if (SLP_ === 1'b0 && RET_ === 1'b0 && NAP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
            -> EventNAPT;
         end else begin
           if (CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0 && slp_initial_trigger === 1'b0 && ret_initial_trigger === 1'b0) begin
              if (CSA_ === 1'b1) begin
                last_A = latch_last_A;
              end
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
           wrong_dvs2 = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs3 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs4 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs5 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs6 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs7 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs8 = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs9 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs10 = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs11 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           con_dvs12  = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs13 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs14 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs15 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
              if (CSA_==1'b1) Last_tc_ClkA_PosEdge = $time;
              read_memory_function;
`ifdef TRC_CHECK
              trc_timiming_monitorA;
`else
`endif
              if (CSA_ === 1'b1) begin
                latch_last_A = A_;
              end
           end else begin
              pin_unknow;
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
         if (SLP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
           -> EventSLPT; 
         end else if (SLP_ === 1'b0 && RET_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
           -> EventRETT;
         end else if (SLP_ === 1'b0 && RET_ === 1'b0 && NAP_ === 1'b1 && CSA_ === 1'b0 && CSB_ === 1'b0 && CSA_CSB_temp === 1'b1 && CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
            -> EventNAPT;
         end else begin
           if (CS_tri_error === 1'b0 && Violate_Hold_time === 1'b0 && slp_initial_trigger === 1'b0 && ret_initial_trigger === 1'b0) begin
             CSB_monitor;
             pre_latch_wdata;
           if (CSB_ !== 0 && DVSE_ === 1'b1) begin
             DVS_TRIGGER_CKB = 1'b1;
           end else begin
             DVS_TRIGGER_CKB = 1'b0;
           end
           wrong_dvs0_ckb = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs1_ckb = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs2_ckb = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs3_ckb = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs4_ckb = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs5_ckb = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs6_ckb = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs7_ckb = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs8_ckb = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs9_ckb = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs10_ckb = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
           wrong_dvs11_ckb = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER_CKB;
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
           pin_unknow;
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
           n_flag_A6 or
           n_flag_B0 or
           n_flag_B1 or
           n_flag_B2 or
           n_flag_B3 or
           n_flag_B4 or
           n_flag_B5 or
           n_flag_B6 or
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

  always @(EventSLPT)
    begin: SLPT
      NODELAY = 1'b1;
      all_core_x(9999,1);
      DO_i    = DO_tmp;
      #TSLP_Q
      DO_tmp = {Bits{1'b0}};
      DO_i    = DO_tmp;
  end 



  always @(EventRETT)
    begin: RETT
      NODELAY = 1'b1;
      DO_i    = DO_tmp;
      #TRET_Q
      DO_tmp = {Bits{1'b0}};
      DO_i    = DO_tmp;
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
      end else if (con_dvs12) begin
        #TOH_12 
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

  task addr_holdtiming_violation;
    begin
       if (con_dvse) #TOH;
       else if (con_dvs12) #TOH_12; 
    end
  endtask // end addr_holdtiming_violation;
  task holdtiming_violation;
    begin
       if (con_dvse) #TOH;
       else if (con_dvs12) #TOH_12; 
      {DO_i} <=  {Bits{1'bX}}; 
    end
  endtask // end holdtiming_violation;

  task timingcheck_violation;
    integer i;
    begin
      // READ PORT
      if ((n_flag_CKA_PER  !== LAST_n_flag_CKA_PER)  ||
          (n_flag_CKA_MINH !== LAST_n_flag_CKA_MINH) ||
          (n_flag_CKA_MINL !== LAST_n_flag_CKA_MINL)) begin
          if (CSA_ !== 1'b0) begin
              holdtiming_violation;
           #0 disable TOHDO;
           NODELAY = 1'b1;
           DO_i = {Bits{1'bX}};
          end
      end
      else begin
          NOT_BUS_A  = {
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
			  if (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) begin 
              holdtiming_violation;
            end
          end
          for (i=0; i<DVSize; i=i+1) begin
            if (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) begin
              holdtiming_violation;
            end
          end
          if (n_flag_DVSE  !== LAST_n_flag_DVSE) begin
          	holdtiming_violation;
          end
          if (n_flag_CSA  !== LAST_n_flag_CSA) begin
          	holdtiming_violation;
          end
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
              holdtiming_violation;
             if (WEB_ !== 1'b1) begin
                all_core_x(9999,0);
             end
          end
      end
      else begin
          NOT_BUS_B  = {
                         n_flag_B6,
                         n_flag_B5,
                         n_flag_B4,
                         n_flag_B3,
                         n_flag_B2,
                         n_flag_B1,
                         n_flag_B0};

          NOT_BUS_DI  = {
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
			  if (NOT_BUS_B[i] !== LAST_NOT_BUS_B[i]) begin 
              holdtiming_violation;
            end
          end
          for (i=0; i<Bits; i=i+1) begin
          if (
               (NOT_BUS_DI[i] !== LAST_NOT_BUS_DI[i]) )
            begin
              holdtiming_violation;
            end
          end
          for (i=0; i<DVSize; i=i+1) begin
            if (NOT_BUS_DVS[i] !== LAST_NOT_BUS_DVS[i]) begin
              holdtiming_violation;
            end
          end
          if (n_flag_DVSE  !== LAST_n_flag_DVSE) begin
          	holdtiming_violation;
          end
          if (n_flag_CSB  !== LAST_n_flag_CSB) begin
          	holdtiming_violation;
          end
          if (
               (n_flag_WEB !== LAST_n_flag_WEB) )
               begin
                 holdtiming_violation;
               end
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
                addr_holdtiming_violation;
                #0 disable TOHDO;
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
                     ErrorMessage(12);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(12);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(14); $finish;
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
                     ErrorMessage(12);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(12);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(14); $finish;
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
                     ErrorMessage(12);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(12);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                     NODELAY = 1'b1;
                     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(14); $finish;
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
                addr_holdtiming_violation;
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
             end else if (wrong_dvs0_ckb || wrong_dvs1_ckb || wrong_dvs2_ckb || wrong_dvs3_ckb || wrong_dvs4_ckb || wrong_dvs5_ckb || wrong_dvs6_ckb || wrong_dvs7_ckb || wrong_dvs8_ckb || wrong_dvs9_ckb || wrong_dvs10_ckb || wrong_dvs11_ckb || wrong_dvs13_ckb || wrong_dvs14_ckb || wrong_dvs15_ckb) begin
                NODELAY = 1'b1;
                all_core_x(9999,1);
`ifdef NO_MEM_MSG
`else
                ErrorMessage(14); $finish;
`endif
             end else if (DVSE_i === 1'bX) begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
                Memory[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(12);
`endif
             end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
                Memory[B_i] = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                ErrorMessage(12);
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

  task pin_unknow;
    begin
      disable SLPT;
      disable RETT;
      disable NAPT;
      disable TOHDO;
      NODELAY = 1'b1;
      all_core_x(9999,1);
      DO_tmp = {Bits{1'bX}};
      DO_i    = DO_tmp;
    end
  endtask


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
         6: $display("** MEM_Error: SLP turn off, CSA or CSB must operate in the TSLP_CSH later %m",$time);
         7: $display("** MEM_Error: RET turn off, CSA or CSB must operate in the TSLP_RET later %m",$time);
         8: $display("** MEM_Error: SLP is unknow or high-z, DO are unknown, all memory core is unknown %m",$time);
         9: $display("** MEM_Error: RET is unknow or high-z, DO are unknown, all memory core is unknown %m",$time);
        10: $display("** MEM_Error: CSA or CSB negedge trigger, SLP don't operate high, so DO are unknown, all memory core is unknown %m",$time);
        11: $display("** MEM_Error: CSA or CSB negedge trigger, RET don't operate high, so DO are unknown, all memory core is unknown %m",$time);
        12: $display("** MEM_Error: DVS or DVSE appear unknown state (%t) in clock of %m",$time);
        14: $display("** MEM_Error: DVS doesn't operate the status (%t) in clock of %m",$time);
        15: $display("** MEM_Error: NAP is unknow or high-z, DO keep data, all memory core keep data %m",$time);
        16: $display("** MEM_Error: CSA or CSB negedge trigger, NAP be operated high, so DO keep data, all memory core keep data %m",$time);
        17: $display("** MEM_Error: NAP turn off, CSB must operate in the TNAP_CSH later %m",$time);
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
      specparam TAA    = (56.8:84.4:139.0);
      specparam TDEFAULT    = (56.8:84.4:139.0);
      specparam TAA_12  = (56.8:84.4:139.0);
      specparam TRC  = (55.4:82.4:146.2);
      specparam TRC_12    = (55.4:82.4:146.2);
      specparam THPW = (8.7:14.3:23.2);
      specparam TLPW = (21.2:24.9:37.9);
      specparam TAS  = (11.7:16.0:27.0);
      specparam TAH  = (11.3:15.7:22.3);
      specparam TWS  = (15.2:19.5:33.9);
      specparam TWH  = (3.1:5.2:10.1);
      specparam TDS  = (16.9:21.2:36.9);
      specparam TDH  = (6.3:5.2:5.5);
      specparam TCSS = (16.9:23.9:42.7);
      specparam TCSH = (16.9:22.8:37.0);
      specparam TSLPH  = (7.6:16.9:33.2);
      specparam TRETH  = (7.6:16.9:33.2);
      specparam TSLP_CSH  = (268.8:377.9:575.5);
      specparam TRET_CSH  = (256.4:348.2:538.5);
      specparam TNAPH  = (7.6:16.9:33.2);
      specparam TNAP_CSH  = (84.4:102.6:142.6);
      specparam TDVSES  = (16.9:23.9:42.7);
      specparam TDVSEH  = (54.2:85.2:147.6);
      specparam TDVSS   = (16.9:23.9:42.7);
      specparam TDVSH   = (54.2:85.2:147.6);
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
      $setuphold ( posedge CKA &&& con_A,         posedge A[6], TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[6], TAS,     TAH,     n_flag_A6      );
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
      $setuphold ( posedge CKB &&& con_B,         posedge B[6], TAS,     TAH,     n_flag_B6      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[6], TAS,     TAH,     n_flag_B6      );
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
      $period    ( posedge CKA &&& cka_per12,     TRC_12,                    n_flag_CKA_PER );
      $width     ( posedge CKA &&& con_CKA,       THPW,    0,                n_flag_CKA_MINH);
      $width     ( negedge CKA &&& con_CKA,       TLPW,    0,                n_flag_CKA_MINL);
      $period    ( posedge CKB &&& ckb_per,       TRC,                       n_flag_CKB_PER );
      $period    ( posedge CKB &&& ckb_per12,     TRC_12,                    n_flag_CKB_PER );
      $width     ( posedge CKB &&& con_CKB,       THPW,    0,                n_flag_CKB_MINH);
      $width     ( negedge CKB &&& con_CKB,       TLPW,    0,                n_flag_CKB_MINL);

      $setuphold ( posedge CKA,                   posedge SLP &&& con_CK_SLP, 0,       TSLPH,   n_flag_SLP     );
      $setuphold ( posedge CKB,                   posedge SLP &&& con_CK_SLP, 0,       TSLPH,   n_flag_SLP     );
      $setuphold ( posedge CKA,                   posedge RET &&& con_CK_RET, 0,       TRETH,   n_flag_RET     );
      $setuphold ( posedge CKB,                   posedge RET &&& con_CK_RET, 0,       TRETH,   n_flag_RET     );

      $setuphold ( negedge SLP &&& con_SLP,       negedge CSAN, 0,       TSLP_CSH, n_flag_SLP_CS  );
      $setuphold ( negedge SLP &&& con_SLP,       negedge CSBN, 0,       TSLP_CSH, n_flag_SLP_CS  );

      $setuphold ( negedge RET &&& con_RET,       negedge CSAN, 0,       TRET_CSH, n_flag_RET_CS  );
      $setuphold ( negedge RET &&& con_RET,       negedge CSBN, 0,       TRET_CSH, n_flag_RET_CS  );

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
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs0)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs1)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs2)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs3)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs4)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs5)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs6)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs7)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs8)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs9)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs10)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs11)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[0] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[1] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[2] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[3] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[4] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[5] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[6] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[7] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[8] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[9] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[10] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[11] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[12] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[13] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[14] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[15] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[16] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[17] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[18] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[19] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[20] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[21] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[22] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[23] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[24] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[25] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[26] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[27] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[28] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[29] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[30] :1'bx)) = TAA_12;
      if (NODELAY == 0 && con_dvs12)  (posedge CKA => (DO[31] :1'bx)) = TAA_12;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs13)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs14)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[0] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[1] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[2] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[3] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[4] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[5] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[6] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[7] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[8] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[9] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[10] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[11] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[12] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[13] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[14] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[15] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[16] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[17] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[18] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[19] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[20] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[21] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[22] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[23] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[24] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[25] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[26] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[27] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[28] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[29] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[30] :1'bx)) = TDEFAULT;
      if (NODELAY == 0 && wrong_dvs15)  (posedge CKA => (DO[31] :1'bx)) = TDEFAULT;


      if (RETREG == 1)  (posedge RET => (DO[0] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[1] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[2] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[3] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[4] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[5] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[6] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[7] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[8] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[9] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[10] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[11] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[12] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[13] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[14] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[15] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[16] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[17] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[18] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[19] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[20] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[21] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[22] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[23] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[24] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[25] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[26] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[27] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[28] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[29] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[30] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge RET => (DO[31] :1'bx)) = 0    ;


      if (RETREG == 1)  (posedge SLP => (DO[0] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[1] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[2] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[3] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[4] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[5] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[6] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[7] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[8] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[9] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[10] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[11] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[12] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[13] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[14] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[15] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[16] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[17] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[18] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[19] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[20] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[21] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[22] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[23] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[24] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[25] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[26] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[27] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[28] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[29] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[30] :1'bx)) = 0    ;
      if (RETREG == 1)  (posedge SLP => (DO[31] :1'bx)) = 0    ;




   endspecify

`endprotect
endmodule
