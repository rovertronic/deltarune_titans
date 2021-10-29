// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_text_engine_loop(){
	if (text_index < string_length(text_read))&&(text_pause < 1) {
		text_index++;
		text_char = string_char_at(text_read,text_index);
		
		if (text_char != "/") {
			text_display += text_char
			}
			else
			{
			text_index ++;
			text_command_char = string_char_at(text_read,text_index);
			switch(text_command_char) {
				case "w":
				text_pause = 8;
				break;
				}
			}
			
		if (text_char == ",") {
			text_pause = 4;
			}
			
		char_silent = false;
		for (i=0; i<array_length(no_text_noise_table); i++) {
			if (no_text_noise_table[i] == text_char) {
				char_silent = true;
				}
			}
		if (!char_silent) {
			audio_play_sound(text_voice_table[text_voice],0,false);
			}
		}
		
	if (text_pause > 0) {
		text_pause --;
		}
	}