module audio_FSM
(
input logic[7:0] data,
input logic clk, start,
output logic[21:0] flash_addr,
output logic[15:0] audio_channel,
output logic write_enable
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
			write_enable = 1'b1;
		end
		else if (clk_counter == 12'd1133) begin
			clk_counter_in = 12'b0;
			sample_counter_in = sample_counter + 22'd1;
			read = 1'b1;
			write_enable = 1'b1;
		end
		else begin
			clk_counter_in = clk_counter + 12'b1;
			sample_counter_in = sample_counter;
			read = 1'b0;
			write_enable = 1'b0;
		end
end



enum logic[3:0]{pause, read_upper_1, read_upper_2, read_upper_3, read_upper_4, read_upper_5, read_upper_6, read_lower_1, read_lower_2,
					 read_lower_3, read_lower_4, read_lower_5, read_lower_6} state, next_state;

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
		flash_addr = 2'd2 * sample_counter;

		case(state)
				pause : begin 
								if (read)
									next_state = read_upper_1; 
								else 
									next_state = pause;
						  end
				read_upper_1 : next_state = read_upper_2;
				read_upper_2 : next_state = read_upper_3;
				read_upper_3 : next_state = read_upper_4;
				read_upper_4 : next_state = read_upper_5;
				read_upper_5 : next_state = read_upper_6;
				read_upper_6 : next_state = read_lower_1;
				
				read_lower_1 : next_state = read_lower_2;
				read_lower_2 : next_state = read_lower_3;
				read_lower_3 : next_state = read_lower_4;
				read_lower_4 : next_state = read_lower_5;
				read_lower_5 : next_state = read_lower_6;
				read_lower_6 : next_state = pause;
				
		endcase
		
		case(state)
				pause : load = 1'b0;
				read_upper_1 : begin
										flash_addr = 2 * sample_counter;
										data_to_reg = {data, audio_channel[7:0]};
										load = 1'b1;
									end
									
				read_upper_2, read_upper_3, read_upper_4, read_upper_5, read_upper_6 : begin
										flash_addr = 2 * sample_counter;
										data_to_reg = {data, audio_channel[7:0]}; 
										load = 1'b1;
									end
									
				read_lower_1 : begin
										flash_addr = 2 * sample_counter + 22'b1;
										data_to_reg = {audio_channel[15:8], data};
										load = 1'b1;
									end
									
				read_lower_2, read_lower_3, read_lower_4, read_lower_5, read_lower_6 : begin
										flash_addr = 2 * sample_counter + 22'b1;
										data_to_reg = {audio_channel[15:8], data};
										load = 1'b1;
									end
		endcase
end
endmodule



module register_16
				  #(parameter width = 16)
				  (
				  input  logic Clk, Reset, Load,
              input  logic [width - 1:0]  Data_in,
              output logic [width - 1:0]  Data_Out
				  );

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 0;
		 else if (Load)
			  Data_Out <= Data_in;
    end
endmodule

