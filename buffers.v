module buffer #(
    parameter DATA_WIDTH = 16,
    parameter DEPTH      = 8
)(
    input  wire                         clk,
    input  wire                         nrst,

    input  wire signed [DATA_WIDTH-1:0] in_real,
    input  wire signed [DATA_WIDTH-1:0] in_imag,

    output reg  signed [DATA_WIDTH-1:0] delayed_real,
    output reg  signed [DATA_WIDTH-1:0] delayed_imag
);

localparam PTR_LEN = (DEPTH <= 1) ? 1 : $clog2(DEPTH);

reg signed [DATA_WIDTH-1:0] mem_real [0:DEPTH-1];
reg signed [DATA_WIDTH-1:0] mem_imag [0:DEPTH-1];

reg [PTR_LEN-1:0] ptr;

integer i;

always @(posedge clk or negedge nrst) begin
    if (!nrst) begin
        delayed_real <= '0;
        delayed_imag <= '0;
        ptr          <= '0;

        for (i = 0; i < DEPTH; i = i + 1) begin
            mem_real[i] <= '0;
            mem_imag[i] <= '0;
        end
    end
    else begin
        delayed_real <= mem_real[ptr];
        delayed_imag <= mem_imag[ptr];

        mem_real[ptr] <= in_real;
        mem_imag[ptr] <= in_imag;

        ptr <= ptr + 1'b1;
    end
end

endmodule