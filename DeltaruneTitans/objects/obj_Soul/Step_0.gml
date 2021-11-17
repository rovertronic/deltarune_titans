func_controls();

if keyboard_check_pressed(vk_escape)
    {
    room_goto(rm_Start);
    }
	
slowdown_input = false;
sped = 4+soul_speed+soul_speed_temporary;
sped = 4+soul_speed+soul_speed_temporary;
sped = lerp(sped,2,slowdown/10);
if (!dead) {
    if global.Gamepad == 0
        {
        haxis = (window_mouse_get_x()-centerx)/5;
        vaxis = (window_mouse_get_y()-centery)/5;
		haxis = clamp(haxis,-1,1);
		vaxis = clamp(vaxis,-1,1);
		
        if mouse_check_button(mb_right)
            {
            slowdown_input = true;
            }
        }
    if global.Gamepad == 1
        {
        haxis = gamepad_axis_value(0, gp_axislh);
        vaxis = gamepad_axis_value(0, gp_axislv);
		
        if gamepad_button_check(0,gp_face3)
            {
            slowdown_input = true;
            }

        }
    if global.Gamepad == 3
        {
        haxis = 0;
        vaxis = 0;
        if keyboard_check(vk_up)
            {
            vaxis = -1;
            }
        if keyboard_check(vk_down)
            {
            vaxis = 1;
            }
        if keyboard_check(vk_left)
            {
            haxis = -1;
            }
        if keyboard_check(vk_right)
            {
            haxis = 1;
            }
        }
    }
    else
    {//soul is frozen, cannot move
	haxis = 0;
	vaxis = 0;
    }

if (b2&&(!player_move)) {
	slowdown ++;
	}
	else
	{
	slowdown --;
	}
slowdown = clamp(slowdown,0,10);

//if (global.Gamepad != 0) {
	speedx = round(haxis*sped);
	speedy = round(vaxis*sped);
	//}
	
x += speedx;
y += speedy;

if (soul_bound) {
	while (soul_distance >= 86) {
		soul_distance = point_distance(320,240,x,y);
		dir = point_direction(x,y,320,240);
		x += lengthdir_x(1,dir);
		y += lengthdir_y(1,dir);
		}
	}

battle_box_x_v = lerp(battle_box_x_v,battle_box_x,.2);
battle_box_y_v = lerp(battle_box_y_v,battle_box_y,.2);
battle_box_h_v = lerp(battle_box_h_v,battle_box_h,.2);
battle_box_w_v = lerp(battle_box_w_v,battle_box_w,.2);


if x < battle_box_x_v+8
    {
    x = battle_box_x_v+8;
    }
if x > battle_box_x_v+battle_box_w_v-8
    {
    x = battle_box_x_v+battle_box_w_v-8;
    }
if y < battle_box_y_v+8
    {
    y = battle_box_y_v+8;
    }
if y > battle_box_y_v+battle_box_h_v-8
    {
    y = battle_box_y_v+battle_box_h_v-8;
    }
	
image_alpha = 1;
image_index = 0;
if (cooldown > 0) {
	if (floor(cooldown/4)%2) {
		image_index = 1;
		}
	cooldown --;
	}

if (turns_repel > 0) {
	cooldown = 1;
	image_alpha = 0.5;
	}
    
if (global.Graze > 0) {
	global.Graze --;
	}
if (global.DissalowGraze > 0) {
	global.DissalowGraze --;
	}

if ((fade > 0)&&(menu_state!=7)) {
	fade = lerp(fade,0,.1);
	}

hide_soul = false;
if (player_move) {//player turn

	switch(menu_state) {
		case 0:
			func_text_engine_loop();
			
			select_main_old = select_main;
			if (rcp) {
				select_main++;
				}
			if (lcp) {
				select_main--;
				}
			select_main = clamp(select_main,0,3-soul_nomercy);
			if (partner_move) {
				select_main = clamp(select_main,0,1);
				}
			if (select_main_old != select_main) {
				audio_play_sound(snd_Menu,0,0);
				}
			
			if (b1p) {
				switch(curr_partymember) {
					case 0: //human
						switch(select_main) {
							case 0://attack
								audio_play_sound(snd_MenuSelect,0,0);
								menu_state = 5;
								attack_stick_x = 47;
								attack_timer = 0;
								attack_stick_moving = true;
								attack_hud_size = 1;
							break;
							case 1:
								audio_play_sound(snd_MenuSelect,0,0);
								menu_state = 2;
								item_select_y = 0;
							break;
							case 2://item
								if (turns_noitem == 0) {
									if (func_inv_itemcount() > 0) {
										item_select_x = 0;
										item_select_y = 0;
										audio_play_sound(snd_MenuSelect,0,0);
										menu_state = 3;
										}
										else
										{
										audio_play_sound(snd_MenuError,0,0);
										}
									}
									else
									{
									audio_play_sound(snd_MenuError,0,0);
									menu_state = 6;
									func_init_text(90);
									}
							break;
							case 3://mercy
								audio_play_sound(snd_MenuSelect,0,0);
								menu_state = 4;
								item_select_y = 0;
							break;
							}
					break;
					case 1: //snowkid
						switch(select_main) {
							case 0://bite
								if (soul_action_taken != 2) {
									audio_play_sound(snd_Menu,0,0);
									menu_state = 5;
									attack_stick_x = 47;
									attack_timer = 0;
									attack_stick_moving = true;
									attack_hud_size = 1;
									}
									else
									{
									func_init_text(233);
									}
							break;
							case 1://defend
								if (global.Run != 2) {
									soul_defense_temporary = 1;
									tp_reserve += 8;
									menu_state = 6;
									func_init_text(89);
									}
									else
									{
									func_init_text(234);
									}
							break;
							}
					break;
					}
				}
		break;
		case 1://fighting minigame
			hide_soul = true;
			attack_stick_anim ++;
			if (attack_stick_moving) {
				attack_stick_anim = false;
				attack_stick_x += 12;
				if (attack_stick_x > 593) {
					attack_stick_damage = 0;
					attack_stick_moving = false;
					}
				}
				else
				{
				attack_timer ++;
				}
			if ((b1p)&&(attack_stick_moving)) {
				
				never_hurt = false;
				
				if (soul_attack_scripted) {
					soul_attack = soul_attack_script_table[soul_attack_script_index];
					soul_attack_script_index += 1 + soul_xslash;
					if (soul_attack_script_index > 13) {
						soul_attack_script_index = 13;
						}
					}
				
				attack_stick_moving = false;
				attack_stick_damage = 300-(abs(attack_stick_x-320));
				if (partner_move) {
					attack_stick_damage /= 2;
					}
				if (abs(attack_stick_x-320)) < 5 {
					attack_stick_damage *= 1.2;
					}
				tp_reserve += attack_stick_damage/80;
				audio_play_sound(snd_Attack,0,0);
				object = instance_create(global.Enemy_Object.x,global.Enemy_Object.y,obj_NewSlice);
				if (soul_xslash) {
					object._X = true;
					}
				}
			
			if ((attack_timer == 20)&&(attack_stick_damage>0)) {
				
				if (soul_xslash) {
					soul_xslash = false;
					attack_stick_damage *= 2;
					}
				
				object = instance_create(320,120,obj_DamageNum);
				object.num_input = attack_stick_damage*(soul_attack/10);
				global.Enemy_HP -= attack_stick_damage*(soul_attack/10);
				hp_bar_timer = 40;
				if (global.Enemy_HP < 1) {
					global.Enemy_HP = 0;
					audio_stop_sound(global.CurrentMusic);
					hide_box = true;
					}
				}
			if (attack_timer > 40) {
				attack_hud_size = lerp(attack_hud_size,0,.15);
				}
			if (attack_timer > 60) {
				if (global.Enemy_HP < 1) {
					partner_move = true;
					}
				do_enemy_dialog();
				if (global.Enemy_HP < 1) {
					partner_move = false;
					}
				}
		break;
		case 2: //act
			if (ucp) {
				item_select_y --;
				}
			if (dcp) {
				item_select_y ++;
				}
			if (b2p) {
				menu_state = 0;
				}
			item_select_y = clamp(item_select_y,0,act_table_amnt[actstate]);
			
			soul_menu_x = 70;
			soul_menu_y = 280+(item_select_y*30);
			
			if (b1p) {
				switch(actstate) {
					case 0://Regular Spamton
						switch(item_select_y) {
							case 0://check
								menu_state = 6;
								func_init_text(91);
							break;
							case 1://deal
								act_deal();
							break;
							case 2://exchange
								if (global.MP >= 12) {
									audio_play_sound(snd_buyitem,0,0);
									soul_kromer += 20;
									tp_reserve -= 12;
									menu_state = 6;
									func_init_text(143);
									}
							break;
							}
					break;
					case 1://Sigma Spamton unchecked
						switch(item_select_y) {
							case 0://check
								if (global.Run != 2) {
									actstate = 4; //unlock options
									menu_state = 6;
									func_init_text(161);
									}
									else
									{
									func_init_text(220);
									menu_state = 6;
									}
							break;
							case 1: //deal
								act_deal();
							break;
							case 2: //heavy exchange
								if (global.MP >= 25) {
									audio_play_sound(snd_buyitem,0,0);
									soul_kromer += 20;
									tp_reserve -= 25;
									menu_state = 6;
									func_init_text(163);
									}
							}
					break;
					case 2://Omega Spamton
						menu_state = 6;
						func_init_text(93);
					break;
					case 3://Jevil
						switch(item_select_y) {
							case 0://check
								menu_state = 6;
								func_init_text(114);
							break;
							}
					break;
					case 4: //Sigma Spamton Checked
					switch(item_select_y) {
						case 0://slice string

							if (global.MP >= 37) {
								global.WorkSouls ++;
								soul_freed_minigame = true;
								menu_state = 6;
								func_init_text(95);
								tp_reserve -= 37;
								audio_play_sound(snd_Attack,0,0);
								}
						break;
						case 1: //deal
							act_deal();
						break;
						case 2: //heavy exchange
							if (global.MP >= 25) {
								audio_play_sound(snd_buyitem,0,0);
								soul_kromer += 20;
								tp_reserve -= 25;
								menu_state = 6;
								func_init_text(163);
								}
						break;
						}
					break;
					case 5://spamton sigma pacifist finale
						func_init_text(166);
						global.HP = global.MaxHP;
						audio_play_sound(snd_Heal,0,0);
						menu_state = 6;
					break;
					case 6://devil
						switch(item_select_y) {
							case 0://check
								menu_state = 6;
								func_init_text(324);
							break;
							case 1://talk
								menu_state = 6;
								func_init_text(370);
								soul_action_taken = 4;//act
							break;
							}
					break;
					}
				}
		break;
		case 3: //items
			item_select_x_old = item_select_x;
			item_select_y_old = item_select_y;
		
			if (lcp||rcp) {
				item_select_x = !item_select_x;
				}
			if (ucp) {
				item_select_y --;
				}
			if (dcp) {
				item_select_y ++;
				}
			item_select_y = clamp(item_select_y,0,3);
			if (b2p) {
				menu_state = 0;
				}
			
			item_pick = (item_select_x*4)+item_select_y;
			
			if (global.Inventory[item_pick] == 0) {
				item_select_x = item_select_x_old;
				item_select_y = item_select_y_old;
				}	
			
			soul_menu_x = 70+(220*item_select_x);
			soul_menu_y = 280+(item_select_y*24);
			
			if (b1p) {
				soul_action_taken = 3;
				switch(global.Inventory[item_pick]) {
					case 1://tensionbit
						tp_reserve += 16;
						consume_item();
						menu_state = 6;
						func_init_text(66);
						audio_play_sound(snd_Heal,0,0);
					break;
					case 2://repel gel
						turns_repel = 2;
						consume_item();
						menu_state = 6;
						func_init_text(67);
						audio_play_sound(snd_Heal,0,0);
					break;
					case 3: //sea tea
						global.HP+=10;
						global.HP = clamp(global.HP,0,global.MaxHP);
						soul_speed ++;
						consume_item();
						menu_state = 6;
						func_init_text(68);
						audio_play_sound(snd_Heal,0,0);
					break;
					case 4: //golden apple
						global.MaxHP += 10;
						hud_hp_offset += 10;
						consume_item();
						menu_state = 6;
						func_init_text(69);
						audio_play_sound(snd_Heal,0,0);
					break;
					case 5: //herb
						global.HP+=50;
						global.HP = clamp(global.HP,0,global.MaxHP);
						consume_item();
						menu_state = 6;
						func_init_text(70);
						audio_play_sound(snd_Heal,0,0);
					break;
					case 6: //regen pot
						turns_noitem = 3;
						regeneration = 1000;
						consume_item();
						menu_state = 6;
						func_init_text(71);
						audio_play_sound(snd_Heal,0,0);
					break;
					}
				}
		break;
		case 4: //mercy
			if (ucp) {
				item_select_y --;
				}
			if (dcp) {
				item_select_y ++;
				}
			if (b2p) {
				menu_state = 0;
				}
			item_select_y = clamp(item_select_y,0,1);
			
			soul_menu_x = 70;
			soul_menu_y = 280+(item_select_y*30);
			
			if (b1p) {
				switch(item_select_y) {
					case 0:
						soul_action_taken = 2;
						do_enemy_dialog();
					break;
					case 1:
						soul_speed_temporary ++;
						menu_state = 6;
						func_init_text(119);
					break;
					}
				}
		break;
		case 5://select fight target
			soul_menu_x = 67;
			soul_menu_y = 280;
			if (b1p) {
				if ((global.MP >= 37)&&(!partner_move)) {
					menu_state = 12; //x slash menu
					item_select_y = 0;
					}
					else
					{
					if (!partner_move) {
						soul_action_taken = 1;
						}
					menu_state = 1;
					}
				}
			if (b2p) {
				menu_state = 0;
				}
		break;
		case 6://single text
			hide_soul = true;
			
			if (b2p) {
				text_display = text_read;
				text_index = string_length(text_read);
				}
			
			if (b1p)&&(text_index >= string_length(text_read)) {
				if (global.TextTable[global.TextIndex][1]) {
					//Continue
					text_index = 0; //Character Index
					global.TextIndex++; //Dialog ID
					text_read = global.TextTable[global.TextIndex][3]
					text_display = "";
					text_voice = global.TextTable[global.TextIndex][0]
					}
					else
					{
					do_enemy_dialog();
					}
				}
			func_text_engine_loop();
		break;
		case 7://intro
			if (timer < 12) {
				if (round(timer/2)%2) {
					if (!hide_soul) {
						audio_play_sound(snd_noise,0,0);
						}
					hide_soul = true;
					}
					else
					{
					hide_soul = false;
					}
				}
			if (timer == 15) {
				audio_play_sound(snd_battlefall,0,0);
				}
			if (timer > 15) {
				global.Soul_X = lerp(global.Soul_X,50,.2);
				global.Soul_Y = lerp(global.Soul_Y,450,.2);
				}
			if (timer == 40) {
				if (!audio_is_playing(global.CurrentMusic))&&(global.MusicOn) {
					audio_play_sound(global.CurrentMusic,0,true);
					}
				menu_state = 0;
				}
			soul_menu_x = global.Soul_X;
			soul_menu_y = global.Soul_Y;
			timer ++;
		break;
		case 8://death
			soul_menu_x = x;
			soul_menu_y = y;
			if (global.RetryMode > 0) {
				timer += 20;
				} else {
				timer ++;
				}
				
			if (timer == 60) {
				audio_play_sound(snd_break2,0,0);
				for (i=0;i<6;i++) {
					instance_create(x,y,obj_soulshard);
					}
				}
			if (timer > 60) {
				hide_soul = true;
				}
			if (timer > 120) {
				global.Inventory = global.SafeInventory;
				room_goto(room);
				}
		break;
		case 9: //enemy speak
			hide_soul = true;
			
			if (b2p) {
				text_display = text_read;
				text_index = string_length(text_read);
				}
			
			if (b1p)&&(text_index >= string_length(text_read))&&(!battle_transition) {
				if (global.TextTable[global.TextIndex][1]) {
					//Continue
					text_index = 0; //Character Index
					global.TextIndex++; //Dialog ID
					text_read = global.TextTable[global.TextIndex][3]
					text_display = "";
					text_voice = global.TextTable[global.TextIndex][0]
					}
					else
					{
					if (global.TextTable[global.TextIndex][2] == 1) { //end battle
						battle_end_star = 1; //1 = neutral
						battle_end_subending = 0;
						menu_state = 11;
						battle_end = true;
						timer = 0;

						switch(global.Enemy_ID) {
							case 2://sigma spamton
							case 3://omega spamton
								end_standard();
								func_set_mini_star(battle_end_subending);
								func_setstar(battle_end_star);
							break;
							case 4:
								if (soul_action_taken == 3) {
									battle_end_text = "No Ending (No Mini-Star!)";
									}
									else
									{
									battle_end_text = "Devil Ending";
									func_set_mini_star(4);
									}
							break;
							}
						}
						else //normal close
						{
						//3rd form
						if (global.TextTable[global.TextIndex][2] == 3) {
							switch(global.Enemy_ID) {
								case 2: //sigma spamton into omega
									menu_state = 0;
									actstate = 2;
									global.Enemy_ID = 3;
									global.Enemy_Name = "Omega Spamton";
									global.Enemy_HP = 1000000;
									global.Enemy_MaxHP = 1000000;
									global.Enemy_Attack = 0;
									soul_attack = .1;
									soul_attack_scripted = true;
									hide_box = false;
									textbox_alpha = .6;
									partner_move = false;
									curr_partymember = 0;
									image_yscale = 1;
									image_blend = c_red;
									
									e_attacktable = [[1,400],[2,400],[3,400],[4,400]];
									e_attacktable = func_scramble_array(e_attacktable);
									e_attackindex = 0;
									
									func_init_text(232);
								break;
								}
							}
							else
							{
							hide_box = false;
							end_turn();
							}
						}
					}
				}
				
			if (battle_transition) {
				battle_transition_timer++;
				
				switch(global.Enemy_ID) {
					case 0://jevil
						if (battle_transition_timer > 60) {
							whitefade += 0.016;
							}
						if (battle_transition_timer > 120) {
							audio_stop_sound(mus_f_destroyed2);
							audio_play_sound(mus_create,0,0);
							global.Inventory = global.SafeInventory;
							room_goto(rm_TVrm);
							}
					break;
					case 1://spamton
						if (battle_transition_timer > 90) {
							whitefade += 0.02;
							}
						if (whitefade > 1) {
							battle_transition = false;
							battle_transition_timer = 0;
							whitefade = 0;
							
							audio_play_sound(mus_create,0,0);
							
							hp_bar_size = 200;
							textbox_alpha = .8;
							global.CurrentMusic = mus_SigmaSpamton;
							global.StartMusic = mus_spamton;
							if (global.MusicOn) {
								audio_play_sound(global.CurrentMusic,0,true);
								}
							
							if (global.Run == 2) {
								soul_attack = 999;
								}
							
							global.Enemy_ID = 2;
							global.Enemy_Name = "Sigma Spamton";
							global.Enemy_HP = (global.Enemy_HP/global.Enemy_MaxHP)*1000;
							global.Enemy_MaxHP = 1000;
							global.Enemy_Attack = 0;
							instance_destroy(obj_Battle_Spamton);
							global.Enemy_Object = instance_create_layer(320,200,"Enemy",obj_Battle_SigmaSpamton);
							for (i = -1; i <2; i += 2) {
								object = instance_create_layer(320,200,"Enemy",obj_Spamton_Hand);
								object.target_x = 320+(i*250);
								if (i > 0) {
									object.hand_id = 1;
									object.image_xscale = -1;
									handobject[0] = object;
									}
									else
									{
									handobject[1] = object;
									}
								}
								
							for (i=global.SavedSouls;i<6;i++) {
								object = instance_create_layer(-30,-30,"Souls",obj_Spamton_Soul);
								object.image_blend = soul_colors[i];
								object.soul_id = i;
								object.soul_parent = handobject[0];
								if (i > 2) {
									object.soul_parent = handobject[1];
									}
								}
							
							instance_create_layer(0,0,"Background_Objects",obj_BG_Dumpster);
							actstate = 1;
							e_attackindex = 0;
							e_attacktable = [[8,400],[9,600],[10,600],[11,500],[12,500]];
							e_attacktable = func_scramble_array(e_attacktable);
							menu_state = 10;
							hide_box = true;
							curr_partymember = 0;
							partner_move = false;
							
							func_init_text(164);
							}
					break
					}
				}
			func_text_engine_loop();
			global.Enemy_Object.text = text_display;
		break;
		case 10: //cutscene
			hide_soul = true;
		break;
		case 11:
			hide_soul = true;
			battle_end_fade = lerp(battle_end_fade,1,.1);
			if (timer > 120) {
				global.CutsceneMode = false;
				global.Party = 0;
				switch(global.Chapter) {
					case 0://devil
						room_goto(rm_Start);
					break;
					case 1://spamton
						global.StartMatter = false;
						global.StartMusic = mus_Wind;
						global.CurrentMusic = mus_Wind;
						audio_play_sound(global.StartMusic,0,true);
						surface_resize(application_surface, 640, 360);
						if (global.Run == 2) {
							global.LV = 8;
							}
						room_goto(rm_OW2_sub5);
					break;
					}
				}
			timer ++;
		break;
		case 12://X-Slash option
			if (ucp) {
				item_select_y --;
				}
			if (dcp) {
				item_select_y ++;
				}
			if (b2p) {
				menu_state = 5;
				}
			item_select_y = clamp(item_select_y,0,1);
			
			soul_menu_x = 70;
			soul_menu_y = 280+(item_select_y*30);
			
			if (b1p) {
				if (!partner_move) {
					soul_action_taken = 1;
					}
				if (item_select_y == 1) {
					soul_xslash = true;
					tp_reserve -= 37;
					}
				menu_state = 1;
				}
		break;
		}

		if (menu_state == 0) {
			soul_menu_x = 50+(154*select_main);
			soul_menu_y = 450;
			}

		x = soul_menu_x;
		y = soul_menu_y;

	}
	else
	{//enemy turn
		
	if (center_time > 0) {
		center_time --;
		x = battle_box_x_v+(battle_box_w_v/2);
		y = battle_box_y_v+(battle_box_h_v/2);
		}
		
	if (regeneration > 0) {
		regeneration--;
		if (regeneration%20==0) {
			global.HP++;
			global.HP = clamp(global.HP,0,global.MaxHP);
			}
		}
		
	enemy_attack_time --;
	if (enemy_attack_time < 1) {
		global.Enemy_Attack = 0;
		soul_action_taken = 0;
		soul_speed_temporary = 0;
		soul_defense_temporary = 0;
		player_move = true;
		partner_move = false;
		menu_state = 0;
		battle_box_x = 47;
		battle_box_y = 260;
		battle_box_w = 546;
		battle_box_h = 115;
		soul_bound = false;
	
		global.TotalTurns++;
		
		if (turns_noitem > 0) {
			turns_noitem --;
			}
		if (turns_repel > 0) {
			turns_repel --;
			}
		
		func_init_text(irandom_range(actstate_text_ranges[actstate][0],actstate_text_ranges[actstate][1]));
		
		if (soul_freed_minigame) {
			global.SavedSouls ++;
			soul_freed_minigame = false;
			if (global.SavedSouls == 6) {
				switch(global.Enemy_ID) {
					case 2:
						soul_attack = 12;
						soul_invincible = true;
						actstate = 5;
						func_init_text(165);
					break;
					}
				}
			}
		}
	}
	
if (tp_reserve > 0) {
	tp_reserve --;
	global.MP++;
	}
if (tp_reserve < 0) {
	tp_reserve ++;
	global.MP--;
	}
if ((global.MP > 50)&&(!player_move)) {
	soul_kromer += global.MP-50;
	}
global.MP = clamp(global.MP,0,50);

if (hp_bar_timer > 0) {
	hp_bar_timer --;
	}
hp_bar_visual = lerp(hp_bar_visual,global.Enemy_HP,.2);
soul_kromer_hud = lerp(soul_kromer_hud,soul_kromer,0.1);

//cant die if invincible
if ((soul_invincible)&&(global.RetryMode!=2)) {
	global.HP = clamp(global.HP,1,global.MaxHP);
	}

if ((global.HP < 1)&&(!dead)) {
	soul_bound = false;
	global.Graze = 0;
	global.HP = 0;
	graze_cooldown = 100;
	dead = true;
	audio_play_sound(snd_Crack,0,0);
	player_move = true;
	menu_state = 8;
	timer = 0;
	cooldown = 0;
	if (global.Enemy_ID != 4) {
		audio_stop_sound(global.CurrentMusic);
		}
	}
	
if (global.HP < 1) {
	image_index = 2;
	}
	
if (debug_mode && keyboard_check_pressed(ord("N"))) {
	global.NoHitRun = true;
	global.HP = 30;
	}