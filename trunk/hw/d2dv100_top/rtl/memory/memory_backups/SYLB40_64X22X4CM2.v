/*******************************************************************************
________________________________________________________________________________________________


            Synchronous RVT Periphery One-Port Register File Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________

       IP Name            :  FSH0L_B_SY                      
       IP Version         :  1.5.0                           
       IP Release Status  :  Active                          
       Word               :  64                              
       Bit                :  22                              
       Byte               :  4                               
       Mux                :  2                               
       Output Loading     :  0.3                             
       Clock Input Slew   :  0.4                             
       Data Input Slew    :  0.4                             
       Ring Type          :  Ringless Model                  
       Ring Width         :  0                               
       Bus Format         :  0                               
       Memaker Path       :  /home/autumn/pdk/memory/ftclib  
       GUI Version        :  m20130120                       
       Date               :  2024/08/20 11:16:37             
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


module SYLB40_64X22X4CM2 (A0,A1,A2,A3,A4,A5,DO0,DO1,DO2,DO3,DO4,DO5,DO6,
                          DO7,DO8,DO9,DO10,DO11,DO12,DO13,DO14,DO15,
                          DO16,DO17,DO18,DO19,DO20,DO21,DO22,DO23,
                          DO24,DO25,DO26,DO27,DO28,DO29,DO30,DO31,
                          DO32,DO33,DO34,DO35,DO36,DO37,DO38,DO39,
                          DO40,DO41,DO42,DO43,DO44,DO45,DO46,DO47,
                          DO48,DO49,DO50,DO51,DO52,DO53,DO54,DO55,
                          DO56,DO57,DO58,DO59,DO60,DO61,DO62,DO63,
                          DO64,DO65,DO66,DO67,DO68,DO69,DO70,DO71,
                          DO72,DO73,DO74,DO75,DO76,DO77,DO78,DO79,
                          DO80,DO81,DO82,DO83,DO84,DO85,DO86,DO87,
                          DI0,DI1,DI2,DI3,DI4,DI5,DI6,DI7,DI8,DI9,
                          DI10,DI11,DI12,DI13,DI14,DI15,DI16,DI17,
                          DI18,DI19,DI20,DI21,DI22,DI23,DI24,DI25,
                          DI26,DI27,DI28,DI29,DI30,DI31,DI32,DI33,
                          DI34,DI35,DI36,DI37,DI38,DI39,DI40,DI41,
                          DI42,DI43,DI44,DI45,DI46,DI47,DI48,DI49,
                          DI50,DI51,DI52,DI53,DI54,DI55,DI56,DI57,
                          DI58,DI59,DI60,DI61,DI62,DI63,DI64,DI65,
                          DI66,DI67,DI68,DI69,DI70,DI71,DI72,DI73,
                          DI74,DI75,DI76,DI77,DI78,DI79,DI80,DI81,
                          DI82,DI83,DI84,DI85,DI86,DI87,CK,NAP,WEB0,WEB1,
                          WEB2,WEB3,DVSE,DVS0,DVS1,DVS2,DVS3,CSB);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 6;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 22;               
  parameter  Words                = 64;               
  parameter  Bytes                = 4;                
  parameter  AspectRatio          = 2;                
  parameter  TOH                  = (50.5:76.2:127.1);
  parameter  TOH_8                = (52.7:79.8:132.9);
  parameter  TOH_10               = (51.3:77.6:129.6);
  parameter  TOH_12               = (50.5:76.2:127.1);
  parameter  TOH_14               = (49.7:75.1:125.3);
  parameter  TWDX                 = (46.3:69.9:115.9);
  parameter  TWDX_8               = (48.3:73.1:121.3);
  parameter  TWDX_10              = (47.0:71.1:118.3);
  parameter  TWDX_12              = (46.3:69.9:115.9);
  parameter  TWDX_14              = (45.6:68.8:114.3);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (70.2:108.0:183.4);
`else
`endif
  parameter  TNAP_Wakeup          = 0;                

  output     DO0,DO1,DO2,DO3,DO4,DO5,DO6,DO7,DO8,
             DO9,DO10,DO11,DO12,DO13,DO14,DO15,DO16,DO17,DO18,
             DO19,DO20,DO21,DO22,DO23,DO24,DO25,DO26,DO27,DO28,
             DO29,DO30,DO31,DO32,DO33,DO34,DO35,DO36,DO37,DO38,
             DO39,DO40,DO41,DO42,DO43,DO44,DO45,DO46,DO47,DO48,
             DO49,DO50,DO51,DO52,DO53,DO54,DO55,DO56,DO57,DO58,
             DO59,DO60,DO61,DO62,DO63,DO64,DO65,DO66,DO67,DO68,
             DO69,DO70,DO71,DO72,DO73,DO74,DO75,DO76,DO77,DO78,
             DO79,DO80,DO81,DO82,DO83,DO84,DO85,DO86,DO87;
  input      DI0,DI1,DI2,DI3,DI4,DI5,DI6,DI7,DI8,
             DI9,DI10,DI11,DI12,DI13,DI14,DI15,DI16,DI17,DI18,
             DI19,DI20,DI21,DI22,DI23,DI24,DI25,DI26,DI27,DI28,
             DI29,DI30,DI31,DI32,DI33,DI34,DI35,DI36,DI37,DI38,
             DI39,DI40,DI41,DI42,DI43,DI44,DI45,DI46,DI47,DI48,
             DI49,DI50,DI51,DI52,DI53,DI54,DI55,DI56,DI57,DI58,
             DI59,DI60,DI61,DI62,DI63,DI64,DI65,DI66,DI67,DI68,
             DI69,DI70,DI71,DI72,DI73,DI74,DI75,DI76,DI77,DI78,
             DI79,DI80,DI81,DI82,DI83,DI84,DI85,DI86,DI87;
  input      A0,A1,A2,A3,A4,A5;
  input      DVSE;                                    
  input      DVS0,DVS1,DVS2,DVS3;
   
  input      WEB0;                                    
  input      WEB1;                                    
  input      WEB2;                                    
  input      WEB3;                                    
  input      CK;                                      
  input      CSB;                                     
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
  wire                            CK_;                
  wire                            CS_;                

  wire       [DVSize-1:0]         DVS_;               
  wire                            DVSE_;              
  reg                             DVS_TRIGGER;        

  reg                             con_dvse;           
  reg                             wrong_dvs0;         
  reg                             wrong_dvs1;         
  reg                             wrong_dvs2;         
  reg                             wrong_dvs3;         
  reg                             wrong_dvs4;         
  reg                             wrong_dvs5;         
  reg                             wrong_dvs6;         
  reg                             wrong_dvs7;         
  reg                             con_dvs8;           
  reg                             wrong_dvs9;         
  reg                             con_dvs10;          
  reg                             wrong_dvs11;        
  reg                             con_dvs12;          
  reg                             wrong_dvs13;        
  reg                             con_dvs14;          
  reg                             wrong_dvs15;        

  reg                             read0;              
  reg                             write0;             
  reg                             read1;              
  reg                             write1;             
  reg                             read2;              
  reg                             write2;             
  reg                             read3;              
  reg                             write3;             

  wire                            NAP_;               



  wire                            con_A;              
  wire                            con_DI_byte0;       
  wire                            con_DI_byte1;       
  wire                            con_DI_byte2;       
  wire                            con_DI_byte3;       
  wire                            con_CK;             
  wire                            ck_per;             
  wire                            ck_per8;            
  wire                            ck_per10;           
  wire                            ck_per12;           
  wire                            ck_per14;           
  wire                            con_WEB0;           
  wire                            con_WEB1;           
  wire                            con_WEB2;           
  wire                            con_WEB3;           
  wire                            con_DVSE_W;         
  wire                            con_DVS_W;          

  wire                            con_NAP;            
  wire                            con_CK_NAP;         

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
  reg                             NAP_i;              
  reg                             CSB_tri_error;      
  reg                             NAPREG;             

  reg                             n_flag_A0;          
  reg                             n_flag_A1;          
  reg                             n_flag_A2;          
  reg                             n_flag_A3;          
  reg                             n_flag_A4;          
  reg                             n_flag_A5;          
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
  reg                             n_flag_DI64;        
  reg                             n_flag_DI65;        
  reg                             n_flag_DI66;        
  reg                             n_flag_DI67;        
  reg                             n_flag_DI68;        
  reg                             n_flag_DI69;        
  reg                             n_flag_DI70;        
  reg                             n_flag_DI71;        
  reg                             n_flag_DI72;        
  reg                             n_flag_DI73;        
  reg                             n_flag_DI74;        
  reg                             n_flag_DI75;        
  reg                             n_flag_DI76;        
  reg                             n_flag_DI77;        
  reg                             n_flag_DI78;        
  reg                             n_flag_DI79;        
  reg                             n_flag_DI80;        
  reg                             n_flag_DI81;        
  reg                             n_flag_DI82;        
  reg                             n_flag_DI83;        
  reg                             n_flag_DI84;        
  reg                             n_flag_DI85;        
  reg                             n_flag_DI86;        
  reg                             n_flag_DI87;        
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

  reg                             n_flag_NAP;         
  reg                             n_flag_NAP_CSB;     
  reg                             Last_CK_temp;       
  reg                             CSB_temp;           
  reg                             CK_temp;            
  reg                             CK_temp2;           

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
  reg                             Violate_Hold_time;  
  reg                             nap_initial_trigger;
  event                           EventNAPT;          

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
  assign     ck_per8              = CS_ & DVSE_ & !DVS_[0] & !DVS_[1] & !DVS_[2] & DVS_[3];
  assign     ck_per10             = CS_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & DVS_[3];
  assign     ck_per12             = CS_ & DVSE_ & !DVS_[0] & !DVS_[1] & DVS_[2] & DVS_[3];
  assign     ck_per14             = CS_ & DVSE_ & !DVS_[0] & DVS_[1] & DVS_[2] & DVS_[3];
  assign     con_DVSE_W           = CS_;
  assign     con_DVS_W            = CS_ & DVSE_;
  assign     con_NAP              = (!CS_);
  assign     con_CK_NAP           = CK_temp2;

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
  buf        ido32           (DO32, DO_[32]);              
  buf        ido33           (DO33, DO_[33]);              
  buf        ido34           (DO34, DO_[34]);              
  buf        ido35           (DO35, DO_[35]);              
  buf        ido36           (DO36, DO_[36]);              
  buf        ido37           (DO37, DO_[37]);              
  buf        ido38           (DO38, DO_[38]);              
  buf        ido39           (DO39, DO_[39]);              
  buf        ido40           (DO40, DO_[40]);              
  buf        ido41           (DO41, DO_[41]);              
  buf        ido42           (DO42, DO_[42]);              
  buf        ido43           (DO43, DO_[43]);              
  buf        ido44           (DO44, DO_[44]);              
  buf        ido45           (DO45, DO_[45]);              
  buf        ido46           (DO46, DO_[46]);              
  buf        ido47           (DO47, DO_[47]);              
  buf        ido48           (DO48, DO_[48]);              
  buf        ido49           (DO49, DO_[49]);              
  buf        ido50           (DO50, DO_[50]);              
  buf        ido51           (DO51, DO_[51]);              
  buf        ido52           (DO52, DO_[52]);              
  buf        ido53           (DO53, DO_[53]);              
  buf        ido54           (DO54, DO_[54]);              
  buf        ido55           (DO55, DO_[55]);              
  buf        ido56           (DO56, DO_[56]);              
  buf        ido57           (DO57, DO_[57]);              
  buf        ido58           (DO58, DO_[58]);              
  buf        ido59           (DO59, DO_[59]);              
  buf        ido60           (DO60, DO_[60]);              
  buf        ido61           (DO61, DO_[61]);              
  buf        ido62           (DO62, DO_[62]);              
  buf        ido63           (DO63, DO_[63]);              
  buf        ido64           (DO64, DO_[64]);              
  buf        ido65           (DO65, DO_[65]);              
  buf        ido66           (DO66, DO_[66]);              
  buf        ido67           (DO67, DO_[67]);              
  buf        ido68           (DO68, DO_[68]);              
  buf        ido69           (DO69, DO_[69]);              
  buf        ido70           (DO70, DO_[70]);              
  buf        ido71           (DO71, DO_[71]);              
  buf        ido72           (DO72, DO_[72]);              
  buf        ido73           (DO73, DO_[73]);              
  buf        ido74           (DO74, DO_[74]);              
  buf        ido75           (DO75, DO_[75]);              
  buf        ido76           (DO76, DO_[76]);              
  buf        ido77           (DO77, DO_[77]);              
  buf        ido78           (DO78, DO_[78]);              
  buf        ido79           (DO79, DO_[79]);              
  buf        ido80           (DO80, DO_[80]);              
  buf        ido81           (DO81, DO_[81]);              
  buf        ido82           (DO82, DO_[82]);              
  buf        ido83           (DO83, DO_[83]);              
  buf        ido84           (DO84, DO_[84]);              
  buf        ido85           (DO85, DO_[85]);              
  buf        ido86           (DO86, DO_[86]);              
  buf        ido87           (DO87, DO_[87]);              
  buf        ick0            (CK_, CK);                    
  buf        ia0             (A_[0], A0);                  
  buf        ia1             (A_[1], A1);                  
  buf        ia2             (A_[2], A2);                  
  buf        ia3             (A_[3], A3);                  
  buf        ia4             (A_[4], A4);                  
  buf        ia5             (A_[5], A5);                  
  buf        idi_byte0_0     (DI_byte0_[0], DI0);          
  buf        idi_byte0_1     (DI_byte0_[1], DI1);          
  buf        idi_byte0_2     (DI_byte0_[2], DI2);          
  buf        idi_byte0_3     (DI_byte0_[3], DI3);          
  buf        idi_byte0_4     (DI_byte0_[4], DI4);          
  buf        idi_byte0_5     (DI_byte0_[5], DI5);          
  buf        idi_byte0_6     (DI_byte0_[6], DI6);          
  buf        idi_byte0_7     (DI_byte0_[7], DI7);          
  buf        idi_byte0_8     (DI_byte0_[8], DI8);          
  buf        idi_byte0_9     (DI_byte0_[9], DI9);          
  buf        idi_byte0_10    (DI_byte0_[10], DI10);        
  buf        idi_byte0_11    (DI_byte0_[11], DI11);        
  buf        idi_byte0_12    (DI_byte0_[12], DI12);        
  buf        idi_byte0_13    (DI_byte0_[13], DI13);        
  buf        idi_byte0_14    (DI_byte0_[14], DI14);        
  buf        idi_byte0_15    (DI_byte0_[15], DI15);        
  buf        idi_byte0_16    (DI_byte0_[16], DI16);        
  buf        idi_byte0_17    (DI_byte0_[17], DI17);        
  buf        idi_byte0_18    (DI_byte0_[18], DI18);        
  buf        idi_byte0_19    (DI_byte0_[19], DI19);        
  buf        idi_byte0_20    (DI_byte0_[20], DI20);        
  buf        idi_byte0_21    (DI_byte0_[21], DI21);        
  buf        idi_byte1_0     (DI_byte1_[0], DI22);         
  buf        idi_byte1_1     (DI_byte1_[1], DI23);         
  buf        idi_byte1_2     (DI_byte1_[2], DI24);         
  buf        idi_byte1_3     (DI_byte1_[3], DI25);         
  buf        idi_byte1_4     (DI_byte1_[4], DI26);         
  buf        idi_byte1_5     (DI_byte1_[5], DI27);         
  buf        idi_byte1_6     (DI_byte1_[6], DI28);         
  buf        idi_byte1_7     (DI_byte1_[7], DI29);         
  buf        idi_byte1_8     (DI_byte1_[8], DI30);         
  buf        idi_byte1_9     (DI_byte1_[9], DI31);         
  buf        idi_byte1_10    (DI_byte1_[10], DI32);        
  buf        idi_byte1_11    (DI_byte1_[11], DI33);        
  buf        idi_byte1_12    (DI_byte1_[12], DI34);        
  buf        idi_byte1_13    (DI_byte1_[13], DI35);        
  buf        idi_byte1_14    (DI_byte1_[14], DI36);        
  buf        idi_byte1_15    (DI_byte1_[15], DI37);        
  buf        idi_byte1_16    (DI_byte1_[16], DI38);        
  buf        idi_byte1_17    (DI_byte1_[17], DI39);        
  buf        idi_byte1_18    (DI_byte1_[18], DI40);        
  buf        idi_byte1_19    (DI_byte1_[19], DI41);        
  buf        idi_byte1_20    (DI_byte1_[20], DI42);        
  buf        idi_byte1_21    (DI_byte1_[21], DI43);        
  buf        idi_byte2_0     (DI_byte2_[0], DI44);         
  buf        idi_byte2_1     (DI_byte2_[1], DI45);         
  buf        idi_byte2_2     (DI_byte2_[2], DI46);         
  buf        idi_byte2_3     (DI_byte2_[3], DI47);         
  buf        idi_byte2_4     (DI_byte2_[4], DI48);         
  buf        idi_byte2_5     (DI_byte2_[5], DI49);         
  buf        idi_byte2_6     (DI_byte2_[6], DI50);         
  buf        idi_byte2_7     (DI_byte2_[7], DI51);         
  buf        idi_byte2_8     (DI_byte2_[8], DI52);         
  buf        idi_byte2_9     (DI_byte2_[9], DI53);         
  buf        idi_byte2_10    (DI_byte2_[10], DI54);        
  buf        idi_byte2_11    (DI_byte2_[11], DI55);        
  buf        idi_byte2_12    (DI_byte2_[12], DI56);        
  buf        idi_byte2_13    (DI_byte2_[13], DI57);        
  buf        idi_byte2_14    (DI_byte2_[14], DI58);        
  buf        idi_byte2_15    (DI_byte2_[15], DI59);        
  buf        idi_byte2_16    (DI_byte2_[16], DI60);        
  buf        idi_byte2_17    (DI_byte2_[17], DI61);        
  buf        idi_byte2_18    (DI_byte2_[18], DI62);        
  buf        idi_byte2_19    (DI_byte2_[19], DI63);        
  buf        idi_byte2_20    (DI_byte2_[20], DI64);        
  buf        idi_byte2_21    (DI_byte2_[21], DI65);        
  buf        idi_byte3_0     (DI_byte3_[0], DI66);         
  buf        idi_byte3_1     (DI_byte3_[1], DI67);         
  buf        idi_byte3_2     (DI_byte3_[2], DI68);         
  buf        idi_byte3_3     (DI_byte3_[3], DI69);         
  buf        idi_byte3_4     (DI_byte3_[4], DI70);         
  buf        idi_byte3_5     (DI_byte3_[5], DI71);         
  buf        idi_byte3_6     (DI_byte3_[6], DI72);         
  buf        idi_byte3_7     (DI_byte3_[7], DI73);         
  buf        idi_byte3_8     (DI_byte3_[8], DI74);         
  buf        idi_byte3_9     (DI_byte3_[9], DI75);         
  buf        idi_byte3_10    (DI_byte3_[10], DI76);        
  buf        idi_byte3_11    (DI_byte3_[11], DI77);        
  buf        idi_byte3_12    (DI_byte3_[12], DI78);        
  buf        idi_byte3_13    (DI_byte3_[13], DI79);        
  buf        idi_byte3_14    (DI_byte3_[14], DI80);        
  buf        idi_byte3_15    (DI_byte3_[15], DI81);        
  buf        idi_byte3_16    (DI_byte3_[16], DI82);        
  buf        idi_byte3_17    (DI_byte3_[17], DI83);        
  buf        idi_byte3_18    (DI_byte3_[18], DI84);        
  buf        idi_byte3_19    (DI_byte3_[19], DI85);        
  buf        idi_byte3_20    (DI_byte3_[20], DI86);        
  buf        idi_byte3_21    (DI_byte3_[21], DI87);        
  not        ics0            (CS_, CSB);                   
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
    Violate_Hold_time = 1'b0;
    CK_temp = 1'b0;
    Last_CK_temp = 1'b0;  
    CSB_tri_error = 1'b0;  
    NAPREG = 1'b0;  
    nap_initial_trigger = 1'b0;  
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



  always @(posedge NAP_) begin
    if ($time === 0) begin
      DO_byte0_i = DO_byte0_tmp;
      DO_byte1_i = DO_byte1_tmp;
      DO_byte2_i = DO_byte2_tmp;
      DO_byte3_i = DO_byte3_tmp;
      nap_initial_trigger = 1'b1;
    end
    if ($time !== 1'b0 && NAP_ === 1'b1 && CSB_tri_error === 1'b0 && Violate_Hold_time === 1'b0 && CSB_temp === 1'b1) begin
      if (CS_ === 1'b0) begin
         -> EventNAPT;
      end
    end else if ($time !== 1'b0 && NAP_ === 1'bx ) begin
      if (CS_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
         ErrorMessage(10);
`endif
         -> EventNAPT;
      end
    end else if ($time !== 1'b0 && NAP_ === 1'bz ) begin
      if (CS_ === 1'b0) begin
`ifdef NO_MEM_MSG
`else
         ErrorMessage(10);
`endif
         -> EventNAPT;
      end
    end
  end

  always @(negedge NAP_) begin
    if ($time !== 1'b0 && NAP_ === 1'b0 && CSB_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
      if (CS_ === 1'b0) begin
          disable NAPT;
          DO_byte0_i = DO_byte0_tmp;
          DO_byte1_i = DO_byte1_tmp;
          DO_byte2_i = DO_byte2_tmp;
          DO_byte3_i = DO_byte3_tmp;
      end
    end else if ($time !== 1'b0 && NAP_ === 1'bx) begin
      if (CS_ === 1'b0) begin
          disable NAPT;
          DO_byte0_i = DO_byte0_tmp;
          DO_byte1_i = DO_byte1_tmp;
          DO_byte2_i = DO_byte2_tmp;
          DO_byte3_i = DO_byte3_tmp;
      end
    end else if ($time !== 1'b0 && NAP_ === 1'bz) begin
      if (CS_ === 1'b0) begin
          disable NAPT;
          DO_byte0_i = DO_byte0_tmp;
          DO_byte1_i = DO_byte1_tmp;
          DO_byte2_i = DO_byte2_tmp;
          DO_byte3_i = DO_byte3_tmp;
      end
    end
   #TNAP_Wakeup
    Violate_Hold_time = 1'b0;
    CSB_tri_error = 1'b0;
  end

  always @(negedge NAP_) begin
        #TNAP_Wakeup  nap_initial_trigger = 1'b0;
  end

  always @(n_flag_NAP) begin
    if ($time !== 1'b0) begin
       disable NAPT;
    end
  end

  always @(posedge CK_) begin
    if (CS_ === 1'b0) begin
      CSB_temp = 1'b1;
    end
    if (CS_ === 1'b0 && Last_CK_temp === 1'b0) begin
       CK_temp = 1'b1;
    end else begin
       CK_temp = 1'b0; 
    end
    Last_CK_temp = CK_temp ;
  end

  always @(posedge CS_) begin
    CSB_temp = 1'b0;  
    if (NAP_ === 1'b1 || NAP_ === 1'bx || NAP_ === 1'bz) begin
      CSB_tri_error = 1'b1;
`ifdef NO_MEM_MSG
`else
      ErrorMessage(8);
`endif
    end
  end

  always @(negedge CK_temp) begin
    CK_temp2 = 1'b0;
  end

  always @(posedge CSB_temp) begin
    CK_temp2 = 1'b1;
    if (NAP_ === 1'bx || NAP_ === 1'bz) begin
`ifdef NO_MEM_MSG
`else
      ErrorMessage(10);
`endif
          DO_byte0_i = DO_byte0_tmp;
          DO_byte1_i = DO_byte1_tmp;
          DO_byte2_i = DO_byte2_tmp;
          DO_byte3_i = DO_byte3_tmp;
    end
  end
  always @(negedge CSB_temp) begin
    CK_temp2 = 1'b0;
  end


  always @(CK_) begin
    casez ({LastClkEdge,CK_})
      2'b01:
        if (CS_ === 1'b0 && NAP_ === 1'b1 && CSB_tri_error === 1'b0 && Violate_Hold_time === 1'b0) begin
          -> EventNAPT; 
        end else begin
          if (CSB_tri_error === 1'b0 && Violate_Hold_time === 1'b0 && nap_initial_trigger === 1'b0) begin
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
           wrong_dvs2 = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs3 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs4 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs5 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs6 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs7 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs8   = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs9 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           con_dvs10  = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs11 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           con_dvs12  = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs13 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           con_dvs14  = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
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
           n_flag_DI64 or
           n_flag_DI65 or
           n_flag_DI66 or
           n_flag_DI67 or
           n_flag_DI68 or
           n_flag_DI69 or
           n_flag_DI70 or
           n_flag_DI71 or
           n_flag_DI72 or
           n_flag_DI73 or
           n_flag_DI74 or
           n_flag_DI75 or
           n_flag_DI76 or
           n_flag_DI77 or
           n_flag_DI78 or
           n_flag_DI79 or
           n_flag_DI80 or
           n_flag_DI81 or
           n_flag_DI82 or
           n_flag_DI83 or
           n_flag_DI84 or
           n_flag_DI85 or
           n_flag_DI86 or
           n_flag_DI87 or
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
      end else if (con_dvs8) begin
        #TOH_8 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs10) begin
        #TOH_10 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs12) begin
        #TOH_12 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs14) begin
        #TOH_14 
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
      end else if (con_dvs8) begin
        #TOH_8 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs10) begin
        #TOH_10 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs12) begin
        #TOH_12 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs14) begin
        #TOH_14 
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
      end else if (con_dvs8) begin
        #TOH_8 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs10) begin
        #TOH_10 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs12) begin
        #TOH_12 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs14) begin
        #TOH_14 
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
      end else if (con_dvs8) begin
        #TOH_8 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs10) begin
        #TOH_10 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs12) begin
        #TOH_12 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs14) begin
        #TOH_14 
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
      end else if (con_dvs8) begin
        #TWDX_8 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs10) begin
        #TWDX_10 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs12) begin
        #TWDX_12 
        NODELAY0 <= 1'b0; 
        DO_byte0_i              =  {Bits{1'bX}}; 
        DO_byte0_i              <= DO_byte0_tmp; 
      end else if (con_dvs14) begin
        #TWDX_14 
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
      end else if (con_dvs8) begin
        #TWDX_8 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs10) begin
        #TWDX_10 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs12) begin
        #TWDX_12 
        NODELAY1 <= 1'b0; 
        DO_byte1_i              =  {Bits{1'bX}}; 
        DO_byte1_i              <= DO_byte1_tmp; 
      end else if (con_dvs14) begin
        #TWDX_14 
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
      end else if (con_dvs8) begin
        #TWDX_8 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs10) begin
        #TWDX_10 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs12) begin
        #TWDX_12 
        NODELAY2 <= 1'b0; 
        DO_byte2_i              =  {Bits{1'bX}}; 
        DO_byte2_i              <= DO_byte2_tmp; 
      end else if (con_dvs14) begin
        #TWDX_14 
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
      end else if (con_dvs8) begin
        #TWDX_8 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs10) begin
        #TWDX_10 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs12) begin
        #TWDX_12 
        NODELAY3 <= 1'b0; 
        DO_byte3_i              =  {Bits{1'bX}}; 
        DO_byte3_i              <= DO_byte3_tmp; 
      end else if (con_dvs14) begin
        #TWDX_14 
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
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

          NOT_BUS_DI_byte0  = {
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

          NOT_BUS_DI_byte1  = {
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
                         n_flag_DI22};

          NOT_BUS_DI_byte2  = {
                         n_flag_DI65,
                         n_flag_DI64,
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
                         n_flag_DI44};

          NOT_BUS_DI_byte3  = {
                         n_flag_DI87,
                         n_flag_DI86,
                         n_flag_DI85,
                         n_flag_DI84,
                         n_flag_DI83,
                         n_flag_DI82,
                         n_flag_DI81,
                         n_flag_DI80,
                         n_flag_DI79,
                         n_flag_DI78,
                         n_flag_DI77,
                         n_flag_DI76,
                         n_flag_DI75,
                         n_flag_DI74,
                         n_flag_DI73,
                         n_flag_DI72,
                         n_flag_DI71,
                         n_flag_DI70,
                         n_flag_DI69,
                         n_flag_DI68,
                         n_flag_DI67,
                         n_flag_DI66};

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
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                   end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                    end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                      end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                        end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs6 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs13 || wrong_dvs15) begin
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


  task pin_unknow;
     begin
      disable TOHDO_byte0;
      disable TWDXDO_byte0;
      disable NAPT;
      NODELAY0 = 1'b1;
      all_core_x(0,1);
      DO_byte0_tmp = {Bits{1'bX}};
      DO_byte0_i = DO_byte0_tmp;
      disable TOHDO_byte1;
      disable TWDXDO_byte1;
      disable NAPT;
      NODELAY1 = 1'b1;
      all_core_x(1,1);
      DO_byte1_tmp = {Bits{1'bX}};
      DO_byte1_i = DO_byte1_tmp;
      disable TOHDO_byte2;
      disable TWDXDO_byte2;
      disable NAPT;
      NODELAY2 = 1'b1;
      all_core_x(2,1);
      DO_byte2_tmp = {Bits{1'bX}};
      DO_byte2_i = DO_byte2_tmp;
      disable TOHDO_byte3;
      disable TWDXDO_byte3;
      disable NAPT;
      NODELAY3 = 1'b1;
      all_core_x(3,1);
      DO_byte3_tmp = {Bits{1'bX}};
      DO_byte3_i = DO_byte3_tmp;
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
         6: $display("** MEM_Error: NAP turn off, CSB must operate in the TNAP_CSH later %m",$time);
         7: $display("** MEM_Error: NAP is unknow or high-z, DO is unknown, all memory core is unknown %m",$time);
         8: $display("** MEM_Error: CSB negedge trigger, NAP be operated high, so DO is unknown, all memory core is unknown %m",$time);
         9: $display("** MEM_Error: CSB negedge trigger, NAP be operated high, so DO keep data, all memory core keep data %m",$time);
        10: $display("** MEM_Error: NAP is unknow or high-z, DO keep data, all memory core keep data %m",$time);
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
      specparam TAA    = (80.7:120.6:202.0);
      specparam TAA_8  = (82.9:124.2:207.8);
      specparam TAA_10  = (81.5:122.0:204.6);
      specparam TAA_12  = (80.7:120.6:202.0);
      specparam TAA_14  = (80.0:119.5:200.3);
      specparam TWDV = (80.1:119.3:199.5);
      specparam TWDV_8  = (82.3:123.0:205.5);
      specparam TWDV_10  = (80.9:120.7:202.1);
      specparam TWDV_12  = (80.1:119.3:199.5);
      specparam TWDV_14  = (79.3:118.2:197.8);
      specparam TRC  = (70.2:108.0:183.4);
      specparam TRC_8    = (72.5:111.6:189.3);
      specparam TRC_10    = (71.0:109.4:186.0);
      specparam TRC_12    = (70.2:108.0:183.4);
      specparam TRC_14    = (69.4:106.8:181.6);
      specparam THPW = (16.1:25.7:44.7);
      specparam TLPW = (17.5:23.9:34.8);
      specparam TAS  = (19.0:25.1:37.3);
      specparam TAH  = (12.1:19.9:34.0);
      specparam TWS  = (14.0:15.9:15.9);
      specparam TWH  = (11.2:17.6:35.3);
      specparam TDS  = (13.9:22.1:42.6);
      specparam TDH  = (3.7:6.0:8.6);
      specparam TCSS = (35.1:51.1:76.5);
      specparam TCSH = (16.6:27.9:51.9);
      specparam TNAPH  = (7.4:13.9:26.6);
      specparam TNAP_CSH  = (31.4:45.9:52.6);
      specparam TDVSES  = (19.0:25.1:37.3);
      specparam TDVSEH  = (54.6:81.7:134.0);
      specparam TDVSS   = (19.0:25.1:37.3);
      specparam TDVSH   = (54.6:81.7:134.0);

      $setuphold ( posedge CK &&& con_A,          posedge A0, TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          negedge A0, TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          posedge A1, TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          negedge A1, TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          posedge A2, TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          negedge A2, TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          posedge A3, TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          negedge A3, TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          posedge A4, TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          negedge A4, TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          posedge A5, TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_A,          negedge A5, TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI7, TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI7, TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI8, TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI8, TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI9, TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI9, TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI10, TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI10, TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI11, TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI11, TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI12, TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI12, TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI13, TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI13, TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI14, TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI14, TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI15, TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI15, TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI16, TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI16, TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI17, TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI17, TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI18, TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI18, TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI19, TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI19, TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI20, TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI20, TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI21, TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI21, TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI22, TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI22, TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI23, TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI23, TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI24, TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI24, TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI25, TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI25, TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI26, TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI26, TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI27, TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI27, TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI28, TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI28, TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI29, TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI29, TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI30, TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI30, TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI31, TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI31, TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI32, TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI32, TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI33, TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI33, TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI34, TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI34, TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI35, TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI35, TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI36, TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI36, TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI37, TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI37, TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI38, TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI38, TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI39, TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI39, TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI40, TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI40, TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI41, TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI41, TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI42, TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI42, TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI43, TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI43, TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI44, TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI44, TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI45, TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI45, TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI46, TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI46, TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI47, TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI47, TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI48, TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI48, TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI49, TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI49, TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI50, TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI50, TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI51, TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI51, TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI52, TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI52, TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI53, TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI53, TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI54, TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI54, TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI55, TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI55, TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI56, TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI56, TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI57, TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI57, TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI58, TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI58, TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI59, TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI59, TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI60, TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI60, TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI61, TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI61, TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI62, TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI62, TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI63, TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI63, TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI64, TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI64, TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI65, TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI65, TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI66, TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI66, TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI67, TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI67, TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI68, TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI68, TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI69, TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI69, TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI70, TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI70, TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI71, TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI71, TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI72, TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI72, TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI73, TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI73, TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI74, TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI74, TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI75, TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI75, TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI76, TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI76, TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI77, TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI77, TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI78, TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI78, TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI79, TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI79, TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI80, TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI80, TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI81, TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI81, TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI82, TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI82, TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI83, TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI83, TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI84, TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI84, TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI85, TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI85, TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI86, TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI86, TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI87, TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI87, TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CK &&& con_WEB0,       posedge WEB0, TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CK &&& con_WEB0,       negedge WEB0, TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CK &&& con_WEB1,       posedge WEB1, TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CK &&& con_WEB1,       negedge WEB1, TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CK &&& con_WEB2,       posedge WEB2, TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CK &&& con_WEB2,       negedge WEB2, TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CK &&& con_WEB3,       posedge WEB3, TWS,     TWH,     n_flag_WEB3    );
      $setuphold ( posedge CK &&& con_WEB3,       negedge WEB3, TWS,     TWH,     n_flag_WEB3    );
      $setuphold ( posedge CK &&& con_DVSE_W,     posedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CK &&& con_DVSE_W,     negedge DVSE, TDVSES,  TDVSEH,  n_flag_DVSE    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS0, TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS0, TDVSS,   TDVSH,   n_flag_DVS0    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS1, TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS1, TDVSS,   TDVSH,   n_flag_DVS1    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS2, TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS2, TDVSS,   TDVSH,   n_flag_DVS2    );
      $setuphold ( posedge CK &&& con_DVS_W,      posedge DVS3, TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CK &&& con_DVS_W,      negedge DVS3, TDVSS,   TDVSH,   n_flag_DVS3    );
      $setuphold ( posedge CK,                    posedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $setuphold ( posedge CK,                    negedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $period    ( posedge CK &&& ck_per,         TRC,                       n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per8,        TRC_8,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per10,       TRC_10,                    n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per12,       TRC_12,                    n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per14,       TRC_14,                    n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );

      $setuphold ( posedge CK,                    posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );
      $setuphold ( negedge NAP &&& con_NAP,       negedge CSB, 0,       TNAP_CSH, n_flag_NAP_CSB );

      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO0 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO1 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO2 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO3 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO4 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO5 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO6 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO7 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO8 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO9 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO10 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO11 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO12 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO13 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO14 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO15 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO16 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO17 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO18 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO19 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO20 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO21 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO0 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO1 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO2 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO3 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO4 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO5 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO6 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO7 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO8 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO9 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO10 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO11 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO12 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO13 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO14 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO15 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO16 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO17 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO18 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO19 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO20 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO21 :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO0 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO1 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO2 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO3 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO4 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO5 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO6 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO7 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO8 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO9 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO10 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO11 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO12 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO13 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO14 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO15 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO16 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO17 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO18 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO19 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO20 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO21 :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO0 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO1 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO2 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO3 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO4 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO5 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO6 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO7 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO8 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO9 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO10 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO11 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO12 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO13 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO14 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO15 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO16 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO17 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO18 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO19 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO20 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO21 :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO0 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO1 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO2 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO3 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO4 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO5 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO6 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO7 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO8 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO9 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO10 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO11 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO12 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO13 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO14 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO15 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO16 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO17 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO18 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO19 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO20 :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO21 :1'bx)) = TAA_14;

      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO22 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO23 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO24 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO25 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO26 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO27 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO28 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO29 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO30 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO31 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO32 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO33 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO34 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO35 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO36 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO37 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO38 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO39 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO40 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO41 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO42 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO43 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO22 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO23 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO24 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO25 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO26 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO27 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO28 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO29 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO30 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO31 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO32 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO33 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO34 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO35 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO36 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO37 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO38 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO39 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO40 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO41 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO42 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO43 :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO22 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO23 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO24 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO25 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO26 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO27 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO28 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO29 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO30 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO31 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO32 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO33 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO34 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO35 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO36 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO37 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO38 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO39 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO40 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO41 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO42 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO43 :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO22 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO23 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO24 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO25 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO26 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO27 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO28 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO29 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO30 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO31 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO32 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO33 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO34 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO35 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO36 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO37 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO38 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO39 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO40 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO41 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO42 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO43 :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO22 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO23 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO24 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO25 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO26 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO27 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO28 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO29 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO30 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO31 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO32 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO33 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO34 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO35 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO36 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO37 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO38 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO39 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO40 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO41 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO42 :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO43 :1'bx)) = TAA_14;

      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO44 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO45 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO46 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO47 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO48 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO49 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO50 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO51 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO52 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO53 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO54 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO55 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO56 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO57 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO58 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO59 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO60 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO61 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO62 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO63 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO64 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO65 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO44 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO45 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO46 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO47 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO48 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO49 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO50 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO51 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO52 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO53 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO54 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO55 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO56 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO57 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO58 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO59 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO60 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO61 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO62 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO63 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO64 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO65 :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO44 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO45 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO46 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO47 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO48 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO49 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO50 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO51 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO52 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO53 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO54 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO55 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO56 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO57 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO58 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO59 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO60 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO61 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO62 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO63 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO64 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO65 :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO44 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO45 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO46 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO47 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO48 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO49 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO50 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO51 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO52 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO53 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO54 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO55 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO56 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO57 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO58 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO59 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO60 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO61 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO62 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO63 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO64 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO65 :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO44 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO45 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO46 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO47 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO48 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO49 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO50 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO51 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO52 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO53 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO54 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO55 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO56 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO57 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO58 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO59 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO60 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO61 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO62 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO63 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO64 :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO65 :1'bx)) = TAA_14;

      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO66 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO67 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO68 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO69 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO70 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO71 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO72 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO73 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO74 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO75 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO76 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO77 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO78 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO79 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO80 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO81 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO82 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO83 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO84 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO85 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO86 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO87 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO66 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO67 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO68 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO69 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO70 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO71 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO72 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO73 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO74 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO75 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO76 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO77 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO78 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO79 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO80 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO81 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO82 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO83 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO84 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO85 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO86 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO87 :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO66 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO67 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO68 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO69 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO70 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO71 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO72 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO73 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO74 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO75 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO76 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO77 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO78 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO79 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO80 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO81 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO82 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO83 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO84 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO85 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO86 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO87 :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO66 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO67 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO68 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO69 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO70 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO71 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO72 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO73 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO74 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO75 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO76 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO77 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO78 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO79 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO80 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO81 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO82 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO83 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO84 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO85 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO86 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO87 :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO66 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO67 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO68 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO69 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO70 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO71 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO72 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO73 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO74 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO75 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO76 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO77 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO78 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO79 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO80 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO81 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO82 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO83 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO84 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO85 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO86 :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO87 :1'bx)) = TAA_14;


      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO0 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO1 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO2 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO3 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO4 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO5 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO6 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO7 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO8 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO9 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO10 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO11 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO12 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO13 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO14 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO15 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO16 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO17 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO18 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO19 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO20 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO21 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO0 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO1 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO2 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO3 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO4 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO5 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO6 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO7 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO8 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO9 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO10 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO11 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO12 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO13 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO14 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO15 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO16 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO17 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO18 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO19 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO20 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO21 :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO0 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO1 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO2 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO3 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO4 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO5 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO6 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO7 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO8 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO9 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO10 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO11 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO12 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO13 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO14 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO15 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO16 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO17 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO18 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO19 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO20 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO21 :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO0 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO1 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO2 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO3 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO4 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO5 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO6 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO7 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO8 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO9 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO10 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO11 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO12 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO13 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO14 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO15 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO16 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO17 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO18 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO19 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO20 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO21 :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO0 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO1 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO2 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO3 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO4 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO5 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO6 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO7 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO8 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO9 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO10 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO11 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO12 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO13 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO14 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO15 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO16 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO17 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO18 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO19 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO20 :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO21 :1'bx)) = TWDV_14;

      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO22 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO23 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO24 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO25 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO26 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO27 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO28 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO29 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO30 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO31 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO32 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO33 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO34 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO35 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO36 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO37 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO38 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO39 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO40 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO41 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO42 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO43 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO22 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO23 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO24 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO25 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO26 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO27 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO28 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO29 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO30 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO31 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO32 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO33 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO34 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO35 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO36 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO37 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO38 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO39 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO40 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO41 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO42 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO43 :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO22 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO23 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO24 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO25 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO26 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO27 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO28 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO29 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO30 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO31 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO32 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO33 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO34 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO35 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO36 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO37 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO38 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO39 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO40 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO41 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO42 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO43 :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO22 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO23 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO24 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO25 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO26 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO27 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO28 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO29 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO30 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO31 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO32 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO33 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO34 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO35 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO36 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO37 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO38 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO39 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO40 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO41 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO42 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO43 :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO22 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO23 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO24 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO25 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO26 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO27 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO28 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO29 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO30 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO31 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO32 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO33 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO34 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO35 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO36 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO37 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO38 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO39 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO40 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO41 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO42 :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO43 :1'bx)) = TWDV_14;

      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO44 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO45 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO46 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO47 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO48 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO49 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO50 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO51 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO52 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO53 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO54 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO55 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO56 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO57 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO58 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO59 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO60 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO61 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO62 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO63 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO64 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO65 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO44 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO45 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO46 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO47 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO48 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO49 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO50 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO51 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO52 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO53 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO54 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO55 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO56 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO57 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO58 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO59 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO60 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO61 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO62 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO63 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO64 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO65 :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO44 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO45 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO46 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO47 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO48 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO49 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO50 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO51 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO52 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO53 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO54 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO55 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO56 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO57 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO58 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO59 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO60 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO61 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO62 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO63 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO64 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO65 :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO44 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO45 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO46 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO47 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO48 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO49 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO50 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO51 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO52 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO53 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO54 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO55 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO56 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO57 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO58 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO59 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO60 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO61 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO62 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO63 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO64 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO65 :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO44 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO45 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO46 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO47 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO48 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO49 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO50 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO51 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO52 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO53 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO54 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO55 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO56 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO57 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO58 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO59 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO60 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO61 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO62 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO63 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO64 :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO65 :1'bx)) = TWDV_14;

      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO66 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO67 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO68 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO69 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO70 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO71 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO72 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO73 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO74 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO75 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO76 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO77 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO78 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO79 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO80 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO81 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO82 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO83 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO84 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO85 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO86 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO87 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO66 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO67 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO68 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO69 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO70 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO71 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO72 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO73 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO74 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO75 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO76 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO77 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO78 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO79 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO80 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO81 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO82 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO83 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO84 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO85 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO86 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO87 :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO66 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO67 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO68 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO69 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO70 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO71 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO72 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO73 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO74 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO75 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO76 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO77 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO78 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO79 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO80 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO81 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO82 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO83 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO84 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO85 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO86 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO87 :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO66 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO67 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO68 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO69 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO70 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO71 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO72 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO73 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO74 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO75 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO76 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO77 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO78 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO79 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO80 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO81 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO82 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO83 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO84 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO85 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO86 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO87 :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO66 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO67 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO68 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO69 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO70 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO71 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO72 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO73 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO74 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO75 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO76 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO77 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO78 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO79 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO80 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO81 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO82 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO83 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO84 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO85 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO86 :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO87 :1'bx)) = TWDV_14;


      if (NAPREG == 1)  (posedge NAP => (DO0 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO1 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO2 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO3 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO4 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO5 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO6 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO7 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO8 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO9 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO10 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO11 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO12 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO13 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO14 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO15 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO16 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO17 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO18 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO19 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO20 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO21 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO22 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO23 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO24 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO25 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO26 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO27 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO28 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO29 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO30 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO31 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO32 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO33 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO34 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO35 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO36 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO37 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO38 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO39 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO40 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO41 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO42 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO43 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO44 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO45 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO46 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO47 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO48 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO49 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO50 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO51 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO52 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO53 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO54 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO55 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO56 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO57 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO58 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO59 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO60 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO61 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO62 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO63 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO64 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO65 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO66 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO67 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO68 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO69 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO70 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO71 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO72 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO73 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO74 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO75 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO76 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO77 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO78 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO79 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO80 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO81 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO82 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO83 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO84 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO85 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO86 :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO87 :1'bx)) = 0    ;



   endspecify

`endprotect
endmodule
