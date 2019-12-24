module x1_lookup
(
input logic[9:0] y_position,
output logic[9:0] x_position
);

always_comb begin
		case(y_position)
				10'd5 : x_position = 10'd289;
				10'd10 : x_position = 10'd285;
				10'd15 : x_position = 10'd282;
10'd20 : x_position = 10'd278;
10'd25 : x_position = 10'd275;
10'd30 : x_position = 10'd271;
10'd35 : x_position = 10'd268;
10'd40 : x_position = 10'd264;
10'd45 : x_position = 10'd261;
10'd50 : x_position = 10'd258;
10'd55 : x_position = 10'd254;
10'd60 : x_position = 10'd251;
10'd65 : x_position = 10'd247;
10'd70 : x_position = 10'd244;
10'd75 : x_position = 10'd240;
10'd80 : x_position = 10'd237;
10'd85 : x_position = 10'd233;
10'd90 : x_position = 10'd230;
10'd95 : x_position = 10'd226;
10'd100 : x_position = 10'd223;
10'd105 : x_position = 10'd220;
10'd110 : x_position = 10'd216;
10'd115 : x_position = 10'd213;
10'd120 : x_position = 10'd209;
10'd125 : x_position = 10'd206;
10'd130 : x_position = 10'd202;
10'd135 : x_position = 10'd199;
10'd140 : x_position = 10'd195;
10'd145 : x_position = 10'd192;
10'd150 : x_position = 10'd189;
10'd155 : x_position = 10'd185;
10'd160 : x_position = 10'd182;
10'd165 : x_position = 10'd178;
10'd170 : x_position = 10'd175;
10'd175 : x_position = 10'd171;
10'd180 : x_position = 10'd168;
10'd185 : x_position = 10'd164;
10'd190 : x_position = 10'd161;
10'd195 : x_position = 10'd157;
10'd200 : x_position = 10'd154;
10'd205 : x_position = 10'd151;
10'd210 : x_position = 10'd147;
10'd215 : x_position = 10'd144;
10'd220 : x_position = 10'd140;
10'd225 : x_position = 10'd137;
10'd230 : x_position = 10'd133;
10'd235 : x_position = 10'd130;
10'd240 : x_position = 10'd126;
10'd245 : x_position = 10'd123;
10'd250 : x_position = 10'd120;
10'd255 : x_position = 10'd116;
10'd260 : x_position = 10'd113;
10'd265 : x_position = 10'd109;
10'd270 : x_position = 10'd106;
10'd275 : x_position = 10'd102;
10'd280 : x_position = 10'd99;
10'd285 : x_position = 10'd95;
10'd290 : x_position = 10'd92;
10'd295 : x_position = 10'd89;
10'd300 : x_position = 10'd85;
10'd305 : x_position = 10'd82;
10'd310 : x_position = 10'd78;
10'd315 : x_position = 10'd75;
10'd320 : x_position = 10'd71;
10'd325 : x_position = 10'd68;
10'd330 : x_position = 10'd64;
10'd335 : x_position = 10'd61;
10'd340 : x_position = 10'd57;
10'd345 : x_position = 10'd54;
10'd350 : x_position = 10'd51;
10'd355 : x_position = 10'd47;
10'd360 : x_position = 10'd44;
10'd365 : x_position = 10'd40;
10'd370 : x_position = 10'd37;
10'd375 : x_position = 10'd33;
10'd380 : x_position = 10'd30;
10'd385 : x_position = 10'd26;
10'd390 : x_position = 10'd23;
10'd395 : x_position = 10'd20;
10'd400 : x_position = 10'd16;
				default : x_position = 10'd292;
		endcase
end

endmodule

module x2_lookup
(
input logic[9:0] y_position,
output logic[9:0] x_position
);

always_comb begin
		case(y_position)
10'd5 : x_position = 10'd305;
10'd10 : x_position = 10'd303;
10'd15 : x_position = 10'd302;
10'd20 : x_position = 10'd300;
10'd25 : x_position = 10'd298;
10'd30 : x_position = 10'd296;
10'd35 : x_position = 10'd295;
10'd40 : x_position = 10'd293;
10'd45 : x_position = 10'd291;
10'd50 : x_position = 10'd289;
10'd55 : x_position = 10'd288;
10'd60 : x_position = 10'd286;
10'd65 : x_position = 10'd284;
10'd70 : x_position = 10'd282;
10'd75 : x_position = 10'd281;
10'd80 : x_position = 10'd279;
10'd85 : x_position = 10'd277;
10'd90 : x_position = 10'd275;
10'd95 : x_position = 10'd274;
10'd100 : x_position = 10'd272;
10'd105 : x_position = 10'd270;
10'd110 : x_position = 10'd268;
10'd115 : x_position = 10'd266;
10'd120 : x_position = 10'd265;
10'd125 : x_position = 10'd263;
10'd130 : x_position = 10'd261;
10'd135 : x_position = 10'd259;
10'd140 : x_position = 10'd258;
10'd145 : x_position = 10'd256;
10'd150 : x_position = 10'd254;
10'd155 : x_position = 10'd252;
10'd160 : x_position = 10'd251;
10'd165 : x_position = 10'd249;
10'd170 : x_position = 10'd247;
10'd175 : x_position = 10'd245;
10'd180 : x_position = 10'd244;
10'd185 : x_position = 10'd242;
10'd190 : x_position = 10'd240;
10'd195 : x_position = 10'd238;
10'd200 : x_position = 10'd237;
10'd205 : x_position = 10'd235;
10'd210 : x_position = 10'd233;
10'd215 : x_position = 10'd231;
10'd220 : x_position = 10'd229;
10'd225 : x_position = 10'd228;
10'd230 : x_position = 10'd226;
10'd235 : x_position = 10'd224;
10'd240 : x_position = 10'd222;
10'd245 : x_position = 10'd221;
10'd250 : x_position = 10'd219;
10'd255 : x_position = 10'd217;
10'd260 : x_position = 10'd215;
10'd265 : x_position = 10'd214;
10'd270 : x_position = 10'd212;
10'd275 : x_position = 10'd210;
10'd280 : x_position = 10'd208;
10'd285 : x_position = 10'd207;
10'd290 : x_position = 10'd205;
10'd295 : x_position = 10'd203;
10'd300 : x_position = 10'd201;
10'd305 : x_position = 10'd200;
10'd310 : x_position = 10'd198;
10'd315 : x_position = 10'd196;
10'd320 : x_position = 10'd194;
10'd325 : x_position = 10'd192;
10'd330 : x_position = 10'd191;
10'd335 : x_position = 10'd189;
10'd340 : x_position = 10'd187;
10'd345 : x_position = 10'd185;
10'd350 : x_position = 10'd184;
10'd355 : x_position = 10'd182;
10'd360 : x_position = 10'd180;
10'd365 : x_position = 10'd178;
10'd370 : x_position = 10'd177;
10'd375 : x_position = 10'd175;
10'd380 : x_position = 10'd173;
10'd385 : x_position = 10'd171;
10'd390 : x_position = 10'd170;
10'd395 : x_position = 10'd168;
10'd400 : x_position = 10'd166;
				default : x_position = 10'd307;
		endcase
end

endmodule

module x4_lookup
(
input logic[9:0] y_position,
output logic[9:0] x_position
);

always_comb begin
		case(y_position)
10'd5 : x_position = 10'd334;
10'd10 : x_position = 10'd335;
10'd15 : x_position = 10'd337;
10'd20 : x_position = 10'd339;
10'd25 : x_position = 10'd340;
10'd30 : x_position = 10'd342;
10'd35 : x_position = 10'd343;
10'd40 : x_position = 10'd345;
10'd45 : x_position = 10'd347;
10'd50 : x_position = 10'd348;
10'd55 : x_position = 10'd350;
10'd60 : x_position = 10'd352;
10'd65 : x_position = 10'd353;
10'd70 : x_position = 10'd355;
10'd75 : x_position = 10'd357;
10'd80 : x_position = 10'd358;
10'd85 : x_position = 10'd360;
10'd90 : x_position = 10'd361;
10'd95 : x_position = 10'd363;
10'd100 : x_position = 10'd365;
10'd105 : x_position = 10'd366;
10'd110 : x_position = 10'd368;
10'd115 : x_position = 10'd370;
10'd120 : x_position = 10'd371;
10'd125 : x_position = 10'd373;
10'd130 : x_position = 10'd375;
10'd135 : x_position = 10'd376;
10'd140 : x_position = 10'd378;
10'd145 : x_position = 10'd379;
10'd150 : x_position = 10'd381;
10'd155 : x_position = 10'd383;
10'd160 : x_position = 10'd384;
10'd165 : x_position = 10'd386;
10'd170 : x_position = 10'd388;
10'd175 : x_position = 10'd389;
10'd180 : x_position = 10'd391;
10'd185 : x_position = 10'd393;
10'd190 : x_position = 10'd394;
10'd195 : x_position = 10'd396;
10'd200 : x_position = 10'd398;
10'd205 : x_position = 10'd399;
10'd210 : x_position = 10'd401;
10'd215 : x_position = 10'd402;
10'd220 : x_position = 10'd404;
10'd225 : x_position = 10'd406;
10'd230 : x_position = 10'd407;
10'd235 : x_position = 10'd409;
10'd240 : x_position = 10'd411;
10'd245 : x_position = 10'd412;
10'd250 : x_position = 10'd414;
10'd255 : x_position = 10'd416;
10'd260 : x_position = 10'd417;
10'd265 : x_position = 10'd419;
10'd270 : x_position = 10'd420;
10'd275 : x_position = 10'd422;
10'd280 : x_position = 10'd424;
10'd285 : x_position = 10'd425;
10'd290 : x_position = 10'd427;
10'd295 : x_position = 10'd429;
10'd300 : x_position = 10'd430;
10'd305 : x_position = 10'd432;
10'd310 : x_position = 10'd434;
10'd315 : x_position = 10'd435;
10'd320 : x_position = 10'd437;
10'd325 : x_position = 10'd438;
10'd330 : x_position = 10'd440;
10'd335 : x_position = 10'd442;
10'd340 : x_position = 10'd443;
10'd345 : x_position = 10'd445;
10'd350 : x_position = 10'd447;
10'd355 : x_position = 10'd448;
10'd360 : x_position = 10'd450;
10'd365 : x_position = 10'd452;
10'd370 : x_position = 10'd453;
10'd375 : x_position = 10'd455;
10'd380 : x_position = 10'd456;
10'd385 : x_position = 10'd458;
10'd390 : x_position = 10'd460;
10'd395 : x_position = 10'd461;
10'd400 : x_position = 10'd463;
				default : x_position = 10'd332;
		endcase
end

endmodule

module x5_lookup
(
input logic[9:0] y_position,
output logic[9:0] x_position
);

always_comb begin
		case(y_position)
			10'd5 : x_position = 10'd345;
			10'd10 : x_position = 10'd349;
			10'd15 : x_position = 10'd352;
			10'd20 : x_position = 10'd356;
			10'd25 : x_position = 10'd359;
			10'd30 : x_position = 10'd362;
			10'd35 : x_position = 10'd366;
			10'd40 : x_position = 10'd369;
			10'd45 : x_position = 10'd373;
			10'd50 : x_position = 10'd376;
			10'd55 : x_position = 10'd379;
			10'd60 : x_position = 10'd383;
			10'd65 : x_position = 10'd386;
			10'd70 : x_position = 10'd390;
			10'd75 : x_position = 10'd393;
			10'd80 : x_position = 10'd396;
			10'd85 : x_position = 10'd400;
			10'd90 : x_position = 10'd403;
			10'd95 : x_position = 10'd407;
			10'd100 : x_position = 10'd410;
			10'd105 : x_position = 10'd413;
			10'd110 : x_position = 10'd417;
			10'd115 : x_position = 10'd420;
			10'd120 : x_position = 10'd424;
			10'd125 : x_position = 10'd427;
			10'd130 : x_position = 10'd430;
			10'd135 : x_position = 10'd434;
			10'd140 : x_position = 10'd437;
			10'd145 : x_position = 10'd441;
			10'd150 : x_position = 10'd444;
			10'd155 : x_position = 10'd447;
			10'd160 : x_position = 10'd451;
			10'd165 : x_position = 10'd454;
			10'd170 : x_position = 10'd458;
			10'd175 : x_position = 10'd461;
			10'd180 : x_position = 10'd464;
			10'd185 : x_position = 10'd468;
			10'd190 : x_position = 10'd471;
			10'd195 : x_position = 10'd475;
			10'd200 : x_position = 10'd478;
			10'd205 : x_position = 10'd481;
			10'd210 : x_position = 10'd485;
			10'd215 : x_position = 10'd488;
			10'd220 : x_position = 10'd492;
			10'd225 : x_position = 10'd495;
			10'd230 : x_position = 10'd498;
			10'd235 : x_position = 10'd502;
			10'd240 : x_position = 10'd505;
			10'd245 : x_position = 10'd509;
			10'd250 : x_position = 10'd512;
			10'd255 : x_position = 10'd515;
			10'd260 : x_position = 10'd519;
			10'd265 : x_position = 10'd522;
			10'd270 : x_position = 10'd526;
			10'd275 : x_position = 10'd529;
			10'd280 : x_position = 10'd532;
			10'd285 : x_position = 10'd536;
			10'd290 : x_position = 10'd539;
			10'd295 : x_position = 10'd543;
			10'd300 : x_position = 10'd546;
			10'd305 : x_position = 10'd549;
			10'd310 : x_position = 10'd553;
			10'd315 : x_position = 10'd556;
			10'd320 : x_position = 10'd560;
			10'd325 : x_position = 10'd563;
			10'd330 : x_position = 10'd566;
			10'd335 : x_position = 10'd570;
			10'd340 : x_position = 10'd573;
			10'd345 : x_position = 10'd577;
			10'd350 : x_position = 10'd580;
			10'd355 : x_position = 10'd583;
			10'd360 : x_position = 10'd587;
			10'd365 : x_position = 10'd590;
			10'd370 : x_position = 10'd594;
			10'd375 : x_position = 10'd597;
			10'd380 : x_position = 10'd600;
			10'd385 : x_position = 10'd604;
			10'd390 : x_position = 10'd607;
			10'd395 : x_position = 10'd611;
			10'd400 : x_position = 10'd614;
				default : x_position = 10'd342;
		endcase
end

endmodule