/*******************************************************************************
________________________________________________________________________________________________


            Synchronous LVT Periphery Ultra-High-Speed One-Port Register File Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________

       IP Name            :  FSH0L_G_SQLVT                   
       IP Version         :  1.0.0                           
       IP Release Status  :  Active                          
       Word               :  256                             
       Bit                :  8                               
       Byte               :  4                               
       Mux                :  2                               
       Output Loading     :  0.3                             
       Clock Input Slew   :  0.4                             
       Data Input Slew    :  0.4                             
       Ring Type          :  Ringless Model                  
       Ring Width         :  0                               
       Bus Format         :  1                               
       Memaker Path       :  /home/autumn/pdk/memory/ftclib  
       GUI Version        :  m20130120                       
       Date               :  2024/08/21 10:14:58             
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


module SQLVTLG40_256X8X4CM2b1 (A,DO,DI,DVSE,DVS,WEB,CK,CSB);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `FALSE;           
  parameter  AddressSize          = 8;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 8;                
  parameter  Words                = 256;              
  parameter  Bytes                = 4;                
  parameter  AspectRatio          = 2;                
  parameter  TOH                  = (7.3:10.2:15.9);  
  parameter  TOH_2                = (7.3:10.2:15.9);  
  parameter  TOH_3                = (7.3:10.2:15.9);  
  parameter  TOH_4                = (7.3:10.2:15.9);  
  parameter  TWDX                 = (7.3:10.2:15.9);  
  parameter  TWDX_2               = (7.3:10.2:15.9);  
  parameter  TWDX_3               = (7.3:10.2:15.9);  
  parameter  TWDX_4               = (7.3:10.2:15.9);  
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (26.4:39.2:68.5); 
`else
`endif

  output     [Bytes*Bits-1:0]     DO;                 
  input      [Bytes*Bits-1:0]     DI;                 
  input      [AddressSize-1:0]    A;                  
  input      DVSE;                                    
  input      [DVSize-1:0]         DVS;                
  input      [Bytes-1:0]          WEB;                
  input      CK;                                      
  input      CSB;                                     

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
  wire                            CK_;                
  wire                            CS_;                

  wire       [DVSize-1:0]         DVS_;               
  wire                            DVSE_;              
  reg                             DVS_TRIGGER;        

  reg                             con_dvse;           
  reg                             wrong_dvs0;         
  reg                             wrong_dvs1;         
  reg                             con_dvs2;           
  reg                             con_dvs3;           
  reg                             con_dvs4;           
  reg                             wrong_dvs5;         
  reg                             wrong_dvs6;         
  reg                             wrong_dvs7;         
  reg                             wrong_dvs8;         
  reg                             wrong_dvs9;         
  reg                             wrong_dvs10;        
  reg                             wrong_dvs11;        
  reg                             wrong_dvs12;        
  reg                             wrong_dvs13;        
  reg                             wrong_dvs14;        
  reg                             wrong_dvs15;        

  reg                             read0;              
  reg                             write0;             
  reg                             read1;              
  reg                             write1;             
  reg                             read2;              
  reg                             write2;             
  reg                             read3;              
  reg                             write3;             




  wire                            con_A;              
  wire                            con_DI_byte0;       
  wire                            con_DI_byte1;       
  wire                            con_DI_byte2;       
  wire                            con_DI_byte3;       
  wire                            con_CK;             
  wire                            ck_per;             
  wire                            ck_per2;            
  wire                            ck_per3;            
  wire                            ck_per4;            
  wire                            con_WEB0;           
  wire                            con_WEB1;           
  wire                            con_WEB2;           
  wire                            con_WEB3;           
  wire                            con_DVSE_W;         
  wire                            con_DVS_W;          

  reg        [AddressSize-1:0]    Latch_A;            
  reg        [Bits-1:0]           Latch_DI_byte0;     
  reg        [Bits-1:0]           Latch_DI_byte1;     
  reg        [Bits-1:0]           Latch_DI_byte2;     
  reg        [Bits-1:0]           Latch_DI_byte3;     
  reg                             Latch_WEB0;         
  reg                             Latch_WEB1;         
  reg                             Latch_WEB2;         
  reg                             Latch_WEB3;         
  reg                             Latch_CS;           
  reg                             Latch_DVSE;         
  reg        [DVSize-1:0]         Latch_DVS;          


  reg        [AddressSize-1:0]    A_i;                
  reg        [Bits-1:0]           DI_byte0_i;         
  reg        [Bits-1:0]           DI_byte1_i;         
  reg        [Bits-1:0]           DI_byte2_i;         
  reg        [Bits-1:0]           DI_byte3_i;         
  reg                             WEB0_i;             
  reg                             WEB1_i;             
  reg                             WEB2_i;             
  reg                             WEB3_i;             
  reg                             CS_i;               
  reg                             DVSE_i;             
  reg        [DVSize-1:0]         DVS_i;              

  reg                             n_flag_A0;          
  reg                             n_flag_A1;          
  reg                             n_flag_A2;          
  reg                             n_flag_A3;          
  reg                             n_flag_A4;          
  reg                             n_flag_A5;          
  reg                             n_flag_A6;          
  reg                             n_flag_A7;          
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
  reg                             n_flag_CS;          
  reg                             n_flag_DVSE;        
  reg                             n_flag_DVS0;        
  reg                             n_flag_DVS1;        
  reg                             n_flag_DVS2;        
  reg                             n_flag_DVS3;        
  reg                             n_flag_CK_PER;      
  reg                             n_flag_CK_MINH;     
  reg                             n_flag_CK_MINL;     
  reg                             LAST_n_flag_WEB0;   
  reg                             LAST_n_flag_WEB1;   
  reg                             LAST_n_flag_WEB2;   
  reg                             LAST_n_flag_WEB3;   


  reg                             LAST_n_flag_CS;     
  reg                             LAST_n_flag_CK_PER; 
  reg                             LAST_n_flag_CK_MINH;
  reg                             LAST_n_flag_CK_MINL;
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

  reg        [Bits-1:0]           last_DI_byte0;      
  reg        [Bits-1:0]           latch_last_DI_byte0;
  reg        [Bits-1:0]           last_DI_byte1;      
  reg        [Bits-1:0]           latch_last_DI_byte1;
  reg        [Bits-1:0]           last_DI_byte2;      
  reg        [Bits-1:0]           latch_last_DI_byte2;
  reg        [Bits-1:0]           last_DI_byte3;      
  reg        [Bits-1:0]           latch_last_DI_byte3;

  reg                             last_WEB0;          
  reg                             latch_last_WEB0;    
  reg                             last_WEB1;          
  reg                             latch_last_WEB1;    
  reg                             last_WEB2;          
  reg                             latch_last_WEB2;    
  reg                             last_WEB3;          
  reg                             latch_last_WEB3;    

  reg        [Bits-1:0]           DO_byte0_i;         
  reg        [Bits-1:0]           DO_byte1_i;         
  reg        [Bits-1:0]           DO_byte2_i;         
  reg        [Bits-1:0]           DO_byte3_i;         



  reg                             LastClkEdge;        

  reg                             flag_A_x;           
  reg                             flag_CS_x;          

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
`else
`endif

  event                           EventTWDXDO_byte0;  
  event                           EventTWDXDO_byte1;  
  event                           EventTWDXDO_byte2;  
  event                           EventTWDXDO_byte3;  


  assign     DO_                  = {DO_byte3_i,DO_byte2_i,DO_byte1_i,DO_byte0_i};
  assign     con_A                = CS_;
  assign     con_DI_byte0         = CS_ & (!WEB0_);
  assign     con_DI_byte1         = CS_ & (!WEB1_);
  assign     con_DI_byte2         = CS_ & (!WEB2_);
  assign     con_DI_byte3         = CS_ & (!WEB3_);
  assign     con_WEB0             = CS_;
  assign     con_WEB1             = CS_;
  assign     con_WEB2             = CS_;
  assign     con_WEB3             = CS_;
  assign     con_CK               = CS_;
  assign     ck_per               = CS_ & !DVSE_;
  assign     ck_per2              = CS_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ck_per3              = CS_ & DVSE_ & DVS_[0] & DVS_[1] & !DVS_[2] & !DVS_[3];
  assign     ck_per4              = CS_ & DVSE_ & !DVS_[0] & !DVS_[1] & DVS_[2] & !DVS_[3];
  assign     con_DVSE_W           = CS_;
  assign     con_DVS_W            = CS_ & DVSE_;

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
  buf        ick0            (CK_, CK);                    
  buf        ia0             (A_[0], A[0]);                
  buf        ia1             (A_[1], A[1]);                
  buf        ia2             (A_[2], A[2]);                
  buf        ia3             (A_[3], A[3]);                
  buf        ia4             (A_[4], A[4]);                
  buf        ia5             (A_[5], A[5]);                
  buf        ia6             (A_[6], A[6]);                
  buf        ia7             (A_[7], A[7]);                
  buf        idi_byte0_0     (DI_byte0_[0], DI[0]);        
  buf        idi_byte0_1     (DI_byte0_[1], DI[1]);        
  buf        idi_byte0_2     (DI_byte0_[2], DI[2]);        
  buf        idi_byte0_3     (DI_byte0_[3], DI[3]);        
  buf        idi_byte0_4     (DI_byte0_[4], DI[4]);        
  buf        idi_byte0_5     (DI_byte0_[5], DI[5]);        
  buf        idi_byte0_6     (DI_byte0_[6], DI[6]);        
  buf        idi_byte0_7     (DI_byte0_[7], DI[7]);        
  buf        idi_byte1_0     (DI_byte1_[0], DI[8]);        
  buf        idi_byte1_1     (DI_byte1_[1], DI[9]);        
  buf        idi_byte1_2     (DI_byte1_[2], DI[10]);       
  buf        idi_byte1_3     (DI_byte1_[3], DI[11]);       
  buf        idi_byte1_4     (DI_byte1_[4], DI[12]);       
  buf        idi_byte1_5     (DI_byte1_[5], DI[13]);       
  buf        idi_byte1_6     (DI_byte1_[6], DI[14]);       
  buf        idi_byte1_7     (DI_byte1_[7], DI[15]);       
  buf        idi_byte2_0     (DI_byte2_[0], DI[16]);       
  buf        idi_byte2_1     (DI_byte2_[1], DI[17]);       
  buf        idi_byte2_2     (DI_byte2_[2], DI[18]);       
  buf        idi_byte2_3     (DI_byte2_[3], DI[19]);       
  buf        idi_byte2_4     (DI_byte2_[4], DI[20]);       
  buf        idi_byte2_5     (DI_byte2_[5], DI[21]);       
  buf        idi_byte2_6     (DI_byte2_[6], DI[22]);       
  buf        idi_byte2_7     (DI_byte2_[7], DI[23]);       
  buf        idi_byte3_0     (DI_byte3_[0], DI[24]);       
  buf        idi_byte3_1     (DI_byte3_[1], DI[25]);       
  buf        idi_byte3_2     (DI_byte3_[2], DI[26]);       
  buf        idi_byte3_3     (DI_byte3_[3], DI[27]);       
  buf        idi_byte3_4     (DI_byte3_[4], DI[28]);       
  buf        idi_byte3_5     (DI_byte3_[5], DI[29]);       
  buf        idi_byte3_6     (DI_byte3_[6], DI[30]);       
  buf        idi_byte3_7     (DI_byte3_[7], DI[31]);       
  not        ics0            (CS_, CSB);                   
  buf        iweb0           (WEB0_, WEB[0]);              
  buf        iweb1           (WEB1_, WEB[1]);              
  buf        iweb2           (WEB2_, WEB[2]);              
  buf        iweb3           (WEB3_, WEB[3]);              

  buf        idvs0           (DVS_[0], DVS[0]);            
  buf        idvs1           (DVS_[1], DVS[1]);            
  buf        idvs2           (DVS_[2], DVS[2]);            
  buf        idvs3           (DVS_[3], DVS[3]);            
  buf        idvse           (DVSE_, DVSE);                


  initial begin
    $timeformat (-12, 0, " ps", 20);
    flag_A_x = `FALSE;
    NODELAY0 = 1'b0;
    NODELAY1 = 1'b0;
    NODELAY2 = 1'b0;
    NODELAY3 = 1'b0;
    LastClkEdge = 1'b0;
    DVS_TRIGGER = 1'b0;
  `ifdef MEM_INIT_ZERO
       all_core_x(0,0);
       all_core_x(1,0);
       all_core_x(2,0);
       all_core_x(3,0);
  `else
  `endif
  `ifdef MEM_VERIFY
    taa_verify = 0;
  `else
  `endif
  end

  always @(negedge CS_) begin
    if (SYN_CS == `FALSE) begin
       ->EventNegCS;
    end
  end
  always @(posedge CS_) begin
    if (SYN_CS == `FALSE) begin
       disable NegCS;
    end
  end





  always @(CK_) begin
    casez ({LastClkEdge,CK_})
      2'b01:
         begin
           last_A = latch_last_A;
           last_WEB0 = latch_last_WEB0;
           last_WEB1 = latch_last_WEB1;
           last_WEB2 = latch_last_WEB2;
           last_WEB3 = latch_last_WEB3;
           last_DI_byte0 = latch_last_DI_byte0;
           last_DI_byte1 = latch_last_DI_byte1;
           last_DI_byte2 = latch_last_DI_byte2;
           last_DI_byte3 = latch_last_DI_byte3;
           CS_monitor;
           pre_latch_data;
           read0 = WEB0_;
           write0 = !WEB0_;
           read1 = WEB1_;
           write1 = !WEB1_;
           read2 = WEB2_;
           write2 = !WEB2_;
           read3 = WEB3_;
           write3 = !WEB3_;
           if (CS_ !== 0 && DVSE_ === 1'b1) begin
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
           memory_function;
`ifdef TRC_CHECK
           trc_timiming_monitor;
`else
`endif
           latch_last_A = A_;
           latch_last_DI_byte0 = DI_byte0_;
           latch_last_DI_byte1 = DI_byte1_;
           latch_last_DI_byte2 = DI_byte2_;
           latch_last_DI_byte3 = DI_byte3_;
           latch_last_WEB0 = WEB0_;
           latch_last_WEB1 = WEB1_;
           latch_last_WEB2 = WEB2_;
           latch_last_WEB3 = WEB3_;
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CS_ !== 0) begin
              if (WEB0_ !== 1'b1) begin
                 all_core_x(0,1);
              end else begin
                 #0 disable TOHDO_byte0;
                    disable TWDXDO_byte0;
                 NODELAY0 = 1'b1;
                 DO_byte0_i = {Bits{1'bX}};
              end
              if (WEB1_ !== 1'b1) begin
                 all_core_x(1,1);
              end else begin
                 #0 disable TOHDO_byte1;
                    disable TWDXDO_byte1;
                 NODELAY1 = 1'b1;
                 DO_byte1_i = {Bits{1'bX}};
              end
              if (WEB2_ !== 1'b1) begin
                 all_core_x(2,1);
              end else begin
                 #0 disable TOHDO_byte2;
                    disable TWDXDO_byte2;
                 NODELAY2 = 1'b1;
                 DO_byte2_i = {Bits{1'bX}};
              end
              if (WEB3_ !== 1'b1) begin
                 all_core_x(3,1);
              end else begin
                 #0 disable TOHDO_byte3;
                    disable TWDXDO_byte3;
                 NODELAY3 = 1'b1;
                 DO_byte3_i = {Bits{1'bX}};
              end
           end
         end
    endcase
    LastClkEdge = CK_;
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
           n_flag_WEB0 or
           n_flag_WEB1 or
           n_flag_WEB2 or
           n_flag_WEB3 or
           n_flag_CS or
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_CK_PER or
           n_flag_CK_MINH or
           n_flag_CK_MINL 
          )
     begin
       timingcheck_violation;
     end




  always @(EventTOHDO_byte0) 
    begin:TOHDO_byte0 
      if (con_dvse) begin
        #TOH
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs3) begin
        #TOH_3 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs4) begin
        #TOH_4 
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
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs3) begin
        #TOH_3 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs4) begin
        #TOH_4 
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
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs3) begin
        #TOH_3 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs4) begin
        #TOH_4 
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
      end else if (con_dvs2) begin
        #TOH_2 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs3) begin
        #TOH_3 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs4) begin
        #TOH_4 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end 
  end 


  always @(EventTWDXDO_byte0) 
    begin:TWDXDO_byte0 
      if (con_dvse) begin
        #TWDX 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs2) begin
        #TWDX_2 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs3) begin
        #TWDX_3 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs4) begin
        #TWDX_4 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end
  end 

  always @(EventTWDXDO_byte1) 
    begin:TWDXDO_byte1 
      if (con_dvse) begin
        #TWDX 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs2) begin
        #TWDX_2 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs3) begin
        #TWDX_3 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs4) begin
        #TWDX_4 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end
  end 

  always @(EventTWDXDO_byte2) 
    begin:TWDXDO_byte2 
      if (con_dvse) begin
        #TWDX 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs2) begin
        #TWDX_2 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs3) begin
        #TWDX_3 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs4) begin
        #TWDX_4 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end
  end 

  always @(EventTWDXDO_byte3) 
    begin:TWDXDO_byte3 
      if (con_dvse) begin
        #TWDX 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs2) begin
        #TWDX_2 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs3) begin
        #TWDX_3 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs4) begin
        #TWDX_4 
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
      if ((n_flag_CK_PER  !== LAST_n_flag_CK_PER)  ||
          (n_flag_CK_MINH !== LAST_n_flag_CK_MINH) ||
          (n_flag_CK_MINL !== LAST_n_flag_CK_MINL)) begin
          if (CS_ !== 1'b0) begin
             if (WEB0_ !== 1'b1) begin
                all_core_x(0,1);
             end
             else begin
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
             end
             if (WEB1_ !== 1'b1) begin
                all_core_x(1,1);
             end
             else begin
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
             end
             if (WEB2_ !== 1'b1) begin
                all_core_x(2,1);
             end
             else begin
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
             end
             if (WEB3_ !== 1'b1) begin
                all_core_x(3,1);
             end
             else begin
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
             end
          end
      end
      else begin
          NOT_BUS_A  = {
                         n_flag_A7,
                         n_flag_A6,
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

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
             Latch_A[i] = (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) ? 1'bx : Latch_A[i];
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
          Latch_CS  =  (n_flag_CS  !== LAST_n_flag_CS)  ? 1'bx : Latch_CS;
          Latch_WEB0 = (n_flag_WEB0 !== LAST_n_flag_WEB0)  ? 1'bx : Latch_WEB0;
          Latch_WEB1 = (n_flag_WEB1 !== LAST_n_flag_WEB1)  ? 1'bx : Latch_WEB1;
          Latch_WEB2 = (n_flag_WEB2 !== LAST_n_flag_WEB2)  ? 1'bx : Latch_WEB2;
          Latch_WEB3 = (n_flag_WEB3 !== LAST_n_flag_WEB3)  ? 1'bx : Latch_WEB3;
          memory_function;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DI_byte0          = NOT_BUS_DI_byte0;
      LAST_NOT_BUS_DI_byte1          = NOT_BUS_DI_byte1;
      LAST_NOT_BUS_DI_byte2          = NOT_BUS_DI_byte2;
      LAST_NOT_BUS_DI_byte3          = NOT_BUS_DI_byte3;
      LAST_NOT_BUS_DVS               = NOT_BUS_DVS;
      LAST_n_flag_DVSE               = n_flag_DVSE;
      LAST_n_flag_WEB0               = n_flag_WEB0;
      LAST_n_flag_WEB1               = n_flag_WEB1;
      LAST_n_flag_WEB2               = n_flag_WEB2;
      LAST_n_flag_WEB3               = n_flag_WEB3;
      LAST_n_flag_CS                 = n_flag_CS;
      LAST_n_flag_CK_PER             = n_flag_CK_PER;
      LAST_n_flag_CK_MINH            = n_flag_CK_MINH;
      LAST_n_flag_CK_MINL            = n_flag_CK_MINL;
    end
  endtask // end timingcheck_violation;

  task pre_latch_data;
    begin
      Latch_A                        = A_;
      Latch_DI_byte0                 = DI_byte0_;
      Latch_DI_byte1                 = DI_byte1_;
      Latch_DI_byte2                 = DI_byte2_;
      Latch_DI_byte3                 = DI_byte3_;
      Latch_WEB0                     = WEB0_;
      Latch_WEB1                     = WEB1_;
      Latch_WEB2                     = WEB2_;
      Latch_WEB3                     = WEB3_;
      Latch_CS                       = CS_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_data
  task memory_function;
    begin
      A_i                            = Latch_A;
      DI_byte0_i                     = Latch_DI_byte0;
      DI_byte1_i                     = Latch_DI_byte1;
      DI_byte2_i                     = Latch_DI_byte2;
      DI_byte3_i                     = Latch_DI_byte3;
      WEB0_i                         = Latch_WEB0;
      WEB1_i                         = Latch_WEB1;
      WEB2_i                         = Latch_WEB2;
      WEB3_i                         = Latch_WEB3;
      CS_i                           = Latch_CS;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CS_ == 1'b1) A_monitor;


      casez({WEB0_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                   if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte0;
                     disable TWDXDO_byte0;
                     NODELAY0 = 1'b1;
                     DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte0;
                     disable TWDXDO_byte0;
                     NODELAY0 = 1'b1;
                     DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte0;
                     disable TWDXDO_byte0;
                     NODELAY0 = 1'b1;
                     DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
		   end else begin
                     NODELAY0 = 1'b1;
                     DO_byte0_tmp = Memory_byte0[A_i];
                     ->EventTOHDO_byte0;
		   end
                end else begin
                  if (WEB0_i !== last_WEB0) begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte0;
                      disable TWDXDO_byte0;
                      NODELAY0 = 1'b1;
                      DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte0;
                      disable TWDXDO_byte0;
                      NODELAY0 = 1'b1;
                      DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte0;
                      disable TWDXDO_byte0;
                      NODELAY0 = 1'b1;
                      DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY0 = 1'b1;
                      DO_byte0_tmp = Memory_byte0[A_i];
                      ->EventTOHDO_byte0;
		    end
                  end else begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte0;
                      disable TWDXDO_byte0;
                      NODELAY0 = 1'b1;
                      DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte0;
                      disable TWDXDO_byte0;
                      NODELAY0 = 1'b1;
                      DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte0;
                      disable TWDXDO_byte0;
                      NODELAY0 = 1'b1;
                      DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY0 = 1'b0;
                      DO_byte0_tmp = Memory_byte0[A_i];
                      DO_byte0_i = DO_byte0_tmp;
		    end
                  end
                end
              end else begin
                if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte0;
                     disable TWDXDO_byte0;
                     NODELAY0 = 1'b1;
                     DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte0;
                     disable TWDXDO_byte0;
                     NODELAY0 = 1'b1;
                     DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte0;
                     disable TWDXDO_byte0;
                     NODELAY0 = 1'b1;
                     DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
                end else begin
                  NODELAY0 = 1'b1;
                  DO_byte0_tmp = Memory_byte0[A_i];
                  ->EventTOHDO_byte0;
                end
             end
           end
           else begin
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte0[A_i] = DI_byte0_i;
                NODELAY0 = 1'b1;
                DO_byte0_tmp = Memory_byte0[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                    if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte0;
                       disable TWDXDO_byte0;
                       NODELAY0 = 1'b1;
                       Memory_byte0[A_i] = {Bits{1'bX}};
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte0;
                       disable TWDXDO_byte0;
                       NODELAY0 = 1'b1;
                       Memory_byte0[A_i] = {Bits{1'bX}};
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY0 = 1'b1;
                       all_core_x(0,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
                    end else begin
                       NODELAY0 = 1'b1;
                       ->EventTWDXDO_byte0;
                    end
                  end else begin
                    if (WEB0_i !== last_WEB0) begin
                      if (DVSE_i === 1'bX) begin
                       #0 disable TOHDO_byte0;
                          disable TWDXDO_byte0;
                          NODELAY0 = 1'b1;
                          Memory_byte0[A_i] = {Bits{1'bX}};
                          DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                       #0 disable TOHDO_byte0;
                          disable TWDXDO_byte0;
                          NODELAY0 = 1'b1;
                          Memory_byte0[A_i] = {Bits{1'bX}};
                          DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                          NODELAY0 = 1'b1;
                          all_core_x(0,1);
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(13);
`endif
                      end else begin
                          NODELAY0 = 1'b1;
                          ->EventTWDXDO_byte0;
                      end
                    end else begin
                      if (DI_byte0_i !== last_DI_byte0) begin
                        if (DVSE_i === 1'bX) begin
                         #0 disable TOHDO_byte0;
                            disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            Memory_byte0[A_i] = {Bits{1'bX}};
                            DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                         #0 disable TOHDO_byte0;
                            disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            Memory_byte0[A_i] = {Bits{1'bX}};
                            DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                            NODELAY0 = 1'b1;
                            all_core_x(0,1);
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(13);
`endif
                        end else begin
                            NODELAY0 = 1'b1;
                            ->EventTWDXDO_byte0;
                        end
		      end else begin
                        if (DVSE_i === 1'bX) begin
                          #0 disable TOHDO_byte0;
                             disable TWDXDO_byte0;
                             NODELAY0 = 1'b1;
                             Memory_byte0[A_i] = {Bits{1'bX}};
                             DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                          #0 disable TOHDO_byte0;
                             disable TWDXDO_byte0;
                             NODELAY0 = 1'b1;
                             Memory_byte0[A_i] = {Bits{1'bX}};
                             DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                             NODELAY0 = 1'b1;
                             all_core_x(0,1);
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(13);
`endif
	  	        end else begin
                           NODELAY0 = 1'b0;
                           DO_byte0_i = DO_byte0_tmp;
	  	        end
		      end
                    end
                  end
               end else begin
                  if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte0;
                       disable TWDXDO_byte0;
                       NODELAY0 = 1'b1;
                       Memory_byte0[A_i] = {Bits{1'bX}};
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte0;
                       disable TWDXDO_byte0;
                       NODELAY0 = 1'b1;
                       Memory_byte0[A_i] = {Bits{1'bX}};
                       DO_byte0_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY0 = 1'b1;
                       all_core_x(0,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
	  	  end else begin
                    NODELAY0 = 1'b1;
                    ->EventTWDXDO_byte0;
                  end
                end
           end else begin
             #0 disable TOHDO_byte0;
                disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(0,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte0;
              disable TWDXDO_byte0;
           NODELAY0 = 1'b1;
           DO_byte0_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte0[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte0;
                disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(0,1);
                end
           end
        end
      endcase

      casez({WEB1_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                   if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte1;
                     disable TWDXDO_byte1;
                     NODELAY1 = 1'b1;
                     DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte1;
                     disable TWDXDO_byte1;
                     NODELAY1 = 1'b1;
                     DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte1;
                     disable TWDXDO_byte1;
                     NODELAY1 = 1'b1;
                     DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
		   end else begin
                     NODELAY1 = 1'b1;
                     DO_byte1_tmp = Memory_byte1[A_i];
                     ->EventTOHDO_byte1;
		   end
                end else begin
                  if (WEB1_i !== last_WEB1) begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte1;
                      disable TWDXDO_byte1;
                      NODELAY1 = 1'b1;
                      DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte1;
                      disable TWDXDO_byte1;
                      NODELAY1 = 1'b1;
                      DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte1;
                      disable TWDXDO_byte1;
                      NODELAY1 = 1'b1;
                      DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY1 = 1'b1;
                      DO_byte1_tmp = Memory_byte1[A_i];
                      ->EventTOHDO_byte1;
		    end
                  end else begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte1;
                      disable TWDXDO_byte1;
                      NODELAY1 = 1'b1;
                      DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte1;
                      disable TWDXDO_byte1;
                      NODELAY1 = 1'b1;
                      DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte1;
                      disable TWDXDO_byte1;
                      NODELAY1 = 1'b1;
                      DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY1 = 1'b0;
                      DO_byte1_tmp = Memory_byte1[A_i];
                      DO_byte1_i = DO_byte1_tmp;
		    end
                  end
                end
              end else begin
                if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte1;
                     disable TWDXDO_byte1;
                     NODELAY1 = 1'b1;
                     DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte1;
                     disable TWDXDO_byte1;
                     NODELAY1 = 1'b1;
                     DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte1;
                     disable TWDXDO_byte1;
                     NODELAY1 = 1'b1;
                     DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
                end else begin
                  NODELAY1 = 1'b1;
                  DO_byte1_tmp = Memory_byte1[A_i];
                  ->EventTOHDO_byte1;
                end
             end
           end
           else begin
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte1[A_i] = DI_byte1_i;
                NODELAY1 = 1'b1;
                DO_byte1_tmp = Memory_byte1[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                    if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte1;
                       disable TWDXDO_byte1;
                       NODELAY1 = 1'b1;
                       Memory_byte1[A_i] = {Bits{1'bX}};
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte1;
                       disable TWDXDO_byte1;
                       NODELAY1 = 1'b1;
                       Memory_byte1[A_i] = {Bits{1'bX}};
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY1 = 1'b1;
                       all_core_x(1,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
                    end else begin
                       NODELAY1 = 1'b1;
                       ->EventTWDXDO_byte1;
                    end
                  end else begin
                    if (WEB1_i !== last_WEB1) begin
                      if (DVSE_i === 1'bX) begin
                       #0 disable TOHDO_byte1;
                          disable TWDXDO_byte1;
                          NODELAY1 = 1'b1;
                          Memory_byte1[A_i] = {Bits{1'bX}};
                          DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                       #0 disable TOHDO_byte1;
                          disable TWDXDO_byte1;
                          NODELAY1 = 1'b1;
                          Memory_byte1[A_i] = {Bits{1'bX}};
                          DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                          NODELAY1 = 1'b1;
                          all_core_x(1,1);
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(13);
`endif
                      end else begin
                          NODELAY1 = 1'b1;
                          ->EventTWDXDO_byte1;
                      end
                    end else begin
                      if (DI_byte1_i !== last_DI_byte1) begin
                        if (DVSE_i === 1'bX) begin
                         #0 disable TOHDO_byte1;
                            disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            Memory_byte1[A_i] = {Bits{1'bX}};
                            DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                         #0 disable TOHDO_byte1;
                            disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            Memory_byte1[A_i] = {Bits{1'bX}};
                            DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                            NODELAY1 = 1'b1;
                            all_core_x(1,1);
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(13);
`endif
                        end else begin
                            NODELAY1 = 1'b1;
                            ->EventTWDXDO_byte1;
                        end
		      end else begin
                        if (DVSE_i === 1'bX) begin
                          #0 disable TOHDO_byte1;
                             disable TWDXDO_byte1;
                             NODELAY1 = 1'b1;
                             Memory_byte1[A_i] = {Bits{1'bX}};
                             DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                          #0 disable TOHDO_byte1;
                             disable TWDXDO_byte1;
                             NODELAY1 = 1'b1;
                             Memory_byte1[A_i] = {Bits{1'bX}};
                             DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                             NODELAY1 = 1'b1;
                             all_core_x(1,1);
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(13);
`endif
	  	        end else begin
                           NODELAY1 = 1'b0;
                           DO_byte1_i = DO_byte1_tmp;
	  	        end
		      end
                    end
                  end
               end else begin
                  if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte1;
                       disable TWDXDO_byte1;
                       NODELAY1 = 1'b1;
                       Memory_byte1[A_i] = {Bits{1'bX}};
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte1;
                       disable TWDXDO_byte1;
                       NODELAY1 = 1'b1;
                       Memory_byte1[A_i] = {Bits{1'bX}};
                       DO_byte1_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY1 = 1'b1;
                       all_core_x(1,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
	  	  end else begin
                    NODELAY1 = 1'b1;
                    ->EventTWDXDO_byte1;
                  end
                end
           end else begin
             #0 disable TOHDO_byte1;
                disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(1,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte1;
              disable TWDXDO_byte1;
           NODELAY1 = 1'b1;
           DO_byte1_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte1[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte1;
                disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(1,1);
                end
           end
        end
      endcase

      casez({WEB2_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                   if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte2;
                     disable TWDXDO_byte2;
                     NODELAY2 = 1'b1;
                     DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte2;
                     disable TWDXDO_byte2;
                     NODELAY2 = 1'b1;
                     DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte2;
                     disable TWDXDO_byte2;
                     NODELAY2 = 1'b1;
                     DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
		   end else begin
                     NODELAY2 = 1'b1;
                     DO_byte2_tmp = Memory_byte2[A_i];
                     ->EventTOHDO_byte2;
		   end
                end else begin
                  if (WEB2_i !== last_WEB2) begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte2;
                      disable TWDXDO_byte2;
                      NODELAY2 = 1'b1;
                      DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte2;
                      disable TWDXDO_byte2;
                      NODELAY2 = 1'b1;
                      DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte2;
                      disable TWDXDO_byte2;
                      NODELAY2 = 1'b1;
                      DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY2 = 1'b1;
                      DO_byte2_tmp = Memory_byte2[A_i];
                      ->EventTOHDO_byte2;
		    end
                  end else begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte2;
                      disable TWDXDO_byte2;
                      NODELAY2 = 1'b1;
                      DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte2;
                      disable TWDXDO_byte2;
                      NODELAY2 = 1'b1;
                      DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte2;
                      disable TWDXDO_byte2;
                      NODELAY2 = 1'b1;
                      DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY2 = 1'b0;
                      DO_byte2_tmp = Memory_byte2[A_i];
                      DO_byte2_i = DO_byte2_tmp;
		    end
                  end
                end
              end else begin
                if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte2;
                     disable TWDXDO_byte2;
                     NODELAY2 = 1'b1;
                     DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte2;
                     disable TWDXDO_byte2;
                     NODELAY2 = 1'b1;
                     DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte2;
                     disable TWDXDO_byte2;
                     NODELAY2 = 1'b1;
                     DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
                end else begin
                  NODELAY2 = 1'b1;
                  DO_byte2_tmp = Memory_byte2[A_i];
                  ->EventTOHDO_byte2;
                end
             end
           end
           else begin
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte2[A_i] = DI_byte2_i;
                NODELAY2 = 1'b1;
                DO_byte2_tmp = Memory_byte2[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                    if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte2;
                       disable TWDXDO_byte2;
                       NODELAY2 = 1'b1;
                       Memory_byte2[A_i] = {Bits{1'bX}};
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte2;
                       disable TWDXDO_byte2;
                       NODELAY2 = 1'b1;
                       Memory_byte2[A_i] = {Bits{1'bX}};
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY2 = 1'b1;
                       all_core_x(2,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
                    end else begin
                       NODELAY2 = 1'b1;
                       ->EventTWDXDO_byte2;
                    end
                  end else begin
                    if (WEB2_i !== last_WEB2) begin
                      if (DVSE_i === 1'bX) begin
                       #0 disable TOHDO_byte2;
                          disable TWDXDO_byte2;
                          NODELAY2 = 1'b1;
                          Memory_byte2[A_i] = {Bits{1'bX}};
                          DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                       #0 disable TOHDO_byte2;
                          disable TWDXDO_byte2;
                          NODELAY2 = 1'b1;
                          Memory_byte2[A_i] = {Bits{1'bX}};
                          DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                          NODELAY2 = 1'b1;
                          all_core_x(2,1);
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(13);
`endif
                      end else begin
                          NODELAY2 = 1'b1;
                          ->EventTWDXDO_byte2;
                      end
                    end else begin
                      if (DI_byte2_i !== last_DI_byte2) begin
                        if (DVSE_i === 1'bX) begin
                         #0 disable TOHDO_byte2;
                            disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            Memory_byte2[A_i] = {Bits{1'bX}};
                            DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                         #0 disable TOHDO_byte2;
                            disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            Memory_byte2[A_i] = {Bits{1'bX}};
                            DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                            NODELAY2 = 1'b1;
                            all_core_x(2,1);
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(13);
`endif
                        end else begin
                            NODELAY2 = 1'b1;
                            ->EventTWDXDO_byte2;
                        end
		      end else begin
                        if (DVSE_i === 1'bX) begin
                          #0 disable TOHDO_byte2;
                             disable TWDXDO_byte2;
                             NODELAY2 = 1'b1;
                             Memory_byte2[A_i] = {Bits{1'bX}};
                             DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                          #0 disable TOHDO_byte2;
                             disable TWDXDO_byte2;
                             NODELAY2 = 1'b1;
                             Memory_byte2[A_i] = {Bits{1'bX}};
                             DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                             NODELAY2 = 1'b1;
                             all_core_x(2,1);
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(13);
`endif
	  	        end else begin
                           NODELAY2 = 1'b0;
                           DO_byte2_i = DO_byte2_tmp;
	  	        end
		      end
                    end
                  end
               end else begin
                  if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte2;
                       disable TWDXDO_byte2;
                       NODELAY2 = 1'b1;
                       Memory_byte2[A_i] = {Bits{1'bX}};
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte2;
                       disable TWDXDO_byte2;
                       NODELAY2 = 1'b1;
                       Memory_byte2[A_i] = {Bits{1'bX}};
                       DO_byte2_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY2 = 1'b1;
                       all_core_x(2,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
	  	  end else begin
                    NODELAY2 = 1'b1;
                    ->EventTWDXDO_byte2;
                  end
                end
           end else begin
             #0 disable TOHDO_byte2;
                disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(2,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte2;
              disable TWDXDO_byte2;
           NODELAY2 = 1'b1;
           DO_byte2_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte2[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte2;
                disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(2,1);
                end
           end
        end
      endcase

      casez({WEB3_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                   if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte3;
                     disable TWDXDO_byte3;
                     NODELAY3 = 1'b1;
                     DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte3;
                     disable TWDXDO_byte3;
                     NODELAY3 = 1'b1;
                     DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte3;
                     disable TWDXDO_byte3;
                     NODELAY3 = 1'b1;
                     DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
		   end else begin
                     NODELAY3 = 1'b1;
                     DO_byte3_tmp = Memory_byte3[A_i];
                     ->EventTOHDO_byte3;
		   end
                end else begin
                  if (WEB3_i !== last_WEB3) begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte3;
                      disable TWDXDO_byte3;
                      NODELAY3 = 1'b1;
                      DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte3;
                      disable TWDXDO_byte3;
                      NODELAY3 = 1'b1;
                      DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte3;
                      disable TWDXDO_byte3;
                      NODELAY3 = 1'b1;
                      DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY3 = 1'b1;
                      DO_byte3_tmp = Memory_byte3[A_i];
                      ->EventTOHDO_byte3;
		    end
                  end else begin
                    if (DVSE_i === 1'bX) begin
                   #0 disable TOHDO_byte3;
                      disable TWDXDO_byte3;
                      NODELAY3 = 1'b1;
                      DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                   #0 disable TOHDO_byte3;
                      disable TWDXDO_byte3;
                      NODELAY3 = 1'b1;
                      DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                   #0 disable TOHDO_byte3;
                      disable TWDXDO_byte3;
                      NODELAY3 = 1'b1;
                      DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                      ErrorMessage(13);
`endif
		    end else begin
                      NODELAY3 = 1'b0;
                      DO_byte3_tmp = Memory_byte3[A_i];
                      DO_byte3_i = DO_byte3_tmp;
		    end
                  end
                end
              end else begin
                if (DVSE_i === 1'bX) begin
                  #0 disable TOHDO_byte3;
                     disable TWDXDO_byte3;
                     NODELAY3 = 1'b1;
                     DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                  #0 disable TOHDO_byte3;
                     disable TWDXDO_byte3;
                     NODELAY3 = 1'b1;
                     DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(11);
`endif
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO_byte3;
                     disable TWDXDO_byte3;
                     NODELAY3 = 1'b1;
                     DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(13);
`endif
                end else begin
                  NODELAY3 = 1'b1;
                  DO_byte3_tmp = Memory_byte3[A_i];
                  ->EventTOHDO_byte3;
                end
             end
           end
           else begin
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte3[A_i] = DI_byte3_i;
                NODELAY3 = 1'b1;
                DO_byte3_tmp = Memory_byte3[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                    if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte3;
                       disable TWDXDO_byte3;
                       NODELAY3 = 1'b1;
                       Memory_byte3[A_i] = {Bits{1'bX}};
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte3;
                       disable TWDXDO_byte3;
                       NODELAY3 = 1'b1;
                       Memory_byte3[A_i] = {Bits{1'bX}};
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY3 = 1'b1;
                       all_core_x(3,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
                    end else begin
                       NODELAY3 = 1'b1;
                       ->EventTWDXDO_byte3;
                    end
                  end else begin
                    if (WEB3_i !== last_WEB3) begin
                      if (DVSE_i === 1'bX) begin
                       #0 disable TOHDO_byte3;
                          disable TWDXDO_byte3;
                          NODELAY3 = 1'b1;
                          Memory_byte3[A_i] = {Bits{1'bX}};
                          DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                       #0 disable TOHDO_byte3;
                          disable TWDXDO_byte3;
                          NODELAY3 = 1'b1;
                          Memory_byte3[A_i] = {Bits{1'bX}};
                          DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(11);
`endif
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                          NODELAY3 = 1'b1;
                          all_core_x(3,1);
`ifdef NO_MEM_MSG
`else
                          ErrorMessage(13);
`endif
                      end else begin
                          NODELAY3 = 1'b1;
                          ->EventTWDXDO_byte3;
                      end
                    end else begin
                      if (DI_byte3_i !== last_DI_byte3) begin
                        if (DVSE_i === 1'bX) begin
                         #0 disable TOHDO_byte3;
                            disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            Memory_byte3[A_i] = {Bits{1'bX}};
                            DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                         #0 disable TOHDO_byte3;
                            disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            Memory_byte3[A_i] = {Bits{1'bX}};
                            DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                            NODELAY3 = 1'b1;
                            all_core_x(3,1);
`ifdef NO_MEM_MSG
`else
                            ErrorMessage(13);
`endif
                        end else begin
                            NODELAY3 = 1'b1;
                            ->EventTWDXDO_byte3;
                        end
		      end else begin
                        if (DVSE_i === 1'bX) begin
                          #0 disable TOHDO_byte3;
                             disable TWDXDO_byte3;
                             NODELAY3 = 1'b1;
                             Memory_byte3[A_i] = {Bits{1'bX}};
                             DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                          #0 disable TOHDO_byte3;
                             disable TWDXDO_byte3;
                             NODELAY3 = 1'b1;
                             Memory_byte3[A_i] = {Bits{1'bX}};
                             DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(11);
`endif
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                             NODELAY3 = 1'b1;
                             all_core_x(3,1);
`ifdef NO_MEM_MSG
`else
                             ErrorMessage(13);
`endif
	  	        end else begin
                           NODELAY3 = 1'b0;
                           DO_byte3_i = DO_byte3_tmp;
	  	        end
		      end
                    end
                  end
               end else begin
                  if (DVSE_i === 1'bX) begin
                    #0 disable TOHDO_byte3;
                       disable TWDXDO_byte3;
                       NODELAY3 = 1'b1;
                       Memory_byte3[A_i] = {Bits{1'bX}};
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
                    #0 disable TOHDO_byte3;
                       disable TWDXDO_byte3;
                       NODELAY3 = 1'b1;
                       Memory_byte3[A_i] = {Bits{1'bX}};
                       DO_byte3_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(11);
`endif
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs8 || wrong_dvs9 || wrong_dvs10 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                       NODELAY3 = 1'b1;
                       all_core_x(3,1);
`ifdef NO_MEM_MSG
`else
                       ErrorMessage(13);
`endif
	  	  end else begin
                    NODELAY3 = 1'b1;
                    ->EventTWDXDO_byte3;
                  end
                end
           end else begin
             #0 disable TOHDO_byte3;
                disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(3,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte3;
              disable TWDXDO_byte3;
           NODELAY3 = 1'b1;
           DO_byte3_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte3[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte3;
                disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(3,1);
                end
           end
        end
      endcase
  end
  endtask //memory_function;

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
                         if (do_x == 1) Memory_byte0[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte0[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'b0}};
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
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'b0}};
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
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'b0}};
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
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'b0}};
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
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte1[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte1[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte2[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte2[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte3[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte3[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'b0}};
                         end
`else
`endif
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

  task CS_monitor;
     begin
       if (^(CS_) !== 1'bX) begin
          flag_CS_x = `FALSE;
       end
       else begin
          if (flag_CS_x == `FALSE) begin
              flag_CS_x = `TRUE;
`ifdef NO_MEM_MSG
`else
              ErrorMessage(3);
`endif
          end
       end
     end
  endtask //end CS_monitor;

`ifdef TRC_CHECK
  task trc_timiming_monitor;
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
          if (CS_ !== 1'b0) begin
             if (WEB0_ !== 1'b1) begin
                all_core_x(0,1);
             end
             else begin
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
             end
             if (WEB1_ !== 1'b1) begin
                all_core_x(1,1);
             end
             else begin
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
             end
             if (WEB2_ !== 1'b1) begin
                all_core_x(2,1);
             end
             else begin
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
             end
             if (WEB3_ !== 1'b1) begin
                all_core_x(3,1);
             end
             else begin
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
             end
          end
       end
     end
  endtask //end trc_timiming_monitor;
`else
`endif

  task ErrorMessage;
     input error_type;
     integer error_type;

     begin
       case (error_type)
         0: $display("** MEM_Error: Abnormal transition occurred (%t) in Clock of %m",$time);
         1: $display("** MEM_Error: Read and Write the same Address, DO is unknown (%t) in clock of %m",$time);
         2: $display("** MEM_Error: Unknown value occurred (%t) in Address of %m",$time);
         3: $display("** MEM_Error: Unknown value occurred (%t) in ChipSelect of %m",$time);
         4: $display("** MEM_Error: Port A and B write the same Address, core is unknown (%t) in clock of %m",$time);
         5: $display("** MEM_Error: Clear all memory core to unknown (%t) in clock of %m",$time);
        11: $display("** MEM_Error: DVS or DVSE appear unknown state (%t) in clock of %m",$time);
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
      specparam TAA    = (37.5:56.5:91.8);
      specparam TAA_2  = (38.6:58.3:94.9);
      specparam TAA_3  = (37.5:56.5:91.8);
      specparam TAA_4  = (36.9:55.6:90.1);
      specparam TWDV    = (37.5:56.5:91.8);
      specparam TWDV_2  = (38.6:58.3:94.9);
      specparam TWDV_3  = (37.5:56.5:91.8);
      specparam TWDV_4  = (36.9:55.6:90.1);
      specparam TRC    = (26.4:39.2:68.5);
      specparam TRC_2    = (27.6:40.9:71.6);
      specparam TRC_3    = (26.4:39.2:68.5);
      specparam TRC_4    = (25.7:38.2:66.7);
      specparam THPW   = (6.6:9.8:17.1);
      specparam TLPW   = (6.6:9.8:17.1);
      specparam TAS    = (28.4:28.8:36.3);
      specparam TAH    = (12.0:15.0:22.1);
      specparam TWS    = (10.2:11.7:19.3);
      specparam TWH    = (12.0:15.0:22.1);
      specparam TDS    = (11.5:13.3:23.3);
      specparam TDH    = (10.7:13.5:19.6);
      specparam TCSS   = (28.4:28.8:36.3);
      specparam TCSH   = (15.3:24.2:42.2);
      specparam TDVSES  = (5.3:4.5:6.5);
      specparam TDVSEH  = (30.5:42.7:67.7);
      specparam TDVSS   = (5.3:4.5:6.5);
      specparam TDVSH   = (30.5:42.7:67.7);

      $setuphold ( posedge CK &&& con_A,          posedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          negedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          posedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          negedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          posedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          negedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          posedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          negedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          posedge A[4], TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          negedge A[4], TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          posedge A[5], TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_A,          negedge A[5], TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_A,          posedge A[6], TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_A,          negedge A[6], TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_A,          posedge A[7], TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CK &&& con_A,          negedge A[7], TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[0], TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[0], TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[1], TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[1], TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[2], TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[2], TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[3], TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[3], TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[4], TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[4], TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[5], TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[5], TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[6], TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[6], TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[7], TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[7], TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[8], TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[8], TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[9], TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[9], TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[10], TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[10], TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[11], TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[11], TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[12], TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[12], TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[13], TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[13], TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[14], TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[14], TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[15], TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[15], TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[16], TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[16], TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[17], TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[17], TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[18], TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[18], TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[19], TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[19], TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[20], TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[20], TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[21], TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[21], TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[22], TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[22], TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[23], TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[23], TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[24], TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[24], TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[25], TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[25], TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[26], TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[26], TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[27], TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[27], TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[28], TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[28], TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[29], TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[29], TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[30], TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[30], TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[31], TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[31], TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_WEB0,       posedge WEB[0], TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CK &&& con_WEB0,       negedge WEB[0], TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CK &&& con_WEB1,       posedge WEB[1], TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CK &&& con_WEB1,       negedge WEB[1], TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CK &&& con_WEB2,       posedge WEB[2], TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CK &&& con_WEB2,       negedge WEB[2], TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CK &&& con_WEB3,       posedge WEB[3], TWS,     TWH,     n_flag_WEB3    );
      $setuphold ( posedge CK &&& con_WEB3,       negedge WEB[3], TWS,     TWH,     n_flag_WEB3    );
      $setuphold ( posedge CK &&& con_DVSE_W,     posedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CK &&& con_DVSE_W,     negedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS[0], TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS[0], TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS[1], TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS[1], TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS[2], TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS[2], TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS[3], TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS[3], TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CK,                    posedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $setuphold ( posedge CK,                    negedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $period    ( posedge CK &&& ck_per,         TRC,                       n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per2,        TRC_2,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per3,        TRC_3,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per4,        TRC_4,                     n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );


      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[0] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[1] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[2] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[3] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[4] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[5] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[6] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[7] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[0] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[1] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[2] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[3] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[4] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[5] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[6] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs2 && read0)  (posedge CK => (DO[7] :1'bx)) = TAA_2;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[0] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[1] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[2] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[3] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[4] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[5] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[6] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs3 && read0)  (posedge CK => (DO[7] :1'bx)) = TAA_3;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[0] :1'bx)) = TAA_4;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[1] :1'bx)) = TAA_4;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[2] :1'bx)) = TAA_4;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[3] :1'bx)) = TAA_4;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[4] :1'bx)) = TAA_4;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[5] :1'bx)) = TAA_4;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[6] :1'bx)) = TAA_4;
      if (NODELAY0 == 0 && con_dvs4 && read0)  (posedge CK => (DO[7] :1'bx)) = TAA_4;

      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[8] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[9] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[10] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[11] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[12] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[13] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[14] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[15] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[8] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[9] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[10] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[11] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[12] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[13] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[14] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs2 && read1)  (posedge CK => (DO[15] :1'bx)) = TAA_2;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[8] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[9] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[10] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[11] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[12] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[13] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[14] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs3 && read1)  (posedge CK => (DO[15] :1'bx)) = TAA_3;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[8] :1'bx)) = TAA_4;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[9] :1'bx)) = TAA_4;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[10] :1'bx)) = TAA_4;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[11] :1'bx)) = TAA_4;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[12] :1'bx)) = TAA_4;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[13] :1'bx)) = TAA_4;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[14] :1'bx)) = TAA_4;
      if (NODELAY1 == 0 && con_dvs4 && read1)  (posedge CK => (DO[15] :1'bx)) = TAA_4;

      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[16] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[17] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[18] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[19] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[20] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[21] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[22] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[23] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[16] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[17] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[18] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[19] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[20] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[21] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[22] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs2 && read2)  (posedge CK => (DO[23] :1'bx)) = TAA_2;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[16] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[17] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[18] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[19] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[20] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[21] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[22] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs3 && read2)  (posedge CK => (DO[23] :1'bx)) = TAA_3;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[16] :1'bx)) = TAA_4;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[17] :1'bx)) = TAA_4;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[18] :1'bx)) = TAA_4;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[19] :1'bx)) = TAA_4;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[20] :1'bx)) = TAA_4;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[21] :1'bx)) = TAA_4;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[22] :1'bx)) = TAA_4;
      if (NODELAY2 == 0 && con_dvs4 && read2)  (posedge CK => (DO[23] :1'bx)) = TAA_4;

      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[24] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[25] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[26] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[27] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[28] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[29] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[30] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[31] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[24] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[25] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[26] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[27] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[28] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[29] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[30] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs2 && read3)  (posedge CK => (DO[31] :1'bx)) = TAA_2;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[24] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[25] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[26] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[27] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[28] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[29] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[30] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs3 && read3)  (posedge CK => (DO[31] :1'bx)) = TAA_3;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[24] :1'bx)) = TAA_4;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[25] :1'bx)) = TAA_4;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[26] :1'bx)) = TAA_4;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[27] :1'bx)) = TAA_4;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[28] :1'bx)) = TAA_4;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[29] :1'bx)) = TAA_4;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[30] :1'bx)) = TAA_4;
      if (NODELAY3 == 0 && con_dvs4 && read3)  (posedge CK => (DO[31] :1'bx)) = TAA_4;


      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs2 && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV_2;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs3 && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV_3;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV_4;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV_4;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV_4;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV_4;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV_4;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV_4;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV_4;
      if (NODELAY0 == 0 && con_dvs4 && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV_4;

      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[8] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[9] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[10] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[11] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[12] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[13] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[14] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[15] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[8] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[9] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[10] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[11] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[12] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[13] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[14] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs2 && write1)  (posedge CK => (DO[15] :1'bx)) = TWDV_2;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[8] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[9] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[10] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[11] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[12] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[13] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[14] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs3 && write1)  (posedge CK => (DO[15] :1'bx)) = TWDV_3;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[8] :1'bx)) = TWDV_4;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[9] :1'bx)) = TWDV_4;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[10] :1'bx)) = TWDV_4;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[11] :1'bx)) = TWDV_4;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[12] :1'bx)) = TWDV_4;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[13] :1'bx)) = TWDV_4;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[14] :1'bx)) = TWDV_4;
      if (NODELAY1 == 0 && con_dvs4 && write1)  (posedge CK => (DO[15] :1'bx)) = TWDV_4;

      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[16] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[17] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[18] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[19] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[20] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[21] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[22] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[23] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[16] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[17] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[18] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[19] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[20] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[21] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[22] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs2 && write2)  (posedge CK => (DO[23] :1'bx)) = TWDV_2;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[16] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[17] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[18] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[19] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[20] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[21] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[22] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs3 && write2)  (posedge CK => (DO[23] :1'bx)) = TWDV_3;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[16] :1'bx)) = TWDV_4;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[17] :1'bx)) = TWDV_4;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[18] :1'bx)) = TWDV_4;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[19] :1'bx)) = TWDV_4;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[20] :1'bx)) = TWDV_4;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[21] :1'bx)) = TWDV_4;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[22] :1'bx)) = TWDV_4;
      if (NODELAY2 == 0 && con_dvs4 && write2)  (posedge CK => (DO[23] :1'bx)) = TWDV_4;

      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[24] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[25] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[26] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[27] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[28] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[29] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[30] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[31] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[24] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[25] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[26] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[27] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[28] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[29] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[30] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs2 && write3)  (posedge CK => (DO[31] :1'bx)) = TWDV_2;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[24] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[25] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[26] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[27] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[28] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[29] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[30] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs3 && write3)  (posedge CK => (DO[31] :1'bx)) = TWDV_3;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[24] :1'bx)) = TWDV_4;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[25] :1'bx)) = TWDV_4;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[26] :1'bx)) = TWDV_4;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[27] :1'bx)) = TWDV_4;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[28] :1'bx)) = TWDV_4;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[29] :1'bx)) = TWDV_4;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[30] :1'bx)) = TWDV_4;
      if (NODELAY3 == 0 && con_dvs4 && write3)  (posedge CK => (DO[31] :1'bx)) = TWDV_4;




   endspecify

`endprotect
endmodule
