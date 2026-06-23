`timescale 1 ns / 1 ps

`define WIDTH 16
`define SIZE 4
`define HALF_WIDTH (`WIDTH / 2)

`define DATA_WIDTH 16
`define TWIDDLE_WIDTH 16

`define OUT_WIDTH (`DATA_WIDTH + `TWIDDLE_WIDTH - 1 + `SIZE)

module complex_multiply(
    input logic clk,
    input logic rst_n,
    input logic signed [`TWIDDLE_WIDTH - 1:0] mul1_real,
    input logic signed [`TWIDDLE_WIDTH - 1:0] mul1_imag,
    input logic signed [`OUT_WIDTH - 1:0] mul2_real,
    input logic signed [`OUT_WIDTH - 1:0] mul2_imag,
    output reg signed [`OUT_WIDTH - 1:0] out_real,
    output reg signed [`OUT_WIDTH - 1:0] out_imag
);

    logic signed [`TWIDDLE_WIDTH + `OUT_WIDTH - 1:0] prr, pii, pri, pir;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prr <= 0;
            pii <= 0;
            pri <= 0;
            pir <= 0;
        end
        else begin
            prr <= mul1_real * mul2_real;
            pii <= mul1_imag * mul2_imag;
            pri <= mul1_real * mul2_imag;
            pir <= mul1_imag * mul2_real;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_real <= 0;
            out_imag <= 0;
        end
        else begin
            out_real <= (prr - pii) >>> (`TWIDDLE_WIDTH - 1);
            out_imag <= (pri + pir) >>> (`TWIDDLE_WIDTH - 1);
        end
    end
endmodule