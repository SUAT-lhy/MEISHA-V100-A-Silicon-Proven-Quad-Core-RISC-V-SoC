
`define MSTD_CELL_EN
`ifndef SYNTHESIS  
`timescale 1ps/1ps
module dont_touch_tc_clk_delay #(
  parameter  Delay_f = 194 ,
  parameter  Delay_r =184
) (
  input  logic in_i,
  output logic out_o
);
initial begin  
  if(!(Delay_f==194||Delay_f==425||Delay_f==935)&&(Delay_r==184||Delay_r==389||Delay_r==812)) $warning("Warning: Delay_VALUE is illegal ");  
end
`ifdef MSTD_CELL_EN    

 if((Delay_f==194||Delay_f==425||Delay_f==935)&&(Delay_r==184||Delay_r==389||Delay_r==812))begin  
  //`CK_DELAY_STD_CELL_DONT_TOUCH
DLYN1LBRMX1 clk_delay (
    .I      (in_i),
    .O      (out_o) 
);  
 end  
else  begin    
    
    always @(posedge in_i) begin
       #Delay_r out_o = in_i;
    end
    always @(negedge in_i) begin
       #Delay_f out_o = in_i;
    end
  end

 

`else

  `ifndef VERILATOR  
  always @(posedge in_i) begin
    #(Delay_r) out_o = in_i;
  end
  always @(negedge in_i) begin
    #(Delay_f) out_o = in_i;
  end
  `endif

`endif 
endmodule
`endif
