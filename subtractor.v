`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 09:12:22 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor(m, n, bin, d, bout);
    input m, n, bin;
    output d, bout;
    
    assign d = m ^ n ^ bin;
    assign bout = n & bin | !m & bin | !m &n;
    
endmodule

module sub_tb;
    reg m, n, bin;
    wire d, bout;
    reg [3:0]vec;
    
    subtractor U(m, n, bin, d, bout);
    
    initial begin
        for(vec = 0; vec < 8; vec = vec + 1)
            begin
                {m, n, bin} = vec;
                #5 $display("m, b, bin = %b%b%b", m, n, bin, " d, bout = %b%b", d, bout);
            end
    end
endmodule
