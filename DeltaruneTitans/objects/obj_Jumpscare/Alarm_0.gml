global.StartMatter = false;
global.StartMusic = mus_prejevil;
audio_sound_pitch(mus_prejevil,0.25);
global.Run = 2;
audio_play_sound(global.StartMusic,0,true);
surface_resize(application_surface, 640, 360);
room_goto(rm_OW1_sub2);