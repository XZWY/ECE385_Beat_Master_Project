module  palette (
						  input logic clk,
						  input  logic  [7:0] data,
                    output logic [23:0] RGB // VGA RGB output
                    );
    

    

    always_ff @(posedge clk) begin
			case (data)
			8'd0:  RGB <= 24'h000000; 	   	8'd64:  RGB <= 24'h5f8700;    	8'd128: RGB <= 24'haf00d7;    	8'd192: RGB <= 24'hd7ff87;
			8'd1:  RGB <= 24'h800000;  	  	8'd65:  RGB <= 24'h5f875f;    	8'd129: RGB <= 24'haf00ff;    	8'd193: RGB <= 24'hd7ffaf;
			8'd2:  RGB <= 24'h008000;   		8'd66:  RGB <= 24'h5f8787;    	8'd130: RGB <= 24'haf5f00;    	8'd194: RGB <= 24'hd7ffd7;
			8'd3:  RGB <= 24'h808000;    		8'd67:  RGB <= 24'h5f87af;    	8'd131: RGB <= 24'haf5f5f;   		8'd195: RGB <= 24'hd7ffff;
			8'd4:  RGB <= 24'h000080;    		8'd68:  RGB <= 24'h5f87d7;    	8'd132: RGB <= 24'haf5f87;    	8'd196: RGB <= 24'hff0000;
			8'd5:  RGB <= 24'h800080;    		8'd69:  RGB <= 24'h5f87ff;    	8'd133: RGB <= 24'haf5faf;    	8'd197: RGB <= 24'hff005f;
			8'd6:  RGB <= 24'h008080;    		8'd70:  RGB <= 24'h5faf00;    	8'd134: RGB <= 24'haf5fd7;    	8'd198: RGB <= 24'hff0087;
			8'd7:  RGB <= 24'hc0c0c0;    		8'd71:  RGB <= 24'h5faf5f;    	8'd135: RGB <= 24'haf5fff;    	8'd199: RGB <= 24'hff00af;
			8'd8:  RGB <= 24'h808080;    		8'd72:  RGB <= 24'h5faf87;    	8'd136: RGB <= 24'haf8700;    	8'd200: RGB <= 24'hff00d7;
			8'd9:  RGB <= 24'hff0000;    		8'd73:  RGB <= 24'h5fafaf;    	8'd137: RGB <= 24'haf875f;    	8'd201: RGB <= 24'hff00ff;
			8'd10: RGB <= 24'h00ff00;    		8'd74:  RGB <= 24'h5fafd7;    	8'd138: RGB <= 24'haf8787;    	8'd202: RGB <= 24'hff5f00;
			8'd11: RGB <= 24'hffff00;    		8'd75:  RGB <= 24'h5fafff;    	8'd139: RGB <= 24'haf87af;    	8'd203: RGB <= 24'hff5f5f;
			8'd12: RGB <= 24'h0000ff;    		8'd76:  RGB <= 24'h5fd700;    	8'd140: RGB <= 24'haf87d7;    	8'd204: RGB <= 24'hff5f87;
			8'd13: RGB <= 24'hff00ff;    		8'd77:  RGB <= 24'h5fd75f;    	8'd141: RGB <= 24'haf87ff;    	8'd205: RGB <= 24'hff5faf;
			8'd14: RGB <= 24'h00ffff;    		8'd78:  RGB <= 24'h5fd787;    	8'd142: RGB <= 24'hafaf00;    	8'd206: RGB <= 24'hff5fd7;
			8'd15: RGB <= 24'hffffff;    		8'd79:  RGB <= 24'h5fd7af;    	8'd143: RGB <= 24'hafaf5f;    	8'd207: RGB <= 24'hff5fff;
			8'd16: RGB <= 24'h000000;    		8'd80:  RGB <= 24'h5fd7d7;    	8'd144: RGB <= 24'hafaf87;    	8'd208: RGB <= 24'hff8700;
			8'd17: RGB <= 24'h00005f;    		8'd81:  RGB <= 24'h5fd7ff;    	8'd145: RGB <= 24'hafafaf;    	8'd209: RGB <= 24'hff875f;
			8'd18: RGB <= 24'h000087;    		8'd82:  RGB <= 24'h5fff00;    	8'd146: RGB <= 24'hafafd7;    	8'd210: RGB <= 24'hff8787;
			8'd19: RGB <= 24'h0000af;    		8'd83:  RGB <= 24'h5fff5f;    	8'd147: RGB <= 24'hafafff;    	8'd211: RGB <= 24'hff87af;
			8'd20: RGB <= 24'h0000d7;    		8'd84:  RGB <= 24'h5fff87;    	8'd148: RGB <= 24'hafd700;    	8'd212: RGB <= 24'hff87d7;
			8'd21: RGB <= 24'h0000ff;    		8'd85:  RGB <= 24'h5fffaf;    	8'd149: RGB <= 24'hafd75f;    	8'd213: RGB <= 24'hff87ff;
			8'd22: RGB <= 24'h005f00;    		8'd86:  RGB <= 24'h5fffd7;    	8'd150: RGB <= 24'hafd787;    	8'd214: RGB <= 24'hffaf00;
			8'd23: RGB <= 24'h005f5f;    		8'd87:  RGB <= 24'h5fffff;    	8'd151: RGB <= 24'hafd7af;    	8'd215: RGB <= 24'hffaf5f;
			8'd24: RGB <= 24'h005f87;    		8'd88:  RGB <= 24'h870000;    	8'd152: RGB <= 24'hafd7d7;    	8'd216: RGB <= 24'hffaf87;
			8'd25: RGB <= 24'h005faf;    		8'd89:  RGB <= 24'h87005f;    	8'd153: RGB <= 24'hafd7ff;    	8'd217: RGB <= 24'hffafaf;
			8'd26: RGB <= 24'h005fd7;    		8'd90:  RGB <= 24'h870087;    	8'd154: RGB <= 24'hafff00;    	8'd218: RGB <= 24'hffafd7;
			8'd27: RGB <= 24'h005fff;    		8'd91:  RGB <= 24'h8700af;    	8'd155: RGB <= 24'hafff5f;    	8'd219: RGB <= 24'hffafff;
			8'd28: RGB <= 24'h008700;    		8'd92:  RGB <= 24'h8700d7;    	8'd156: RGB <= 24'hafff87;    	8'd220: RGB <= 24'hffd700;
			8'd29: RGB <= 24'h00875f;    		8'd93:  RGB <= 24'h8700ff;    	8'd157: RGB <= 24'hafffaf;    	8'd221: RGB <= 24'hffd75f;
			8'd30: RGB <= 24'h008787;    		8'd94:  RGB <= 24'h875f00;    	8'd158: RGB <= 24'hafffd7;    	8'd222: RGB <= 24'hffd787;
			8'd31: RGB <= 24'h0087af;    		8'd95:  RGB <= 24'h875f5f;    	8'd159: RGB <= 24'hafffff;    	8'd223: RGB <= 24'hffd7af;
			8'd32: RGB <= 24'h0087d7;    		8'd96:  RGB <= 24'h875f87;    	8'd160: RGB <= 24'hd70000;    	8'd224: RGB <= 24'hffd7d7;
			8'd33: RGB <= 24'h0087ff;    		8'd97:  RGB <= 24'h875faf;    	8'd161: RGB <= 24'hd7005f;    	8'd225: RGB <= 24'hffd7ff;
			8'd34: RGB <= 24'h00af00;    		8'd98:  RGB <= 24'h875fd7;    	8'd162: RGB <= 24'hd70087;    	8'd226: RGB <= 24'hffff00;
			8'd35: RGB <= 24'h00af5f;    		8'd99:  RGB <= 24'h875fff;    	8'd163: RGB <= 24'hd700af;    	8'd227: RGB <= 24'hffff5f;
			8'd36: RGB <= 24'h00af87;    		8'd100: RGB <= 24'h878700;    	8'd164: RGB <= 24'hd700d7;    	8'd228: RGB <= 24'hffff87;
			8'd37: RGB <= 24'h00afaf;    		8'd101: RGB <= 24'h87875f;    	8'd165: RGB <= 24'hd700ff;    	8'd229: RGB <= 24'hffffaf;
			8'd38: RGB <= 24'h00afd7;    		8'd102: RGB <= 24'h878787;    	8'd166: RGB <= 24'hd75f00;    	8'd230: RGB <= 24'hffffd7;
			8'd39: RGB <= 24'h00afff;    		8'd103: RGB <= 24'h8787af;    	8'd167: RGB <= 24'hd75f5f;    	8'd231: RGB <= 24'hffffff;
			8'd40: RGB <= 24'h00d700;    		8'd104: RGB <= 24'h8787d7;    	8'd168: RGB <= 24'hd75f87;    	8'd232: RGB <= 24'h080808;
			8'd41: RGB <= 24'h00d75f;    		8'd105: RGB <= 24'h8787ff;    	8'd169: RGB <= 24'hd75faf;    	8'd233: RGB <= 24'h121212;
			8'd42: RGB <= 24'h00d787;    		8'd106: RGB <= 24'h87af00;    	8'd170: RGB <= 24'hd75fd7;    	8'd234: RGB <= 24'h1c1c1c;
			8'd43: RGB <= 24'h00d7af;    		8'd107: RGB <= 24'h87af5f;    	8'd171: RGB <= 24'hd75fff;    	8'd235: RGB <= 24'h262626;
			8'd44: RGB <= 24'h00d7d7;    		8'd108: RGB <= 24'h87af87;    	8'd172: RGB <= 24'hd78700;    	8'd236: RGB <= 24'h303030;
			8'd45: RGB <= 24'h00d7ff;    		8'd109: RGB <= 24'h87afaf;    	8'd173: RGB <= 24'hd7875f;    	8'd237: RGB <= 24'h3a3a3a;
			8'd46: RGB <= 24'h00ff00;    		8'd110: RGB <= 24'h87afd7;    	8'd174: RGB <= 24'hd78787;    	8'd238: RGB <= 24'h444444;
			8'd47: RGB <= 24'h00ff5f;    		8'd111: RGB <= 24'h87afff;    	8'd175: RGB <= 24'hd787af;    	8'd239: RGB <= 24'h4e4e4e;
			8'd48: RGB <= 24'h00ff87;    		8'd112: RGB <= 24'h87d700;    	8'd176: RGB <= 24'hd787d7;    	8'd240: RGB <= 24'h585858;
			8'd49: RGB <= 24'h00ffaf;    		8'd113: RGB <= 24'h87d75f;    	8'd177: RGB <= 24'hd787ff;    	8'd241: RGB <= 24'h626262;
			8'd50: RGB <= 24'h00ffd7;    		8'd114: RGB <= 24'h87d787;    	8'd178: RGB <= 24'hd7af00;    	8'd242: RGB <= 24'h6c6c6c;
			8'd51: RGB <= 24'h00ffff;    		8'd115: RGB <= 24'h87d7af;    	8'd179: RGB <= 24'hd7af5f;    	8'd243: RGB <= 24'h767676;
			8'd52: RGB <= 24'h5f0000;    		8'd116: RGB <= 24'h87d7d7;    	8'd180: RGB <= 24'hd7af87;    	8'd244: RGB <= 24'h808080;
			8'd53: RGB <= 24'h5f005f;    		8'd117: RGB <= 24'h87d7ff;    	8'd181: RGB <= 24'hd7afaf;    	8'd245: RGB <= 24'h8a8a8a;
			8'd54: RGB <= 24'h5f0087;    		8'd118: RGB <= 24'h87ff00;    	8'd182: RGB <= 24'hd7afd7;    	8'd246: RGB <= 24'h949494;
			8'd55: RGB <= 24'h5f00af;    		8'd119: RGB <= 24'h87ff5f;    	8'd183: RGB <= 24'hd7afff;    	8'd247: RGB <= 24'h9e9e9e;
			8'd56: RGB <= 24'h5f00d7;    		8'd120: RGB <= 24'h87ff87;    	8'd184: RGB <= 24'hd7d700;    	8'd248: RGB <= 24'ha8a8a8;
			8'd57: RGB <= 24'h5f00ff;    		8'd121: RGB <= 24'h87ffaf;    	8'd185: RGB <= 24'hd7d75f;    	8'd249: RGB <= 24'hb2b2b2;
			8'd58: RGB <= 24'h5f5f00;    		8'd122: RGB <= 24'h87ffd7;    	8'd186: RGB <= 24'hd7d787;    	8'd250: RGB <= 24'hbcbcbc;
			8'd59: RGB <= 24'h5f5f5f;    		8'd123: RGB <= 24'h87ffff;    	8'd187: RGB <= 24'hd7d7af;    	8'd251: RGB <= 24'hc6c6c6;
			8'd60: RGB <= 24'h5f5f87;    		8'd124: RGB <= 24'haf0000;    	8'd188: RGB <= 24'hd7d7d7;    	8'd252: RGB <= 24'hd0d0d0;
			8'd61: RGB <= 24'h5f5faf;    		8'd125: RGB <= 24'haf005f;    	8'd189: RGB <= 24'hd7d7ff;    	8'd253: RGB <= 24'hdadada;
			8'd62: RGB <= 24'h5f5fd7;    		8'd126: RGB <= 24'haf0087;    	8'd190: RGB <= 24'hd7ff00;    	8'd254: RGB <= 24'he4e4e4;
			8'd63: RGB <= 24'h5f5fff;    		8'd127: RGB <= 24'haf00af;    	8'd191: RGB <= 24'hd7ff5f;    	8'd255: RGB <= 24'heeeeee;
			endcase
    end 
    
endmodule
