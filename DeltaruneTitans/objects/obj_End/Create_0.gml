audio_play_sound(snd_save,0,0);
alarm_set(0,120);
window_set_size(room_width,room_height);

if global.End == 0
    {
	func_setstar(0);
	audio_sound_pitch(mus_prejevil,0.75);
    }
    else
    {
	audio_sound_pitch(mus_prejevil,0.5);
	func_setstar(1);
	global.LV = 2;
    }

