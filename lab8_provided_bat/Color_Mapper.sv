// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( 
							  input logic show_score,
							  input logic[15:0] SRAM_DATA,
							  input logic clk,
							  input logic[7:0] is_block, active, hit,
							  input logic menu,
                       input logic [9:0] DrawX, DrawY,
                       output logic [7:0] VGA_R, VGA_G, VGA_B,
							  output logic [19:0] SRAM_ADDR
                     );
    parameter [9:0] top_first = 10'd120;
	 parameter [9:0] top_second = 10'd230;
	 parameter [9:0] top_third = 10'd318;
	 parameter [9:0] top_fourth = 10'd420;
	 
	 
    logic [7:0] Red, Green, Blue;
	 
	 logic b0, b1, b2, b3, b4, b5, b6, b7;
	 assign b0 = (is_block[0] == 1'b1) && (active[0] == 1'b1);
	 assign b1 = (is_block[1] == 1'b1) && (active[1] == 1'b1);
	 assign b2 = (is_block[2] == 1'b1) && (active[2] == 1'b1);
	 assign b3 = (is_block[3] == 1'b1) && (active[3] == 1'b1);
	 assign b4 = (is_block[4] == 1'b1) && (active[4] == 1'b1);
	 assign b5 = (is_block[5] == 1'b1) && (active[5] == 1'b1);
	 assign b6 = (is_block[6] == 1'b1) && (active[6] == 1'b1);
	 assign b7 = (is_block[7] == 1'b1) && (active[7] == 1'b1);
    
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
	 
//	 eight_bit_RGB
	 logic[7:0] background_r, background_g, background_b, menu_r, menu_g, menu_b, score_r, score_g, score_b;
	 
	 logic[7:0] menu_RGB_8, background_rgb_8;
	 logic[7:0] score_rgb_8;
	 logic[19:0] x;
	 
	 
	 always_comb begin
			if (show_score) SRAM_ADDR = (DrawX + DrawY * 10'd640) >> 1;
			else SRAM_ADDR = ((DrawX + DrawY * 10'd640) >> 1) + 20'h30000;
	 end
//	 assign SRAM_ADDR = (DrawX + DrawY * 10'd640) >> 1;
	 assign x = DrawX + DrawY * 10'd640;
	 
	 always_comb begin
			if (x[0] == 1'b0) begin
				score_rgb_8 = SRAM_DATA[15:8];
				menu_RGB_8 = SRAM_DATA[15:8];
			end
			else begin
				score_rgb_8 = SRAM_DATA[7:0];
				menu_RGB_8 = SRAM_DATA[7:0];
			end
	 end
	 
	 palette palette_score
	 (
	 .clk(clk),
	 .data(score_rgb_8),
	 .RGB({score_r, score_g, score_b}) // VGA RGB output
	 );
	 
//	 menu_screen screen
//	 (
//	 .address(DrawX + DrawY * 640),
//	 .clock(clk),
//	 .q(menu_RGB_4)
//	 );
	 
	 palette palette_menu 
	 (
	 .clk(clk),
	 .data(menu_RGB_8),
	 .RGB({menu_r, menu_g, menu_b}) // VGA RGB output
	 );
	 
	 background game_screen_x 
	 (
	 .address(DrawX + DrawY * 640),
	 .clock(clk),
	 .q(background_rgb_8)
	 );
	 
	 palette palette_game
	 (
	 .clk(clk),
	 .data(background_rgb_8),
	 .RGB({background_r, background_g, background_b}) // VGA RGB output
	 );
	 
//	 score 
//	 (
//	 .address(DrawX + DrawY * 640),
//	 .clock(clk),
//	 .q(score_rgb_4)
//	 );
//	 
//	 palette_new palette_score 
//	 (
//	 .clk(clk),
//	 .data(score_rgb_4),
//	 .RGB({score_r, score_g, score_b}) // VGA RGB output
//	 );
	 
//	 background background_image
//	 (
//	 .address(DrawX + DrawY * 640),
//	 .clock(clk),
//	 .q(eight_bit_RGB)
//	 );
//	 
//	 
//	 
//	 palette palette_instance (
//				.clk(clk),
//				.data(eight_bit_RGB),            // data read from frame buffer
//				.RGB({background_r, background_g, background_b}) // VGA RGB output
//				);
    
    // Assign color based on is_ball signal
    always_comb
    begin
        if (menu == 1'b1)
        begin
            Red = menu_r; 
            Green = menu_g;
            Blue = menu_b;
		  end else if ((show_score == 1'b0) && (menu == 1'b0) && (b0 | b1 | b2 | b3 | b4 | b5 | b6 | b7) == 1'b1) begin
				// White block
				if ((hit[0] | hit[1] | hit[2] | hit[3] | hit[4] | hit[5] | hit[6] | hit[7]) == 1'b1) begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'hff;
				end else begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'hff;
					end
        end else if (show_score == 1'b1) begin
					Red = score_r;
					Green = score_g;
					Blue = score_b;
		  end else begin
				Red = background_r;
				Green = background_g;
				Blue = background_b;
		  end
    end 
    
endmodule