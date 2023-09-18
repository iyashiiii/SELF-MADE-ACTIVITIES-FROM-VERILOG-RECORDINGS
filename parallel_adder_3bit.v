module parallel_adder_3bit(q,a,b);
    input[2:0] a,b;
    output[3:0] q;
    wire [2:0] c;


    full_adder FA_0(c[0],q[0],a[0],b[0],1'b0);
    full_adder FA_1(c[1],q[1],a[1],b[1],c[0]);
    full_adder FA_2(q[3],q[2],a[2],b[2],c[1]);
endmodule

module full_adder(cout,s,a,b,cin);
    input a,b,cin;
    output cout, s;
    wire x,y,z;
    xor (x,a,b);
    xor (s,x,cin);
    and(y,x,cin);
    and(z,a,b);
    or(cout,y,z);
endmodule

module p_adder_3tb();
    reg[2:0] a,b;
    wire[3:0] q;

    parallel_adder_3bit PA3(q,a,b);
    initial begin
        $dumpfile("p_adder_3tb.vcd");
        $dumpvars;
            a = 3'b110; b = 3'b111; #1;

    end
endmodule
 