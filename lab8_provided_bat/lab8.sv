module lab8( input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK,      //SDRAM Clock
				 output logic [7:0]  LEDG, //led signal
				 output logic CE, UB, LB, OE, WE,
             output logic [19:0] SRAM_ADDR,
				 input logic[15:0] SRAM_DQ,
				 
				 //flash interface for music data
				 output logic[22:0] FL_ADDR,
				 output logic FL_CE_N, FL_OE_N, FL_RST_N, FL_WE_N, FL_WP_N,
				 input logic[7:0] FL_DQ,
				 
				 //audio chip interface
				 input logic AUD_ADCDAT,
				 
				 // Bidirectionals
				 input logic AUD_BCLK,
				 input logic AUD_ADCLRCK,
				 input logic AUD_DACLRCK,
				 output logic I2C_SDAT,
				 
				 // Outputs
				 output logic AUD_XCK,
				 output logic AUD_DACDAT,
				 output logic I2C_SCLK
            );
	
	 //assign flash control signals
	 assign FL_CE_N = 1'b0;
	 assign FL_OE_N = 1'b0;
	 assign FL_RST_N = 1'b1;
	 assign FL_WE_N = 1'b1;
	 
	 assign FL_ADDR[22] = 1'b0;
	 assign FL_WP_N = 1'b1;
	 
	 
	 
	 logic[15:0] left_channel_audio_out, right_channel_audio_out, data_from_flash;
	 logic[21:0] flash_addr;
	 logic write_enable;
	 
	 logic AU_INIT;
	 
	 
	 //all the audio control
	 audio_FSM
	 (
	 .data(FL_DQ),
	 .clk(CLOCK_50),
	 .start(start),
	 .flash_addr(FL_ADDR),
	 .audio_channel(left_channel_audio_out)
	 );
	 
	 logic CLOCK_12288;
	 
	 audio_pll AU_p(.inclk0(CLOCK_50), .c0(CLOCK_12288));

	 logic[15:0] channel;
	 always_comb begin
			if (song_over | menu | alarm_trigger) begin
					channel = 0;
			end else begin
					channel = left_channel_audio_out;
			end
	 end
	 audio_interface AU0(
			.LDATA(channel), .RDATA(channel), 	  
			.clk(CLOCK_50), .Reset(Reset_h), .INIT(start), .AUD_BCLK(AUD_BCLK),        		
			.AUD_DACDAT(AUD_DACDAT), .AUD_DACLRCK(AUD_DACLRCK),  
			.I2C_SDAT(I2C_SDAT),       
			.I2C_SCLK(I2C_SCLK)
		);
		

	 
	 assign AUD_XCK = CLOCK_12288;
	 
	 
	 
	 
//	 assign right_channel_audio_out = left_channel_audio_out;
	 
//	 avconf #(.USE_MIC_INPUT(1)) avc 
//	 (
//	 .I2C_SCLK(I2C_SCLK),
//	 .I2C_SDAT(I2C_SDAT),
//	 .CLOCK_50(CLOCK_50),
//	 .reset(~KEY[0])
//	 );
//	 
//	 logic audio_out_allowed; 
//	 logic[31:0] audio_right;
//	 assign audio_right = {{16{right_channel_audio_out[15]}},right_channel_audio_out};
	 
//	 Audio_Controller Audio_Controller (
//	// Inputs
//	.CLOCK_50(CLOCK_50),
//	.reset(~KEY[0]),
//	.clear_audio_in_memory(),
//	.read_audio_in(),
//	.clear_audio_out_memory(),
//	//three useful signals for ADC
//	.left_channel_audio_out(audio_right),
//	.right_channel_audio_out(audio_right),
//	.write_audio_out(write_enable),
//	
//	.AUD_ADCDAT(AUD_ADCDAT),
//	// Bidirectionals
//	.AUD_BCLK					(AUD_BCLK),
//	.AUD_ADCLRCK				(AUD_ADCLRCK),
//	.AUD_DACLRCK				(AUD_DACLRCK),
//	// Outputs
////	.left_channel_audio_in(),
////	.right_channel_audio_in(),
//	.audio_out_allowed(audio_out_allowed),
//	.AUD_XCK(AUD_XCK),
//	.AUD_DACDAT(AUD_DACDAT)
//);

    //active high reset signals
    logic Reset_h, Clk;
    logic [31:0] keycode;
    
    assign Clk = CLOCK_50;
    always_ff @ (posedge Clk) begin
        Reset_h <= ~(KEY[0]);        // The push buttons are active low
    end
    
    logic [1:0] hpi_addr;
    logic [15:0] hpi_data_in, hpi_data_out;
    logic hpi_r, hpi_w, hpi_cs, hpi_reset;
	 logic [9:0] x, y;
	 logic start, menu, song_over;
	 logic [7:0] is_block_8, active_8, hit_8, miss_8;
	 logic [11:0] number_hits, score, score_in;
	 logic show_score, warning;
//	 assign number_hits = {8'b00000000, hit_8[0]} + {8'b00000000, hit_8[1]} + {8'b00000000, hit_8[2]} + {8'b00000000, hit_8[3]} + {8'b00000000, hit_8[4]} + 
//								 {8'b00000000, hit_8[5]} + {8'b00000000, hit_8[6]} + {8'b00000000, hit_8[7]}; 
	 
	//assign SRAM signals 
	assign OE = 1'b0;
	assign WE = 1'b1;
	assign CE = 1'b0;
	assign UB = 1'b0;
	assign LB = 1'b0;
	
	assign warning = miss_8[0] | miss_8[1] | miss_8[2] | miss_8[3] | miss_8[4] | miss_8[5] | miss_8[6] | miss_8[7];
	
	logic [7:0] hit_delayed, increment;
	always_ff @(posedge Clk) begin
			hit_delayed[0] <= hit_8[0];
			hit_delayed[1] <= hit_8[1];
			hit_delayed[2] <= hit_8[2];
			hit_delayed[3] <= hit_8[3];
			hit_delayed[4] <= hit_8[4];
			hit_delayed[5] <= hit_8[5];
			hit_delayed[6] <= hit_8[6];
			hit_delayed[7] <= hit_8[7];
			score <= score_in;
	end
	
	logic [11:0] actual_score;
	assign actual_score = score / 12'h00c;
	
	always_comb begin
			increment[0] = hit_delayed[0] & (~hit_8[0]); //previous cycle is one, current cycle is zero for hit
			increment[1] = hit_delayed[1] & (~hit_8[1]);
			increment[2] = hit_delayed[2] & (~hit_8[2]);
			increment[3] = hit_delayed[3] & (~hit_8[3]);
			increment[4] = hit_delayed[4] & (~hit_8[4]);			
			increment[5] = hit_delayed[5] & (~hit_8[5]);
			increment[6] = hit_delayed[6] & (~hit_8[6]);
			increment[7] = hit_delayed[7] & (~hit_8[7]);

			
			number_hits = {11'b00000000, increment[0]} + {11'b00000000, increment[1]} + {11'b00000000, increment[2]} + {11'b00000000, increment[3]} + {11'b00000000, increment[4]} + 
							  {11'b00000000, increment[5]} + {11'b00000000, increment[6]} + {11'b00000000, increment[7]};
							
			
			score_in = score + number_hits;
			if (start | menu) score_in = 0;
			if (show_score) score_in = score;
//			if (
//				((~hit_8[4]) & miss_8[0]) | ((~hit_8[5]) & miss_8[1]) | ((~hit_8[6]) & miss_8[2]) | ((~hit_8[7]) & miss_8[3]) | ((~hit_8[0]) & miss_8[4])
//				| ((~hit_8[1]) & miss_8[5]) | ((~hit_8[2]) & miss_8[6]) | ((~hit_8[3]) & miss_8[7])
//				) score_in = score;
			
	end

//	 always_comb begin
//			case (keycode)
//						8'h07 : 
//						begin
//								LEDG = 4'b1000;
//						end
//						8'h04 : 
//						begin
//								LEDG = 4'b0100;
//						end
//						8'h16 : 
//						begin
//								LEDG = 4'b0010;
//						end
//						8'h1A : 
//						begin
//								LEDG = 4'b0001;
//						end
//						default : LEDG = 4'b0000;
//				endcase
//	 end


	assign LEDG[0] = alarm_trigger;
    
    // Interface between NIOS II and EZ-OTG chip
    hpi_io_intf hpi_io_inst(
                            .Clk(Clk),
                            .Reset(Reset_h),
                            // signals connected to NIOS II
                            .from_sw_address(hpi_addr),
                            .from_sw_data_in(hpi_data_in),
                            .from_sw_data_out(hpi_data_out),
                            .from_sw_r(hpi_r),
                            .from_sw_w(hpi_w),
                            .from_sw_cs(hpi_cs),
                            .from_sw_reset(hpi_reset),
                            // signals connected to EZ-OTG chip
                            .OTG_DATA(OTG_DATA),    
                            .OTG_ADDR(OTG_ADDR),    
                            .OTG_RD_N(OTG_RD_N),    
                            .OTG_WR_N(OTG_WR_N),    
                            .OTG_CS_N(OTG_CS_N),
                            .OTG_RST_N(OTG_RST_N),
    );
     
     // You need to make sure that the port names here match the ports in Qsys-generated codes.
     lab8_soc nios_system(
                             .clk_clk(Clk),         
                             .reset_reset_n(1'b1),    // Never reset NIOS
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                             .sdram_clk_clk(DRAM_CLK),
                             .keycode_export(keycode),  
                             .otg_hpi_address_export(hpi_addr),
                             .otg_hpi_data_in_port(hpi_data_in),
                             .otg_hpi_data_out_port(hpi_data_out),
                             .otg_hpi_cs_export(hpi_cs),
                             .otg_hpi_r_export(hpi_r),
                             .otg_hpi_w_export(hpi_w),
                             .otg_hpi_reset_export(hpi_reset)
    );
    
    // Use PLL to generate the 25MHZ VGA_CLK.
    // You will have to generate it on your own in simulation.
    vga_clk vga_clk_instance(.inclk0(Clk), .c0(VGA_CLK));
    
    // TODO: Fill in the connections for the rest of the modules 
    VGA_controller vga_controller_instance( .Clk(Clk),         // 50 MHz clock
                                           .Reset(Reset_h),       // Active-high reset signal
														 .VGA_HS(VGA_HS),      // Horizontal sync pulse.  Active low
                                           .VGA_VS(VGA_VS),      // Vertical sync pulse.  Active low
                                           .VGA_CLK(VGA_CLK),     // 25 MHz VGA clock input
                                           .VGA_BLANK_N(VGA_BLANK_N), // Blanking interval indicator.  Active low.
                                           .VGA_SYNC_N(VGA_SYNC_N),  // Composite Sync signal.  Active low.  We don't use it in this lab,
                                                        // but the video DAC on the DE2 board requires an input for it.
                                           .DrawX(x),       // horizontal coordinate
                                           .DrawY(y)      // vertical coordinate
														 );
														 
		
														 
//		score_keeper score_instance (
//						 .clk(Clk),
//						 .stop(show_score),
//						 .start(start),
//						 .number_hits(number_hits),
//						 .score(score)						  
//						 );
    
		block block1 (
						 .reset(menu),
						 .notes(180'h090798096568736983165518287527387598327857858),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b000),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[0]),
						 .is_block(is_block_8[0]),
						 .hit(hit_8[0]),
						 .song_over(),
						 .miss(miss_8[0]),
						 .parallel_hit(hit_8[4]),
						 .alarm(alarm[0])
                   );
						 
		block block2 (
						 .reset(menu),
						 .notes(180'h0978294900389590790884172983775abcbbfbdebdb00),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b001),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[1]),
						 .is_block(is_block_8[1]),
						 .hit(hit_8[1]),
						 .song_over(),
						 .miss(miss_8[1]),
						 .parallel_hit(hit_8[5]),
						 .alarm(alarm[1])
                   );
						 
		block block3 (
						 .reset(menu),
						 .notes(180'h0936786764875bdbebbcfeff294890342345830869023),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b010),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[2]),
						 .is_block(is_block_8[2]),
						 .hit(hit_8[2]),
						 .song_over(),
						 .miss(miss_8[2]),
						 .parallel_hit(hit_8[6]),
						 .alarm(alarm[2])
                   );
						 
		block block4(
						 .reset(menu),
						 .notes(180'h00928747828abcd87d7e7c7a7b72193875892837f0000),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b011),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[3]),
						 .is_block(is_block_8[3]),
						 .hit(hit_8[3]),
						 .song_over(),
						 .miss(miss_8[3]),
						 .parallel_hit(hit_8[7]),
						 .alarm(alarm[3])
                   );
		
		block block5 (
						 .reset(menu),
						 .notes(180'habcd8928359384763827747264875768488523abd0000),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b100),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[4]),
						 .is_block(is_block_8[4]),
						 .hit(hit_8[4]),
						 .song_over(),
						 .miss(miss_8[4]),
						 .parallel_hit(hit_8[0]),
						 .alarm(alarm[4])
                   );
						 
		block block6 (
						 .reset(menu),
						 .notes(180'h34567899876abcdefbcdfe2985797cbdbbadbe89b0000),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b101),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[5]),
						 .is_block(is_block_8[5]),
						 .hit(hit_8[5]),
						 .song_over(),
						 .miss(miss_8[5]),
						 .parallel_hit(hit_8[1]),
						 .alarm(alarm[5])
                   );
		
		block block7 (
						 .reset(menu),
						 .notes(180'habcbdbbcbdb2b4b6bb39989b78c88d8e8d88790bc0000),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b110),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[6]),
						 .is_block(is_block_8[6]),
						 .hit(hit_8[6]),
						 .song_over(),
						 .miss(miss_8[6]),
						 .parallel_hit(hit_8[2]),
						 .alarm(alarm[6])
                   );
    logic[8:0] count;
	 block block8 (
						 .count(count),
						 .reset(menu),
						 .notes(180'h896468787268717dfbeffaa8992995671764551270000),
						 .Clk(Clk),
						 .frame_clk(VGA_VS),
						 .start(start),
						 .keycode(keycode),
						 .position(3'b111),
						 .draw_x(x), .draw_y(y),
						 .active(active_8[7]),
						 .is_block(is_block_8[7]),
						 .hit(hit_8[7]),
						 .song_over(song_over),
						 .miss(miss_8[7]),
						 .parallel_hit(hit_8[3]),
						 .alarm(alarm[7])
                   );
						 
		logic[7:0] alarm;
		logic alarm_trigger;
		assign alarm_trigger = alarm[0] | alarm[1] | alarm[2] | alarm[3] | alarm[4] | alarm[5] | alarm[6] | alarm[7];
						 
		game_control game_controller(
						 .song_over(song_over),
						 .reset(Reset_h),
						 .clk(Clk),
						 .keycode(keycode),
						 .is_menu(menu),
						 .is_start(start),
						 .show_score(show_score)
						 );
										  
		color_mapper color_instance(
						 .show_score(show_score),
						 .SRAM_ADDR(SRAM_ADDR),
						 .SRAM_DATA(SRAM_DQ),
						 .hit(hit_8),
						 .clk(Clk),
						 .is_block(is_block_8), .active(active_8),
						 .menu(menu),
						 .DrawX(x), .DrawY(y),
						 .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B) 
                   );
						 
						 
		

	
    
    // Display keycode on hex display
    HexDriver hex_inst_0 (actual_score[3:0], HEX0);
    HexDriver hex_inst_1 (actual_score[7:4], HEX1);
	 HexDriver hex_inst_2 (actual_score[11:8], HEX2);
    HexDriver hex_inst_3 (4'b0, HEX3);
    HexDriver hex_inst_4 ({3'b0, song_over}, HEX4);
    HexDriver hex_inst_5 ({3'b0, show_score}, HEX5);
    HexDriver hex_inst_6 (count[3:0], HEX6);
    HexDriver hex_inst_7 (count[7:4], HEX7);

		  

    
endmodule
