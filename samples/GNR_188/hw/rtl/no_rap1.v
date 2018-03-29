
module no_rap1
(
  input clk,
  input start,
  input rst,
  input reset_nos,
  input start_s0,
  input start_s1,
  input init_state,
  input [1-1:0] epac_s0,
  input [1-1:0] epac_s1,
  input [1-1:0] c3g_s0,
  input [1-1:0] c3g_s1,
  input [1-1:0] crk_s0,
  input [1-1:0] crk_s1,
  input [1-1:0] pka_s0,
  input [1-1:0] pka_s1,
  output reg [1-1:0] s0,
  output reg [1-1:0] s1,
  output [1-1:0] rap1_s0,
  output [1-1:0] rap1_s1
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
            s0 <=  ( epac_s0 ) | ( c3g_s0 & ( ( ( crk_s0 ) ) ) ) | ( pka_s0 ) ;
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
          s1 <=  ( epac_s1 ) | ( c3g_s1 & ( ( ( crk_s1 ) ) ) ) | ( pka_s1 ) ;
        end 
      end
    end
  end

  assign rap1_s0 = s0;
  assign rap1_s1 = s1;

endmodule
