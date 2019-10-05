/*
  MIT License

  Copyright (c) 2019 Richard Eng

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

/*
  Pong - Horizontal Sync Circuit
  ------------------------------
*/
`default_nettype none

module hsync
(
    input wire  mclk, clk7_159, _hreset, h16, h32, h64,
    output wire hblank, _hblank, _hsync
);

// hack-hack: "and" with clock to simulate propagation delay of ripple counter...
srlatch h5bc(mclk, ~(h16 & h64 & clk7_159), _hreset, _hblank, hblank);
assign _hsync = ~(hblank & h32);


/*
wire g5b_to_h5b, add_delay;

reg delayed_wire;

always @(posedge clk7_159 //posedge gclk//) begin
  delayed_wire <= add_delay;
end

assign g5b_to_h5b = delayed_wire;

ls10 g5b(h16, h64, h64, add_delay);

wire _hblank_tmp;
ls00 h5b(g5b_to_h5b, hblank, _hblank_tmp);

reg _hblank_reg;
always @(posedge gclk) begin
  _hblank_reg <= _hblank_tmp;
end
assign _hblank = _hblank_reg;

wire hblank_tmp;
ls00 h5c(_hblank, _hreset, hblank_tmp);

reg hblank_reg;
always @(posedge gclk) begin
  hblank_reg <= hblank_tmp;
end
assign hblank = hblank_reg;

ls00 h5d(hblank, h32, _hsync);
*/

endmodule

