flash = !flash;
timer ++;

image_blend = c_red;
if (flash) {
	image_blend = c_yellow;
	}
	
if (!instance_exists(obj_Glove)) {
	audio_stop_sound(mus_sfx_a_target);
	instance_destroy();
	}
	else
	{
	if (timer > 18) {
		audio_stop_sound(mus_sfx_a_target);
		obj_Glove.target_x = x;
		obj_Glove.target_y = y;
		obj_Glove.hit = 1;
		audio_play_sound(snd_ultraswing,0,0);
		instance_destroy();
		}
	}