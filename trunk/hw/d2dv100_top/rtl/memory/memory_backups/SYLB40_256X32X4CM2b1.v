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
       Word               :  256                             
       Bit                :  32                              
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
       Date               :  2024/08/22 08:07:51             
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


module SYLB40_256X32X4CM2b1 (A,DO,DI,DVSE,DVS,WEB,CK,CSB,NAP);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 8;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 32;               
  parameter  Words                = 256;              
  parameter  Bytes                = 4;                
  parameter  AspectRatio          = 2;                
  parameter  TOH                  = (59.1:89.8:150.4);
  parameter  TOH_8                = (62.4:95.4:159.8);
  parameter  TOH_10               = (60.3:91.9:154.5);
  parameter  TOH_12               = (59.1:89.8:150.4);
  parameter  TOH_14               = (57.9:87.9:147.5);
  parameter  TWDX                 = (53.6:81.5:135.9);
  parameter  TWDX_8               = (56.6:86.6:144.5);
  parameter  TWDX_10              = (54.6:83.5:139.6);
  parameter  TWDX_12              = (53.6:81.5:135.9);
  parameter  TWDX_14              = (52.5:79.8:133.2);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (78.9:121.7:206.6);
`else
`endif
  parameter  TNAP_Wakeup          = 0;                

  output     [Bytes*Bits-1:0]     DO;                 
  input      [Bytes*Bits-1:0]     DI;                 
  input      [AddressSize-1:0]    A;                  
  input      DVSE;                                    
  input      [DVSize-1:0]         DVS;                
  input      [Bytes-1:0]          WEB;                
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
  reg                             n_flag_DI88;        
  reg                             n_flag_DI89;        
  reg                             n_flag_DI90;        
  reg                             n_flag_DI91;        
  reg                             n_flag_DI92;        
  reg                             n_flag_DI93;        
  reg                             n_flag_DI94;        
  reg                             n_flag_DI95;        
  reg                             n_flag_DI96;        
  reg                             n_flag_DI97;        
  reg                             n_flag_DI98;        
  reg                             n_flag_DI99;        
  reg                             n_flag_DI100;       
  reg                             n_flag_DI101;       
  reg                             n_flag_DI102;       
  reg                             n_flag_DI103;       
  reg                             n_flag_DI104;       
  reg                             n_flag_DI105;       
  reg                             n_flag_DI106;       
  reg                             n_flag_DI107;       
  reg                             n_flag_DI108;       
  reg                             n_flag_DI109;       
  reg                             n_flag_DI110;       
  reg                             n_flag_DI111;       
  reg                             n_flag_DI112;       
  reg                             n_flag_DI113;       
  reg                             n_flag_DI114;       
  reg                             n_flag_DI115;       
  reg                             n_flag_DI116;       
  reg                             n_flag_DI117;       
  reg                             n_flag_DI118;       
  reg                             n_flag_DI119;       
  reg                             n_flag_DI120;       
  reg                             n_flag_DI121;       
  reg                             n_flag_DI122;       
  reg                             n_flag_DI123;       
  reg                             n_flag_DI124;       
  reg                             n_flag_DI125;       
  reg                             n_flag_DI126;       
  reg                             n_flag_DI127;       
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

  reg                             n_flag_NAP;         
  reg                             n_flag_NAP_CSB;     
  reg                             Last_CK_temp;       
  reg                             CSB_temp;           
  reg                             CK_temp;            
  reg                             CK_temp2;           

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
  buf        ido64           (DO[64], DO_[64]);            
  buf        ido65           (DO[65], DO_[65]);            
  buf        ido66           (DO[66], DO_[66]);            
  buf        ido67           (DO[67], DO_[67]);            
  buf        ido68           (DO[68], DO_[68]);            
  buf        ido69           (DO[69], DO_[69]);            
  buf        ido70           (DO[70], DO_[70]);            
  buf        ido71           (DO[71], DO_[71]);            
  buf        ido72           (DO[72], DO_[72]);            
  buf        ido73           (DO[73], DO_[73]);            
  buf        ido74           (DO[74], DO_[74]);            
  buf        ido75           (DO[75], DO_[75]);            
  buf        ido76           (DO[76], DO_[76]);            
  buf        ido77           (DO[77], DO_[77]);            
  buf        ido78           (DO[78], DO_[78]);            
  buf        ido79           (DO[79], DO_[79]);            
  buf        ido80           (DO[80], DO_[80]);            
  buf        ido81           (DO[81], DO_[81]);            
  buf        ido82           (DO[82], DO_[82]);            
  buf        ido83           (DO[83], DO_[83]);            
  buf        ido84           (DO[84], DO_[84]);            
  buf        ido85           (DO[85], DO_[85]);            
  buf        ido86           (DO[86], DO_[86]);            
  buf        ido87           (DO[87], DO_[87]);            
  buf        ido88           (DO[88], DO_[88]);            
  buf        ido89           (DO[89], DO_[89]);            
  buf        ido90           (DO[90], DO_[90]);            
  buf        ido91           (DO[91], DO_[91]);            
  buf        ido92           (DO[92], DO_[92]);            
  buf        ido93           (DO[93], DO_[93]);            
  buf        ido94           (DO[94], DO_[94]);            
  buf        ido95           (DO[95], DO_[95]);            
  buf        ido96           (DO[96], DO_[96]);            
  buf        ido97           (DO[97], DO_[97]);            
  buf        ido98           (DO[98], DO_[98]);            
  buf        ido99           (DO[99], DO_[99]);            
  buf        ido100          (DO[100], DO_[100]);          
  buf        ido101          (DO[101], DO_[101]);          
  buf        ido102          (DO[102], DO_[102]);          
  buf        ido103          (DO[103], DO_[103]);          
  buf        ido104          (DO[104], DO_[104]);          
  buf        ido105          (DO[105], DO_[105]);          
  buf        ido106          (DO[106], DO_[106]);          
  buf        ido107          (DO[107], DO_[107]);          
  buf        ido108          (DO[108], DO_[108]);          
  buf        ido109          (DO[109], DO_[109]);          
  buf        ido110          (DO[110], DO_[110]);          
  buf        ido111          (DO[111], DO_[111]);          
  buf        ido112          (DO[112], DO_[112]);          
  buf        ido113          (DO[113], DO_[113]);          
  buf        ido114          (DO[114], DO_[114]);          
  buf        ido115          (DO[115], DO_[115]);          
  buf        ido116          (DO[116], DO_[116]);          
  buf        ido117          (DO[117], DO_[117]);          
  buf        ido118          (DO[118], DO_[118]);          
  buf        ido119          (DO[119], DO_[119]);          
  buf        ido120          (DO[120], DO_[120]);          
  buf        ido121          (DO[121], DO_[121]);          
  buf        ido122          (DO[122], DO_[122]);          
  buf        ido123          (DO[123], DO_[123]);          
  buf        ido124          (DO[124], DO_[124]);          
  buf        ido125          (DO[125], DO_[125]);          
  buf        ido126          (DO[126], DO_[126]);          
  buf        ido127          (DO[127], DO_[127]);          
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
  buf        idi_byte0_8     (DI_byte0_[8], DI[8]);        
  buf        idi_byte0_9     (DI_byte0_[9], DI[9]);        
  buf        idi_byte0_10    (DI_byte0_[10], DI[10]);      
  buf        idi_byte0_11    (DI_byte0_[11], DI[11]);      
  buf        idi_byte0_12    (DI_byte0_[12], DI[12]);      
  buf        idi_byte0_13    (DI_byte0_[13], DI[13]);      
  buf        idi_byte0_14    (DI_byte0_[14], DI[14]);      
  buf        idi_byte0_15    (DI_byte0_[15], DI[15]);      
  buf        idi_byte0_16    (DI_byte0_[16], DI[16]);      
  buf        idi_byte0_17    (DI_byte0_[17], DI[17]);      
  buf        idi_byte0_18    (DI_byte0_[18], DI[18]);      
  buf        idi_byte0_19    (DI_byte0_[19], DI[19]);      
  buf        idi_byte0_20    (DI_byte0_[20], DI[20]);      
  buf        idi_byte0_21    (DI_byte0_[21], DI[21]);      
  buf        idi_byte0_22    (DI_byte0_[22], DI[22]);      
  buf        idi_byte0_23    (DI_byte0_[23], DI[23]);      
  buf        idi_byte0_24    (DI_byte0_[24], DI[24]);      
  buf        idi_byte0_25    (DI_byte0_[25], DI[25]);      
  buf        idi_byte0_26    (DI_byte0_[26], DI[26]);      
  buf        idi_byte0_27    (DI_byte0_[27], DI[27]);      
  buf        idi_byte0_28    (DI_byte0_[28], DI[28]);      
  buf        idi_byte0_29    (DI_byte0_[29], DI[29]);      
  buf        idi_byte0_30    (DI_byte0_[30], DI[30]);      
  buf        idi_byte0_31    (DI_byte0_[31], DI[31]);      
  buf        idi_byte1_0     (DI_byte1_[0], DI[32]);       
  buf        idi_byte1_1     (DI_byte1_[1], DI[33]);       
  buf        idi_byte1_2     (DI_byte1_[2], DI[34]);       
  buf        idi_byte1_3     (DI_byte1_[3], DI[35]);       
  buf        idi_byte1_4     (DI_byte1_[4], DI[36]);       
  buf        idi_byte1_5     (DI_byte1_[5], DI[37]);       
  buf        idi_byte1_6     (DI_byte1_[6], DI[38]);       
  buf        idi_byte1_7     (DI_byte1_[7], DI[39]);       
  buf        idi_byte1_8     (DI_byte1_[8], DI[40]);       
  buf        idi_byte1_9     (DI_byte1_[9], DI[41]);       
  buf        idi_byte1_10    (DI_byte1_[10], DI[42]);      
  buf        idi_byte1_11    (DI_byte1_[11], DI[43]);      
  buf        idi_byte1_12    (DI_byte1_[12], DI[44]);      
  buf        idi_byte1_13    (DI_byte1_[13], DI[45]);      
  buf        idi_byte1_14    (DI_byte1_[14], DI[46]);      
  buf        idi_byte1_15    (DI_byte1_[15], DI[47]);      
  buf        idi_byte1_16    (DI_byte1_[16], DI[48]);      
  buf        idi_byte1_17    (DI_byte1_[17], DI[49]);      
  buf        idi_byte1_18    (DI_byte1_[18], DI[50]);      
  buf        idi_byte1_19    (DI_byte1_[19], DI[51]);      
  buf        idi_byte1_20    (DI_byte1_[20], DI[52]);      
  buf        idi_byte1_21    (DI_byte1_[21], DI[53]);      
  buf        idi_byte1_22    (DI_byte1_[22], DI[54]);      
  buf        idi_byte1_23    (DI_byte1_[23], DI[55]);      
  buf        idi_byte1_24    (DI_byte1_[24], DI[56]);      
  buf        idi_byte1_25    (DI_byte1_[25], DI[57]);      
  buf        idi_byte1_26    (DI_byte1_[26], DI[58]);      
  buf        idi_byte1_27    (DI_byte1_[27], DI[59]);      
  buf        idi_byte1_28    (DI_byte1_[28], DI[60]);      
  buf        idi_byte1_29    (DI_byte1_[29], DI[61]);      
  buf        idi_byte1_30    (DI_byte1_[30], DI[62]);      
  buf        idi_byte1_31    (DI_byte1_[31], DI[63]);      
  buf        idi_byte2_0     (DI_byte2_[0], DI[64]);       
  buf        idi_byte2_1     (DI_byte2_[1], DI[65]);       
  buf        idi_byte2_2     (DI_byte2_[2], DI[66]);       
  buf        idi_byte2_3     (DI_byte2_[3], DI[67]);       
  buf        idi_byte2_4     (DI_byte2_[4], DI[68]);       
  buf        idi_byte2_5     (DI_byte2_[5], DI[69]);       
  buf        idi_byte2_6     (DI_byte2_[6], DI[70]);       
  buf        idi_byte2_7     (DI_byte2_[7], DI[71]);       
  buf        idi_byte2_8     (DI_byte2_[8], DI[72]);       
  buf        idi_byte2_9     (DI_byte2_[9], DI[73]);       
  buf        idi_byte2_10    (DI_byte2_[10], DI[74]);      
  buf        idi_byte2_11    (DI_byte2_[11], DI[75]);      
  buf        idi_byte2_12    (DI_byte2_[12], DI[76]);      
  buf        idi_byte2_13    (DI_byte2_[13], DI[77]);      
  buf        idi_byte2_14    (DI_byte2_[14], DI[78]);      
  buf        idi_byte2_15    (DI_byte2_[15], DI[79]);      
  buf        idi_byte2_16    (DI_byte2_[16], DI[80]);      
  buf        idi_byte2_17    (DI_byte2_[17], DI[81]);      
  buf        idi_byte2_18    (DI_byte2_[18], DI[82]);      
  buf        idi_byte2_19    (DI_byte2_[19], DI[83]);      
  buf        idi_byte2_20    (DI_byte2_[20], DI[84]);      
  buf        idi_byte2_21    (DI_byte2_[21], DI[85]);      
  buf        idi_byte2_22    (DI_byte2_[22], DI[86]);      
  buf        idi_byte2_23    (DI_byte2_[23], DI[87]);      
  buf        idi_byte2_24    (DI_byte2_[24], DI[88]);      
  buf        idi_byte2_25    (DI_byte2_[25], DI[89]);      
  buf        idi_byte2_26    (DI_byte2_[26], DI[90]);      
  buf        idi_byte2_27    (DI_byte2_[27], DI[91]);      
  buf        idi_byte2_28    (DI_byte2_[28], DI[92]);      
  buf        idi_byte2_29    (DI_byte2_[29], DI[93]);      
  buf        idi_byte2_30    (DI_byte2_[30], DI[94]);      
  buf        idi_byte2_31    (DI_byte2_[31], DI[95]);      
  buf        idi_byte3_0     (DI_byte3_[0], DI[96]);       
  buf        idi_byte3_1     (DI_byte3_[1], DI[97]);       
  buf        idi_byte3_2     (DI_byte3_[2], DI[98]);       
  buf        idi_byte3_3     (DI_byte3_[3], DI[99]);       
  buf        idi_byte3_4     (DI_byte3_[4], DI[100]);      
  buf        idi_byte3_5     (DI_byte3_[5], DI[101]);      
  buf        idi_byte3_6     (DI_byte3_[6], DI[102]);      
  buf        idi_byte3_7     (DI_byte3_[7], DI[103]);      
  buf        idi_byte3_8     (DI_byte3_[8], DI[104]);      
  buf        idi_byte3_9     (DI_byte3_[9], DI[105]);      
  buf        idi_byte3_10    (DI_byte3_[10], DI[106]);     
  buf        idi_byte3_11    (DI_byte3_[11], DI[107]);     
  buf        idi_byte3_12    (DI_byte3_[12], DI[108]);     
  buf        idi_byte3_13    (DI_byte3_[13], DI[109]);     
  buf        idi_byte3_14    (DI_byte3_[14], DI[110]);     
  buf        idi_byte3_15    (DI_byte3_[15], DI[111]);     
  buf        idi_byte3_16    (DI_byte3_[16], DI[112]);     
  buf        idi_byte3_17    (DI_byte3_[17], DI[113]);     
  buf        idi_byte3_18    (DI_byte3_[18], DI[114]);     
  buf        idi_byte3_19    (DI_byte3_[19], DI[115]);     
  buf        idi_byte3_20    (DI_byte3_[20], DI[116]);     
  buf        idi_byte3_21    (DI_byte3_[21], DI[117]);     
  buf        idi_byte3_22    (DI_byte3_[22], DI[118]);     
  buf        idi_byte3_23    (DI_byte3_[23], DI[119]);     
  buf        idi_byte3_24    (DI_byte3_[24], DI[120]);     
  buf        idi_byte3_25    (DI_byte3_[25], DI[121]);     
  buf        idi_byte3_26    (DI_byte3_[26], DI[122]);     
  buf        idi_byte3_27    (DI_byte3_[27], DI[123]);     
  buf        idi_byte3_28    (DI_byte3_[28], DI[124]);     
  buf        idi_byte3_29    (DI_byte3_[29], DI[125]);     
  buf        idi_byte3_30    (DI_byte3_[30], DI[126]);     
  buf        idi_byte3_31    (DI_byte3_[31], DI[127]);     
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
           n_flag_DI88 or
           n_flag_DI89 or
           n_flag_DI90 or
           n_flag_DI91 or
           n_flag_DI92 or
           n_flag_DI93 or
           n_flag_DI94 or
           n_flag_DI95 or
           n_flag_DI96 or
           n_flag_DI97 or
           n_flag_DI98 or
           n_flag_DI99 or
           n_flag_DI100 or
           n_flag_DI101 or
           n_flag_DI102 or
           n_flag_DI103 or
           n_flag_DI104 or
           n_flag_DI105 or
           n_flag_DI106 or
           n_flag_DI107 or
           n_flag_DI108 or
           n_flag_DI109 or
           n_flag_DI110 or
           n_flag_DI111 or
           n_flag_DI112 or
           n_flag_DI113 or
           n_flag_DI114 or
           n_flag_DI115 or
           n_flag_DI116 or
           n_flag_DI117 or
           n_flag_DI118 or
           n_flag_DI119 or
           n_flag_DI120 or
           n_flag_DI121 or
           n_flag_DI122 or
           n_flag_DI123 or
           n_flag_DI124 or
           n_flag_DI125 or
           n_flag_DI126 or
           n_flag_DI127 or
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
                         n_flag_A7,
                         n_flag_A6,
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

          NOT_BUS_DI_byte0  = {
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

          NOT_BUS_DI_byte1  = {
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
                         n_flag_DI32};

          NOT_BUS_DI_byte2  = {
                         n_flag_DI95,
                         n_flag_DI94,
                         n_flag_DI93,
                         n_flag_DI92,
                         n_flag_DI91,
                         n_flag_DI90,
                         n_flag_DI89,
                         n_flag_DI88,
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
                         n_flag_DI66,
                         n_flag_DI65,
                         n_flag_DI64};

          NOT_BUS_DI_byte3  = {
                         n_flag_DI127,
                         n_flag_DI126,
                         n_flag_DI125,
                         n_flag_DI124,
                         n_flag_DI123,
                         n_flag_DI122,
                         n_flag_DI121,
                         n_flag_DI120,
                         n_flag_DI119,
                         n_flag_DI118,
                         n_flag_DI117,
                         n_flag_DI116,
                         n_flag_DI115,
                         n_flag_DI114,
                         n_flag_DI113,
                         n_flag_DI112,
                         n_flag_DI111,
                         n_flag_DI110,
                         n_flag_DI109,
                         n_flag_DI108,
                         n_flag_DI107,
                         n_flag_DI106,
                         n_flag_DI105,
                         n_flag_DI104,
                         n_flag_DI103,
                         n_flag_DI102,
                         n_flag_DI101,
                         n_flag_DI100,
                         n_flag_DI99,
                         n_flag_DI98,
                         n_flag_DI97,
                         n_flag_DI96};

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
      specparam TAA    = (89.6:134.7:226.1);
      specparam TAA_8  = (93.0:140.3:235.5);
      specparam TAA_10  = (90.9:136.8:230.2);
      specparam TAA_12  = (89.6:134.7:226.1);
      specparam TAA_14  = (88.5:132.8:223.2);
      specparam TWDV    = (88.5:132.6:222.1);
      specparam TWDV_8  = (91.9:138.4:231.7);
      specparam TWDV_10  = (89.7:134.8:226.3);
      specparam TWDV_12  = (88.5:132.6:222.1);
      specparam TWDV_14  = (87.3:130.7:219.2);
      specparam TRC    = (78.9:121.7:206.6);
      specparam TRC_8    = (82.4:127.5:216.2);
      specparam TRC_10    = (80.2:123.9:210.8);
      specparam TRC_12    = (78.9:121.7:206.6);
      specparam TRC_14    = (77.7:119.8:203.7);
      specparam THPW   = (16.9:27.1:45.6);
      specparam TLPW   = (17.5:23.9:37.5);
      specparam TAS    = (19.0:25.9:40.0);
      specparam TAH    = (12.1:19.9:34.0);
      specparam TWS    = (14.9:17.1:16.8);
      specparam TWH    = (11.5:18.2:36.5);
      specparam TDS    = (13.5:21.5:41.7);
      specparam TDH    = (4.8:7.6:11.3);
      specparam TCSS   = (36.3:53.4:81.6);
      specparam TCSH   = (16.6:27.9:51.9);
      specparam TNAPH  = (7.4:13.9:26.6);
      specparam TNAP_CSH  = (54.3:78.7:108.7);
      specparam TDVSES  = (19.0:25.9:40.0);
      specparam TDVSEH  = (65.1:97.8:160.2);
      specparam TDVSS   = (19.0:25.9:40.0);
      specparam TDVSH   = (65.1:97.8:160.2);

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
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[8], TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[8], TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[9], TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[9], TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[10], TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[10], TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[11], TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[11], TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[12], TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[12], TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[13], TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[13], TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[14], TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[14], TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[15], TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[15], TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[16], TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[16], TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[17], TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[17], TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[18], TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[18], TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[19], TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[19], TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[20], TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[20], TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[21], TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[21], TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[22], TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[22], TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[23], TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[23], TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[24], TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[24], TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[25], TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[25], TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[26], TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[26], TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[27], TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[27], TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[28], TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[28], TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[29], TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[29], TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[30], TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[30], TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI[31], TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI[31], TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[32], TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[32], TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[33], TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[33], TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[34], TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[34], TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[35], TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[35], TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[36], TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[36], TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[37], TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[37], TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[38], TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[38], TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[39], TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[39], TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[40], TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[40], TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[41], TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[41], TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[42], TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[42], TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[43], TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[43], TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[44], TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[44], TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[45], TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[45], TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[46], TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[46], TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[47], TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[47], TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[48], TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[48], TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[49], TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[49], TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[50], TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[50], TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[51], TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[51], TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[52], TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[52], TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[53], TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[53], TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[54], TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[54], TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[55], TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[55], TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[56], TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[56], TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[57], TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[57], TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[58], TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[58], TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[59], TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[59], TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[60], TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[60], TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[61], TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[61], TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[62], TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[62], TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI[63], TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI[63], TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[64], TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[64], TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[65], TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[65], TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[66], TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[66], TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[67], TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[67], TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[68], TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[68], TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[69], TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[69], TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[70], TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[70], TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[71], TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[71], TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[72], TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[72], TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[73], TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[73], TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[74], TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[74], TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[75], TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[75], TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[76], TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[76], TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[77], TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[77], TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[78], TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[78], TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[79], TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[79], TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[80], TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[80], TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[81], TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[81], TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[82], TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[82], TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[83], TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[83], TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[84], TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[84], TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[85], TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[85], TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[86], TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[86], TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[87], TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[87], TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[88], TDS,     TDH,     n_flag_DI88    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[88], TDS,     TDH,     n_flag_DI88    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[89], TDS,     TDH,     n_flag_DI89    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[89], TDS,     TDH,     n_flag_DI89    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[90], TDS,     TDH,     n_flag_DI90    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[90], TDS,     TDH,     n_flag_DI90    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[91], TDS,     TDH,     n_flag_DI91    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[91], TDS,     TDH,     n_flag_DI91    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[92], TDS,     TDH,     n_flag_DI92    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[92], TDS,     TDH,     n_flag_DI92    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[93], TDS,     TDH,     n_flag_DI93    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[93], TDS,     TDH,     n_flag_DI93    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[94], TDS,     TDH,     n_flag_DI94    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[94], TDS,     TDH,     n_flag_DI94    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI[95], TDS,     TDH,     n_flag_DI95    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI[95], TDS,     TDH,     n_flag_DI95    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[96], TDS,     TDH,     n_flag_DI96    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[96], TDS,     TDH,     n_flag_DI96    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[97], TDS,     TDH,     n_flag_DI97    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[97], TDS,     TDH,     n_flag_DI97    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[98], TDS,     TDH,     n_flag_DI98    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[98], TDS,     TDH,     n_flag_DI98    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[99], TDS,     TDH,     n_flag_DI99    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[99], TDS,     TDH,     n_flag_DI99    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[100], TDS,     TDH,     n_flag_DI100   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[100], TDS,     TDH,     n_flag_DI100   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[101], TDS,     TDH,     n_flag_DI101   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[101], TDS,     TDH,     n_flag_DI101   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[102], TDS,     TDH,     n_flag_DI102   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[102], TDS,     TDH,     n_flag_DI102   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[103], TDS,     TDH,     n_flag_DI103   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[103], TDS,     TDH,     n_flag_DI103   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[104], TDS,     TDH,     n_flag_DI104   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[104], TDS,     TDH,     n_flag_DI104   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[105], TDS,     TDH,     n_flag_DI105   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[105], TDS,     TDH,     n_flag_DI105   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[106], TDS,     TDH,     n_flag_DI106   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[106], TDS,     TDH,     n_flag_DI106   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[107], TDS,     TDH,     n_flag_DI107   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[107], TDS,     TDH,     n_flag_DI107   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[108], TDS,     TDH,     n_flag_DI108   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[108], TDS,     TDH,     n_flag_DI108   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[109], TDS,     TDH,     n_flag_DI109   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[109], TDS,     TDH,     n_flag_DI109   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[110], TDS,     TDH,     n_flag_DI110   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[110], TDS,     TDH,     n_flag_DI110   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[111], TDS,     TDH,     n_flag_DI111   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[111], TDS,     TDH,     n_flag_DI111   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[112], TDS,     TDH,     n_flag_DI112   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[112], TDS,     TDH,     n_flag_DI112   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[113], TDS,     TDH,     n_flag_DI113   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[113], TDS,     TDH,     n_flag_DI113   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[114], TDS,     TDH,     n_flag_DI114   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[114], TDS,     TDH,     n_flag_DI114   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[115], TDS,     TDH,     n_flag_DI115   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[115], TDS,     TDH,     n_flag_DI115   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[116], TDS,     TDH,     n_flag_DI116   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[116], TDS,     TDH,     n_flag_DI116   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[117], TDS,     TDH,     n_flag_DI117   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[117], TDS,     TDH,     n_flag_DI117   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[118], TDS,     TDH,     n_flag_DI118   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[118], TDS,     TDH,     n_flag_DI118   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[119], TDS,     TDH,     n_flag_DI119   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[119], TDS,     TDH,     n_flag_DI119   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[120], TDS,     TDH,     n_flag_DI120   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[120], TDS,     TDH,     n_flag_DI120   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[121], TDS,     TDH,     n_flag_DI121   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[121], TDS,     TDH,     n_flag_DI121   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[122], TDS,     TDH,     n_flag_DI122   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[122], TDS,     TDH,     n_flag_DI122   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[123], TDS,     TDH,     n_flag_DI123   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[123], TDS,     TDH,     n_flag_DI123   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[124], TDS,     TDH,     n_flag_DI124   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[124], TDS,     TDH,     n_flag_DI124   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[125], TDS,     TDH,     n_flag_DI125   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[125], TDS,     TDH,     n_flag_DI125   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[126], TDS,     TDH,     n_flag_DI126   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[126], TDS,     TDH,     n_flag_DI126   );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI[127], TDS,     TDH,     n_flag_DI127   );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI[127], TDS,     TDH,     n_flag_DI127   );
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
      $period    ( posedge CK &&& ck_per8,        TRC_8,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per10,       TRC_10,                    n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per12,       TRC_12,                    n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per14,       TRC_14,                    n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );

      $setuphold ( posedge CK,                    posedge NAP &&& con_CK_NAP, 0,       TNAPH,   n_flag_NAP     );
      $setuphold ( negedge NAP &&& con_NAP,       negedge CSB, 0,       TNAP_CSH, n_flag_NAP_CSB );

      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[0] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[1] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[2] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[3] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[4] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[5] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[6] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[7] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[8] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[9] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[10] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[11] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[12] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[13] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[14] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[15] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[16] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[17] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[18] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[19] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[20] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[21] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[22] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[23] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[24] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[25] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[26] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[27] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[28] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[29] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[30] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvse && read0)  (posedge CK => (DO[31] :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[0] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[1] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[2] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[3] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[4] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[5] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[6] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[7] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[8] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[9] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[10] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[11] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[12] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[13] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[14] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[15] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[16] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[17] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[18] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[19] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[20] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[21] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[22] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[23] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[24] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[25] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[26] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[27] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[28] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[29] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[30] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs8 && read0)  (posedge CK => (DO[31] :1'bx)) = TAA_8;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[0] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[1] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[2] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[3] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[4] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[5] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[6] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[7] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[8] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[9] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[10] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[11] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[12] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[13] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[14] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[15] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[16] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[17] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[18] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[19] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[20] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[21] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[22] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[23] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[24] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[25] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[26] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[27] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[28] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[29] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[30] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs10 && read0)  (posedge CK => (DO[31] :1'bx)) = TAA_10;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[0] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[1] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[2] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[3] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[4] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[5] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[6] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[7] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[8] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[9] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[10] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[11] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[12] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[13] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[14] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[15] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[16] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[17] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[18] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[19] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[20] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[21] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[22] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[23] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[24] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[25] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[26] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[27] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[28] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[29] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[30] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs12 && read0)  (posedge CK => (DO[31] :1'bx)) = TAA_12;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[0] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[1] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[2] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[3] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[4] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[5] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[6] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[7] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[8] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[9] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[10] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[11] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[12] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[13] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[14] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[15] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[16] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[17] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[18] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[19] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[20] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[21] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[22] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[23] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[24] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[25] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[26] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[27] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[28] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[29] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[30] :1'bx)) = TAA_14;
      if (NODELAY0 == 0 && con_dvs14 && read0)  (posedge CK => (DO[31] :1'bx)) = TAA_14;

      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[32] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[33] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[34] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[35] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[36] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[37] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[38] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[39] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[40] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[41] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[42] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[43] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[44] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[45] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[46] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[47] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[48] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[49] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[50] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[51] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[52] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[53] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[54] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[55] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[56] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[57] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[58] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[59] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[60] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[61] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[62] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvse && read1)  (posedge CK => (DO[63] :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[32] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[33] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[34] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[35] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[36] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[37] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[38] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[39] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[40] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[41] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[42] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[43] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[44] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[45] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[46] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[47] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[48] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[49] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[50] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[51] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[52] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[53] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[54] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[55] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[56] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[57] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[58] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[59] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[60] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[61] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[62] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs8 && read1)  (posedge CK => (DO[63] :1'bx)) = TAA_8;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[32] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[33] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[34] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[35] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[36] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[37] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[38] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[39] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[40] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[41] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[42] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[43] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[44] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[45] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[46] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[47] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[48] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[49] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[50] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[51] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[52] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[53] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[54] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[55] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[56] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[57] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[58] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[59] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[60] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[61] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[62] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs10 && read1)  (posedge CK => (DO[63] :1'bx)) = TAA_10;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[32] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[33] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[34] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[35] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[36] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[37] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[38] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[39] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[40] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[41] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[42] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[43] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[44] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[45] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[46] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[47] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[48] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[49] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[50] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[51] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[52] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[53] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[54] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[55] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[56] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[57] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[58] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[59] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[60] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[61] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[62] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs12 && read1)  (posedge CK => (DO[63] :1'bx)) = TAA_12;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[32] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[33] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[34] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[35] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[36] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[37] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[38] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[39] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[40] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[41] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[42] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[43] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[44] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[45] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[46] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[47] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[48] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[49] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[50] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[51] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[52] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[53] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[54] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[55] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[56] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[57] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[58] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[59] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[60] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[61] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[62] :1'bx)) = TAA_14;
      if (NODELAY1 == 0 && con_dvs14 && read1)  (posedge CK => (DO[63] :1'bx)) = TAA_14;

      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[64] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[65] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[66] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[67] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[68] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[69] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[70] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[71] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[72] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[73] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[74] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[75] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[76] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[77] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[78] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[79] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[80] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[81] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[82] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[83] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[84] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[85] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[86] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[87] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[88] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[89] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[90] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[91] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[92] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[93] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[94] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvse && read2)  (posedge CK => (DO[95] :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[64] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[65] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[66] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[67] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[68] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[69] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[70] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[71] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[72] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[73] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[74] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[75] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[76] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[77] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[78] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[79] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[80] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[81] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[82] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[83] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[84] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[85] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[86] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[87] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[88] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[89] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[90] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[91] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[92] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[93] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[94] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs8 && read2)  (posedge CK => (DO[95] :1'bx)) = TAA_8;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[64] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[65] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[66] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[67] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[68] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[69] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[70] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[71] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[72] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[73] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[74] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[75] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[76] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[77] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[78] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[79] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[80] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[81] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[82] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[83] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[84] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[85] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[86] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[87] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[88] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[89] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[90] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[91] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[92] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[93] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[94] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs10 && read2)  (posedge CK => (DO[95] :1'bx)) = TAA_10;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[64] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[65] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[66] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[67] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[68] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[69] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[70] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[71] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[72] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[73] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[74] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[75] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[76] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[77] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[78] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[79] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[80] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[81] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[82] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[83] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[84] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[85] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[86] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[87] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[88] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[89] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[90] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[91] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[92] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[93] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[94] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs12 && read2)  (posedge CK => (DO[95] :1'bx)) = TAA_12;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[64] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[65] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[66] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[67] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[68] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[69] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[70] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[71] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[72] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[73] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[74] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[75] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[76] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[77] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[78] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[79] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[80] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[81] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[82] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[83] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[84] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[85] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[86] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[87] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[88] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[89] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[90] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[91] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[92] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[93] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[94] :1'bx)) = TAA_14;
      if (NODELAY2 == 0 && con_dvs14 && read2)  (posedge CK => (DO[95] :1'bx)) = TAA_14;

      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[96] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[97] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[98] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[99] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[100] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[101] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[102] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[103] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[104] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[105] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[106] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[107] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[108] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[109] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[110] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[111] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[112] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[113] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[114] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[115] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[116] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[117] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[118] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[119] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[120] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[121] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[122] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[123] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[124] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[125] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[126] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvse && read3)  (posedge CK => (DO[127] :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[96] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[97] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[98] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[99] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[100] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[101] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[102] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[103] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[104] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[105] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[106] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[107] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[108] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[109] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[110] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[111] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[112] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[113] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[114] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[115] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[116] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[117] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[118] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[119] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[120] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[121] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[122] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[123] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[124] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[125] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[126] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs8 && read3)  (posedge CK => (DO[127] :1'bx)) = TAA_8;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[96] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[97] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[98] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[99] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[100] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[101] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[102] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[103] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[104] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[105] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[106] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[107] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[108] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[109] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[110] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[111] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[112] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[113] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[114] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[115] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[116] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[117] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[118] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[119] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[120] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[121] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[122] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[123] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[124] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[125] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[126] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs10 && read3)  (posedge CK => (DO[127] :1'bx)) = TAA_10;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[96] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[97] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[98] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[99] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[100] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[101] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[102] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[103] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[104] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[105] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[106] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[107] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[108] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[109] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[110] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[111] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[112] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[113] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[114] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[115] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[116] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[117] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[118] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[119] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[120] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[121] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[122] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[123] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[124] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[125] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[126] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs12 && read3)  (posedge CK => (DO[127] :1'bx)) = TAA_12;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[96] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[97] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[98] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[99] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[100] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[101] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[102] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[103] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[104] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[105] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[106] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[107] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[108] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[109] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[110] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[111] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[112] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[113] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[114] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[115] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[116] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[117] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[118] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[119] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[120] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[121] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[122] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[123] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[124] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[125] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[126] :1'bx)) = TAA_14;
      if (NODELAY3 == 0 && con_dvs14 && read3)  (posedge CK => (DO[127] :1'bx)) = TAA_14;


      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[8] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[9] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[10] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[11] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[12] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[13] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[14] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[15] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[16] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[17] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[18] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[19] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[20] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[21] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[22] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[23] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[24] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[25] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[26] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[27] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[28] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[29] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[30] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvse && write0)  (posedge CK => (DO[31] :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[8] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[9] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[10] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[11] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[12] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[13] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[14] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[15] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[16] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[17] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[18] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[19] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[20] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[21] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[22] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[23] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[24] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[25] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[26] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[27] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[28] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[29] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[30] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs8 && write0)  (posedge CK => (DO[31] :1'bx)) = TWDV_8;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[8] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[9] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[10] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[11] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[12] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[13] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[14] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[15] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[16] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[17] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[18] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[19] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[20] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[21] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[22] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[23] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[24] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[25] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[26] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[27] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[28] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[29] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[30] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs10 && write0)  (posedge CK => (DO[31] :1'bx)) = TWDV_10;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[8] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[9] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[10] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[11] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[12] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[13] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[14] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[15] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[16] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[17] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[18] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[19] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[20] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[21] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[22] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[23] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[24] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[25] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[26] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[27] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[28] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[29] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[30] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs12 && write0)  (posedge CK => (DO[31] :1'bx)) = TWDV_12;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[0] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[1] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[2] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[3] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[4] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[5] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[6] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[7] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[8] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[9] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[10] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[11] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[12] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[13] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[14] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[15] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[16] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[17] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[18] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[19] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[20] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[21] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[22] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[23] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[24] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[25] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[26] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[27] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[28] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[29] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[30] :1'bx)) = TWDV_14;
      if (NODELAY0 == 0 && con_dvs14 && write0)  (posedge CK => (DO[31] :1'bx)) = TWDV_14;

      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[32] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[33] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[34] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[35] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[36] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[37] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[38] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[39] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[40] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[41] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[42] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[43] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[44] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[45] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[46] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[47] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[48] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[49] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[50] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[51] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[52] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[53] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[54] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[55] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[56] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[57] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[58] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[59] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[60] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[61] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[62] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvse && write1)  (posedge CK => (DO[63] :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[32] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[33] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[34] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[35] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[36] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[37] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[38] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[39] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[40] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[41] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[42] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[43] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[44] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[45] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[46] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[47] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[48] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[49] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[50] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[51] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[52] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[53] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[54] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[55] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[56] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[57] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[58] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[59] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[60] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[61] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[62] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs8 && write1)  (posedge CK => (DO[63] :1'bx)) = TWDV_8;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[32] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[33] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[34] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[35] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[36] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[37] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[38] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[39] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[40] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[41] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[42] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[43] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[44] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[45] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[46] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[47] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[48] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[49] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[50] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[51] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[52] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[53] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[54] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[55] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[56] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[57] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[58] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[59] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[60] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[61] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[62] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs10 && write1)  (posedge CK => (DO[63] :1'bx)) = TWDV_10;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[32] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[33] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[34] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[35] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[36] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[37] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[38] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[39] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[40] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[41] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[42] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[43] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[44] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[45] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[46] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[47] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[48] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[49] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[50] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[51] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[52] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[53] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[54] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[55] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[56] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[57] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[58] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[59] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[60] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[61] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[62] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs12 && write1)  (posedge CK => (DO[63] :1'bx)) = TWDV_12;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[32] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[33] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[34] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[35] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[36] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[37] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[38] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[39] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[40] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[41] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[42] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[43] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[44] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[45] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[46] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[47] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[48] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[49] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[50] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[51] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[52] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[53] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[54] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[55] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[56] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[57] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[58] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[59] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[60] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[61] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[62] :1'bx)) = TWDV_14;
      if (NODELAY1 == 0 && con_dvs14 && write1)  (posedge CK => (DO[63] :1'bx)) = TWDV_14;

      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[64] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[65] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[66] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[67] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[68] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[69] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[70] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[71] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[72] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[73] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[74] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[75] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[76] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[77] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[78] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[79] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[80] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[81] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[82] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[83] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[84] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[85] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[86] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[87] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[88] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[89] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[90] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[91] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[92] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[93] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[94] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvse && write2)  (posedge CK => (DO[95] :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[64] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[65] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[66] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[67] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[68] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[69] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[70] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[71] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[72] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[73] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[74] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[75] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[76] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[77] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[78] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[79] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[80] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[81] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[82] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[83] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[84] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[85] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[86] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[87] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[88] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[89] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[90] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[91] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[92] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[93] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[94] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs8 && write2)  (posedge CK => (DO[95] :1'bx)) = TWDV_8;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[64] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[65] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[66] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[67] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[68] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[69] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[70] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[71] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[72] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[73] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[74] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[75] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[76] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[77] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[78] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[79] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[80] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[81] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[82] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[83] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[84] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[85] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[86] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[87] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[88] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[89] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[90] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[91] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[92] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[93] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[94] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs10 && write2)  (posedge CK => (DO[95] :1'bx)) = TWDV_10;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[64] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[65] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[66] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[67] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[68] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[69] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[70] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[71] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[72] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[73] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[74] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[75] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[76] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[77] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[78] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[79] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[80] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[81] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[82] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[83] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[84] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[85] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[86] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[87] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[88] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[89] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[90] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[91] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[92] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[93] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[94] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs12 && write2)  (posedge CK => (DO[95] :1'bx)) = TWDV_12;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[64] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[65] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[66] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[67] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[68] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[69] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[70] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[71] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[72] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[73] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[74] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[75] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[76] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[77] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[78] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[79] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[80] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[81] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[82] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[83] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[84] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[85] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[86] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[87] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[88] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[89] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[90] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[91] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[92] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[93] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[94] :1'bx)) = TWDV_14;
      if (NODELAY2 == 0 && con_dvs14 && write2)  (posedge CK => (DO[95] :1'bx)) = TWDV_14;

      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[96] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[97] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[98] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[99] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[100] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[101] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[102] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[103] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[104] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[105] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[106] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[107] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[108] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[109] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[110] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[111] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[112] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[113] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[114] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[115] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[116] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[117] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[118] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[119] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[120] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[121] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[122] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[123] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[124] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[125] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[126] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvse && write3)  (posedge CK => (DO[127] :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[96] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[97] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[98] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[99] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[100] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[101] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[102] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[103] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[104] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[105] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[106] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[107] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[108] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[109] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[110] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[111] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[112] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[113] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[114] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[115] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[116] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[117] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[118] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[119] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[120] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[121] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[122] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[123] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[124] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[125] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[126] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs8 && write3)  (posedge CK => (DO[127] :1'bx)) = TWDV_8;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[96] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[97] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[98] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[99] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[100] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[101] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[102] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[103] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[104] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[105] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[106] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[107] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[108] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[109] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[110] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[111] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[112] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[113] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[114] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[115] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[116] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[117] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[118] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[119] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[120] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[121] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[122] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[123] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[124] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[125] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[126] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs10 && write3)  (posedge CK => (DO[127] :1'bx)) = TWDV_10;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[96] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[97] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[98] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[99] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[100] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[101] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[102] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[103] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[104] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[105] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[106] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[107] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[108] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[109] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[110] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[111] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[112] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[113] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[114] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[115] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[116] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[117] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[118] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[119] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[120] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[121] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[122] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[123] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[124] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[125] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[126] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs12 && write3)  (posedge CK => (DO[127] :1'bx)) = TWDV_12;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[96] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[97] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[98] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[99] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[100] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[101] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[102] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[103] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[104] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[105] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[106] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[107] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[108] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[109] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[110] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[111] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[112] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[113] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[114] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[115] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[116] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[117] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[118] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[119] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[120] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[121] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[122] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[123] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[124] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[125] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[126] :1'bx)) = TWDV_14;
      if (NODELAY3 == 0 && con_dvs14 && write3)  (posedge CK => (DO[127] :1'bx)) = TWDV_14;


      if (NAPREG == 1)  (posedge NAP => (DO[0] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[1] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[2] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[3] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[4] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[5] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[6] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[7] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[8] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[9] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[10] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[11] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[12] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[13] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[14] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[15] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[16] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[17] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[18] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[19] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[20] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[21] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[22] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[23] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[24] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[25] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[26] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[27] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[28] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[29] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[30] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[31] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[32] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[33] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[34] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[35] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[36] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[37] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[38] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[39] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[40] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[41] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[42] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[43] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[44] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[45] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[46] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[47] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[48] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[49] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[50] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[51] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[52] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[53] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[54] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[55] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[56] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[57] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[58] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[59] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[60] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[61] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[62] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[63] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[64] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[65] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[66] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[67] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[68] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[69] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[70] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[71] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[72] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[73] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[74] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[75] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[76] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[77] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[78] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[79] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[80] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[81] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[82] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[83] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[84] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[85] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[86] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[87] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[88] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[89] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[90] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[91] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[92] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[93] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[94] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[95] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[96] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[97] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[98] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[99] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[100] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[101] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[102] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[103] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[104] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[105] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[106] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[107] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[108] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[109] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[110] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[111] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[112] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[113] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[114] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[115] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[116] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[117] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[118] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[119] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[120] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[121] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[122] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[123] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[124] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[125] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[126] :1'bx)) = 0    ;
      if (NAPREG == 1)  (posedge NAP => (DO[127] :1'bx)) = 0    ;



   endspecify

`endprotect
endmodule
