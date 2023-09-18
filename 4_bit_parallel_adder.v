module full_adder(cout, s, a, b, cin);
    output cout, s;
    input a, b, cin;
    wire x, y, z;
    xor(x, a, b);
    xor(s, x, cin);
    and(y, x, cin);
    and(z, a, b);
    or(cout, y, z);
endmodule

module parallel_adder_4bit(s, cout, cin, a, b);
    output [3:0] s;
    output cout;
    input cin;
    input [3:0] a, b;
    wire c0, c1, c2;
    wire y1, y2, y3, y4;

    full_adder FA0(c0, s[0], a[0], b[0], cin);
    full_adder FA1(c1, s[1], a[1], b[1], c0);
    full_adder FA2(c2, s[2], a[2], b[2], c1);
    full_adder FA3(cout, s[3], a[3], b[3], c2);
endmodule

module PA_4bit_tb();
    wire [3:0] S;
    wire COUT;
    reg [3:0] A, B;
    reg CIN;

    parallel_adder_4bit PA4(S, COUT, CIN, A, B);
    
    initial
    begin
        $dumpfile("Adder.vcd");
        $dumpvars;
        
        CIN = 0; A = 4'b1000; B = 4'b1000; #10;
        CIN = 0; A = 4'b1011; B = 4'b1011; #10;
        CIN = 0; A = 4'b1001; B = 4'b1001; #10;
        CIN = 0; A = 4'b0111; B = 4'b0111; #10;
      
    end
endmodule