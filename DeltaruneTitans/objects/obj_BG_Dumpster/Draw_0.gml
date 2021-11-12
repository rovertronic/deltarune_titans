if (transition) {
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_red,1);
	}
	
if (transition_fade > 0) {
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,transition_fade);
	}