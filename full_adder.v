module full_adder(cout,s,a,b,cin);
    output cout,s;
    input a,b,cin;
    wire x,y,z;
    xor(x,a,b);
    xor(s,x,cin);
    and(y,x,cin);
    and(z,a,cin);
    or(cout,y,z);
endmodule


module FA_tb();    
    wire COUT,S;
    reg A,B,CIN;
//instantiate
    full_adder FA1(COUT,S,A,B,CIN);
    initial
        begin
          $dumpfile("FA1.vcd");
          $dumpvars;
          A=0; B=0; CIN=0; #10;
          A=0; B=0; CIN=1; #10;
          A=0; B=1; CIN=0; #10;
          A=0; B=1; CIN=1; #10;
          A=1; B=0; CIN=0; #10;
          A=1; B=0; CIN=1; #10;
          A=1; B=1; CIN=0; #10;
          A=1; B=1; CIN=1; #10;
        end
    endmodule