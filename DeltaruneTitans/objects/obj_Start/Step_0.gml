func_controls();

if (transition_io) {
	if (!submenu_open) { //normal menu controls
	if (dcp) {
		if (scroll_vertical < chapter_total) {
			scroll_vertical ++;
			audio_play_sound(snd_Menu,0,false);
			}
		}
	if (ucp) {
		if (scroll_vertical > 0) {
			scroll_vertical --;
			audio_play_sound(snd_Menu,0,false);
			}
		}

	if (scroll_vertical == chapter_total) {
		if (rcp) {
			if (scroll_horizontal < array_length(menu_text)-1) {
				scroll_horizontal ++;
				audio_play_sound(snd_Menu,0,false);
				}
			}
		if (lcp) {
			if (scroll_horizontal > 0) {
				scroll_horizontal --;
				audio_play_sound(snd_Menu,0,false);
				}
			}
		}
	
	}
	else
	{//submenu controls
	if (dcp) {
		scroll_submenu ++;
		}
	if (ucp) {
		scroll_submenu --;
		}
	switch(submenu_type) {
		case 0:
		scroll_submenu = clamp(scroll_submenu,0,array_length(options_text)-1);
		break;
		case 3:
		scroll_submenu = clamp(scroll_submenu,0,3);
		break;
		}
	}

	chapter_scroll_value = chapter_scroll_table[scroll_vertical];

	if (b1p||b2p) {
		if (!submenu_open) {
			if (scroll_vertical < 7) {
				//chapter menu
				if (scroll_vertical < chapter_unlocks+1) {
					global.Chapter = scroll_vertical;
					submenu_open = true;
					submenu_type = 3;	
					scroll_submenu = 3;
					}
					else
					{
					audio_play_sound(snd_MenuError,0,false);
					}
				}
				else
				{
				switch(scroll_horizontal) {
					case 0:
						if (func_inv_itemcount() > 0) {
							submenu_open = true;
							submenu_type = 2;
							}
							else
							{
							audio_play_sound(snd_MenuError,0,0);
							}
					break;
					case 1:
						submenu_open = true;
						submenu_type = 1;	
					break;
					case 2:
					scroll_submenu = 0;
					submenu_open = true;
					submenu_type = 0;
					break;
					case 3:
						game_end();
					break;
					}
				}
			}
			else
			{//submenu controls
			switch (submenu_type) {
				case 0:
				switch(scroll_submenu) {
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
							gamepad_temporary = 0;
							break;
							case 1:
							options_value[1] = 2;
							gamepad_temporary = 1;
							break;
							case 2:
							options_value[1] = 0;
							gamepad_temporary = 3;
							break;
							}
					break;
					case 2://delete save
						switch(options_value[2]) {
							case 0:
							options_value[2] ++;
							audio_play_sound(snd_MenuError,0,false);
							break;
							case 1:
							options_value[2] ++;
							audio_play_sound(snd_Attack,0,false);
							break;
							case 2:
							options_value[2] ++;
							audio_play_sound(snd_Hit,0,false);
					
							file_delete("Deltarune_Titans_Save.ini");
					
							transition_room = room;
							transition_io = false;

							break;
							}
					break;
					case 3://exit menu
						global.Gamepad = gamepad_temporary;
						submenu_open = false;
					break;
					}
				break;
				case 1:
					submenu_open = false;
				break;
				case 2:
					submenu_open = false;
				break;
				case 3: //chapter description
					if (scroll_submenu == 3) {
						submenu_open = false;
						}
						else
						{
						if (runs_unlocked[global.Chapter][scroll_submenu]) {
							global.Run = scroll_submenu;
							global.LV = start_lvs[global.Chapter][global.Run];
							transition_room = chapter_rooms[global.Chapter];
							transition_io = false;
							}
							else
							{
							audio_play_sound(snd_MenuError,0,0);	
							}
						}
					
				break;
				}
			}

		}
	}

if (keyboard_check_pressed(vk_f4)) {
	window_set_fullscreen(window_get_fullscreen());
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
		global.StartMusic = chapter_musics[scroll_vertical];
		room_goto(transition_room);
		}
	}
	
if (submenu_open) {
	submenu_width = lerp(submenu_width,100,.2);
	submenu_height = lerp(submenu_height,150,.2);
	submenu_open_full = (submenu_width > 95);
	}
	else
	{
	submenu_width = lerp(submenu_width,0,.2);
	submenu_height = lerp(submenu_height,0,.2);
	submenu_open_full = false;
	}