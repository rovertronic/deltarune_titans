draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(font_new_dialog);
draw_set_color(c_white);

switch(title_state) {
	case 0:
	draw_text(room_width/2,(room_height/2)-128,"An Undertale / Deltarune Fangame");
	draw_text(room_width/2,(room_height/2)+128,"By Rovert");
	draw_sprite_ext(spr_Rovert,0,room_width/2,room_height/2,2,2,0,c_white,1);
	break;
	case 1:
	draw_sprite(spr_Title,0,room_width/2,title_y);
	break;
	}
	
draw_set_color(c_black);
draw_set_alpha(title_fade_amount);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_color(c_white);
draw_set_alpha(1);