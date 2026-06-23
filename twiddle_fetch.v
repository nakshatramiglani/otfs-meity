`timescale 1 ns / 1 ps

`define WIDTH 1024
`define SIZE 10
`define HALF_WIDTH (`WIDTH / 2)

`define DATA_WIDTH 32
`define TWIDDLE_WIDTH 16

module twiddle_factors(
    input logic clk,
    input logic rst_n,
    input logic [8:0] angle_idx,
    output logic signed[`TWIDDLE_WIDTH - 1:0] twiddle_real, 
    output logic signed[`TWIDDLE_WIDTH - 1:0] twiddle_imag
);
    (* ram_style = "distributed" *) logic signed [`TWIDDLE_WIDTH - 1 : 0] rom_real [0:255];
    (* ram_style = "distributed" *) logic signed [`TWIDDLE_WIDTH - 1 : 0] rom_imag [0:255];

    initial begin
        $readmemh("data/fft/twiddles_real_256.hex", rom_real);
        $readmemh("data/fft/twiddles_imag_256.hex", rom_imag);
    end

    logic signed [`TWIDDLE_WIDTH - 1:0] raw_r, raw_i;
    logic swap_flag;

    always_ff @(posedge clk) begin
        raw_r <= rom_real[angle_idx[7:0]];
        raw_i <= rom_imag[angle_idx[7:0]];
        swap_flag <= angle_idx[8];
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            twiddle_real <= 0;
            twiddle_imag <= 0;
        end
        else begin
            if (swap_flag) begin
                twiddle_real <= raw_i;
                twiddle_imag <= -raw_r;
            end
            else begin
                twiddle_real <= raw_r;
                twiddle_imag <= raw_i;
            end
        end
    end
endmodule