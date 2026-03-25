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
       Word               :  16                              
       Bit                :  272                             
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
       Date               :  2024/11/21 08:55:30             
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


module SZLVTLB40_16X272X1CM1b1 (A,B,DO,DI,CKA,CKB,CSAN,DVSE,DVS,WEB,CSBN,NAP);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 4;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 272;              
  parameter  Words                = 16;               
  parameter  Bytes                = 1;                
  parameter  AspectRatio          = 1;                
  parameter  Tr2w                 = (52.1:75.1:137.5);
  parameter  Tw2r                 = (60.7:92.0:180.8);
  parameter  TOH                  = (42.3:63.7:108.8);
  parameter  TOH_2                = (43.3:65.2:112.2);
  parameter  TOH_3                = (42.3:63.7:108.8);
  parameter  TOH_4                = (41.2:61.9:105.1);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (60.7:92.0:166.6);
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
  reg                             n_flag_B0;          
  reg                             n_flag_B1;          
  reg                             n_flag_B2;          
  reg                             n_flag_B3;          
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
  reg                             n_flag_DI128;       
  reg                             n_flag_DI129;       
  reg                             n_flag_DI130;       
  reg                             n_flag_DI131;       
  reg                             n_flag_DI132;       
  reg                             n_flag_DI133;       
  reg                             n_flag_DI134;       
  reg                             n_flag_DI135;       
  reg                             n_flag_DI136;       
  reg                             n_flag_DI137;       
  reg                             n_flag_DI138;       
  reg                             n_flag_DI139;       
  reg                             n_flag_DI140;       
  reg                             n_flag_DI141;       
  reg                             n_flag_DI142;       
  reg                             n_flag_DI143;       
  reg                             n_flag_DI144;       
  reg                             n_flag_DI145;       
  reg                             n_flag_DI146;       
  reg                             n_flag_DI147;       
  reg                             n_flag_DI148;       
  reg                             n_flag_DI149;       
  reg                             n_flag_DI150;       
  reg                             n_flag_DI151;       
  reg                             n_flag_DI152;       
  reg                             n_flag_DI153;       
  reg                             n_flag_DI154;       
  reg                             n_flag_DI155;       
  reg                             n_flag_DI156;       
  reg                             n_flag_DI157;       
  reg                             n_flag_DI158;       
  reg                             n_flag_DI159;       
  reg                             n_flag_DI160;       
  reg                             n_flag_DI161;       
  reg                             n_flag_DI162;       
  reg                             n_flag_DI163;       
  reg                             n_flag_DI164;       
  reg                             n_flag_DI165;       
  reg                             n_flag_DI166;       
  reg                             n_flag_DI167;       
  reg                             n_flag_DI168;       
  reg                             n_flag_DI169;       
  reg                             n_flag_DI170;       
  reg                             n_flag_DI171;       
  reg                             n_flag_DI172;       
  reg                             n_flag_DI173;       
  reg                             n_flag_DI174;       
  reg                             n_flag_DI175;       
  reg                             n_flag_DI176;       
  reg                             n_flag_DI177;       
  reg                             n_flag_DI178;       
  reg                             n_flag_DI179;       
  reg                             n_flag_DI180;       
  reg                             n_flag_DI181;       
  reg                             n_flag_DI182;       
  reg                             n_flag_DI183;       
  reg                             n_flag_DI184;       
  reg                             n_flag_DI185;       
  reg                             n_flag_DI186;       
  reg                             n_flag_DI187;       
  reg                             n_flag_DI188;       
  reg                             n_flag_DI189;       
  reg                             n_flag_DI190;       
  reg                             n_flag_DI191;       
  reg                             n_flag_DI192;       
  reg                             n_flag_DI193;       
  reg                             n_flag_DI194;       
  reg                             n_flag_DI195;       
  reg                             n_flag_DI196;       
  reg                             n_flag_DI197;       
  reg                             n_flag_DI198;       
  reg                             n_flag_DI199;       
  reg                             n_flag_DI200;       
  reg                             n_flag_DI201;       
  reg                             n_flag_DI202;       
  reg                             n_flag_DI203;       
  reg                             n_flag_DI204;       
  reg                             n_flag_DI205;       
  reg                             n_flag_DI206;       
  reg                             n_flag_DI207;       
  reg                             n_flag_DI208;       
  reg                             n_flag_DI209;       
  reg                             n_flag_DI210;       
  reg                             n_flag_DI211;       
  reg                             n_flag_DI212;       
  reg                             n_flag_DI213;       
  reg                             n_flag_DI214;       
  reg                             n_flag_DI215;       
  reg                             n_flag_DI216;       
  reg                             n_flag_DI217;       
  reg                             n_flag_DI218;       
  reg                             n_flag_DI219;       
  reg                             n_flag_DI220;       
  reg                             n_flag_DI221;       
  reg                             n_flag_DI222;       
  reg                             n_flag_DI223;       
  reg                             n_flag_DI224;       
  reg                             n_flag_DI225;       
  reg                             n_flag_DI226;       
  reg                             n_flag_DI227;       
  reg                             n_flag_DI228;       
  reg                             n_flag_DI229;       
  reg                             n_flag_DI230;       
  reg                             n_flag_DI231;       
  reg                             n_flag_DI232;       
  reg                             n_flag_DI233;       
  reg                             n_flag_DI234;       
  reg                             n_flag_DI235;       
  reg                             n_flag_DI236;       
  reg                             n_flag_DI237;       
  reg                             n_flag_DI238;       
  reg                             n_flag_DI239;       
  reg                             n_flag_DI240;       
  reg                             n_flag_DI241;       
  reg                             n_flag_DI242;       
  reg                             n_flag_DI243;       
  reg                             n_flag_DI244;       
  reg                             n_flag_DI245;       
  reg                             n_flag_DI246;       
  reg                             n_flag_DI247;       
  reg                             n_flag_DI248;       
  reg                             n_flag_DI249;       
  reg                             n_flag_DI250;       
  reg                             n_flag_DI251;       
  reg                             n_flag_DI252;       
  reg                             n_flag_DI253;       
  reg                             n_flag_DI254;       
  reg                             n_flag_DI255;       
  reg                             n_flag_DI256;       
  reg                             n_flag_DI257;       
  reg                             n_flag_DI258;       
  reg                             n_flag_DI259;       
  reg                             n_flag_DI260;       
  reg                             n_flag_DI261;       
  reg                             n_flag_DI262;       
  reg                             n_flag_DI263;       
  reg                             n_flag_DI264;       
  reg                             n_flag_DI265;       
  reg                             n_flag_DI266;       
  reg                             n_flag_DI267;       
  reg                             n_flag_DI268;       
  reg                             n_flag_DI269;       
  reg                             n_flag_DI270;       
  reg                             n_flag_DI271;       
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
  buf        ido128          (DO[128], DO_[128]);          
  buf        ido129          (DO[129], DO_[129]);          
  buf        ido130          (DO[130], DO_[130]);          
  buf        ido131          (DO[131], DO_[131]);          
  buf        ido132          (DO[132], DO_[132]);          
  buf        ido133          (DO[133], DO_[133]);          
  buf        ido134          (DO[134], DO_[134]);          
  buf        ido135          (DO[135], DO_[135]);          
  buf        ido136          (DO[136], DO_[136]);          
  buf        ido137          (DO[137], DO_[137]);          
  buf        ido138          (DO[138], DO_[138]);          
  buf        ido139          (DO[139], DO_[139]);          
  buf        ido140          (DO[140], DO_[140]);          
  buf        ido141          (DO[141], DO_[141]);          
  buf        ido142          (DO[142], DO_[142]);          
  buf        ido143          (DO[143], DO_[143]);          
  buf        ido144          (DO[144], DO_[144]);          
  buf        ido145          (DO[145], DO_[145]);          
  buf        ido146          (DO[146], DO_[146]);          
  buf        ido147          (DO[147], DO_[147]);          
  buf        ido148          (DO[148], DO_[148]);          
  buf        ido149          (DO[149], DO_[149]);          
  buf        ido150          (DO[150], DO_[150]);          
  buf        ido151          (DO[151], DO_[151]);          
  buf        ido152          (DO[152], DO_[152]);          
  buf        ido153          (DO[153], DO_[153]);          
  buf        ido154          (DO[154], DO_[154]);          
  buf        ido155          (DO[155], DO_[155]);          
  buf        ido156          (DO[156], DO_[156]);          
  buf        ido157          (DO[157], DO_[157]);          
  buf        ido158          (DO[158], DO_[158]);          
  buf        ido159          (DO[159], DO_[159]);          
  buf        ido160          (DO[160], DO_[160]);          
  buf        ido161          (DO[161], DO_[161]);          
  buf        ido162          (DO[162], DO_[162]);          
  buf        ido163          (DO[163], DO_[163]);          
  buf        ido164          (DO[164], DO_[164]);          
  buf        ido165          (DO[165], DO_[165]);          
  buf        ido166          (DO[166], DO_[166]);          
  buf        ido167          (DO[167], DO_[167]);          
  buf        ido168          (DO[168], DO_[168]);          
  buf        ido169          (DO[169], DO_[169]);          
  buf        ido170          (DO[170], DO_[170]);          
  buf        ido171          (DO[171], DO_[171]);          
  buf        ido172          (DO[172], DO_[172]);          
  buf        ido173          (DO[173], DO_[173]);          
  buf        ido174          (DO[174], DO_[174]);          
  buf        ido175          (DO[175], DO_[175]);          
  buf        ido176          (DO[176], DO_[176]);          
  buf        ido177          (DO[177], DO_[177]);          
  buf        ido178          (DO[178], DO_[178]);          
  buf        ido179          (DO[179], DO_[179]);          
  buf        ido180          (DO[180], DO_[180]);          
  buf        ido181          (DO[181], DO_[181]);          
  buf        ido182          (DO[182], DO_[182]);          
  buf        ido183          (DO[183], DO_[183]);          
  buf        ido184          (DO[184], DO_[184]);          
  buf        ido185          (DO[185], DO_[185]);          
  buf        ido186          (DO[186], DO_[186]);          
  buf        ido187          (DO[187], DO_[187]);          
  buf        ido188          (DO[188], DO_[188]);          
  buf        ido189          (DO[189], DO_[189]);          
  buf        ido190          (DO[190], DO_[190]);          
  buf        ido191          (DO[191], DO_[191]);          
  buf        ido192          (DO[192], DO_[192]);          
  buf        ido193          (DO[193], DO_[193]);          
  buf        ido194          (DO[194], DO_[194]);          
  buf        ido195          (DO[195], DO_[195]);          
  buf        ido196          (DO[196], DO_[196]);          
  buf        ido197          (DO[197], DO_[197]);          
  buf        ido198          (DO[198], DO_[198]);          
  buf        ido199          (DO[199], DO_[199]);          
  buf        ido200          (DO[200], DO_[200]);          
  buf        ido201          (DO[201], DO_[201]);          
  buf        ido202          (DO[202], DO_[202]);          
  buf        ido203          (DO[203], DO_[203]);          
  buf        ido204          (DO[204], DO_[204]);          
  buf        ido205          (DO[205], DO_[205]);          
  buf        ido206          (DO[206], DO_[206]);          
  buf        ido207          (DO[207], DO_[207]);          
  buf        ido208          (DO[208], DO_[208]);          
  buf        ido209          (DO[209], DO_[209]);          
  buf        ido210          (DO[210], DO_[210]);          
  buf        ido211          (DO[211], DO_[211]);          
  buf        ido212          (DO[212], DO_[212]);          
  buf        ido213          (DO[213], DO_[213]);          
  buf        ido214          (DO[214], DO_[214]);          
  buf        ido215          (DO[215], DO_[215]);          
  buf        ido216          (DO[216], DO_[216]);          
  buf        ido217          (DO[217], DO_[217]);          
  buf        ido218          (DO[218], DO_[218]);          
  buf        ido219          (DO[219], DO_[219]);          
  buf        ido220          (DO[220], DO_[220]);          
  buf        ido221          (DO[221], DO_[221]);          
  buf        ido222          (DO[222], DO_[222]);          
  buf        ido223          (DO[223], DO_[223]);          
  buf        ido224          (DO[224], DO_[224]);          
  buf        ido225          (DO[225], DO_[225]);          
  buf        ido226          (DO[226], DO_[226]);          
  buf        ido227          (DO[227], DO_[227]);          
  buf        ido228          (DO[228], DO_[228]);          
  buf        ido229          (DO[229], DO_[229]);          
  buf        ido230          (DO[230], DO_[230]);          
  buf        ido231          (DO[231], DO_[231]);          
  buf        ido232          (DO[232], DO_[232]);          
  buf        ido233          (DO[233], DO_[233]);          
  buf        ido234          (DO[234], DO_[234]);          
  buf        ido235          (DO[235], DO_[235]);          
  buf        ido236          (DO[236], DO_[236]);          
  buf        ido237          (DO[237], DO_[237]);          
  buf        ido238          (DO[238], DO_[238]);          
  buf        ido239          (DO[239], DO_[239]);          
  buf        ido240          (DO[240], DO_[240]);          
  buf        ido241          (DO[241], DO_[241]);          
  buf        ido242          (DO[242], DO_[242]);          
  buf        ido243          (DO[243], DO_[243]);          
  buf        ido244          (DO[244], DO_[244]);          
  buf        ido245          (DO[245], DO_[245]);          
  buf        ido246          (DO[246], DO_[246]);          
  buf        ido247          (DO[247], DO_[247]);          
  buf        ido248          (DO[248], DO_[248]);          
  buf        ido249          (DO[249], DO_[249]);          
  buf        ido250          (DO[250], DO_[250]);          
  buf        ido251          (DO[251], DO_[251]);          
  buf        ido252          (DO[252], DO_[252]);          
  buf        ido253          (DO[253], DO_[253]);          
  buf        ido254          (DO[254], DO_[254]);          
  buf        ido255          (DO[255], DO_[255]);          
  buf        ido256          (DO[256], DO_[256]);          
  buf        ido257          (DO[257], DO_[257]);          
  buf        ido258          (DO[258], DO_[258]);          
  buf        ido259          (DO[259], DO_[259]);          
  buf        ido260          (DO[260], DO_[260]);          
  buf        ido261          (DO[261], DO_[261]);          
  buf        ido262          (DO[262], DO_[262]);          
  buf        ido263          (DO[263], DO_[263]);          
  buf        ido264          (DO[264], DO_[264]);          
  buf        ido265          (DO[265], DO_[265]);          
  buf        ido266          (DO[266], DO_[266]);          
  buf        ido267          (DO[267], DO_[267]);          
  buf        ido268          (DO[268], DO_[268]);          
  buf        ido269          (DO[269], DO_[269]);          
  buf        ido270          (DO[270], DO_[270]);          
  buf        ido271          (DO[271], DO_[271]);          
  buf        ia0             (A_[0], A[0]);                
  buf        ia1             (A_[1], A[1]);                
  buf        ia2             (A_[2], A[2]);                
  buf        ia3             (A_[3], A[3]);                
  buf        ib0             (B_[0], B[0]);                
  buf        ib1             (B_[1], B[1]);                
  buf        ib2             (B_[2], B[2]);                
  buf        ib3             (B_[3], B[3]);                
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
  buf        idi_64          (DI_[64], DI[64]);            
  buf        idi_65          (DI_[65], DI[65]);            
  buf        idi_66          (DI_[66], DI[66]);            
  buf        idi_67          (DI_[67], DI[67]);            
  buf        idi_68          (DI_[68], DI[68]);            
  buf        idi_69          (DI_[69], DI[69]);            
  buf        idi_70          (DI_[70], DI[70]);            
  buf        idi_71          (DI_[71], DI[71]);            
  buf        idi_72          (DI_[72], DI[72]);            
  buf        idi_73          (DI_[73], DI[73]);            
  buf        idi_74          (DI_[74], DI[74]);            
  buf        idi_75          (DI_[75], DI[75]);            
  buf        idi_76          (DI_[76], DI[76]);            
  buf        idi_77          (DI_[77], DI[77]);            
  buf        idi_78          (DI_[78], DI[78]);            
  buf        idi_79          (DI_[79], DI[79]);            
  buf        idi_80          (DI_[80], DI[80]);            
  buf        idi_81          (DI_[81], DI[81]);            
  buf        idi_82          (DI_[82], DI[82]);            
  buf        idi_83          (DI_[83], DI[83]);            
  buf        idi_84          (DI_[84], DI[84]);            
  buf        idi_85          (DI_[85], DI[85]);            
  buf        idi_86          (DI_[86], DI[86]);            
  buf        idi_87          (DI_[87], DI[87]);            
  buf        idi_88          (DI_[88], DI[88]);            
  buf        idi_89          (DI_[89], DI[89]);            
  buf        idi_90          (DI_[90], DI[90]);            
  buf        idi_91          (DI_[91], DI[91]);            
  buf        idi_92          (DI_[92], DI[92]);            
  buf        idi_93          (DI_[93], DI[93]);            
  buf        idi_94          (DI_[94], DI[94]);            
  buf        idi_95          (DI_[95], DI[95]);            
  buf        idi_96          (DI_[96], DI[96]);            
  buf        idi_97          (DI_[97], DI[97]);            
  buf        idi_98          (DI_[98], DI[98]);            
  buf        idi_99          (DI_[99], DI[99]);            
  buf        idi_100         (DI_[100], DI[100]);          
  buf        idi_101         (DI_[101], DI[101]);          
  buf        idi_102         (DI_[102], DI[102]);          
  buf        idi_103         (DI_[103], DI[103]);          
  buf        idi_104         (DI_[104], DI[104]);          
  buf        idi_105         (DI_[105], DI[105]);          
  buf        idi_106         (DI_[106], DI[106]);          
  buf        idi_107         (DI_[107], DI[107]);          
  buf        idi_108         (DI_[108], DI[108]);          
  buf        idi_109         (DI_[109], DI[109]);          
  buf        idi_110         (DI_[110], DI[110]);          
  buf        idi_111         (DI_[111], DI[111]);          
  buf        idi_112         (DI_[112], DI[112]);          
  buf        idi_113         (DI_[113], DI[113]);          
  buf        idi_114         (DI_[114], DI[114]);          
  buf        idi_115         (DI_[115], DI[115]);          
  buf        idi_116         (DI_[116], DI[116]);          
  buf        idi_117         (DI_[117], DI[117]);          
  buf        idi_118         (DI_[118], DI[118]);          
  buf        idi_119         (DI_[119], DI[119]);          
  buf        idi_120         (DI_[120], DI[120]);          
  buf        idi_121         (DI_[121], DI[121]);          
  buf        idi_122         (DI_[122], DI[122]);          
  buf        idi_123         (DI_[123], DI[123]);          
  buf        idi_124         (DI_[124], DI[124]);          
  buf        idi_125         (DI_[125], DI[125]);          
  buf        idi_126         (DI_[126], DI[126]);          
  buf        idi_127         (DI_[127], DI[127]);          
  buf        idi_128         (DI_[128], DI[128]);          
  buf        idi_129         (DI_[129], DI[129]);          
  buf        idi_130         (DI_[130], DI[130]);          
  buf        idi_131         (DI_[131], DI[131]);          
  buf        idi_132         (DI_[132], DI[132]);          
  buf        idi_133         (DI_[133], DI[133]);          
  buf        idi_134         (DI_[134], DI[134]);          
  buf        idi_135         (DI_[135], DI[135]);          
  buf        idi_136         (DI_[136], DI[136]);          
  buf        idi_137         (DI_[137], DI[137]);          
  buf        idi_138         (DI_[138], DI[138]);          
  buf        idi_139         (DI_[139], DI[139]);          
  buf        idi_140         (DI_[140], DI[140]);          
  buf        idi_141         (DI_[141], DI[141]);          
  buf        idi_142         (DI_[142], DI[142]);          
  buf        idi_143         (DI_[143], DI[143]);          
  buf        idi_144         (DI_[144], DI[144]);          
  buf        idi_145         (DI_[145], DI[145]);          
  buf        idi_146         (DI_[146], DI[146]);          
  buf        idi_147         (DI_[147], DI[147]);          
  buf        idi_148         (DI_[148], DI[148]);          
  buf        idi_149         (DI_[149], DI[149]);          
  buf        idi_150         (DI_[150], DI[150]);          
  buf        idi_151         (DI_[151], DI[151]);          
  buf        idi_152         (DI_[152], DI[152]);          
  buf        idi_153         (DI_[153], DI[153]);          
  buf        idi_154         (DI_[154], DI[154]);          
  buf        idi_155         (DI_[155], DI[155]);          
  buf        idi_156         (DI_[156], DI[156]);          
  buf        idi_157         (DI_[157], DI[157]);          
  buf        idi_158         (DI_[158], DI[158]);          
  buf        idi_159         (DI_[159], DI[159]);          
  buf        idi_160         (DI_[160], DI[160]);          
  buf        idi_161         (DI_[161], DI[161]);          
  buf        idi_162         (DI_[162], DI[162]);          
  buf        idi_163         (DI_[163], DI[163]);          
  buf        idi_164         (DI_[164], DI[164]);          
  buf        idi_165         (DI_[165], DI[165]);          
  buf        idi_166         (DI_[166], DI[166]);          
  buf        idi_167         (DI_[167], DI[167]);          
  buf        idi_168         (DI_[168], DI[168]);          
  buf        idi_169         (DI_[169], DI[169]);          
  buf        idi_170         (DI_[170], DI[170]);          
  buf        idi_171         (DI_[171], DI[171]);          
  buf        idi_172         (DI_[172], DI[172]);          
  buf        idi_173         (DI_[173], DI[173]);          
  buf        idi_174         (DI_[174], DI[174]);          
  buf        idi_175         (DI_[175], DI[175]);          
  buf        idi_176         (DI_[176], DI[176]);          
  buf        idi_177         (DI_[177], DI[177]);          
  buf        idi_178         (DI_[178], DI[178]);          
  buf        idi_179         (DI_[179], DI[179]);          
  buf        idi_180         (DI_[180], DI[180]);          
  buf        idi_181         (DI_[181], DI[181]);          
  buf        idi_182         (DI_[182], DI[182]);          
  buf        idi_183         (DI_[183], DI[183]);          
  buf        idi_184         (DI_[184], DI[184]);          
  buf        idi_185         (DI_[185], DI[185]);          
  buf        idi_186         (DI_[186], DI[186]);          
  buf        idi_187         (DI_[187], DI[187]);          
  buf        idi_188         (DI_[188], DI[188]);          
  buf        idi_189         (DI_[189], DI[189]);          
  buf        idi_190         (DI_[190], DI[190]);          
  buf        idi_191         (DI_[191], DI[191]);          
  buf        idi_192         (DI_[192], DI[192]);          
  buf        idi_193         (DI_[193], DI[193]);          
  buf        idi_194         (DI_[194], DI[194]);          
  buf        idi_195         (DI_[195], DI[195]);          
  buf        idi_196         (DI_[196], DI[196]);          
  buf        idi_197         (DI_[197], DI[197]);          
  buf        idi_198         (DI_[198], DI[198]);          
  buf        idi_199         (DI_[199], DI[199]);          
  buf        idi_200         (DI_[200], DI[200]);          
  buf        idi_201         (DI_[201], DI[201]);          
  buf        idi_202         (DI_[202], DI[202]);          
  buf        idi_203         (DI_[203], DI[203]);          
  buf        idi_204         (DI_[204], DI[204]);          
  buf        idi_205         (DI_[205], DI[205]);          
  buf        idi_206         (DI_[206], DI[206]);          
  buf        idi_207         (DI_[207], DI[207]);          
  buf        idi_208         (DI_[208], DI[208]);          
  buf        idi_209         (DI_[209], DI[209]);          
  buf        idi_210         (DI_[210], DI[210]);          
  buf        idi_211         (DI_[211], DI[211]);          
  buf        idi_212         (DI_[212], DI[212]);          
  buf        idi_213         (DI_[213], DI[213]);          
  buf        idi_214         (DI_[214], DI[214]);          
  buf        idi_215         (DI_[215], DI[215]);          
  buf        idi_216         (DI_[216], DI[216]);          
  buf        idi_217         (DI_[217], DI[217]);          
  buf        idi_218         (DI_[218], DI[218]);          
  buf        idi_219         (DI_[219], DI[219]);          
  buf        idi_220         (DI_[220], DI[220]);          
  buf        idi_221         (DI_[221], DI[221]);          
  buf        idi_222         (DI_[222], DI[222]);          
  buf        idi_223         (DI_[223], DI[223]);          
  buf        idi_224         (DI_[224], DI[224]);          
  buf        idi_225         (DI_[225], DI[225]);          
  buf        idi_226         (DI_[226], DI[226]);          
  buf        idi_227         (DI_[227], DI[227]);          
  buf        idi_228         (DI_[228], DI[228]);          
  buf        idi_229         (DI_[229], DI[229]);          
  buf        idi_230         (DI_[230], DI[230]);          
  buf        idi_231         (DI_[231], DI[231]);          
  buf        idi_232         (DI_[232], DI[232]);          
  buf        idi_233         (DI_[233], DI[233]);          
  buf        idi_234         (DI_[234], DI[234]);          
  buf        idi_235         (DI_[235], DI[235]);          
  buf        idi_236         (DI_[236], DI[236]);          
  buf        idi_237         (DI_[237], DI[237]);          
  buf        idi_238         (DI_[238], DI[238]);          
  buf        idi_239         (DI_[239], DI[239]);          
  buf        idi_240         (DI_[240], DI[240]);          
  buf        idi_241         (DI_[241], DI[241]);          
  buf        idi_242         (DI_[242], DI[242]);          
  buf        idi_243         (DI_[243], DI[243]);          
  buf        idi_244         (DI_[244], DI[244]);          
  buf        idi_245         (DI_[245], DI[245]);          
  buf        idi_246         (DI_[246], DI[246]);          
  buf        idi_247         (DI_[247], DI[247]);          
  buf        idi_248         (DI_[248], DI[248]);          
  buf        idi_249         (DI_[249], DI[249]);          
  buf        idi_250         (DI_[250], DI[250]);          
  buf        idi_251         (DI_[251], DI[251]);          
  buf        idi_252         (DI_[252], DI[252]);          
  buf        idi_253         (DI_[253], DI[253]);          
  buf        idi_254         (DI_[254], DI[254]);          
  buf        idi_255         (DI_[255], DI[255]);          
  buf        idi_256         (DI_[256], DI[256]);          
  buf        idi_257         (DI_[257], DI[257]);          
  buf        idi_258         (DI_[258], DI[258]);          
  buf        idi_259         (DI_[259], DI[259]);          
  buf        idi_260         (DI_[260], DI[260]);          
  buf        idi_261         (DI_[261], DI[261]);          
  buf        idi_262         (DI_[262], DI[262]);          
  buf        idi_263         (DI_[263], DI[263]);          
  buf        idi_264         (DI_[264], DI[264]);          
  buf        idi_265         (DI_[265], DI[265]);          
  buf        idi_266         (DI_[266], DI[266]);          
  buf        idi_267         (DI_[267], DI[267]);          
  buf        idi_268         (DI_[268], DI[268]);          
  buf        idi_269         (DI_[269], DI[269]);          
  buf        idi_270         (DI_[270], DI[270]);          
  buf        idi_271         (DI_[271], DI[271]);          
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
           n_flag_B0 or
           n_flag_B1 or
           n_flag_B2 or
           n_flag_B3 or
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
           n_flag_DI128 or
           n_flag_DI129 or
           n_flag_DI130 or
           n_flag_DI131 or
           n_flag_DI132 or
           n_flag_DI133 or
           n_flag_DI134 or
           n_flag_DI135 or
           n_flag_DI136 or
           n_flag_DI137 or
           n_flag_DI138 or
           n_flag_DI139 or
           n_flag_DI140 or
           n_flag_DI141 or
           n_flag_DI142 or
           n_flag_DI143 or
           n_flag_DI144 or
           n_flag_DI145 or
           n_flag_DI146 or
           n_flag_DI147 or
           n_flag_DI148 or
           n_flag_DI149 or
           n_flag_DI150 or
           n_flag_DI151 or
           n_flag_DI152 or
           n_flag_DI153 or
           n_flag_DI154 or
           n_flag_DI155 or
           n_flag_DI156 or
           n_flag_DI157 or
           n_flag_DI158 or
           n_flag_DI159 or
           n_flag_DI160 or
           n_flag_DI161 or
           n_flag_DI162 or
           n_flag_DI163 or
           n_flag_DI164 or
           n_flag_DI165 or
           n_flag_DI166 or
           n_flag_DI167 or
           n_flag_DI168 or
           n_flag_DI169 or
           n_flag_DI170 or
           n_flag_DI171 or
           n_flag_DI172 or
           n_flag_DI173 or
           n_flag_DI174 or
           n_flag_DI175 or
           n_flag_DI176 or
           n_flag_DI177 or
           n_flag_DI178 or
           n_flag_DI179 or
           n_flag_DI180 or
           n_flag_DI181 or
           n_flag_DI182 or
           n_flag_DI183 or
           n_flag_DI184 or
           n_flag_DI185 or
           n_flag_DI186 or
           n_flag_DI187 or
           n_flag_DI188 or
           n_flag_DI189 or
           n_flag_DI190 or
           n_flag_DI191 or
           n_flag_DI192 or
           n_flag_DI193 or
           n_flag_DI194 or
           n_flag_DI195 or
           n_flag_DI196 or
           n_flag_DI197 or
           n_flag_DI198 or
           n_flag_DI199 or
           n_flag_DI200 or
           n_flag_DI201 or
           n_flag_DI202 or
           n_flag_DI203 or
           n_flag_DI204 or
           n_flag_DI205 or
           n_flag_DI206 or
           n_flag_DI207 or
           n_flag_DI208 or
           n_flag_DI209 or
           n_flag_DI210 or
           n_flag_DI211 or
           n_flag_DI212 or
           n_flag_DI213 or
           n_flag_DI214 or
           n_flag_DI215 or
           n_flag_DI216 or
           n_flag_DI217 or
           n_flag_DI218 or
           n_flag_DI219 or
           n_flag_DI220 or
           n_flag_DI221 or
           n_flag_DI222 or
           n_flag_DI223 or
           n_flag_DI224 or
           n_flag_DI225 or
           n_flag_DI226 or
           n_flag_DI227 or
           n_flag_DI228 or
           n_flag_DI229 or
           n_flag_DI230 or
           n_flag_DI231 or
           n_flag_DI232 or
           n_flag_DI233 or
           n_flag_DI234 or
           n_flag_DI235 or
           n_flag_DI236 or
           n_flag_DI237 or
           n_flag_DI238 or
           n_flag_DI239 or
           n_flag_DI240 or
           n_flag_DI241 or
           n_flag_DI242 or
           n_flag_DI243 or
           n_flag_DI244 or
           n_flag_DI245 or
           n_flag_DI246 or
           n_flag_DI247 or
           n_flag_DI248 or
           n_flag_DI249 or
           n_flag_DI250 or
           n_flag_DI251 or
           n_flag_DI252 or
           n_flag_DI253 or
           n_flag_DI254 or
           n_flag_DI255 or
           n_flag_DI256 or
           n_flag_DI257 or
           n_flag_DI258 or
           n_flag_DI259 or
           n_flag_DI260 or
           n_flag_DI261 or
           n_flag_DI262 or
           n_flag_DI263 or
           n_flag_DI264 or
           n_flag_DI265 or
           n_flag_DI266 or
           n_flag_DI267 or
           n_flag_DI268 or
           n_flag_DI269 or
           n_flag_DI270 or
           n_flag_DI271 or
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
                         n_flag_B3,
                         n_flag_B2,
                         n_flag_B1,
                         n_flag_B0};

          NOT_BUS_DI  = {
                         n_flag_DI271,
                         n_flag_DI270,
                         n_flag_DI269,
                         n_flag_DI268,
                         n_flag_DI267,
                         n_flag_DI266,
                         n_flag_DI265,
                         n_flag_DI264,
                         n_flag_DI263,
                         n_flag_DI262,
                         n_flag_DI261,
                         n_flag_DI260,
                         n_flag_DI259,
                         n_flag_DI258,
                         n_flag_DI257,
                         n_flag_DI256,
                         n_flag_DI255,
                         n_flag_DI254,
                         n_flag_DI253,
                         n_flag_DI252,
                         n_flag_DI251,
                         n_flag_DI250,
                         n_flag_DI249,
                         n_flag_DI248,
                         n_flag_DI247,
                         n_flag_DI246,
                         n_flag_DI245,
                         n_flag_DI244,
                         n_flag_DI243,
                         n_flag_DI242,
                         n_flag_DI241,
                         n_flag_DI240,
                         n_flag_DI239,
                         n_flag_DI238,
                         n_flag_DI237,
                         n_flag_DI236,
                         n_flag_DI235,
                         n_flag_DI234,
                         n_flag_DI233,
                         n_flag_DI232,
                         n_flag_DI231,
                         n_flag_DI230,
                         n_flag_DI229,
                         n_flag_DI228,
                         n_flag_DI227,
                         n_flag_DI226,
                         n_flag_DI225,
                         n_flag_DI224,
                         n_flag_DI223,
                         n_flag_DI222,
                         n_flag_DI221,
                         n_flag_DI220,
                         n_flag_DI219,
                         n_flag_DI218,
                         n_flag_DI217,
                         n_flag_DI216,
                         n_flag_DI215,
                         n_flag_DI214,
                         n_flag_DI213,
                         n_flag_DI212,
                         n_flag_DI211,
                         n_flag_DI210,
                         n_flag_DI209,
                         n_flag_DI208,
                         n_flag_DI207,
                         n_flag_DI206,
                         n_flag_DI205,
                         n_flag_DI204,
                         n_flag_DI203,
                         n_flag_DI202,
                         n_flag_DI201,
                         n_flag_DI200,
                         n_flag_DI199,
                         n_flag_DI198,
                         n_flag_DI197,
                         n_flag_DI196,
                         n_flag_DI195,
                         n_flag_DI194,
                         n_flag_DI193,
                         n_flag_DI192,
                         n_flag_DI191,
                         n_flag_DI190,
                         n_flag_DI189,
                         n_flag_DI188,
                         n_flag_DI187,
                         n_flag_DI186,
                         n_flag_DI185,
                         n_flag_DI184,
                         n_flag_DI183,
                         n_flag_DI182,
                         n_flag_DI181,
                         n_flag_DI180,
                         n_flag_DI179,
                         n_flag_DI178,
                         n_flag_DI177,
                         n_flag_DI176,
                         n_flag_DI175,
                         n_flag_DI174,
                         n_flag_DI173,
                         n_flag_DI172,
                         n_flag_DI171,
                         n_flag_DI170,
                         n_flag_DI169,
                         n_flag_DI168,
                         n_flag_DI167,
                         n_flag_DI166,
                         n_flag_DI165,
                         n_flag_DI164,
                         n_flag_DI163,
                         n_flag_DI162,
                         n_flag_DI161,
                         n_flag_DI160,
                         n_flag_DI159,
                         n_flag_DI158,
                         n_flag_DI157,
                         n_flag_DI156,
                         n_flag_DI155,
                         n_flag_DI154,
                         n_flag_DI153,
                         n_flag_DI152,
                         n_flag_DI151,
                         n_flag_DI150,
                         n_flag_DI149,
                         n_flag_DI148,
                         n_flag_DI147,
                         n_flag_DI146,
                         n_flag_DI145,
                         n_flag_DI144,
                         n_flag_DI143,
                         n_flag_DI142,
                         n_flag_DI141,
                         n_flag_DI140,
                         n_flag_DI139,
                         n_flag_DI138,
                         n_flag_DI137,
                         n_flag_DI136,
                         n_flag_DI135,
                         n_flag_DI134,
                         n_flag_DI133,
                         n_flag_DI132,
                         n_flag_DI131,
                         n_flag_DI130,
                         n_flag_DI129,
                         n_flag_DI128,
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
                         n_flag_DI96,
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
      specparam TAA    = (62.0:92.9:155.2);
      specparam TAA_2  = (62.9:94.5:158.6);
      specparam TAA_3  = (62.0:92.9:155.2);
      specparam TAA_4  = (60.8:91.1:151.5);
      specparam TRC  = (60.7:92.0:166.6);
      specparam TRC_2    = (60.7:92.0:166.6);
      specparam TRC_3    = (60.7:92.0:166.6);
      specparam TRC_4    = (60.7:92.0:166.6);
      specparam THPW = (8.8:14.5:24.0);
      specparam TLPW = (19.7:22.5:35.7);
      specparam TAS  = (12.1:13.3:21.1);
      specparam TAH  = (13.1:16.5:23.0);
      specparam TWS  = (11.4:14.9:26.6);
      specparam TWH  = (10.2:13.8:21.3);
      specparam TDS  = (14.9:18.5:32.5);
      specparam TDH  = (9.9:9.8:11.6);
      specparam TCSS = (19.0:22.2:38.1);
      specparam TCSH = (17.2:23.3:39.1);
      specparam TNAPH  = (8.4:18.6:35.8);
      specparam TNAP_CSH  = (23.1:30.2:43.0);
      specparam TDVSES  = (12.1:13.3:21.1);
      specparam TDVSEH  = (46.8:71.4:117.6);
      specparam TDVSS   = (12.1:13.3:21.1);
      specparam TDVSH   = (46.8:71.4:117.6);
      specparam TCR2W   = (0:0:0);


      $setuphold ( posedge CKA &&& con_A,         posedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[0], TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[1], TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[2], TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CKA &&& con_A,         posedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CKA &&& con_A,         negedge A[3], TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[0], TAS,     TAH,     n_flag_B0      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[0], TAS,     TAH,     n_flag_B0      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[1], TAS,     TAH,     n_flag_B1      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[1], TAS,     TAH,     n_flag_B1      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[2], TAS,     TAH,     n_flag_B2      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[2], TAS,     TAH,     n_flag_B2      );
      $setuphold ( posedge CKB &&& con_B,         posedge B[3], TAS,     TAH,     n_flag_B3      );
      $setuphold ( posedge CKB &&& con_B,         negedge B[3], TAS,     TAH,     n_flag_B3      );
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
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[64], TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[64], TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[65], TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[65], TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[66], TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[66], TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[67], TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[67], TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[68], TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[68], TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[69], TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[69], TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[70], TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[70], TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[71], TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[71], TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[72], TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[72], TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[73], TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[73], TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[74], TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[74], TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[75], TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[75], TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[76], TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[76], TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[77], TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[77], TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[78], TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[78], TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[79], TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[79], TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[80], TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[80], TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[81], TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[81], TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[82], TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[82], TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[83], TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[83], TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[84], TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[84], TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[85], TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[85], TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[86], TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[86], TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[87], TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[87], TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[88], TDS,     TDH,     n_flag_DI88    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[88], TDS,     TDH,     n_flag_DI88    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[89], TDS,     TDH,     n_flag_DI89    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[89], TDS,     TDH,     n_flag_DI89    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[90], TDS,     TDH,     n_flag_DI90    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[90], TDS,     TDH,     n_flag_DI90    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[91], TDS,     TDH,     n_flag_DI91    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[91], TDS,     TDH,     n_flag_DI91    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[92], TDS,     TDH,     n_flag_DI92    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[92], TDS,     TDH,     n_flag_DI92    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[93], TDS,     TDH,     n_flag_DI93    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[93], TDS,     TDH,     n_flag_DI93    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[94], TDS,     TDH,     n_flag_DI94    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[94], TDS,     TDH,     n_flag_DI94    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[95], TDS,     TDH,     n_flag_DI95    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[95], TDS,     TDH,     n_flag_DI95    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[96], TDS,     TDH,     n_flag_DI96    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[96], TDS,     TDH,     n_flag_DI96    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[97], TDS,     TDH,     n_flag_DI97    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[97], TDS,     TDH,     n_flag_DI97    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[98], TDS,     TDH,     n_flag_DI98    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[98], TDS,     TDH,     n_flag_DI98    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[99], TDS,     TDH,     n_flag_DI99    );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[99], TDS,     TDH,     n_flag_DI99    );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[100], TDS,     TDH,     n_flag_DI100   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[100], TDS,     TDH,     n_flag_DI100   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[101], TDS,     TDH,     n_flag_DI101   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[101], TDS,     TDH,     n_flag_DI101   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[102], TDS,     TDH,     n_flag_DI102   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[102], TDS,     TDH,     n_flag_DI102   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[103], TDS,     TDH,     n_flag_DI103   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[103], TDS,     TDH,     n_flag_DI103   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[104], TDS,     TDH,     n_flag_DI104   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[104], TDS,     TDH,     n_flag_DI104   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[105], TDS,     TDH,     n_flag_DI105   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[105], TDS,     TDH,     n_flag_DI105   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[106], TDS,     TDH,     n_flag_DI106   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[106], TDS,     TDH,     n_flag_DI106   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[107], TDS,     TDH,     n_flag_DI107   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[107], TDS,     TDH,     n_flag_DI107   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[108], TDS,     TDH,     n_flag_DI108   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[108], TDS,     TDH,     n_flag_DI108   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[109], TDS,     TDH,     n_flag_DI109   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[109], TDS,     TDH,     n_flag_DI109   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[110], TDS,     TDH,     n_flag_DI110   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[110], TDS,     TDH,     n_flag_DI110   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[111], TDS,     TDH,     n_flag_DI111   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[111], TDS,     TDH,     n_flag_DI111   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[112], TDS,     TDH,     n_flag_DI112   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[112], TDS,     TDH,     n_flag_DI112   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[113], TDS,     TDH,     n_flag_DI113   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[113], TDS,     TDH,     n_flag_DI113   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[114], TDS,     TDH,     n_flag_DI114   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[114], TDS,     TDH,     n_flag_DI114   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[115], TDS,     TDH,     n_flag_DI115   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[115], TDS,     TDH,     n_flag_DI115   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[116], TDS,     TDH,     n_flag_DI116   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[116], TDS,     TDH,     n_flag_DI116   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[117], TDS,     TDH,     n_flag_DI117   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[117], TDS,     TDH,     n_flag_DI117   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[118], TDS,     TDH,     n_flag_DI118   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[118], TDS,     TDH,     n_flag_DI118   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[119], TDS,     TDH,     n_flag_DI119   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[119], TDS,     TDH,     n_flag_DI119   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[120], TDS,     TDH,     n_flag_DI120   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[120], TDS,     TDH,     n_flag_DI120   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[121], TDS,     TDH,     n_flag_DI121   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[121], TDS,     TDH,     n_flag_DI121   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[122], TDS,     TDH,     n_flag_DI122   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[122], TDS,     TDH,     n_flag_DI122   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[123], TDS,     TDH,     n_flag_DI123   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[123], TDS,     TDH,     n_flag_DI123   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[124], TDS,     TDH,     n_flag_DI124   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[124], TDS,     TDH,     n_flag_DI124   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[125], TDS,     TDH,     n_flag_DI125   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[125], TDS,     TDH,     n_flag_DI125   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[126], TDS,     TDH,     n_flag_DI126   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[126], TDS,     TDH,     n_flag_DI126   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[127], TDS,     TDH,     n_flag_DI127   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[127], TDS,     TDH,     n_flag_DI127   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[128], TDS,     TDH,     n_flag_DI128   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[128], TDS,     TDH,     n_flag_DI128   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[129], TDS,     TDH,     n_flag_DI129   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[129], TDS,     TDH,     n_flag_DI129   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[130], TDS,     TDH,     n_flag_DI130   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[130], TDS,     TDH,     n_flag_DI130   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[131], TDS,     TDH,     n_flag_DI131   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[131], TDS,     TDH,     n_flag_DI131   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[132], TDS,     TDH,     n_flag_DI132   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[132], TDS,     TDH,     n_flag_DI132   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[133], TDS,     TDH,     n_flag_DI133   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[133], TDS,     TDH,     n_flag_DI133   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[134], TDS,     TDH,     n_flag_DI134   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[134], TDS,     TDH,     n_flag_DI134   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[135], TDS,     TDH,     n_flag_DI135   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[135], TDS,     TDH,     n_flag_DI135   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[136], TDS,     TDH,     n_flag_DI136   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[136], TDS,     TDH,     n_flag_DI136   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[137], TDS,     TDH,     n_flag_DI137   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[137], TDS,     TDH,     n_flag_DI137   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[138], TDS,     TDH,     n_flag_DI138   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[138], TDS,     TDH,     n_flag_DI138   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[139], TDS,     TDH,     n_flag_DI139   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[139], TDS,     TDH,     n_flag_DI139   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[140], TDS,     TDH,     n_flag_DI140   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[140], TDS,     TDH,     n_flag_DI140   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[141], TDS,     TDH,     n_flag_DI141   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[141], TDS,     TDH,     n_flag_DI141   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[142], TDS,     TDH,     n_flag_DI142   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[142], TDS,     TDH,     n_flag_DI142   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[143], TDS,     TDH,     n_flag_DI143   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[143], TDS,     TDH,     n_flag_DI143   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[144], TDS,     TDH,     n_flag_DI144   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[144], TDS,     TDH,     n_flag_DI144   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[145], TDS,     TDH,     n_flag_DI145   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[145], TDS,     TDH,     n_flag_DI145   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[146], TDS,     TDH,     n_flag_DI146   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[146], TDS,     TDH,     n_flag_DI146   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[147], TDS,     TDH,     n_flag_DI147   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[147], TDS,     TDH,     n_flag_DI147   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[148], TDS,     TDH,     n_flag_DI148   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[148], TDS,     TDH,     n_flag_DI148   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[149], TDS,     TDH,     n_flag_DI149   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[149], TDS,     TDH,     n_flag_DI149   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[150], TDS,     TDH,     n_flag_DI150   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[150], TDS,     TDH,     n_flag_DI150   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[151], TDS,     TDH,     n_flag_DI151   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[151], TDS,     TDH,     n_flag_DI151   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[152], TDS,     TDH,     n_flag_DI152   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[152], TDS,     TDH,     n_flag_DI152   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[153], TDS,     TDH,     n_flag_DI153   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[153], TDS,     TDH,     n_flag_DI153   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[154], TDS,     TDH,     n_flag_DI154   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[154], TDS,     TDH,     n_flag_DI154   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[155], TDS,     TDH,     n_flag_DI155   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[155], TDS,     TDH,     n_flag_DI155   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[156], TDS,     TDH,     n_flag_DI156   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[156], TDS,     TDH,     n_flag_DI156   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[157], TDS,     TDH,     n_flag_DI157   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[157], TDS,     TDH,     n_flag_DI157   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[158], TDS,     TDH,     n_flag_DI158   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[158], TDS,     TDH,     n_flag_DI158   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[159], TDS,     TDH,     n_flag_DI159   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[159], TDS,     TDH,     n_flag_DI159   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[160], TDS,     TDH,     n_flag_DI160   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[160], TDS,     TDH,     n_flag_DI160   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[161], TDS,     TDH,     n_flag_DI161   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[161], TDS,     TDH,     n_flag_DI161   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[162], TDS,     TDH,     n_flag_DI162   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[162], TDS,     TDH,     n_flag_DI162   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[163], TDS,     TDH,     n_flag_DI163   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[163], TDS,     TDH,     n_flag_DI163   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[164], TDS,     TDH,     n_flag_DI164   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[164], TDS,     TDH,     n_flag_DI164   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[165], TDS,     TDH,     n_flag_DI165   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[165], TDS,     TDH,     n_flag_DI165   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[166], TDS,     TDH,     n_flag_DI166   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[166], TDS,     TDH,     n_flag_DI166   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[167], TDS,     TDH,     n_flag_DI167   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[167], TDS,     TDH,     n_flag_DI167   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[168], TDS,     TDH,     n_flag_DI168   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[168], TDS,     TDH,     n_flag_DI168   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[169], TDS,     TDH,     n_flag_DI169   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[169], TDS,     TDH,     n_flag_DI169   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[170], TDS,     TDH,     n_flag_DI170   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[170], TDS,     TDH,     n_flag_DI170   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[171], TDS,     TDH,     n_flag_DI171   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[171], TDS,     TDH,     n_flag_DI171   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[172], TDS,     TDH,     n_flag_DI172   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[172], TDS,     TDH,     n_flag_DI172   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[173], TDS,     TDH,     n_flag_DI173   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[173], TDS,     TDH,     n_flag_DI173   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[174], TDS,     TDH,     n_flag_DI174   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[174], TDS,     TDH,     n_flag_DI174   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[175], TDS,     TDH,     n_flag_DI175   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[175], TDS,     TDH,     n_flag_DI175   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[176], TDS,     TDH,     n_flag_DI176   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[176], TDS,     TDH,     n_flag_DI176   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[177], TDS,     TDH,     n_flag_DI177   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[177], TDS,     TDH,     n_flag_DI177   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[178], TDS,     TDH,     n_flag_DI178   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[178], TDS,     TDH,     n_flag_DI178   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[179], TDS,     TDH,     n_flag_DI179   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[179], TDS,     TDH,     n_flag_DI179   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[180], TDS,     TDH,     n_flag_DI180   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[180], TDS,     TDH,     n_flag_DI180   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[181], TDS,     TDH,     n_flag_DI181   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[181], TDS,     TDH,     n_flag_DI181   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[182], TDS,     TDH,     n_flag_DI182   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[182], TDS,     TDH,     n_flag_DI182   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[183], TDS,     TDH,     n_flag_DI183   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[183], TDS,     TDH,     n_flag_DI183   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[184], TDS,     TDH,     n_flag_DI184   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[184], TDS,     TDH,     n_flag_DI184   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[185], TDS,     TDH,     n_flag_DI185   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[185], TDS,     TDH,     n_flag_DI185   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[186], TDS,     TDH,     n_flag_DI186   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[186], TDS,     TDH,     n_flag_DI186   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[187], TDS,     TDH,     n_flag_DI187   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[187], TDS,     TDH,     n_flag_DI187   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[188], TDS,     TDH,     n_flag_DI188   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[188], TDS,     TDH,     n_flag_DI188   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[189], TDS,     TDH,     n_flag_DI189   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[189], TDS,     TDH,     n_flag_DI189   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[190], TDS,     TDH,     n_flag_DI190   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[190], TDS,     TDH,     n_flag_DI190   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[191], TDS,     TDH,     n_flag_DI191   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[191], TDS,     TDH,     n_flag_DI191   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[192], TDS,     TDH,     n_flag_DI192   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[192], TDS,     TDH,     n_flag_DI192   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[193], TDS,     TDH,     n_flag_DI193   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[193], TDS,     TDH,     n_flag_DI193   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[194], TDS,     TDH,     n_flag_DI194   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[194], TDS,     TDH,     n_flag_DI194   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[195], TDS,     TDH,     n_flag_DI195   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[195], TDS,     TDH,     n_flag_DI195   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[196], TDS,     TDH,     n_flag_DI196   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[196], TDS,     TDH,     n_flag_DI196   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[197], TDS,     TDH,     n_flag_DI197   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[197], TDS,     TDH,     n_flag_DI197   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[198], TDS,     TDH,     n_flag_DI198   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[198], TDS,     TDH,     n_flag_DI198   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[199], TDS,     TDH,     n_flag_DI199   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[199], TDS,     TDH,     n_flag_DI199   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[200], TDS,     TDH,     n_flag_DI200   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[200], TDS,     TDH,     n_flag_DI200   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[201], TDS,     TDH,     n_flag_DI201   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[201], TDS,     TDH,     n_flag_DI201   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[202], TDS,     TDH,     n_flag_DI202   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[202], TDS,     TDH,     n_flag_DI202   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[203], TDS,     TDH,     n_flag_DI203   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[203], TDS,     TDH,     n_flag_DI203   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[204], TDS,     TDH,     n_flag_DI204   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[204], TDS,     TDH,     n_flag_DI204   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[205], TDS,     TDH,     n_flag_DI205   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[205], TDS,     TDH,     n_flag_DI205   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[206], TDS,     TDH,     n_flag_DI206   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[206], TDS,     TDH,     n_flag_DI206   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[207], TDS,     TDH,     n_flag_DI207   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[207], TDS,     TDH,     n_flag_DI207   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[208], TDS,     TDH,     n_flag_DI208   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[208], TDS,     TDH,     n_flag_DI208   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[209], TDS,     TDH,     n_flag_DI209   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[209], TDS,     TDH,     n_flag_DI209   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[210], TDS,     TDH,     n_flag_DI210   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[210], TDS,     TDH,     n_flag_DI210   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[211], TDS,     TDH,     n_flag_DI211   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[211], TDS,     TDH,     n_flag_DI211   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[212], TDS,     TDH,     n_flag_DI212   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[212], TDS,     TDH,     n_flag_DI212   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[213], TDS,     TDH,     n_flag_DI213   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[213], TDS,     TDH,     n_flag_DI213   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[214], TDS,     TDH,     n_flag_DI214   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[214], TDS,     TDH,     n_flag_DI214   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[215], TDS,     TDH,     n_flag_DI215   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[215], TDS,     TDH,     n_flag_DI215   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[216], TDS,     TDH,     n_flag_DI216   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[216], TDS,     TDH,     n_flag_DI216   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[217], TDS,     TDH,     n_flag_DI217   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[217], TDS,     TDH,     n_flag_DI217   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[218], TDS,     TDH,     n_flag_DI218   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[218], TDS,     TDH,     n_flag_DI218   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[219], TDS,     TDH,     n_flag_DI219   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[219], TDS,     TDH,     n_flag_DI219   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[220], TDS,     TDH,     n_flag_DI220   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[220], TDS,     TDH,     n_flag_DI220   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[221], TDS,     TDH,     n_flag_DI221   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[221], TDS,     TDH,     n_flag_DI221   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[222], TDS,     TDH,     n_flag_DI222   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[222], TDS,     TDH,     n_flag_DI222   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[223], TDS,     TDH,     n_flag_DI223   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[223], TDS,     TDH,     n_flag_DI223   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[224], TDS,     TDH,     n_flag_DI224   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[224], TDS,     TDH,     n_flag_DI224   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[225], TDS,     TDH,     n_flag_DI225   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[225], TDS,     TDH,     n_flag_DI225   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[226], TDS,     TDH,     n_flag_DI226   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[226], TDS,     TDH,     n_flag_DI226   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[227], TDS,     TDH,     n_flag_DI227   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[227], TDS,     TDH,     n_flag_DI227   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[228], TDS,     TDH,     n_flag_DI228   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[228], TDS,     TDH,     n_flag_DI228   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[229], TDS,     TDH,     n_flag_DI229   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[229], TDS,     TDH,     n_flag_DI229   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[230], TDS,     TDH,     n_flag_DI230   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[230], TDS,     TDH,     n_flag_DI230   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[231], TDS,     TDH,     n_flag_DI231   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[231], TDS,     TDH,     n_flag_DI231   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[232], TDS,     TDH,     n_flag_DI232   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[232], TDS,     TDH,     n_flag_DI232   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[233], TDS,     TDH,     n_flag_DI233   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[233], TDS,     TDH,     n_flag_DI233   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[234], TDS,     TDH,     n_flag_DI234   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[234], TDS,     TDH,     n_flag_DI234   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[235], TDS,     TDH,     n_flag_DI235   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[235], TDS,     TDH,     n_flag_DI235   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[236], TDS,     TDH,     n_flag_DI236   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[236], TDS,     TDH,     n_flag_DI236   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[237], TDS,     TDH,     n_flag_DI237   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[237], TDS,     TDH,     n_flag_DI237   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[238], TDS,     TDH,     n_flag_DI238   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[238], TDS,     TDH,     n_flag_DI238   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[239], TDS,     TDH,     n_flag_DI239   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[239], TDS,     TDH,     n_flag_DI239   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[240], TDS,     TDH,     n_flag_DI240   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[240], TDS,     TDH,     n_flag_DI240   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[241], TDS,     TDH,     n_flag_DI241   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[241], TDS,     TDH,     n_flag_DI241   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[242], TDS,     TDH,     n_flag_DI242   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[242], TDS,     TDH,     n_flag_DI242   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[243], TDS,     TDH,     n_flag_DI243   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[243], TDS,     TDH,     n_flag_DI243   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[244], TDS,     TDH,     n_flag_DI244   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[244], TDS,     TDH,     n_flag_DI244   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[245], TDS,     TDH,     n_flag_DI245   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[245], TDS,     TDH,     n_flag_DI245   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[246], TDS,     TDH,     n_flag_DI246   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[246], TDS,     TDH,     n_flag_DI246   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[247], TDS,     TDH,     n_flag_DI247   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[247], TDS,     TDH,     n_flag_DI247   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[248], TDS,     TDH,     n_flag_DI248   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[248], TDS,     TDH,     n_flag_DI248   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[249], TDS,     TDH,     n_flag_DI249   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[249], TDS,     TDH,     n_flag_DI249   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[250], TDS,     TDH,     n_flag_DI250   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[250], TDS,     TDH,     n_flag_DI250   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[251], TDS,     TDH,     n_flag_DI251   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[251], TDS,     TDH,     n_flag_DI251   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[252], TDS,     TDH,     n_flag_DI252   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[252], TDS,     TDH,     n_flag_DI252   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[253], TDS,     TDH,     n_flag_DI253   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[253], TDS,     TDH,     n_flag_DI253   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[254], TDS,     TDH,     n_flag_DI254   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[254], TDS,     TDH,     n_flag_DI254   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[255], TDS,     TDH,     n_flag_DI255   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[255], TDS,     TDH,     n_flag_DI255   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[256], TDS,     TDH,     n_flag_DI256   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[256], TDS,     TDH,     n_flag_DI256   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[257], TDS,     TDH,     n_flag_DI257   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[257], TDS,     TDH,     n_flag_DI257   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[258], TDS,     TDH,     n_flag_DI258   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[258], TDS,     TDH,     n_flag_DI258   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[259], TDS,     TDH,     n_flag_DI259   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[259], TDS,     TDH,     n_flag_DI259   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[260], TDS,     TDH,     n_flag_DI260   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[260], TDS,     TDH,     n_flag_DI260   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[261], TDS,     TDH,     n_flag_DI261   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[261], TDS,     TDH,     n_flag_DI261   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[262], TDS,     TDH,     n_flag_DI262   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[262], TDS,     TDH,     n_flag_DI262   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[263], TDS,     TDH,     n_flag_DI263   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[263], TDS,     TDH,     n_flag_DI263   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[264], TDS,     TDH,     n_flag_DI264   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[264], TDS,     TDH,     n_flag_DI264   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[265], TDS,     TDH,     n_flag_DI265   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[265], TDS,     TDH,     n_flag_DI265   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[266], TDS,     TDH,     n_flag_DI266   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[266], TDS,     TDH,     n_flag_DI266   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[267], TDS,     TDH,     n_flag_DI267   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[267], TDS,     TDH,     n_flag_DI267   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[268], TDS,     TDH,     n_flag_DI268   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[268], TDS,     TDH,     n_flag_DI268   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[269], TDS,     TDH,     n_flag_DI269   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[269], TDS,     TDH,     n_flag_DI269   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[270], TDS,     TDH,     n_flag_DI270   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[270], TDS,     TDH,     n_flag_DI270   );
      $setuphold ( posedge CKB &&& con_DI,        posedge DI[271], TDS,     TDH,     n_flag_DI271   );
      $setuphold ( posedge CKB &&& con_DI,        negedge DI[271], TDS,     TDH,     n_flag_DI271   );
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
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[64] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[65] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[66] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[67] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[68] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[69] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[70] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[71] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[72] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[73] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[74] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[75] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[76] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[77] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[78] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[79] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[80] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[81] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[82] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[83] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[84] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[85] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[86] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[87] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[88] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[89] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[90] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[91] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[92] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[93] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[94] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[95] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[96] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[97] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[98] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[99] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[100] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[101] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[102] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[103] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[104] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[105] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[106] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[107] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[108] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[109] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[110] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[111] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[112] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[113] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[114] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[115] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[116] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[117] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[118] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[119] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[120] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[121] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[122] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[123] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[124] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[125] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[126] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[127] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[128] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[129] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[130] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[131] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[132] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[133] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[134] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[135] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[136] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[137] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[138] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[139] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[140] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[141] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[142] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[143] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[144] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[145] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[146] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[147] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[148] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[149] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[150] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[151] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[152] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[153] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[154] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[155] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[156] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[157] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[158] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[159] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[160] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[161] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[162] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[163] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[164] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[165] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[166] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[167] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[168] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[169] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[170] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[171] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[172] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[173] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[174] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[175] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[176] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[177] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[178] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[179] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[180] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[181] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[182] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[183] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[184] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[185] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[186] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[187] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[188] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[189] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[190] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[191] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[192] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[193] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[194] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[195] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[196] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[197] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[198] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[199] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[200] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[201] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[202] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[203] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[204] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[205] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[206] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[207] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[208] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[209] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[210] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[211] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[212] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[213] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[214] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[215] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[216] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[217] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[218] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[219] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[220] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[221] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[222] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[223] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[224] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[225] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[226] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[227] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[228] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[229] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[230] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[231] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[232] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[233] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[234] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[235] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[236] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[237] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[238] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[239] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[240] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[241] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[242] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[243] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[244] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[245] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[246] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[247] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[248] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[249] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[250] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[251] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[252] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[253] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[254] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[255] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[256] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[257] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[258] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[259] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[260] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[261] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[262] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[263] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[264] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[265] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[266] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[267] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[268] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[269] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[270] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CKA => (DO[271] :1'bx)) = TAA  ;
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
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[64] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[65] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[66] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[67] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[68] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[69] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[70] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[71] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[72] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[73] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[74] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[75] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[76] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[77] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[78] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[79] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[80] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[81] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[82] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[83] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[84] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[85] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[86] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[87] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[88] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[89] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[90] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[91] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[92] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[93] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[94] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[95] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[96] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[97] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[98] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[99] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[100] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[101] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[102] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[103] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[104] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[105] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[106] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[107] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[108] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[109] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[110] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[111] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[112] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[113] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[114] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[115] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[116] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[117] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[118] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[119] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[120] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[121] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[122] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[123] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[124] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[125] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[126] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[127] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[128] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[129] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[130] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[131] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[132] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[133] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[134] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[135] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[136] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[137] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[138] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[139] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[140] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[141] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[142] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[143] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[144] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[145] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[146] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[147] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[148] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[149] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[150] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[151] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[152] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[153] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[154] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[155] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[156] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[157] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[158] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[159] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[160] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[161] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[162] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[163] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[164] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[165] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[166] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[167] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[168] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[169] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[170] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[171] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[172] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[173] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[174] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[175] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[176] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[177] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[178] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[179] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[180] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[181] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[182] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[183] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[184] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[185] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[186] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[187] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[188] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[189] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[190] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[191] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[192] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[193] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[194] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[195] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[196] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[197] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[198] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[199] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[200] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[201] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[202] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[203] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[204] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[205] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[206] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[207] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[208] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[209] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[210] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[211] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[212] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[213] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[214] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[215] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[216] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[217] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[218] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[219] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[220] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[221] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[222] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[223] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[224] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[225] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[226] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[227] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[228] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[229] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[230] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[231] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[232] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[233] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[234] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[235] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[236] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[237] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[238] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[239] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[240] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[241] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[242] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[243] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[244] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[245] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[246] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[247] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[248] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[249] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[250] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[251] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[252] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[253] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[254] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[255] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[256] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[257] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[258] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[259] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[260] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[261] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[262] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[263] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[264] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[265] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[266] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[267] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[268] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[269] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[270] :1'bx)) = TAA_2;
      if (NODELAY == 0 && con_dvs2)  (posedge CKA => (DO[271] :1'bx)) = TAA_2;
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
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[64] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[65] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[66] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[67] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[68] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[69] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[70] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[71] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[72] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[73] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[74] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[75] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[76] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[77] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[78] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[79] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[80] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[81] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[82] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[83] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[84] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[85] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[86] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[87] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[88] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[89] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[90] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[91] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[92] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[93] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[94] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[95] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[96] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[97] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[98] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[99] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[100] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[101] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[102] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[103] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[104] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[105] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[106] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[107] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[108] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[109] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[110] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[111] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[112] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[113] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[114] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[115] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[116] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[117] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[118] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[119] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[120] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[121] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[122] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[123] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[124] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[125] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[126] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[127] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[128] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[129] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[130] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[131] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[132] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[133] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[134] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[135] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[136] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[137] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[138] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[139] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[140] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[141] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[142] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[143] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[144] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[145] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[146] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[147] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[148] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[149] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[150] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[151] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[152] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[153] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[154] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[155] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[156] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[157] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[158] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[159] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[160] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[161] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[162] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[163] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[164] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[165] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[166] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[167] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[168] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[169] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[170] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[171] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[172] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[173] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[174] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[175] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[176] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[177] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[178] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[179] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[180] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[181] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[182] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[183] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[184] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[185] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[186] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[187] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[188] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[189] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[190] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[191] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[192] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[193] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[194] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[195] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[196] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[197] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[198] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[199] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[200] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[201] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[202] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[203] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[204] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[205] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[206] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[207] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[208] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[209] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[210] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[211] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[212] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[213] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[214] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[215] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[216] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[217] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[218] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[219] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[220] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[221] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[222] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[223] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[224] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[225] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[226] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[227] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[228] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[229] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[230] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[231] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[232] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[233] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[234] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[235] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[236] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[237] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[238] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[239] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[240] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[241] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[242] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[243] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[244] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[245] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[246] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[247] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[248] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[249] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[250] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[251] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[252] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[253] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[254] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[255] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[256] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[257] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[258] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[259] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[260] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[261] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[262] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[263] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[264] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[265] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[266] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[267] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[268] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[269] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[270] :1'bx)) = TAA_3;
      if (NODELAY == 0 && con_dvs3)  (posedge CKA => (DO[271] :1'bx)) = TAA_3;
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
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[64] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[65] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[66] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[67] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[68] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[69] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[70] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[71] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[72] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[73] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[74] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[75] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[76] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[77] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[78] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[79] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[80] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[81] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[82] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[83] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[84] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[85] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[86] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[87] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[88] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[89] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[90] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[91] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[92] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[93] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[94] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[95] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[96] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[97] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[98] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[99] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[100] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[101] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[102] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[103] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[104] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[105] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[106] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[107] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[108] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[109] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[110] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[111] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[112] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[113] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[114] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[115] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[116] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[117] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[118] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[119] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[120] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[121] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[122] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[123] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[124] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[125] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[126] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[127] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[128] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[129] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[130] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[131] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[132] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[133] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[134] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[135] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[136] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[137] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[138] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[139] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[140] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[141] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[142] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[143] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[144] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[145] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[146] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[147] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[148] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[149] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[150] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[151] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[152] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[153] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[154] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[155] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[156] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[157] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[158] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[159] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[160] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[161] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[162] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[163] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[164] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[165] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[166] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[167] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[168] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[169] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[170] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[171] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[172] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[173] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[174] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[175] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[176] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[177] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[178] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[179] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[180] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[181] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[182] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[183] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[184] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[185] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[186] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[187] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[188] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[189] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[190] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[191] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[192] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[193] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[194] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[195] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[196] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[197] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[198] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[199] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[200] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[201] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[202] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[203] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[204] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[205] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[206] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[207] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[208] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[209] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[210] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[211] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[212] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[213] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[214] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[215] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[216] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[217] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[218] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[219] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[220] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[221] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[222] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[223] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[224] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[225] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[226] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[227] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[228] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[229] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[230] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[231] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[232] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[233] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[234] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[235] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[236] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[237] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[238] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[239] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[240] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[241] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[242] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[243] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[244] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[245] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[246] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[247] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[248] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[249] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[250] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[251] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[252] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[253] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[254] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[255] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[256] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[257] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[258] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[259] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[260] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[261] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[262] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[263] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[264] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[265] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[266] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[267] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[268] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[269] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[270] :1'bx)) = TAA_4;
      if (NODELAY == 0 && con_dvs4)  (posedge CKA => (DO[271] :1'bx)) = TAA_4;



   endspecify

`endprotect
endmodule
