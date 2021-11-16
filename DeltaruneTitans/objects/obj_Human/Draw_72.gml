if (bglayer) {
	shader_set(shade_void);
	shader_set_uniform_f(uni1,sintimer);
	draw_sprite_ext(spr_VoidBG,0,camera_get_view_x(view_camera[0])-100,camera_get_view_y(view_camera[0])-100,2,2,0,c_white,1);
	shader_reset();
	}