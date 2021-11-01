if (global.Current_Interacting_Object == id) {
	u8 = true;
	}
	else
	{
	if (u8) {
		u8 = false;
		interacts++;
		if (interacts > 3) {
			interacts = 3;
			}
		dialogid = dialoglist[interacts];
		}
	}
	
if (state == 1) {
	timer ++;
	if (timer > 30) {
		state = 2;
		image_index = 1;
		audio_play_sound(snd_noise,0,0);
		instance_create(x+48,y+10,obj_OW_Spamton);
		}
	}