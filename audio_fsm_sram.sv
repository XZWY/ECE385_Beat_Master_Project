module audio_FSM_sram
(
input logic[15:0] data,
input logic clk, start,
output logic[19:0] flash_addr,
output logic[15:0] audio_channel
);

logic[21:0] sample_counter, sample_counter_in;
logic[11:0] clk_counter, clk_counter_in;
logic read;

always_ff @(posedge clk) begin
		sample_counter = sample_counter_in;
		clk_counter = clk_counter_in;
end

always_comb begin
		if (start) begin
			clk_counter_in = 12'b0;
			sample_counter_in = 22'b0;
			read = 1'b1;
		end
		else if (clk_counter == 12'd1133) begin
			clk_counter_in = 12'b0;
			sample_counter_in = sample_counter + 22'd1;
			read = 1'b1;
		end
		else begin
			clk_counter_in = clk_counter + 12'b1;
			sample_counter_in = sample_counter;
			read = 1'b0;
		end
end



enum logic[2:0]{pause, read_upper_1, read_upper_2} state, next_state;

register_16 channel_data
(
.Clk(clk), .Reset(0), .Load(load),
.Data_in(data_to_reg),
.Data_Out(audio_channel)
);

logic load;
logic[15:0] data_to_reg;


always_ff @(posedge clk) begin
		if (start)
			state = read_upper_1;
		state = next_state;
end

always_comb begin

		next_state = pause;
		load = 1'b0;
		data_to_reg = audio_channel;
		flash_addr = sample_counter;

		case(state)
				pause : begin 
								if (read)
									next_state = read_upper_1; 
								else 
									next_state = pause;
						  end
				read_upper_1 : next_state = read_upper_2;
				read_upper_2 : next_state = pause;
		endcase
		
		case(state)
				pause : load = 1'b0;
				read_upper_1 : begin
										flash_addr = sample_counter;
										data_to_reg = data;
										load = 1'b1;
									end
									
				read_upper_2 : begin
										flash_addr = sample_counter;
										data_to_reg = data;
										load = 1'b1;
									end
		endcase
end
endmodule



