module x_position_track
(
input logic[2:0] block_position,
input logic[9:0] y_position,
output logic[9:0] x_position_in, block_width
);

logic[9:0] x1, x2, x4, x5;


always_comb begin
		case(block_position)
				3'b000, 3'b100 : 
					begin
						x_position_in = x1;
						block_width = x2 + (~x1) + 1'b1;
					end
				3'b001, 3'b101 : 
					begin
						x_position_in = x2;
						block_width = 10'd317 + (~x2) + 1'b1;
					end
				3'b010, 3'b110 : 
					begin
						x_position_in = 10'd317;
						block_width = x4 + (~10'd317) + 1'b1;
					end
				3'b011, 3'b111 : 
					begin
						x_position_in = x4;
						block_width = x5 + (~x4) + 1'b1;
					end
				default : begin
						x_position_in = 0;
						block_width = 0;
				end
		endcase
end


x1_lookup x1_look
(
.y_position(y_position),
.x_position(x1)
);

x2_lookup x2_look
(
.y_position(y_position),
.x_position(x2)
);

x4_lookup x4_look
(
.y_position(y_position),
.x_position(x4)
);

x5_lookup x5_look
(
.y_position(y_position),
.x_position(x5)
);

endmodule