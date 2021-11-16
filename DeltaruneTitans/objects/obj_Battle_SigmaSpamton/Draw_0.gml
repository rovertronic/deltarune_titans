if (sprite_index == spr_SigmaSpamton_Static) {
	shader_set(shade_static);
	shader_set_uniform_f(uni1,timer);
	shader_set_uniform_f(uni2,(image_index!=2));
	}

draw_self();

if (sprite_index == spr_SigmaSpamton_Static) {
	shader_reset();
	}

func_print_bubble(130,-20+(sin(sintimer/5)*5));