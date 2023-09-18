module full_adderv2(cout,s,a,b,cin);
    input a,b,cin;
    output s,cout;
    wire x,y,z;

    xor(x,a,b);
    xor(s,x,cin);
    and(y,x,cin);
    and(z,a,b);
    or(cout,y,z);

endmodule

//test bench
module full_adderv2_TB();
    wire s,cout;
    reg a,b,cin;
    //instantiate
    full_adderv2 FAV2 (cout,s,a,b,cin);
    initial begin
        $dumpfile("FAV2TB.vcd");
        $dumpvars;
        a=0; b=0; cin=0; #10;
        a=0; b=0; cin=1; #10;
        a=0; b=1; cin=0; #10;
        a=0; b=1; cin=1; #10;
        a=1; b=0; cin=0; #10;
        a=1; b=0; cin=1; #10;
        a=1; b=1; cin=0; #10;
        a=1; b=1; cin=1; #10;
    end
endmodule
 

