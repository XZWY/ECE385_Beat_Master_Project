module  palette_new (
						  input logic clk,
						  input  logic  [3:0] data,
                    output logic [23:0] RGB // VGA RGB output
                    );
    

    

    always_ff @(posedge clk) begin
			case (data)
			8'd0:  RGB <= 24'h000000; 	   	8'd1:  RGB <= 24'hffffff;    	8'd2: RGB <= 24'h250025;    	8'd3: RGB <= 24'h302f3d;
			8'd4:  RGB <= 24'h382f5e;  	  	8'd5:  RGB <= 24'h512e64;    	8'd6: RGB <= 24'h652b65;    	8'd7: RGB <= 24'h330035;
			8'd8:  RGB <= 24'h790073;			8'd9:  RGB <= 24'ha22374;		8'd10:  RGB <= 24'h330035;		8'd11:  RGB <= 24'h5d0059;
			8'd12:  RGB <= 24'h81017c;			8'd13:  RGB <= 24'hce00d3;		8'd14:  RGB <= 24'hc014c5;		8'd15:  RGB <= 24'h14c56f;
			endcase
    end 
    
endmodule
