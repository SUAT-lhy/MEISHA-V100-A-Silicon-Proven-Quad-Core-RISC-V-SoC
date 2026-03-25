/*******************************************************************************
________________________________________________________________________________________________________________________


            Synchronous RVT Periphery Via1 Programmable ROM Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________________________________

       IP Name            :  FSH0L_B_SP                                                                                 
       IP Version         :  1.3.0                                                                                      
       IP Release Status  :  Active                                                                                     
       Word               :  2048                                                                                       
       Bit                :  32                                                                                         
       Mux                :  1                                                                                          
       Rom Code Version   :  A                                                                                          
       Rom Code Format    :  bin                                                                                        
       Rom Code File      :  /home/autumn/pdk/memory/ftclib/ram/SPLB40_2048X32BM1b1A/SPLB40_2048X32BM1b1A_All0.romcode  
       Output Loading     :  0.3                                                                                        
       Clock Input Slew   :  0.4                                                                                        
       Data Input Slew    :  0.4                                                                                        
       Ring Type          :  Ringless Model                                                                             
       Ring Width         :  0                                                                                          
       Bus Format         :  1                                                                                          
       Memaker Path       :  /home/autumn/pdk/memory/ftclib                                                             
       GUI Version        :  m20130120                                                                                  
       Date               :  2024/09/20 08:51:55                                                                        
________________________________________________________________________________________________________________________


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


module SPLB40_2048X32BM1b1A (A,DO,DVSE,DVS,VCC, GND, CK,CS);
  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `FALSE;           
  parameter  ROMCODE              = "/home/autumn/pdk/memory/ftclib/ram/SPLB40_2048X32BM1b1A/SPLB40_2048X32BM1b1A_All0.romcode";
  parameter  DVSize               = 4;                
  parameter  AddressSize          = 11;               
  parameter  Bits                 = 32;               
  parameter  Words                = 2048;             
  parameter  AspectRatio          = 1;                
  parameter  TOH                  = (75.5:119.4:214.0);
  parameter  TOH_6                = (75.5:119.4:214.0);
  parameter  TOH_8                = (75.5:119.4:214.0);
  parameter  TOH_10               = (75.5:119.4:214.0);

  output     [Bits-1:0]           DO;                 
  input      [AddressSize-1:0]    A;                  
  input      DVSE;                                    
  input      [DVSize-1:0]         DVS;                
  input      CK;                                      
  input      CS;                                      
  input      VCC;                                     
  input      GND;                                     

`protect
  reg        [Bits-1:0]           Memory [Words-1:0];           

  wire       [Bits-1:0]           DO_;                
  wire       [AddressSize-1:0]    A_;                 
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
  reg                             con_dvs6;           
  reg                             wrong_dvs7;         
  reg                             con_dvs8;           
  reg                             wrong_dvs9;         
  reg                             con_dvs10;          
  reg                             wrong_dvs11;        
  reg                             wrong_dvs12;        
  reg                             wrong_dvs13;        
  reg                             wrong_dvs14;        
  reg                             wrong_dvs15;        

  wire                            VCC_;               
  wire                            GND_;               



  wire                            con_A;              
  wire                            con_CK;             
  wire                            ck_per;             
  wire                            ck_per6;            
  wire                            ck_per8;            
  wire                            ck_per10;           
  wire                            con_DVSE_W;         
  wire                            con_DVS_W;          

  reg        [AddressSize-1:0]    Latch_A;            
  reg                             Latch_CS;           
  reg                             Latch_DVSE;         
  reg        [DVSize-1:0]         Latch_DVS;          

  reg        [AddressSize-1:0]    A_i;                
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
  reg                             n_flag_A8;          
  reg                             n_flag_A9;          
  reg                             n_flag_A10;         
  reg                             n_flag_DVSE;        
  reg                             n_flag_DVS0;        
  reg                             n_flag_DVS1;        
  reg                             n_flag_DVS2;        
  reg                             n_flag_DVS3;        
  reg                             n_flag_CS;          
  reg                             n_flag_CK_PER;      
  reg                             n_flag_CK_MINH;     
  reg                             n_flag_CK_MINL;     
  reg                             LAST_n_flag_CS;     
  reg                             LAST_n_flag_CK_PER; 
  reg                             LAST_n_flag_CK_MINH;
  reg                             LAST_n_flag_CK_MINL;
  reg        [AddressSize-1:0]    NOT_BUS_A;          
  reg        [AddressSize-1:0]    LAST_NOT_BUS_A;     

  reg                             LAST_n_flag_DVSE;   
  reg        [DVSize-1:0]         NOT_BUS_DVS;        
  reg        [DVSize-1:0]         LAST_NOT_BUS_DVS;   

  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       

  reg        [Bits-1:0]           DO_i;               

  reg        [Bits-1:0]           DO_VCC_i;           
  reg        [Bits-1:0]           DO_GND_i;           

  reg                             LastClkEdge;        

  reg                             flag_A_x;           
  reg                             flag_CS_x;          
  reg                             NODELAY;            
  reg        [Bits-1:0]           DO_tmp;             
  event                           EventTOHDO;         
  event                           EventNegCS;         
`ifdef MEM_VERIFY
  reg                             taa_verify;         
`else
`endif

`ifdef power_function
  assign     DO_                  = GND ? DO_GND_i : (VCC ? DO_i : DO_VCC_i);  
`else
  assign     DO_                  = {DO_i};
`endif
  assign     con_A                = CS_;
  assign     con_CK               = CS_;
  assign     ck_per               = CS_ & !DVSE_;
  assign     ck_per6              = CS_ & DVSE_ & !DVS_[0] & DVS_[1] & DVS_[2] & !DVS_[3];
  assign     ck_per8              = CS_ & DVSE_ & !DVS_[0] & !DVS_[1] & !DVS_[2] & DVS_[3];
  assign     ck_per10             = CS_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & DVS_[3];
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
  buf        ia8             (A_[8], A[8]);                
  buf        ia9             (A_[9], A[9]);                
  buf        ia10            (A_[10], A[10]);              
  buf        ics0            (CS_, CS);                    

  buf        idvs0           (DVS_[0], DVS[0]);            
  buf        idvs1           (DVS_[1], DVS[1]);            
  buf        idvs2           (DVS_[2], DVS[2]);            
  buf        idvs3           (DVS_[3], DVS[3]);            
  buf        idvse           (DVSE_, DVSE);                

  buf        ivcc0           (VCC_, VCC);                  
  buf        ignd0           (GND_, GND);                  

  initial begin
    $timeformat (-12, 0, " ps", 20);
    flag_A_x = `FALSE;
    NODELAY = 1'b0;
    LastClkEdge = 1'b0;
    DVS_TRIGGER = 1'b0;
  `ifdef MEM_VERIFY
    taa_verify = 0;
  `else
  `endif
  end

  initial
    begin
      if (ROMCODE != "")
        begin
          $readmemb(ROMCODE,Memory);
        end
      else
        begin
          $display("** MEM_Error: No proper input file name is available.\n");
          $finish;
        end
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


`ifdef power_function
  always @(negedge GND_) begin
    if (GND_ === 1'bx) begin
       pin_unknow;
`ifdef NO_MEM_MSG
`else
       ErrorMessage(7);
`endif
    end else begin
        latch_last_A = 1'bx;
        DO_i = DO_GND_i;
    end
  end

  always @(posedge VCC_) begin
    if (VCC_ === 1'bx) begin
       pin_unknow;
`ifdef NO_MEM_MSG
`else
       ErrorMessage(7);
`endif
    end else begin
        latch_last_A = 1'bx;
        DO_i = DO_VCC_i;
    end
  end

  always @(posedge GND_) begin
    if (GND_ === 1'bx) begin
       pin_unknow;
`ifdef NO_MEM_MSG
`else
       ErrorMessage(7);
`endif
    end else begin
       disable TOHDO;
       NODELAY = 1'b1;
       DO_GND_i = {Bits{1'bX}};
    end
  end


  always @(negedge VCC_) begin
    if (VCC_ === 1'bx) begin
       pin_unknow;
`ifdef NO_MEM_MSG
`else
       ErrorMessage(7);
`endif
    end
    else if (VCC_ === 1'b0) begin
       disable TOHDO;
       NODELAY = 1'b1;
       DO_VCC_i = {Bits{1'bX}};
    end
  end
`else
`endif

  always @(CK_) begin
    casez ({LastClkEdge,CK_})
      2'b01:
`ifdef power_function
        if (VCC_=== 1'bx || GND_ === 1'bx) begin
          pin_unknow;
`ifdef NO_MEM_MSG
`else
          ErrorMessage(7);
`endif
        end else if (VCC_ === 1'b0 || GND_ === 1'b1) begin
          pin_unknow;
        end else begin
           last_A = latch_last_A;
           CS_monitor;
           pre_latch_data;
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
           con_dvs6   = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs7 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs8   = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs9 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           con_dvs10  = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs11 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs12 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs13 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs14 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs15 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           memory_function;
           latch_last_A = A_;
        end
`else
         begin
           last_A = latch_last_A;
           CS_monitor;
           pre_latch_data;
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
           con_dvs6   = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           wrong_dvs7 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (!DVS_[3]) & DVS_TRIGGER;
           con_dvs8   = (!DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs9 = (DVS_[0]) & (!DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           con_dvs10  = (!DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs11 = (DVS_[0]) & (DVS_[1]) & (!DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs12 = (!DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs13 = (DVS_[0]) & (!DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs14 = (!DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           wrong_dvs15 = (DVS_[0]) & (DVS_[1]) & (DVS_[2]) & (DVS_[3]) & DVS_TRIGGER;
           memory_function;
           latch_last_A = A_;
         end
`endif
      2'b?x:
         begin
           ErrorMessage(0);
           #0 disable TOHDO;
           DO_i = {Bits{1'bX}};
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
           n_flag_A8 or
           n_flag_A9 or
           n_flag_A10 or
           n_flag_DVSE or
           n_flag_DVS0 or
           n_flag_DVS1 or
           n_flag_DVS2 or
           n_flag_DVS3 or
           n_flag_CS or
           n_flag_CK_PER or
           n_flag_CK_MINH or
           n_flag_CK_MINL
          )
     begin
       timingcheck_violation;
     end


  always @(EventTOHDO)
    begin:TOHDO
      if (con_dvse) begin
        #TOH
        NODELAY <= 1'b0;
        DO_i              =  {Bits{1'bX}};
        DO_i              <= DO_tmp;
      end else if (con_dvs6) begin
        #TOH_6
        NODELAY <= 1'b0;
        DO_i              =  {Bits{1'bX}};
        DO_i              <= DO_tmp;
      end else if (con_dvs8) begin
        #TOH_8
        NODELAY <= 1'b0;
        DO_i              =  {Bits{1'bX}};
        DO_i              <= DO_tmp;
      end else if (con_dvs10) begin
        #TOH_10
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
      if ((n_flag_CK_PER  !== LAST_n_flag_CK_PER)  ||
          (n_flag_CK_MINH !== LAST_n_flag_CK_MINH) ||
          (n_flag_CK_MINL !== LAST_n_flag_CK_MINL)) begin
          if (CS_ !== 1'b0) begin
             #0 disable TOHDO;
             NODELAY = 1'b1;
             DO_i = {Bits{1'bX}};
          end
      end
      else begin
          NOT_BUS_A  = {
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
          Latch_CS  =  (n_flag_CS  !== LAST_n_flag_CS)  ? 1'bx : Latch_CS;
          memory_function;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DVS               = NOT_BUS_DVS;
      LAST_n_flag_DVSE               = n_flag_DVSE;
      LAST_n_flag_CS                 = n_flag_CS;
      LAST_n_flag_CK_PER             = n_flag_CK_PER;
      LAST_n_flag_CK_MINH            = n_flag_CK_MINH;
      LAST_n_flag_CK_MINL            = n_flag_CK_MINL;
    end
  endtask // end timingcheck_violation;

  task pre_latch_data;
    begin
      Latch_A                        = A_;
      Latch_CS                       = CS_;
      Latch_DVS                      = DVS_;
      Latch_DVSE                     = DVSE_;
    end
  endtask //end pre_latch_data
  task memory_function;
    begin
      A_i                            = Latch_A;
      CS_i                           = Latch_CS;
      DVS_i                          = Latch_DVS;
      DVSE_i                         = Latch_DVSE;

      if (CS_ == 1'b1) A_monitor;

      casez(CS_i)
        1'b1: begin
           if (AddressRangeCheck(A_i)) begin
              if (NO_SER_TOH == `TRUE) begin
                if (A_i !== last_A) begin


                  if (DVSE_i === 1'bX) begin
		  #0 disable TOHDO;
		     NODELAY = 1'b1;   
		     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(6);
`endif
                  end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
		  #0 disable TOHDO;
		     NODELAY = 1'b1;   
		     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(6);
`endif
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                  NODELAY = 1'b1;
                  DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(8);
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
                     ErrorMessage(6);
`endif
                  end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
		  #0 disable TOHDO;
		     NODELAY = 1'b1;   
		     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(6);
`endif
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                  NODELAY = 1'b1;
                  DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(8);
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
                     ErrorMessage(6);
`endif
                  end else if (^(DVS_i) === 1'bX && DVSE_i === 1'b1) begin
		  #0 disable TOHDO;
		     NODELAY = 1'b1;   
		     DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(6);
`endif
                  end else if (wrong_dvs0 || wrong_dvs1 || wrong_dvs2 || wrong_dvs3 || wrong_dvs4 || wrong_dvs5 || wrong_dvs7 || wrong_dvs9 || wrong_dvs11 || wrong_dvs12 || wrong_dvs13 || wrong_dvs14 || wrong_dvs15) begin
                  #0 disable TOHDO;
                  NODELAY = 1'b1;
                  DO_i = {Bits{1'bX}};
`ifdef NO_MEM_MSG
`else
                     ErrorMessage(8);
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
           else begin
                #0 disable TOHDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
             `ifdef MEM_VERIFY
		taa_verify = 0;
             `else
             `endif
           end
        end
        1'bx: begin
           #0 disable TOHDO;
           NODELAY = 1'b1;
           DO_i = {Bits{1'bX}};
        end
      endcase
  end
  endtask //memory_function;

  task pin_unknow;
     begin
      #0 disable TOHDO;
      NODELAY = 1'b1;
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
              ErrorMessage(2);
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
              ErrorMessage(3);
          end
       end
     end
  endtask //end CS_monitor;

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
         6: $display("** MEM_Error: DVS or DVSE appear unknown state (%t) in clock of %m",$time);
         8: $display("** MEM_Error: DVS doesn't operate the status (%t) in clock of %m",$time);
         7: $display("** MEM_Error: VCC or GND are unknown, so DO is unknown, all memory core is unknown %m",$time);
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
      specparam TAA    = (121.6:193.8:343.1);
      specparam TAA_6  = (123.0:197.3:353.3);
      specparam TAA_8  = (121.6:193.8:343.1);
      specparam TAA_10  = (119.2:189.8:336.3);
      specparam TRC  = (130.6:201.6:351.5);
      specparam TRC_6    = (132.7:207.1:368.4);
      specparam TRC_8    = (130.6:201.6:351.5);
      specparam TRC_10    = (127.0:195.4:340.7);
      specparam THPW = (17.8:28.7:48.1);
      specparam TLPW = (40.8:62.6:111.3);
      specparam TAS  = (18.7:26.3:41.7);
      specparam TAH  = (6.6:9.8:16.6);
      specparam TCSS = (23.0:33.9:53.5);
      specparam TCSH = (7.1:11.2:22.4);
      specparam TDVSES  = (18.7:26.3:41.7);
      specparam TDVSEH  = (115.4:183.3:325.4);
      specparam TDVSS   = (18.7:26.3:41.7);
      specparam TDVSH   = (115.4:183.3:325.4);

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
      $setuphold ( posedge CK &&& con_A,          posedge A[8], TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CK &&& con_A,          negedge A[8], TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CK &&& con_A,          posedge A[9], TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CK &&& con_A,          negedge A[9], TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CK &&& con_A,          posedge A[10], TAS,     TAH,     n_flag_A10     );
      $setuphold ( posedge CK &&& con_A,          negedge A[10], TAS,     TAH,     n_flag_A10     );
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
      $setuphold ( posedge CK,                    posedge CS, TCSS,    TCSH,    n_flag_CS      );
      $setuphold ( posedge CK,                    negedge CS, TCSS,    TCSH,    n_flag_CS      );
      $period    ( posedge CK &&& ck_per,         TRC,                       n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per6,        TRC_6,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per8,        TRC_8,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per10,       TRC_10,                    n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );


      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[0] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[1] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[2] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[3] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[4] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[5] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[6] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[7] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[8] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[9] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[10] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[11] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[12] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[13] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[14] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[15] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[16] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[17] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[18] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[19] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[20] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[21] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[22] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[23] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[24] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[25] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[26] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[27] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[28] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[29] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[30] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO[31] :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[0] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[1] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[2] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[3] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[4] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[5] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[6] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[7] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[8] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[9] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[10] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[11] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[12] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[13] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[14] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[15] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[16] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[17] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[18] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[19] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[20] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[21] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[22] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[23] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[24] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[25] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[26] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[27] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[28] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[29] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[30] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO[31] :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[0] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[1] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[2] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[3] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[4] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[5] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[6] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[7] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[8] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[9] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[10] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[11] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[12] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[13] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[14] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[15] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[16] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[17] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[18] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[19] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[20] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[21] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[22] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[23] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[24] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[25] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[26] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[27] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[28] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[29] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[30] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO[31] :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[0] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[1] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[2] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[3] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[4] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[5] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[6] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[7] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[8] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[9] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[10] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[11] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[12] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[13] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[14] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[15] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[16] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[17] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[18] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[19] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[20] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[21] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[22] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[23] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[24] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[25] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[26] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[27] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[28] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[29] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[30] :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO[31] :1'bx)) = TAA_10;


   endspecify

`endprotect
endmodule
