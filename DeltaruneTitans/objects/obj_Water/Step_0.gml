if ((distance_to_object(obj_Partner_Snowkid) < 60)&&(room == rm_OW2_sub2)) {
	audio_stop_sound(snd_Freeze);
	audio_play_sound(snd_Freeze,0,0);
	instance_destroy();
	instance_create_layer(x,y,"Instances_puzzle",obj_Ice);
	}