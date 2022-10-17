`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2022 10:35:21 PM
// Design Name: 
// Module Name: funny
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module struct_funny(a,b,c,d,f);
    input a, b, c, d;
    output f;
    wire a0, a1, a2, a3, a4, a5, a6, a7, a8;
    
    and A0(a0,a,b,c,d);
    and A1(a1,~a,~b,~c,~d);
    and A2(a2,a,~d);
    and A3(a3,~a,b,~c);
    and A4(a4,b,d);
    and A5(a5,~a,b,~c);
    and A6(a6,a,b,~c,d);
    and A7(a7,b,c,d);
    and A8(a8,~a,c,~d);
    or O(f, a0,a1,a2,a3,a4,a5,a6,a7,a8);
    
endmodule


module df_funny(a,b,c,d,f);
    input a, b, c, d;
    output f;
    wire a0, a1, a2, a3, a4, a5, a6, a7, a8;
    
    assign a0 = a & b & c & d;
    assign a1 = ~a & ~b & ~c & ~d;
    assign a2 = a & ~d;
    assign a3 = ~a & b & ~c; 
    assign a4 = b & d;
    assign a5 = ~a & b & ~c;
    assign a6 = a & b & ~c & d;
    assign a7 = b & c & d;
    assign a8 = ~a & c & ~d;
    assign f = a0 | a1 | a2 | a3 | a4 | a5 | a6  | a7 | a8;
    
endmodule

module simp_funny(b,d,f);
    input b,d;
    output f;
    
    or(f,b,~d);
    
endmodule

module BDD(a,b,f0, f1, f2,f3, f4, f5);
    input a, b;
    output f0, f1, f2, f3, f4, f5;
    
    and(f0, a, b);
    or(f1, a, b);
    xor(f2, a, b);
    nand(f3, a, b);
    nor(f4, a, b);
    xnor(f5, a, b);
    
endmodule

module funny_tb;
    reg a_in, b_in, c_in, d_in;
    wire f_out, f2_out, f3_out;
    reg [4:0] vec; 
    
    reg a, b;
    wire f0, f1, f2, f3, f4, f5;
    reg [3:0] vec1;
    
    struct_funny U(a_in, b_in, c_in, d_in, f_out);
    df_funny V(a_in, b_in, c_in, d_in, f2_out);
    simp_funny W(b_in,d_in,f3_out);
    BDD H(a, b, f0, f1, f2, f3, f4, f5);
    
    initial
    begin 
        $display("            Input:                    Output:");
        for (vec = 0; vec < 16; vec = vec + 1)
            begin 
                {a_in, b_in, c_in, d_in} = vec;
                #5 $display("a, b, c, d = %b%b%b%b", a_in, b_in, c_in, d_in," f_out, f2_out, f3_out = %b%b%b", f_out, f2_out, f3_out);
            end
            
         for(vec1 = 0; vec1 < 4; vec1 = vec1 +1)
            begin 
                {a, b} = vec1;
                #5;
                $display("a,b = %b%b", a,b, " and  gate output f0 = %b",f0);
                $display("a,b = %b%b", a,b, " or   gate output f1 = %b",f1);
                $display("a,b = %b%b", a,b, " xor  gate output f2 = %b",f2);
                $display("a,b = %b%b", a,b, " nand gate output f3 = %b",f3);
                $display("a,b = %b%b", a,b, " nor  gate output f4 = %b",f4);
                $display("a,b = %b%b", a,b, " xnor gate output f5 = %b",f5);
            end
    end 
    
endmodule
