if (obj_Soul.soul_attack > 10) {
	audio_play_sound(snd_Hit,0,0);
	}
	else
	{
	audio_play_sound(snd_damage,0,0);
	}

//if (instance_exists(obj_En_OSpamton)) {
	//obj_En_OSpamton.state = 3;
	//}
if (instance_exists(obj_Battle_Jevil)) {
	obj_Battle_Jevil.state = 1;
	}
	
if (instance_exists(obj_Battle_Spamton)) {
	obj_Battle_Spamton.state = 1;
	}
if (instance_exists(obj_Battle_SigmaSpamton)) {
	if (obj_Battle_SigmaSpamton.angry) {
		obj_Battle_SigmaSpamton.state = 7;
		obj_Battle_SigmaSpamton.timer = 0;
		}
		else
		{
		obj_Battle_SigmaSpamton.state = 3;
		obj_Battle_SigmaSpamton.image_speed = 4;
		}
	}

instance_destroy();