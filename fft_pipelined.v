`timescale 1ns/1ps

`include "stage.v"

module fft_top #(
    parameter WIDTH = 16,
    parameter IN_WIDTH = 32,
    parameter TWIDDLE_WIDTH = 16
)(
    input  logic clk,
    input  logic rst_n,
    input  logic signed [IN_WIDTH-1:0] in_real,
    input  logic signed [IN_WIDTH-1:0] in_imag,
    input  logic [$clog2(WIDTH)-1:0] sample_count,

    output logic signed [IN_WIDTH-1:0] out_real,
    output logic signed [IN_WIDTH-1:0] out_imag
);

    wire signed [IN_WIDTH-1:0] s1_to_s2_real, s1_to_s2_imag;
    wire signed [IN_WIDTH-1:0] s2_to_s3_real, s2_to_s3_imag;
    wire signed [IN_WIDTH-1:0] s3_to_s4_real, s3_to_s4_imag;

    logic [$clog2(WIDTH)-1:0] count_stage1;
    logic [$clog2(WIDTH)-1:0] count_stage2;
    logic [$clog2(WIDTH)-1:0] count_stage3;
    logic [$clog2(WIDTH)-1:0] count_stage4;

    (* ram_style="distributed" *) logic signed [TWIDDLE_WIDTH-1:0] rom_real [0:WIDTH/4-1];
    (* ram_style="distributed" *) logic signed [TWIDDLE_WIDTH-1:0] rom_imag [0:WIDTH/4-1];

    initial begin
        $readmemh("data/fft/twiddles_real.hex", rom_real);
        $readmemh("data/fft/twiddles_imag.hex", rom_imag);
    end

    // STAGE 1 
    assign count_stage1 = sample_count;
    
    stage #(.WIDTH(WIDTH), .IN_WIDTH(IN_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH), .STAGE(1)) stage1 (
        .clk(clk), .rst_n(rst_n),
        .in_real(in_real), .in_imag(in_imag), .rom_imag(rom_imag), .rom_real(rom_real), .sample_count(count_stage1),
        .out_real(s1_to_s2_real), .out_imag(s1_to_s2_imag)
    );

    logic [$clog2(WIDTH)-1:0] s1_delay_pipe [0:11];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) for(int j=0; j<12; j++) s1_delay_pipe[j] <= '0;
        else begin
            s1_delay_pipe[0] <= count_stage1;
            for(int j=1; j<12; j++) s1_delay_pipe[j] <= s1_delay_pipe[j-1];
        end
    end
    assign count_stage2 = s1_delay_pipe[11];

    // STAGE 2 
    stage #(.WIDTH(WIDTH), .IN_WIDTH(IN_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH), .STAGE(2)) stage2 (
        .clk(clk), .rst_n(rst_n),
        .in_real(s1_to_s2_real), .in_imag(s1_to_s2_imag), .sample_count(count_stage2), .rom_imag(rom_imag), .rom_real(rom_real),
        .out_real(s2_to_s3_real), .out_imag(s2_to_s3_imag)
    );

    logic [$clog2(WIDTH)-1:0] s2_delay_pipe [0:7];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) for(int j=0; j<8; j++) s2_delay_pipe[j] <= '0;
        else begin
            s2_delay_pipe[0] <= count_stage2;
            for(int j=1; j<8; j++) s2_delay_pipe[j] <= s2_delay_pipe[j-1];
        end
    end
    assign count_stage3 = s2_delay_pipe[7];

    // STAGE 3 
    stage #(.WIDTH(WIDTH), .IN_WIDTH(IN_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH), .STAGE(3)) stage3 (
        .clk(clk), .rst_n(rst_n),
        .in_real(s2_to_s3_real), .in_imag(s2_to_s3_imag), .sample_count(count_stage3), .rom_imag(rom_imag), .rom_real(rom_real),
        .out_real(s3_to_s4_real), .out_imag(s3_to_s4_imag)
    );

    logic [$clog2(WIDTH)-1:0] s3_delay_pipe [0:5];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) for(int j=0; j<6; j++) s3_delay_pipe[j] <= '0;
        else begin
            s3_delay_pipe[0] <= count_stage3;
            for(int j=1; j<6; j++) s3_delay_pipe[j] <= s3_delay_pipe[j-1];
        end
    end
    assign count_stage4 = s3_delay_pipe[5];

    // STAGE 4
    stage #(.WIDTH(WIDTH), .IN_WIDTH(IN_WIDTH), .TWIDDLE_WIDTH(TWIDDLE_WIDTH), .STAGE(4)) stage4 (
        .clk(clk), .rst_n(rst_n),
        .in_real(s3_to_s4_real), .in_imag(s3_to_s4_imag), .sample_count(count_stage4), .rom_imag(rom_imag), .rom_real(rom_real),
        .out_real(out_real), .out_imag(out_imag)
    );

endmodule