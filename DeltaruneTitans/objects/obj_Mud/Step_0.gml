if place_meeting(x,y,obj_Human) {
	audio_play_sound(snd_splat,0,false);
	instance_create_layer(x,y,"Instances_puzzle",obj_OpenTile);
	instance_destroy();
	}
