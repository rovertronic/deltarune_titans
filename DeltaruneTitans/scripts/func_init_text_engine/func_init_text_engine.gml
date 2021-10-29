// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_init_text_engine(){
	no_text_noise_table = [" ","?","!","*",".","'",","];
	text_voice_table = [snd_Talk,snd_TalkSpamton,snd_TalkRegular,snd_TalkIceKid,snd_LetterBox];

	text_open = false;
	text_voice = 1;
	text_index = 0;
	text_pause = 0;
	text_char = "";
	text_read = "";
	text_display = "";
	text_command_char = "";
	}