/*******************************************************************************
________________________________________________________________________________________________________________


            Synchronous RVT Periphery Via1 Programmable ROM Compiler

                UMC 40nm Logic Low Power and Low K Process

________________________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________________________

       IP Name            :  FSH0L_B_SP                                                                         
       IP Version         :  1.3.0                                                                              
       IP Release Status  :  Active                                                                             
       Word               :  2048                                                                               
       Bit                :  32                                                                                 
       Mux                :  1                                                                                  
       Rom Code Version   :  A                                                                                  
       Rom Code Format    :  bin                                                                                
       Rom Code File      :  /home/autumn/pdk/memory/ftclib/SPLB40_2048X32BM1A/SPLB40_2048X32BM1A_All0.romcode  
       Output Loading     :  0.3                                                                                
       Clock Input Slew   :  0.4                                                                                
       Data Input Slew    :  0.4                                                                                
       Ring Type          :  Ringless Model                                                                     
       Ring Width         :  0                                                                                  
       Bus Format         :  0                                                                                  
       Memaker Path       :  /home/autumn/pdk/memory/ftclib                                                     
       GUI Version        :  m20130120                                                                          
       Date               :  2024/07/25 10:27:10                                                                
________________________________________________________________________________________________________________


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


module SPLB40_2048X32BM1A (A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,DO0,DO1,DO2,DO3,
                           DO4,DO5,DO6,DO7,DO8,DO9,DO10,DO11,DO12,DO13,
                           DO14,DO15,DO16,DO17,DO18,DO19,DO20,DO21,
                           DO22,DO23,DO24,DO25,DO26,DO27,DO28,DO29,
                           DO30,DO31,DVSE,DVS3,DVS2,DVS1,DVS0,CK,CS);
  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `FALSE;           
  parameter  ROMCODE              = "/home/autumn/test/SPLB40_2048X32BM1A_All0.romcode";
  parameter  DVSize               = 4;                
  parameter  AddressSize          = 11;               
  parameter  Bits                 = 32;               
  parameter  Words                = 2048;             
  parameter  AspectRatio          = 1;                
  parameter  TOH                  = (75.5:119.4:214.0);
  parameter  TOH_6                = (75.5:119.4:214.0);
  parameter  TOH_8                = (75.5:119.4:214.0);
  parameter  TOH_10               = (75.5:119.4:214.0);

  output     DO0,DO1,DO2,DO3,DO4,DO5,DO6,DO7,DO8,
             DO9,DO10,DO11,DO12,DO13,DO14,DO15,DO16,DO17,DO18,
             DO19,DO20,DO21,DO22,DO23,DO24,DO25,DO26,DO27,DO28,
             DO29,DO30,DO31;
  input      A0,A1,A2,A3,A4,A5,A6,A7,A8,
             A9,A10;
  input      DVSE;                                    
  input      DVS0,DVS1,DVS2,DVS3;
  input      CK;                                      
  input      CS;                                      

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
  assign     DO_                  = {DO_i};
  assign     con_A                = CS_;
  assign     con_CK               = CS_;
  assign     ck_per               = CS_ & !DVSE_;
  assign     ck_per6              = CS_ & DVSE_ & !DVS_[0] & DVS_[1] & DVS_[2] & !DVS_[3];
  assign     ck_per8              = CS_ & DVSE_ & !DVS_[0] & !DVS_[1] & !DVS_[2] & DVS_[3];
  assign     ck_per10             = CS_ & DVSE_ & !DVS_[0] & DVS_[1] & !DVS_[2] & DVS_[3];
  assign     con_DVSE_W           = CS_;
  assign     con_DVS_W            = CS_ & DVSE_;
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
  buf        ick0            (CK_, CK);                    
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
  buf        ics0            (CS_, CS);                    
  buf        idvs0           (DVS_[0], DVS0);              
  buf        idvs1           (DVS_[1], DVS1);              
  buf        idvs2           (DVS_[2], DVS2);              
  buf        idvs3           (DVS_[3], DVS3);              
  buf        idvse           (DVSE_, DVSE);                



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



  always @(CK_) begin
    casez ({LastClkEdge,CK_})
      2'b01:
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
      $setuphold ( posedge CK &&& con_A,          posedge A6, TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_A,          negedge A6, TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_A,          posedge A7, TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CK &&& con_A,          negedge A7, TAS,     TAH,     n_flag_A7      );
      $setuphold ( posedge CK &&& con_A,          posedge A8, TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CK &&& con_A,          negedge A8, TAS,     TAH,     n_flag_A8      );
      $setuphold ( posedge CK &&& con_A,          posedge A9, TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CK &&& con_A,          negedge A9, TAS,     TAH,     n_flag_A9      );
      $setuphold ( posedge CK &&& con_A,          posedge A10, TAS,     TAH,     n_flag_A10     );
      $setuphold ( posedge CK &&& con_A,          negedge A10, TAS,     TAH,     n_flag_A10     );
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
      $setuphold ( posedge CK,                    posedge CS, TCSS,    TCSH,    n_flag_CS      );
      $setuphold ( posedge CK,                    negedge CS, TCSS,    TCSH,    n_flag_CS      );
      $period    ( posedge CK &&& ck_per,         TRC,                       n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per6,        TRC_6,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per8,        TRC_8,                     n_flag_CK_PER  );
      $period    ( posedge CK &&& ck_per10,       TRC_10,                    n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );


      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO0 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO1 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO2 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO3 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO4 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO5 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO6 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO7 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO8 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO9 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO10 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO11 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO12 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO13 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO14 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO15 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO16 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO17 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO18 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO19 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO20 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO21 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO22 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO23 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO24 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO25 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO26 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO27 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO28 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO29 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO30 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvse)  (posedge CK => (DO31 :1'bx)) = TAA  ;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO0 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO1 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO2 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO3 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO4 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO5 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO6 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO7 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO8 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO9 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO10 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO11 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO12 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO13 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO14 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO15 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO16 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO17 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO18 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO19 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO20 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO21 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO22 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO23 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO24 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO25 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO26 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO27 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO28 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO29 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO30 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs6)  (posedge CK => (DO31 :1'bx)) = TAA_6;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO0 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO1 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO2 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO3 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO4 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO5 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO6 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO7 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO8 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO9 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO10 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO11 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO12 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO13 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO14 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO15 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO16 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO17 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO18 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO19 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO20 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO21 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO22 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO23 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO24 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO25 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO26 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO27 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO28 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO29 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO30 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs8)  (posedge CK => (DO31 :1'bx)) = TAA_8;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO0 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO1 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO2 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO3 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO4 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO5 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO6 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO7 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO8 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO9 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO10 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO11 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO12 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO13 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO14 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO15 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO16 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO17 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO18 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO19 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO20 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO21 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO22 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO23 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO24 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO25 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO26 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO27 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO28 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO29 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO30 :1'bx)) = TAA_10;
      if (NODELAY == 0 && con_dvs10)  (posedge CK => (DO31 :1'bx)) = TAA_10;

   endspecify

`endprotect
endmodule
