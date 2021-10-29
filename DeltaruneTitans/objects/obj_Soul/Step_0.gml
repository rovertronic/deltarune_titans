func_controls();

if keyboard_check_pressed(vk_escape)
    {
    room_goto(rm_Start);
    }
	
slowdown_input = false;
sped = 4+soul_speed+soul_speed_temporary;
sped = 4+soul_speed+soul_speed_temporary;
sped = lerp(sped,1,slowdown/10);
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
image_blend = c_red;
if (cooldown > 0) {
	if (floor(cooldown/4)%2) {
		image_blend = make_color_rgb(127,0,0);
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
			select_main = clamp(select_main,0,3);
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
								audio_play_sound(snd_Menu,0,0);
								menu_state = 5;
								attack_stick_x = 47;
								attack_timer = 0;
								attack_stick_moving = true;
							break;
							case 1://defend
								tp_reserve += 8;
								menu_state = 6;
								func_init_text(89);
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
				attack_stick_moving = false;
				attack_stick_damage = 300-(abs(attack_stick_x-320));
				if (attack_stick_x < 310)&&(attack_stick_x>290) {
					//attack_stick_damage = 400;
					}
				tp_reserve += attack_stick_damage/80;
				audio_play_sound(snd_Attack,0,0);
				instance_create(global.Enemy_Object.x,global.Enemy_Object.y,obj_NewSlice);
				}
			if ((attack_timer == 20)&&(attack_stick_damage>0)) {
				object = instance_create(320,120,obj_DamageNum);
				object.num_input = attack_stick_damage*(soul_attack/10);
				global.Enemy_HP -= attack_stick_damage*(soul_attack/10);
				hp_bar_timer = 40;
				}
			if (attack_timer > 60) {
				do_enemy_dialog();
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
							case 1://wait
								menu_state = 6;
								actstate = 1;
								func_init_text(96);
							break;
							}
					break;
					case 1://Sigma Spamton
						switch(item_select_y) {
							case 0://check
								menu_state = 6;
								func_init_text(92);
							break;
							case 1://slice string
								if (global.MP >= 25) {
									menu_state = 6;
									func_init_text(95);
									tp_reserve -= 25;
									audio_play_sound(snd_Attack,0,0);
									}
							break;
							}
					break;
					case 2://Omega Spamton
					
					break;
					case 3://Jevil
						switch(item_select_y) {
							case 0://check
								menu_state = 6;
								func_init_text(114);
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
				menu_state = 1;
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
				menu_state = 0;
				}
			soul_menu_x = global.Soul_X;
			soul_menu_y = global.Soul_Y;
			timer ++;
		break;
		case 8://death
			soul_menu_x = x;
			soul_menu_y = y;
			timer ++;
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
				global.NoHitRun = true;
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
					end_turn();
					}
				}
				
			if (battle_transition) {
				battle_transition_timer++;
				
				switch(global.Chapter) {
					case 0:
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
					}
				}
			func_text_engine_loop();
			global.Enemy_Object.text = text_display;
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
		soul_speed_temporary = 0;
		player_move = true;
		partner_move = false;
		menu_state = 0;
		battle_box_x = 47;
		battle_box_y = 260;
		battle_box_w = 546;
		battle_box_h = 115;
		
		global.TotalTurns++;
		
		if (turns_noitem > 0) {
			turns_noitem --;
			}
		if (turns_repel > 0) {
			turns_repel --;
			}
		
		func_init_text(irandom_range(actstate_text_ranges[actstate][0],actstate_text_ranges[actstate][1]));
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
global.MP = clamp(global.MP,0,50);

if (hp_bar_timer > 0) {
	hp_bar_timer --;
	}
hp_bar_visual = lerp(hp_bar_visual,global.Enemy_HP,.2);

if ((global.HP < 1)&&(!dead)) {
	global.Graze = 0;
	global.HP = 0;
	graze_cooldown = 100;
	dead = true;
	audio_play_sound(snd_Crack,0,0);
	image_index = 1;
	player_move = true;
	menu_state = 8;
	timer = 0;
	cooldown = 0;
	audio_stop_sound(global.CurrentMusic);
	}