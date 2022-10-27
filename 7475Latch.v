`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2022 08:13:14 PM
// Design Name: 
// Module Name: 7475Latch
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


module latch7475(d1, d2, d3, d4, c1, c2, q1, q2, q3, q4);
    input d1, d2, d3, d4,c1,c2;
    output q1, q2, q3, q4;
    reg q1, q2, q3, q4;
    
    always @(c1 or d1 or d2)
      begin
        if(c1)
            begin
                q1 <= d1;
                q2 <= d2;
            end
        end
        
     always @(c2 or d3 or d4)
        begin       
            if(c2)
                begin
                    q3 <= d3;
                    q4 <= d4;
                end
          end
      
endmodule

module latch_tb;
    reg d1, d2, d3, d4, c1, c2;
    wire q1, q2, q3, q4;
    
    latch7475 U(d1, d2, d3, d4, c1, c2, q1, q2, q3,q4);
    
    initial begin
        c1 = 1'b0;
        c2 = 1'b0;
        
        forever
            begin
                #2 c1 = !c1;
                c2 = !c2;
            end
    end
    
    initial begin
        #1;
        d1 = 1; 
        #1;
        d2 = 1; 
        #1;
        d3 = 1;
        d4 = 1; 
        #1;
        d1 = 0;
        d2 = 0;
        #3;
        d1 = 1;
        d2 = 1;
    end
    
    initial 
        $monitor("At time %t, d1 = %b, d2 = %b, d3 = %b, d4 = %b, q1 = %b, q2 = %b, q3 = %b, q4 = %b", $time, d1, d2, d3, d4, q1,q2,q3,q4);
    
endmodule