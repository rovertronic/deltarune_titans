global.SavedSouls += 1;
global.State = 1;
audio_stop_sound(snd_Alarm);
audio_play_sound(snd_Heal,0,0);
global.HP = 50;

