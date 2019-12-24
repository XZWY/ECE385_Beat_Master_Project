module game_control
(
						 input logic song_over,
						 input logic reset,
						 input logic clk,
						 input logic[31:0] keycode,
						 output logic is_menu,
						 output logic is_start,
						 output logic show_score
);

				parameter [7:0] key_reset = 8'h29;
				parameter [7:0] key_one   = 8'h1e;
//				parameter [7:0] key_two   = 8'h1f;
//				parameter [7:0] key_three = 8'h20;

logic reset_pushed, one_pushed;
assign reset_pushed = (keycode[7:0] == key_reset) | (keycode[15:8] == key_reset) | (keycode[23:16] == key_reset) | (keycode[31:24] == key_reset);
assign one_pushed = (keycode[7:0] == key_one) | (keycode[15:8] == key_one) | (keycode[23:16] == key_one) | (keycode[31:24] == key_one);


enum logic[1:0]{menu, start, play, score} state, next_state;


always_ff @(posedge clk) begin
		if (reset) state <= menu;
		state <= next_state;
end

always_comb begin
		is_menu = 1'b0;
		is_start = 1'b0;
		show_score = 1'b0;
		next_state = state;
		case(state)
				menu : begin
							if(one_pushed) next_state = start;
						 end
				start : next_state = play;
				play : begin
							if (song_over) next_state = score;
							if (reset_pushed) next_state = menu;
						 end
				score : if (reset_pushed) next_state = menu;
		endcase
		
		case(state)
				menu : is_menu = 1'b1;
				start : is_start = 1'b1;
				score : show_score = 1'b1;
		endcase
end		

endmodule
