`define WIDTH 256
`define SIZE 8
`define OUT_WIDTH (`WIDTH + 16)
`define HALF_WIDTH (`WIDTH / 2)


module twiddle_factors(output logic signed[15:0]twiddle_real[`HALF_WIDTH-1:0], 
                        output logic signed[15:0]twiddle_imag[`HALF_WIDTH-1:0]);
    initial begin
        twiddle_real[0] = 16'sd32767; twiddle_imag[0] = 16'sd0;
        twiddle_real[1] = 16'sd32758; twiddle_imag[1] = -16'sd804;
        twiddle_real[2] = 16'sd32729; twiddle_imag[2] = -16'sd1608;
        twiddle_real[3] = 16'sd32679; twiddle_imag[3] = -16'sd2411;
        twiddle_real[4] = 16'sd32610; twiddle_imag[4] = -16'sd3212;
        twiddle_real[5] = 16'sd32522; twiddle_imag[5] = -16'sd4011;
        twiddle_real[6] = 16'sd32413; twiddle_imag[6] = -16'sd4808;
        twiddle_real[7] = 16'sd32286; twiddle_imag[7] = -16'sd5602;
        twiddle_real[8] = 16'sd32138; twiddle_imag[8] = -16'sd6393;
        twiddle_real[9] = 16'sd31972; twiddle_imag[9] = -16'sd7180;
        twiddle_real[10] = 16'sd31786; twiddle_imag[10] = -16'sd7962;
        twiddle_real[11] = 16'sd31581; twiddle_imag[11] = -16'sd8740;
        twiddle_real[12] = 16'sd31357; twiddle_imag[12] = -16'sd9512;
        twiddle_real[13] = 16'sd31114; twiddle_imag[13] = -16'sd10279;
        twiddle_real[14] = 16'sd30853; twiddle_imag[14] = -16'sd11039;
        twiddle_real[15] = 16'sd30572; twiddle_imag[15] = -16'sd11793;
        twiddle_real[16] = 16'sd30274; twiddle_imag[16] = -16'sd12540;
        twiddle_real[17] = 16'sd29957; twiddle_imag[17] = -16'sd13279;
        twiddle_real[18] = 16'sd29622; twiddle_imag[18] = -16'sd14010;
        twiddle_real[19] = 16'sd29269; twiddle_imag[19] = -16'sd14733;
        twiddle_real[20] = 16'sd28899; twiddle_imag[20] = -16'sd15447;
        twiddle_real[21] = 16'sd28511; twiddle_imag[21] = -16'sd16151;
        twiddle_real[22] = 16'sd28106; twiddle_imag[22] = -16'sd16846;
        twiddle_real[23] = 16'sd27684; twiddle_imag[23] = -16'sd17531;
        twiddle_real[24] = 16'sd27246; twiddle_imag[24] = -16'sd18205;
        twiddle_real[25] = 16'sd26791; twiddle_imag[25] = -16'sd18868;
        twiddle_real[26] = 16'sd26320; twiddle_imag[26] = -16'sd19520;
        twiddle_real[27] = 16'sd25833; twiddle_imag[27] = -16'sd20160;
        twiddle_real[28] = 16'sd25330; twiddle_imag[28] = -16'sd20788;
        twiddle_real[29] = 16'sd24812; twiddle_imag[29] = -16'sd21403;
        twiddle_real[30] = 16'sd24279; twiddle_imag[30] = -16'sd22006;
        twiddle_real[31] = 16'sd23732; twiddle_imag[31] = -16'sd22595;
        twiddle_real[32] = 16'sd23170; twiddle_imag[32] = -16'sd23170;
        twiddle_real[33] = 16'sd22595; twiddle_imag[33] = -16'sd23732;
        twiddle_real[34] = 16'sd22006; twiddle_imag[34] = -16'sd24279;
        twiddle_real[35] = 16'sd21403; twiddle_imag[35] = -16'sd24812;
        twiddle_real[36] = 16'sd20788; twiddle_imag[36] = -16'sd25330;
        twiddle_real[37] = 16'sd20160; twiddle_imag[37] = -16'sd25833;
        twiddle_real[38] = 16'sd19520; twiddle_imag[38] = -16'sd26320;
        twiddle_real[39] = 16'sd18868; twiddle_imag[39] = -16'sd26791;
        twiddle_real[40] = 16'sd18205; twiddle_imag[40] = -16'sd27246;
        twiddle_real[41] = 16'sd17531; twiddle_imag[41] = -16'sd27684;
        twiddle_real[42] = 16'sd16846; twiddle_imag[42] = -16'sd28106;
        twiddle_real[43] = 16'sd16151; twiddle_imag[43] = -16'sd28511;
        twiddle_real[44] = 16'sd15447; twiddle_imag[44] = -16'sd28899;
        twiddle_real[45] = 16'sd14733; twiddle_imag[45] = -16'sd29269;
        twiddle_real[46] = 16'sd14010; twiddle_imag[46] = -16'sd29622;
        twiddle_real[47] = 16'sd13279; twiddle_imag[47] = -16'sd29957;
        twiddle_real[48] = 16'sd12540; twiddle_imag[48] = -16'sd30274;
        twiddle_real[49] = 16'sd11793; twiddle_imag[49] = -16'sd30572;
        twiddle_real[50] = 16'sd11039; twiddle_imag[50] = -16'sd30853;
        twiddle_real[51] = 16'sd10279; twiddle_imag[51] = -16'sd31114;
        twiddle_real[52] = 16'sd9512; twiddle_imag[52] = -16'sd31357;
        twiddle_real[53] = 16'sd8740; twiddle_imag[53] = -16'sd31581;
        twiddle_real[54] = 16'sd7962; twiddle_imag[54] = -16'sd31786;
        twiddle_real[55] = 16'sd7180; twiddle_imag[55] = -16'sd31972;
        twiddle_real[56] = 16'sd6393; twiddle_imag[56] = -16'sd32138;
        twiddle_real[57] = 16'sd5602; twiddle_imag[57] = -16'sd32286;
        twiddle_real[58] = 16'sd4808; twiddle_imag[58] = -16'sd32413;
        twiddle_real[59] = 16'sd4011; twiddle_imag[59] = -16'sd32522;
        twiddle_real[60] = 16'sd3212; twiddle_imag[60] = -16'sd32610;
        twiddle_real[61] = 16'sd2411; twiddle_imag[61] = -16'sd32679;
        twiddle_real[62] = 16'sd1608; twiddle_imag[62] = -16'sd32729;
        twiddle_real[63] = 16'sd804; twiddle_imag[63] = -16'sd32758;
        twiddle_real[64] = 16'sd0; twiddle_imag[64] = -16'sd32768;
        twiddle_real[65] = -16'sd804; twiddle_imag[65] = -16'sd32758;
        twiddle_real[66] = -16'sd1608; twiddle_imag[66] = -16'sd32729;
        twiddle_real[67] = -16'sd2411; twiddle_imag[67] = -16'sd32679;
        twiddle_real[68] = -16'sd3212; twiddle_imag[68] = -16'sd32610;
        twiddle_real[69] = -16'sd4011; twiddle_imag[69] = -16'sd32522;
        twiddle_real[70] = -16'sd4808; twiddle_imag[70] = -16'sd32413;
        twiddle_real[71] = -16'sd5602; twiddle_imag[71] = -16'sd32286;
        twiddle_real[72] = -16'sd6393; twiddle_imag[72] = -16'sd32138;
        twiddle_real[73] = -16'sd7180; twiddle_imag[73] = -16'sd31972;
        twiddle_real[74] = -16'sd7962; twiddle_imag[74] = -16'sd31786;
        twiddle_real[75] = -16'sd8740; twiddle_imag[75] = -16'sd31581;
        twiddle_real[76] = -16'sd9512; twiddle_imag[76] = -16'sd31357;
        twiddle_real[77] = -16'sd10279; twiddle_imag[77] = -16'sd31114;
        twiddle_real[78] = -16'sd11039; twiddle_imag[78] = -16'sd30853;
        twiddle_real[79] = -16'sd11793; twiddle_imag[79] = -16'sd30572;
        twiddle_real[80] = -16'sd12540; twiddle_imag[80] = -16'sd30274;
        twiddle_real[81] = -16'sd13279; twiddle_imag[81] = -16'sd29957;
        twiddle_real[82] = -16'sd14010; twiddle_imag[82] = -16'sd29622;
        twiddle_real[83] = -16'sd14733; twiddle_imag[83] = -16'sd29269;
        twiddle_real[84] = -16'sd15447; twiddle_imag[84] = -16'sd28899;
        twiddle_real[85] = -16'sd16151; twiddle_imag[85] = -16'sd28511;
        twiddle_real[86] = -16'sd16846; twiddle_imag[86] = -16'sd28106;
        twiddle_real[87] = -16'sd17531; twiddle_imag[87] = -16'sd27684;
        twiddle_real[88] = -16'sd18205; twiddle_imag[88] = -16'sd27246;
        twiddle_real[89] = -16'sd18868; twiddle_imag[89] = -16'sd26791;
        twiddle_real[90] = -16'sd19520; twiddle_imag[90] = -16'sd26320;
        twiddle_real[91] = -16'sd20160; twiddle_imag[91] = -16'sd25833;
        twiddle_real[92] = -16'sd20788; twiddle_imag[92] = -16'sd25330;
        twiddle_real[93] = -16'sd21403; twiddle_imag[93] = -16'sd24812;
        twiddle_real[94] = -16'sd22006; twiddle_imag[94] = -16'sd24279;
        twiddle_real[95] = -16'sd22595; twiddle_imag[95] = -16'sd23732;
        twiddle_real[96] = -16'sd23170; twiddle_imag[96] = -16'sd23170;
        twiddle_real[97] = -16'sd23732; twiddle_imag[97] = -16'sd22595;
        twiddle_real[98] = -16'sd24279; twiddle_imag[98] = -16'sd22006;
        twiddle_real[99] = -16'sd24812; twiddle_imag[99] = -16'sd21403;
        twiddle_real[100] = -16'sd25330; twiddle_imag[100] = -16'sd20788;
        twiddle_real[101] = -16'sd25833; twiddle_imag[101] = -16'sd20160;
        twiddle_real[102] = -16'sd26320; twiddle_imag[102] = -16'sd19520;
        twiddle_real[103] = -16'sd26791; twiddle_imag[103] = -16'sd18868;
        twiddle_real[104] = -16'sd27246; twiddle_imag[104] = -16'sd18205;
        twiddle_real[105] = -16'sd27684; twiddle_imag[105] = -16'sd17531;
        twiddle_real[106] = -16'sd28106; twiddle_imag[106] = -16'sd16846;
        twiddle_real[107] = -16'sd28511; twiddle_imag[107] = -16'sd16151;
        twiddle_real[108] = -16'sd28899; twiddle_imag[108] = -16'sd15447;
        twiddle_real[109] = -16'sd29269; twiddle_imag[109] = -16'sd14733;
        twiddle_real[110] = -16'sd29622; twiddle_imag[110] = -16'sd14010;
        twiddle_real[111] = -16'sd29957; twiddle_imag[111] = -16'sd13279;
        twiddle_real[112] = -16'sd30274; twiddle_imag[112] = -16'sd12540;
        twiddle_real[113] = -16'sd30572; twiddle_imag[113] = -16'sd11793;
        twiddle_real[114] = -16'sd30853; twiddle_imag[114] = -16'sd11039;
        twiddle_real[115] = -16'sd31114; twiddle_imag[115] = -16'sd10279;
        twiddle_real[116] = -16'sd31357; twiddle_imag[116] = -16'sd9512;
        twiddle_real[117] = -16'sd31581; twiddle_imag[117] = -16'sd8740;
        twiddle_real[118] = -16'sd31786; twiddle_imag[118] = -16'sd7962;
        twiddle_real[119] = -16'sd31972; twiddle_imag[119] = -16'sd7180;
        twiddle_real[120] = -16'sd32138; twiddle_imag[120] = -16'sd6393;
        twiddle_real[121] = -16'sd32286; twiddle_imag[121] = -16'sd5602;
        twiddle_real[122] = -16'sd32413; twiddle_imag[122] = -16'sd4808;
        twiddle_real[123] = -16'sd32522; twiddle_imag[123] = -16'sd4011;
        twiddle_real[124] = -16'sd32610; twiddle_imag[124] = -16'sd3212;
        twiddle_real[125] = -16'sd32679; twiddle_imag[125] = -16'sd2411;
        twiddle_real[126] = -16'sd32729; twiddle_imag[126] = -16'sd1608;
        twiddle_real[127] = -16'sd32758; twiddle_imag[127] = -16'sd804;  
    end

endmodule

module bit_reversal(
    input [`SIZE-1:0] in[`WIDTH-1:0],
    output reg [`SIZE-1:0] out[`WIDTH-1:0]
);
    integer i, j;
    reg [`SIZE-1:0] reversed_bits;
    always @(*) begin
        for (i = 0; i < `WIDTH; i = i + 1) begin
            for (j = 0; j < `SIZE; j = j + 1)
                reversed_bits[j] = i[`SIZE-1-j];
            out[i] = in[reversed_bits];
        end
    end
endmodule

module add_sub(
    input signed [`OUT_WIDTH-1:0] in_real[`WIDTH-1:0],
    input signed [`OUT_WIDTH-1:0] in_imag[`WIDTH-1:0],
    output reg signed [`OUT_WIDTH-1:0] out_real[`WIDTH-1:0],
    output reg signed [`OUT_WIDTH-1:0] out_imag[`WIDTH-1:0],
    output reg done
);
    logic signed[15:0] twiddle_real[`HALF_WIDTH-1:0];
    logic signed[15:0] twiddle_imag[`HALF_WIDTH-1:0];

    twiddle_factors uut(twiddle_real, twiddle_imag);

    integer i, j, k, jump;
    reg [`SIZE-1:0] num; 

    reg signed [`OUT_WIDTH-1:0] inter1_real[`WIDTH-1:0];
    reg signed [`OUT_WIDTH-1:0] inter1_imag[`WIDTH-1:0];
    reg signed [`OUT_WIDTH-1:0] inter2_real[`WIDTH-1:0];
    reg signed [`OUT_WIDTH-1:0] inter2_imag[`WIDTH-1:0];

    task complex_multiply;

        input logic signed [15:0] mul1_real;
        input logic signed [15:0] mul1_imag;
        input logic signed [`OUT_WIDTH - 1:0] mul2_real;
        input logic signed [`OUT_WIDTH - 1:0] mul2_imag;
        output reg signed [`OUT_WIDTH - 1:0] out_real;
        output reg signed [`OUT_WIDTH - 1:0] out_imag;

        logic signed [`OUT_WIDTH + 15:0] temp_real;
        logic signed [`OUT_WIDTH + 15:0] temp_imag;

        begin

            temp_real = (mul1_real * mul2_real) - (mul1_imag * mul2_imag);
            temp_imag = (mul1_real * mul2_imag) + (mul1_imag * mul2_real);

            out_real = temp_real >>> 15;
            out_imag = temp_imag >>> 15;

        end

    endtask

    always @(in_real[0] or in_imag[0]) begin
        done = 1'b0;
        for (i = 0; i < `SIZE; i = i + 1) begin
            num = 2**i;
            k = 0;
            jump = `HALF_WIDTH/num;

            for (j = 0; j < `WIDTH; j = j + 1) begin
                if (i != 0) begin 
                    if ((j & num) != 0) begin
                        k = (j % num) * jump;
                        if (i % 2 != 0) begin
                            complex_multiply(twiddle_real[k], twiddle_imag[k], inter1_real[j], inter1_imag[j], inter1_real[j], inter1_imag[j]);
                        end 
                        else begin
                            complex_multiply(twiddle_real[k], twiddle_imag[k], inter2_real[j], inter2_imag[j], inter2_real[j], inter2_imag[j]);
                        end
                    end
                end
            end

            for (j = 0; j < `WIDTH; j = j + 1) begin
                if (i == 0) begin
                    if ((j & num) == 0) begin
                        inter1_real[j] = in_real[j] + in_real[j + 1];
                        inter1_imag[j] = in_imag[j] + in_imag[j + 1];
                    end
                    else begin
                        inter1_real[j] = in_real[j - 1] - in_real[j];
                        inter1_imag[j] = in_imag[j - 1] - in_imag[j];
                    end
                end
                else begin
                    if (i % 2 != 0) begin
                        if ((j & num) == 0) begin
                            inter2_real[j] = inter1_real[j] + inter1_real[j + num];
                            inter2_imag[j] = inter1_imag[j] + inter1_imag[j + num];
                        end
                        else begin
                            inter2_real[j] = inter1_real[j - num] - inter1_real[j];
                            inter2_imag[j] = inter1_imag[j - num] - inter1_imag[j];
                        end
                    end
                    else
                        if ((j & num) == 0) begin
                            inter1_real[j] = inter2_real[j] + inter2_real[j + num];
                            inter1_imag[j] = inter2_imag[j] + inter2_imag[j + num];
                        end
                        else begin
                            inter1_real[j] = inter2_real[j - num] - inter2_real[j];
                            inter1_imag[j] = inter2_imag[j - num] - inter2_imag[j];
                        end
                end
            end
        end
        for (i = 0; i < `WIDTH; i = i + 1) begin
            if (`SIZE % 2 == 0) begin
                out_real[i] = inter2_real[i];
                out_imag[i] = inter2_imag[i];
            end else begin
                out_real[i] = inter1_real[i];
                out_imag[i] = inter1_imag[i];
            end
        end
        done = 1'b1;
        $display("done");
    end
endmodule
