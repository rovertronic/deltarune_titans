audio_play_sound(snd_damage,0,0);

//if (instance_exists(obj_En_OSpamton)) {
	//obj_En_OSpamton.state = 3;
	//}
if (instance_exists(obj_Battle_Jevil)) {
	obj_Battle_Jevil.state = 1;
	}
	
if (instance_exists(obj_Battle_Spamton)) {
	obj_Battle_Spamton.state = 1;
	}

instance_destroy();