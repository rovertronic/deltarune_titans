audio_play_sound(snd_Heal,0,0);
alarm_set(0,120);
window_set_size(room_width,room_height);

if global.End == 0
    {
	func_setstar(0);
    }
    else
    {
	func_setstar(1);
    }

