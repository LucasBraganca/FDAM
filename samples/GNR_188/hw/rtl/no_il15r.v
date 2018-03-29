
module no_il15r
(
  input clk,
  input start,
  input rst,
  input reset_nos,
  input start_s0,
  input start_s1,
  input init_state,
  input [1-1:0] cgc_s0,
  input [1-1:0] cgc_s1,
  input [1-1:0] il15ra_s0,
  input [1-1:0] il15ra_s1,
  input [1-1:0] il2rb_s0,
  input [1-1:0] il2rb_s1,
  input [1-1:0] il15_e_s0,
  input [1-1:0] il15_e_s1,
  output reg [1-1:0] s0,
  output reg [1-1:0] s1,
  output [1-1:0] il15r_s0,
  output [1-1:0] il15r_s1
);

  reg pass;

  always @(posedge clk) begin
    if(rst) begin
      s0 <= 1'd0;
      pass <= 1'b0;
    end else begin
      if(reset_nos) begin
        s0 <= init_state;
        pass <= 1;
      end else begin
        if(start_s0) begin
          if(pass) begin
            s0 <=  ( cgc_s0 & ( ( ( il15ra_s0 & il2rb_s0 & il15_e_s0 ) ) ) ) ;
            pass <= 0;
          end else begin
            pass <= 1;
          end
        end 
      end
    end
  end


  always @(posedge clk) begin
    if(rst) begin
      s1 <= 1'd0;
    end else begin
      if(reset_nos) begin
        s1 <= init_state;
      end else begin
        if(start_s1) begin
          s1 <=  ( cgc_s1 & ( ( ( il15ra_s1 & il2rb_s1 & il15_e_s1 ) ) ) ) ;
        end 
      end
    end
  end

  assign il15r_s0 = s0;
  assign il15r_s1 = s1;

endmodule
