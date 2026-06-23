`include "complex_multiply.v"
`include "add_sub.v"
`include "twiddle_fetch.v"
`include "buffers.v"

module fft #(
    parameter WIDTH = 16,
    parameter DATA_WIDTH = 16,
    parameter TWIDDLE_WIDTH = 16
)(
    input logic clk,
    input logic rst_n,

    input logic signed [DATA_WIDTH-1:0] in_real,
    input logic signed [DATA_WIDTH-1:0] in_imag,

    output logic signed [FFT_WIDTH-1:0] out_real,
    output logic signed [FFT_WIDTH-1:0] out_imag
);

localparam SIZE      = $clog2(WIDTH);
localparam FFT_WIDTH = DATA_WIDTH + SIZE;

endmodule