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

//generating all buffers
genvar i; 
generate
    for(i=0; i<SIZE; i=i+1) begin : DELAYS
        buffer #(.DEPTH(1 << i), .DATA_WIDTH(FFT_WIDTH - i))
        buff_inst(
            .clk(clk),
            .rst_n(rst_n),
            .in_real(delay_in_real),
            .in_imag(delay_in_imag),
            .delayed_real(delayed_real),
            .delayed_imag(delayed_imag)
        );
    end
endgenerate;

generate
    for(i=0; i<SIZE; i=i+1) begin : TWIDDLE_MUL
        complex_multiply #(.DATA_WIDTH(FFT_WIDTH - i))
        cmplx_mult_inst(
            .clk(clk),
            .in1_real(twiddle_real),
            .in1_imag(twiddle_imag),
            .in2_real(in_even_real),
            .in2_imag(in_even_imag),
            .out_real(inter_real),
            .out_imag(inter_imag)
        );
    end
endgenerate;

generate
    for(i=0; i<SIZE; i=i+1) begin : ADDSUB
        add_sub #(.DATA_WIDTH(FFT_WIDTH - i))
        addsub_inst(
            .clk(clk),
            .in1_real(inter_real),
            .in1_imag(inter_imag),
            .in2_real(delayed_real),
            .in2_imag(delayed_imag),
            .out1_real(out1_real),
            .out1_imag(out1_imag),
            .out2_real(out2_real),
            .out2_imag(out2_imag)
        );
    end
endgenerate;

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        out_real <= 0;
        out_imag <= 0;
    end else begin
    end
end

endmodule