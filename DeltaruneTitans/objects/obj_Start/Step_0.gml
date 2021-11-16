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
		case 2:
		scroll_submenu = clamp(scroll_submenu,0,global.UpgradeLevel-1);
		global.Current_Soul_Skin = scroll_submenu;
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
						submenu_open = true;
						submenu_type = 2;
						scroll_submenu = global.Current_Soul_Skin;
					break;
					case 1:
						submenu_open = true;
						submenu_type = 1;
						credits_scroll = 320;
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
					case 3://retry mode
						options_value[3]++;
						if (options_value[3] > 2) {
							options_value[3] = 0;
							}
						global.RetryMode = options_value[3];
					break;
					case 4://music
						global.MusicOn = !global.MusicOn;
						options_value[4] = !options_value[4];
						save_settings();
					break;
					case 5://eqip
						options_value[5]++;
						if (options_value[5] > 2) {
							options_value[5] = 0;
							}
						global.EquipmentMode = options_value[5];
						save_settings();
					break;
					case 6://exit menu
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
					save_settings();
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
		switch(global.EquipmentMode) {
			case 0:
				if (global.Best_Chapter+1 == global.Chapter) { //best chapter+1 is latest unlocked, but not complete
					global.Equipment = global.Chapter;
					}
					else
					{
					global.Equipment = global.Best_Chapter;
					}
			break;
			case 1:
				global.Equipment = global.Chapter;
			break;
			case 2:
				global.Equipment = 0;
			break;
			}
		
		
		global.UpgradeATK = chapter_atk_def_start[global.Equipment][0];
		global.UpgradeDF = chapter_atk_def_start[global.Equipment][1];
		
		global.StartMusic = chapter_musics[scroll_vertical];
		
		global.Encounter = global.Chapter;
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
	
credits_scroll --;
credits_scroll -= (dc*2)
