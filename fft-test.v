    `timescale 1 ns / 1 ps
    `define WIDTH 256
    `define SIZE 8
    `define OUT_WIDTH (`WIDTH + 16)
    `define HALF_WIDTH (`WIDTH / 2)

    module testbench_tb;
        reg [`SIZE-1:0] A[`WIDTH-1:0];
        wire [`SIZE-1:0] B[`WIDTH-1:0];
        wire signed [`OUT_WIDTH -1:0] out_real[`WIDTH-1:0];
        wire signed [`OUT_WIDTH -1:0] out_imag[`WIDTH-1:0];
        reg signed [`OUT_WIDTH -1:0] B_new_real[`WIDTH-1:0];
        reg signed [`OUT_WIDTH -1:0] B_new_imag[`WIDTH-1:0];
        wire done;
        integer i;

        real start_time;
        real end_time;

        bit_reversal uut1(.in(A), .out(B));
        add_sub uut2(.in_real(B_new_real), .in_imag(B_new_imag), .out_real(out_real), .out_imag(out_imag), .done(done));
        always @(*) begin
            for (i = 0; i < `WIDTH; i = i + 1) begin
                B_new_real[i] = $unsigned(B[i]) <<< 15;       
                B_new_imag[i] = {`OUT_WIDTH{1'sd0}};
            end
        end
        initial begin
            $dumpfile("test.vcd");
            $dumpvars(0, testbench_tb);
            $display("Test testbench");
            for(i = 0; i < `WIDTH; i = i + 1) begin
                A[i] = i; 
            end

            start_time = $realtime;

            fork begin
                @(posedge done);
            end
            begin
                #1000;
                $display("Error.");
                $finish;
            end
            join_any
            disable fork;


            $display("Bit reversal module");
            for (i = 0; i < `WIDTH; i = i + 1) begin
                $display("%b %b", A[i], B[i]);
            end
            $display("Add-Sub");
            for (i = 0; i < `WIDTH; i = i + 1) begin
                if ($itor($signed(out_imag[i])) < 0)
                    $display("%0d + 0j : %.4f - %.4f j", A[i], $itor($signed(out_real[i])) / 32768.0, -$itor($signed(out_imag[i])) / 32768.0);
                else
                    $display("%0d + 0j : %.4f + %.4f j", A[i], $itor($signed(out_real[i])) / 32768.0, $itor($signed(out_imag[i])) / 32768.0);
            end
            $display("Time: %0f ns", (end_time - start_time));
        end
        
    endmodule
