//window_set_size(room_width,room_height);
surface_resize(application_surface, 853, 480);
global.SafeInventory = global.Inventory;

sprite_index = global.Soul_Skins[global.Current_Soul_Skin];

global.Intensity = 0;

global.WorkSouls = global.SavedSouls;
if (global.SavedSouls == 0) {
	global.NoHitRun = true;
	}

//i am addicted to arrys
//jk i had to change it bc of sus
layer_id = layer_get_id("Background");
chapter_start_music = mus_prejevil;
switch(global.Encounter) {
	case 0://jevvel
		layer_destroy(layer_id);
	break;
	case 1://sussy spamton
		layer_destroy(layer_id);
		chapter_start_music = mus_spamton;
	break;
	case 20://devol
		chapter_start_music = mus_Knightmare;
	break;
	}

global.CurrentMusic = chapter_start_music;
global.StartMusic = chapter_start_music;

//ending stuff
battle_end = false;
battle_end_fade = 0;
battle_end_text = "Neutral Ending";
battle_end_star = 1;
battle_end_subending = 0;

text_choice = 0;

never_hurt = true;

dead = false;

object = -1;

talks = 0;

x = global.Soul_X;
y = global.Soul_Y;
soul_menu_x = x;
soul_menu_y = y;

soul_distance = 0;
soul_bound = false;

soul_xslash = false;

soul_colors = [c_yellow,c_blue,c_lime,c_orange,c_purple,c_aqua,c_aqua];

soul_freed_minigame = false;

handobject[0] = noone;
handobject[1] = noone;

button_sprites=[
spr_Fight,
spr_Act,
spr_Item,
spr_Mercy,
];

partner_button_sprites = [
[spr_Act,spr_Act],
[spr_BiteButton,spr_Defend],
]

soul_action_taken = 0;
soul_attack = 1+(global.UpgradeATK/6);
soul_defense = 0+(global.UpgradeDF/3);

soul_nomercy = 0;
if (global.Run == 2) {
	soul_nomercy = 1;
	}

soul_attack_scripted = false;
soul_attack_script_table = [.1,.3,2,10,200,800,999,3000,7000,60000,100000,150000,999999,999999];
soul_attack_script_index = 0;

soul_defense_temporary = 0;
soul_speed = 0;
soul_speed_temporary = 0;
soul_invincible = false;
regeneration = 0;
turns_noitem = 0;
turns_repel = 0;
soul_kromer = 0;
soul_kromer_hud = 0;
deal = 0;
deal_table = [0,1,2,3,4,5,6,7,8,9,9];
random_set_seed(current_second);
deal_table = func_scramble_array(deal_table);
deal_index = 0;

textbox_alpha = 1;

actstate = 0;
act_table = [
"* Check\n* Deal - 10 KROMER\n* Exchange - 24% TP", //Spamton Regular 0
"* Check\n* Deal - 10 KROMER\n* Exchange - 50% TP", //Sigma Spamton Unchecked 1
"* Check", //Genocide Spamton 2
"* Check", //Jevil 3 
"* Cut String - 74% TP\n* Deal - 10 KROMER\n* Exchange - 50% TP", //Sigma Spamton Checked 4
"* Soul Healing", //Sigma Spamton Pacifist 5
"* Check\n* Talk", //Devil 6
];
act_table_amnt = [2,2,0,0,2,0,2];
actstate_text_ranges = [
[97,101],//spamton 0
[102,111],//spamton sigma unchecked 1 
[232,232],//omega spamton 2
[112,113],//jevil 3 
[102,111],//spamton sigma checked 4
[165,165],//spamton sigma checked 5
[321,323],//devil 6
];

partner_text_ranges = [
[235,236],//spamton 0
[237,240],//spamton sigma unchecked 1 
[241,243],//omega spamton 2
[0,0],//jevil 3 
[237,240],//spamton sigma checked 4
[237,240],//spamton sigma checked 5
[0,0],//devil 6
];

player_move = true;
partner_move = false;

curr_partymember = 0;

select_main = 0;
select_main_old = 0;
menu_state = 7; //0 = selecting, 1 = fight, 2 = act, 3 = item, 4 = mercy
//5 = select fight target, 6 = text, //7 battle intro
attack_stick_x = 0;
attack_stick_moving = false;
attack_stick_damage = 0;
attack_stick_anim = false;
attack_timer = 0;
attack_hud_size = 1;
timer = 0;

hide_soul = false;
hide_box = false;

soul_menu_x = 0;
soul_menu_y = 0;
fade = 1;
whitefade = 0;

item_select_x = false;
item_select_y = 0;
item_select_x_old = false;
item_select_y_old = 0;
item_pick = 0;

tp_reserve = 0;

enemy_attack_time = 0;

speedx = 0;
speedy = 0;

func_init_text_engine();

battle_box_x = 47;
battle_box_y = 260;
battle_box_w = 546;
battle_box_h = 115;

battle_box_x_v = 47;
battle_box_y_v = 260;
battle_box_w_v = 546;
battle_box_h_v = 115;

global.Graze = 0;
global.DissalowGraze = 0;
global.MaxHP = 16+(global.LV*4)+global.UpgradeHP;
if (global.RetryMode==2) {
	global.MaxHP = 1;
	global.SavedSouls = 0;
	global.NoHitRun = true;
	}
global.HP = global.MaxHP;
hud_hp_offset = global.MaxHP - 16;
global.MP = 0;
global.Super = false;
global.BossQue = 0;
global.Destoul = 0;
global.KK = 0;

center_time = 0;

slowdown = 0;
slowdown_input = false;

image_speed = 0;
x = room_width/2;
centerx = room_width/2;
centery = room_height/2;
sped = 0;
cooldown = 0;

haxis = 0;
vaxis = 0;

battle_transition = false;
battle_transition_timer = 0;

image_blend = c_red;

global.Enemy_ID = 0;
global.Enemy_Attack = 0;
global.Enemy_Name = "missingno";
global.Enemy_HP = 0;
global.Enemy_MaxHP = 0;
global.Enemy_Object = -1;

global.TotalTurns = 0;

e_attacktable = [[0,30]];
e_attackindex = 0;

//ENEMY IDS BE LIKE
//0: jevil
//1: spamton
//2: sigma spamton
//3: omega spamton
//4: devil

//set encounters
switch(global.Encounter) {
	case 0:
		global.Enemy_ID = 0;
		global.Enemy_Name = "Jevil";
		global.Enemy_HP = 375;
		global.Enemy_MaxHP = 375;
		global.Enemy_Object = instance_create_layer(room_width/2,200,"Enemy",obj_Battle_Jevil);
		e_attacktable = [[2,240],[1,360],[3,240]];
		e_attacktable = func_scramble_array(e_attacktable);
		actstate = 3;
	break;
	case 1:
		global.Enemy_ID = 1;
		global.Enemy_Name = "Spamton";
		global.Enemy_HP = 500;
		global.Enemy_MaxHP = 500;
		global.Enemy_Object = instance_create_layer(room_width/2,200,"Enemy",obj_Battle_Spamton);
		actstate = 0;
		e_attacktable = [[2,240],[1,360],[3,360]];
		e_attacktable = func_scramble_array(e_attacktable);
	break;
	case 20:
		global.Enemy_ID = 4;
		global.Enemy_Name = "Devil";
		global.Enemy_HP = 200;
		global.Enemy_MaxHP = 200;
		global.Enemy_Object = instance_create_layer(room_width/2,200,"Enemy",obj_Battle_Devil);
		e_attacktable = [[2,300],[1,360],[3,240]];
		e_attacktable = func_scramble_array(e_attacktable);
		actstate = 6;
	break;
	}

hp_bar_visual = global.Enemy_MaxHP;
hp_bar_timer = 0;
hp_bar_size = 100;

func_init_text(irandom_range(actstate_text_ranges[actstate][0],actstate_text_ranges[actstate][1]));

function consume_item() {
	for (i=item_pick;i<7;i++) {
		global.Inventory[i] = global.Inventory[i+1];
		}
	global.Inventory[7] = 0;
	}

function do_enemy_dialog() {
	if ((!partner_move)&&(global.Party!=0)) {
		curr_partymember = global.Party;
		partner_move = true;
		select_main = 0;
		menu_state = 0;
		image_blend = c_white;
		image_yscale = -1;
		func_init_text(irandom_range(partner_text_ranges[actstate][0],partner_text_ranges[actstate][1]));
		}
		else
		{
		e_attackindex ++;
		if (e_attackindex+1 > array_length(e_attacktable)) {
			e_attackindex = 0;
			e_attacktable = func_scramble_array(e_attacktable);
			}
	
		switch(global.Enemy_ID) {
			case 0://jevil
				switch(e_attacktable[e_attackindex][0]) {
					case 1:
					func_init_text(117);
					break;
					case 2:
					func_init_text(118);
					break;
					case 3:
					func_init_text(115);
					break;
					}
				if (soul_action_taken == 2) {
					func_init_text(142);
					}
				if ((global.TotalTurns > 4)||(global.Enemy_HP < 200)) {
					func_init_text(116);
					battle_transition = true;
					audio_play_sound(mus_f_destroyed2,0,true);
					}
			break;
			case 1:
				switch(e_attacktable[e_attackindex][0]) {
					case 1:
					func_init_text(139);
					break;
					case 2:
					func_init_text(156);
					break;
					case 3:
					func_init_text(157);
					break;
					}
				
				if (soul_action_taken == 1) {
					if (irandom(1) == 1) {
						func_init_text(158);
						}
						else
						{
						func_init_text(140);
						}
					}
				if (soul_action_taken == 2) {
					func_init_text(141);
					}
				if ((global.TotalTurns > 6)||(global.Enemy_HP < 400)) {
					func_init_text(160);
					battle_transition = true;
					audio_play_sound(snd_Phone,0,false);
					audio_stop_sound(global.CurrentMusic);
					}
			break;
			case 2://Sigma Spamton
			
				func_init_text(286);
				switch(e_attacktable[e_attackindex][0]) {
					case 9:
					func_init_text(284);
					break;
					case 10:
					func_init_text(397);
					break;
					case 11:
					func_init_text(398);
					break;
					case 12:
					func_init_text(400);
					break;
					}
				
				if (soul_freed_minigame) {
					func_init_text(167+global.SavedSouls);
					}
					
				if (actstate == 5) {
					func_init_text(174);
					}
					
				if ((global.SavedSouls == 6)&&(soul_action_taken = 2)) {
					audio_stop_sound(global.CurrentMusic);
					obj_Battle_SigmaSpamton.image_speed = 0;
					obj_Battle_SigmaSpamton.image_index = 0;
					hide_box = true;
					func_init_text(175);
					}
					
				if (global.Enemy_HP == 0) {
					func_init_text(192);
					if (global.SavedSouls == 6) {
						func_init_text(175);
						}
					if (global.Run == 2) {
						func_init_text(202);
						}
					}
			break;
			case 3://omega gencoide spamton
				text_choice = 244+(soul_attack_script_index*2);
				if (text_choice > 269) {
					text_choice = 268;
					}
				func_init_text(text_choice);
				if (global.Enemy_HP == 0) {
					func_init_text(224);
					}
			break;
			case 4://devil
				func_init_text(332);
				if (global.HP < 6) {
					func_init_text(333+irandom(2));
					}
				
				if (global.Enemy_HP == 0) {
					if (global.NoHitRun) {
						func_init_text(374);
						}
						else
						{
						func_init_text(371);
						}
					}
				
				if (soul_action_taken == 3) {
					audio_stop_sound(global.CurrentMusic);
					func_init_text(327);
					}
					
				if (soul_action_taken == 4) {
					func_init_text(336+talks);
					talks++;
					if (talks == 7) {
						audio_stop_sound(global.CurrentMusic);
						}
					}
			break;
			}
	
		menu_state = 9;
		}
	}

function end_turn() {

	global.Intensity = 0;
	switch(global.Enemy_ID) {
		case 4://devil
			global.Intensity += (global.Enemy_HP < global.Enemy_MaxHP/2)||(talks > 2);
		break;
		default://everyone else
			global.Intensity += ((global.Enemy_HP < global.Enemy_MaxHP/2)||(global.SavedSouls > 2));
			global.Intensity += ((global.Enemy_HP < global.Enemy_MaxHP/3)||(global.SavedSouls > 4));
		break;
		}

	curr_partymember = 0;
	player_move = false;
	partner_move = false;
	image_blend = c_red;
	image_yscale = 1;
	center_time = 15;
		
	battle_box_x = (room_width/2)-80;
	battle_box_y = (room_height/2)-80;
	battle_box_w = 160;
	battle_box_h = 160;
	enemy_attack_time = e_attacktable[e_attackindex][1];
	global.Enemy_Attack = e_attacktable[e_attackindex][0];
	
	if (soul_freed_minigame) {
		global.Enemy_Attack = global.WorkSouls;
		enemy_attack_time = 600;
		
		battle_box_x = (room_width/2)-90;
		battle_box_y = (room_height/2)-90;
		battle_box_w = 170;
		battle_box_h = 170;
		}

	}
	
function act_deal() {
	if (soul_kromer >= 10) {
		deal_index ++;
		if (deal_index > array_length(deal_table)-1) {
			deal_index = 0;
			deal_table = func_scramble_array(deal_table);
			}
		deal = deal_table[deal_index];
		if (deal != 1) {
			soul_kromer -= 10;
			}
									
		switch(deal) {
			case 0:
			global.HP -= 10;
			tp_reserve+=25;
			audio_play_sound(snd_Hurt,0,0);
			break;
			case 1:
			soul_kromer *= 2;
			audio_play_sound(snd_buyitem,0,0);
			break;
			case 2:
			audio_play_sound(snd_Heal,0,0);
			global.HP += 10;
			global.Enemy_HP += 100;
			break;
			case 3:
			audio_play_sound(snd_Attack,0,0);
			soul_defense -= 2;
			soul_attack += .5;
			break;
			case 4:
			global.HP -= 15;
			global.MaxHP += 10;
			audio_play_sound(snd_save,0,0);
			break;
			case 5:
			audio_play_sound(snd_splat,0,0);
			global.HP -= 99;
			turns_noitem = 2;
			break;
			case 6:
			audio_play_sound(snd_Bell,0,0);
			global.HP += 99;
			tp_reserve += 50;
			break;
			case 7:
			audio_play_sound(snd_Freeze,0,0);
			soul_speed ++;
			global.MaxHP -= 5;
			break;
			case 8:
			audio_play_sound(snd_Akward,0,0);
			tp_reserve -= global.MP;
			global.UpgradeTP *= 2;
			break;
			case 9://anger
				audio_play_sound(snd_b,0,0);
				soul_attack += 1.5;
			break;
			}
		global.HP = clamp(global.HP,1,global.MaxHP);
		global.Enemy_HP = clamp(global.Enemy_HP,0,global.Enemy_MaxHP);
		global.MaxHP = clamp(global.MaxHP,1,99);
		hud_hp_offset = global.MaxHP - 16;
		func_init_text(144+deal);
		menu_state = 6;
		}
	}
	
function end_standard() {
	switch(global.Run) {
		case 0://started pacifist
			
			battle_end_subending = 1;
			battle_end_text = "Aborted Pacifist Ending";
			if (global.SavedSouls == 6) {
				battle_end_star = 0; //0 = pacifist
				battle_end_subending = 2;
				battle_end_text = "Pacifist Ending";
				if (global.Enemy_HP == 0) {
					battle_end_subending = 3;
					battle_end_text = "Aggressive Pacifist Ending";
					}
				if (never_hurt) {
					battle_end_subending = 4;
					battle_end_text = "True Pacifist Ending";
					}
				}
		break;
		case 1://started neutral
			battle_end_subending = 5;
			battle_end_text = "Neutral Ending";
			if (global.SavedSouls == 0) {
				battle_end_subending = 6;
				battle_end_text = "Neutral Soulcrusher Ending";
				}
			if (global.SavedSouls == 6) {
				battle_end_subending = 7;
				battle_end_text = "Neutral Pacifist Ending";
				}
		break;
		case 2://locked in soulcrusher
			battle_end_subending = 8;
			battle_end_text = "Soulcrusher Ending";
			if (soul_attack_script_index == 13) {
				battle_end_subending = 9;
				battle_end_text = "Brutal Soulcrusher Ending";
				}
			battle_end_star = 2; //2 = soulcrusher
		break;
		}	
	}