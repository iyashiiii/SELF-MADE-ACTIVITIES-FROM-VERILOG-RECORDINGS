module parallel_adder2bitself(cout,s,a,b,cin);
    input[1:0] a,b;
    input cin;
    output[1:0] cout,s;
    wire c;

    full_adder FA1(cout[0],s[0],a[0],b[0],cin);
    full_adder FA2(cout[1],s[1],a[1],b[1],cout[0]);
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

module paralleladder2bit_selfTB();
    reg[1:0] a,b;
    reg cin;
    wire[1:0] cout,s;

    parallel_adder2bitself pa2bitTB(cout,s,a,b,cin);
    initial begin
        $dumpfile("2bitparalleladder_self_TB.vcd");
        $dumpvars;
            a = 2'b01; b = 2'b00; cin = 2'b01; #10;

    end
endmodule