draw_self();
draw_set_font(font_battle);


draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x,y-60,sound_string);


draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

if (string_length(keyboard_string) > 5) {
	keyboard_string = string_copy(keyboard_string,1,5);
	}

keyboard_string = string_lower(keyboard_string);

contains = false;
correct_index = 0;
for (i = 1; i <= string_length(keyboard_string); i++) {
	draw_set_color(c_black);
	if (string_copy(keyboard_string,i,string_length(sound_string)) == sound_string) {
		correct_index = string_length(sound_string);
		contains = true;
		}

	if (correct_index > 0) {
		correct_index --;
		draw_set_color(c_green);
		}
	if (already_used) {
		draw_set_color(c_red);
		}	
	if (correct) {
		draw_set_color(c_green);
		}
		
	if (state == 0) {
		draw_text(x-40+(i*15),y,string_char_at(keyboard_string,i));
		}
		else
		{
		draw_set_color(c_green);
		draw_text(x-40+(i*15),y,string_char_at(final_answer,i));
		}
	}

//faux step event

switch(state) {
	case 0:
	y++;
	if (y > obj_Soul.y) {
		y = obj_Soul.y;
		}
	
	
	if (keyboard_string != old_string) {
		audio_play_sound(snd_noise,0,0);
		old_string = keyboard_string;
		
		if (contains) {
			correct = false;
			already_used = false;
	
			//calculate validity
			for (i=0;i<array_length(used_words);i++) {
				if (keyboard_string == used_words[i]) {
					already_used = true;
					}
				}
	
			if (!already_used) {
				foundword = false;
				if (keyboard_string == "icup") {
					foundword = true;
					}
				for (i=0;i<array_length(words);i++) {
					if (keyboard_string == words[i]) {
						foundword = true;
						}
					}
				if (foundword) {
					correct = true;
					state = 1;
					target_y = y - 80;
					timer = 0;
					final_answer = keyboard_string;
					audio_play_sound(snd_buyitem,0,0);
					}
				}
			}
		}
	break;
	case 1:
	
	y = lerp(y,target_y,0.15);
	if (y < 50) {
		y = 50;
		}
	
	timer++
	if (timer > 30) {
		
		correct = false;
		
		sound_string = sound_list[irandom(2)];
		
		state = 0;
		keyboard_string = "";
		used_words[used_words_index] = final_answer;
		used_words_index ++;
		}
	break;
	}
