module fifo #(
    parameter WIDTH = 32,
    parameter DEPTH = 4
)(
    input clk,
    input rst_n,
    input push,
    input [WIDTH-1:0] data_in,
    input pop,
    output reg [WIDTH-1:0] data_out,
    output reg empty,
    output reg full
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH):0] head, tail;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            head <= 0;
            tail <= 0;
            empty <= 1;
            full <= 0;
        end else begin
            if (push && !full) begin
                mem[head] <= data_in;
                head <= head + 1;
                if (head == DEPTH) head <= 0;
                if (head == tail) full <= 1;
                empty <= 0;
            end

            if (pop && !empty) begin
                data_out <= mem[tail];
                tail <= tail + 1;
                if (tail == DEPTH) tail <= 0;
                if (tail == head) empty <= 1;
                full <= 0;
            end
        end
    end

endmodule