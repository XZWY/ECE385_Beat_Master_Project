module block
(				input logic reset,
				input logic Clk,
				input logic frame_clk,
				input logic start,
				input logic[31:0] keycode,
				input logic[2:0] position,
				input logic[9:0] draw_x, draw_y,
				input logic[179:0] notes,
				input logic parallel_hit,
				output logic active,
				output logic is_block,
				output logic hit,
				output logic miss,
				output logic song_over,
				output logic[8:0] count,
				output logic alarm
);

				assign count = counter;
				
				parameter [7:0] key_A = 8'h04;
				parameter [7:0] key_S = 8'h16;
				parameter [7:0] key_D = 8'h07;
				parameter [7:0] key_F = 8'h09;
				
				

				

				
				parameter [9:0] bottom_start = 10'd328;
				parameter [9:0] bottom_end = 10'd395;


//				parameter [9:0] top_first = 10'd120;
//				parameter [9:0] top_second = 10'd230;
//				parameter [9:0] top_third = 10'd318;
//				parameter [9:0] top_fourth = 10'd420;				
				
//				parameter [9:0] middle_first = 10'd;
//				parameter [9:0] middle_second = 10'd;
//				parameter [9:0] middle_third = 10'd;
//				parameter [9:0] middle_fourth = 10'd;		
				
				logic [9:0] step_size;
				assign step_size = (block_Y_Pos < 10'd200) ? 10'd10 : 10'd5;
				
//				parameter [9:0] block_width = 10'd68;
				parameter [9:0] block_height = 10'd11;
				
	 logic [9:0] block_width;
	 logic [7:0] correct_keycode;
	 logic [9:0] block_X_Pos, block_Y_Pos;
    logic [9:0] block_X_Pos_in, block_Y_Pos_in;
				
	 logic[8:0] counter, counter_in;
	 logic keycode_correct;
	 
	 assign keycode_correct = (keycode[7:0] == correct_keycode) | (keycode[15:8] == correct_keycode) | (keycode[23:16] == correct_keycode) | (keycode[31:24] == correct_keycode);

				
always_comb begin
		case(position)
			3'b000 : begin   correct_keycode = key_A; end
			3'b001 : begin   correct_keycode = key_S; end
			3'b010 : begin   correct_keycode = key_D; end
			3'b011 : begin   correct_keycode = key_F; end
			3'b100 : begin   correct_keycode = key_A; end
			3'b101 : begin   correct_keycode = key_S; end
			3'b110 : begin   correct_keycode = key_D; end
			3'b111 : begin   correct_keycode = key_F; end
		endcase
end

//block_X_Pos =     top_first;
//block_X_Pos =    top_second;
//block_X_Pos =     top_third;
//block_X_Pos =    top_fourth;
//block_X_Pos =     top_first;
//block_X_Pos =    top_second;
//block_X_Pos =     top_third;
//block_X_Pos =    top_fourth;







x_position_track track
(
.block_position(position),
.y_position(block_Y_Pos),
.x_position_in(block_X_Pos),
.block_width(block_width)
);


logic frame_clk_delayed, frame_clk_rising_edge;

always_ff @ (posedge Clk) begin
    frame_clk_delayed <= frame_clk;
    frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
end

always_ff @(posedge Clk) begin
		counter <= counter_in;
		block_Y_Pos <= block_Y_Pos_in;
		if ((start | reset) == 1'b1) begin
			counter <= 0;
			case (position[2])
				1'b0 : block_Y_Pos <= 10'd0;
				1'b1 : block_Y_Pos <= 10'd220;
			endcase
		end
end

always_comb begin
		if ((draw_x >= block_X_Pos) && (draw_x <= block_X_Pos + block_width) && (draw_y >= block_Y_Pos) && (draw_y <= block_Y_Pos + block_height))
				is_block = 1'b1;
		else 
				is_block = 1'b0;
end


always_comb begin
		active = notes[counter];
//		if ((parallel_hit == 1'b0) && (miss == 1'b1)) begin
//				active = 1'b0;
//		end
			
end

always_comb begin
		if ((block_Y_Pos < bottom_end) && (block_Y_Pos > bottom_start) && (keycode_correct) && (is_block == 1'b1) && (active == 1'b1))
				hit = 1'b1;
		else
				hit = 1'b0;
end

always_comb begin
		if ((keycode_correct == 1'b1) && ((is_block == 1'b0) || (active == 1'b0)))
				miss = 1'b1;
		else
				miss = 1'b0;
end


always_comb begin
	if (counter == 9'd40) song_over = 1'b1; 
	else song_over = 1'b0;
end
always_comb begin
		counter_in = counter;
		block_Y_Pos_in = block_Y_Pos;
//		block_X_Pos_in = block_X_Pos;
		
		if (frame_clk_rising_edge) begin
				block_Y_Pos_in = block_Y_Pos + step_size;
//				block_X_Pos_in = block_X_Pos;
				
				if ((block_Y_Pos > bottom_end)) begin
						if (counter == 9'd40) begin
							counter_in = counter;
						end
						else 
							counter_in = counter + 9'd1;
				end
				if (block_Y_Pos > bottom_end)
					block_Y_Pos_in = 0;
		end
end

//the logic to generate the alarm signal
logic[12:0] keycode_counter, keycode_counter_in;
always_ff @(posedge Clk) begin
		keycode_counter <= keycode_counter_in;
		if (~keycode_correct) keycode_counter <= 13'b0;
end

always_comb begin
		keycode_counter_in = keycode_counter;
		if (frame_clk_rising_edge) begin
				if ((keycode_correct == 1'b1))
					keycode_counter_in = keycode_counter + 13'b1;
				if (keycode_counter == 13'd30)
					keycode_counter_in = keycode_counter;
		end
end

always_comb begin
		alarm = 1'b0;
		if (keycode_counter == 13'd30)  alarm = 1'b1;
end

				
endmodule
