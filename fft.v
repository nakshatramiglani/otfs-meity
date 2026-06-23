`timescale 1 ns / 1 ps

`define WIDTH 16
`define SIZE $clog2(`WIDTH)
`define HALF_WIDTH (`WIDTH / 2)

`define IN_WIDTH 16
`define TWIDDLE_WIDTH 16

`define OUT_WIDTH (`DATA_WIDTH + `SIZE)

`include "complex_multiply.v"
`include "fft_pipelined.v"
`include "twiddle_fetch.v"
`include "buffers.v"

module fft(
    input logic clk,
    input logic rst_n,
    input signed [`IN_WIDTH-1:0] in_real[`WIDTH-1:0],
    input signed [`IN_WIDTH-1:0] in_imag[`WIDTH-1:0],
    output reg signed [`OUT_WIDTH-1:0] out_real[`WIDTH-1:0],
    output reg signed [`OUT_WIDTH-1:0] out_imag[`WIDTH-1:0]
);



endmodule