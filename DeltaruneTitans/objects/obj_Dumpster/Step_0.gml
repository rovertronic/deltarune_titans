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
		global.StartMusic = mus_spamton;
		global.CurrentMusic = mus_spamton;
		audio_sound_pitch(mus_spamton,1);
		if (global.Run == 2) {
			audio_sound_pitch(mus_spamton,0.5);
			}
		if (global.MusicOn) {
			audio_play_sound(global.StartMusic,0,true);
			}
		}
	}