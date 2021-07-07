module edge_cap(clk, rstn, pulse, pos_edge, neg_edge);
  input clk;
  input rstn;
  input pulse;

  output pos_edge;
  output neg_edge;

  reg pulse_r1;
  reg pulse_r2;

  always @(posedge clk or negedge rstn) begin : proc_pulse_r1
    if(~rstn) begin
      pulse_r1 <= 0;
      pulse_r2 <= 0;
    end else begin
      pulse_r1 <= pulse;
      pulse_r2 <= pulse_r1;
    end
  end

  assign pos_edge = (pulse_r1 && ~pulse_r2) ? 1 : 0;
  assign neg_edge = (~pulse_r1 && pulse_r2) ? 1 : 0;

endmodule // edge_cap