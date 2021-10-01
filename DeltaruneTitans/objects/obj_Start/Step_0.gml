if (transition_io) {
	if (keyboard_check_pressed(vk_down)) {
		if (scroll_vertical < chapter_total) {
			scroll_vertical ++;
			audio_play_sound(snd_Menu,0,false);
			}
		}
	if (keyboard_check_pressed(vk_up)) {
		if (scroll_vertical > 0) {
			scroll_vertical --;
			audio_play_sound(snd_Menu,0,false);
			}
		}

	if (scroll_vertical == chapter_total) {
		if (keyboard_check_pressed(vk_right)) {
			scroll_horizontal ++;
			audio_play_sound(snd_Menu,0,false);
			}
		if (keyboard_check_pressed(vk_left)) {
			scroll_horizontal --;
			audio_play_sound(snd_Menu,0,false);
			}
		}
	scroll_horizontal = clamp(scroll_horizontal,0,array_length(options_value)-1)
	

	chapter_scroll_value = chapter_scroll_table[scroll_vertical];

	if keyboard_check_pressed(vk_enter) {
		if (scroll_vertical < 7) {
			//chapter menu
			if (scroll_vertical < chapter_unlocks+1) {
				if (global.chapters_played[scroll_vertical] == false) {
					global.chapters_played[scroll_vertical] = true;
					}
					else
					{
					global.Chapter = scroll_vertical;
				
					transition_room = chapter_rooms[scroll_vertical];
					transition_io = false;
					}
				}
				else
				{
				audio_play_sound(snd_MenuError,0,false);
				}
			}
			else
			{
			//lower settings
			switch(scroll_horizontal) {
				case 0:
					if (options_value[0] == 0) {
						window_set_fullscreen(true);
						options_value[0] = 1;
						}
						else
						{
						window_set_fullscreen(false);
						options_value[0] = 0;
						}
				break;
				case 1:
					switch(options_value[1]) {
						case 0:
						options_value[1] = 1;
						global.Gamepad = 0;
						break;
						case 1:
						options_value[1] = 2;
						global.Gamepad = 1;
						break;
						case 2:
						options_value[1] = 0;
						global.Gamepad = 3;
						break;
						}
				break;
				case 3://delete save
					switch(options_value[3]) {
						case 0:
						options_value[3] ++;
						audio_play_sound(snd_MenuError,0,false);
						break;
						case 1:
						options_value[3] ++;
						audio_play_sound(snd_Attack,0,false);
						break;
						case 2:
						options_value[3] ++;
						audio_play_sound(snd_Hit,0,false);
					
						file_delete("Deltarune_Titans_Save.ini");
					
						for (iy = 0; iy < 10; iy ++) {
							for (ix = 0; ix < 4; ix ++) {
								global.star_table[iy][ix] = 0;
								}
							}
						break;
						}
				break;
				}
			}
		}
	}

if (keyboard_check_pressed(vk_f4)) {
	window_set_fullscreen(true);
	}
	
if (transition_io) {
	if (transition_fade > 0) {
		transition_fade-=.05;
		}
	}
	else
	{
	if (transition_fade < 1) {
		transition_fade+=.05;
		}
		else
		{
		audio_play_sound(chapter_musics[scroll_vertical],0,1);
		room_goto(transition_room);
		}
	}