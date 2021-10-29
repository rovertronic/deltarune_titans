//window_set_size(room_width,room_height);
surface_resize(application_surface, 853, 480);
global.SafeInventory = global.Inventory;

if (!audio_is_playing(global.CurrentMusic)) {
	audio_play_sound(global.CurrentMusic,0,true);
	}

dead = false;

object = -1;

x = global.Soul_X;
y = global.Soul_Y;
soul_menu_x = x;
soul_menu_y = y;

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

soul_attack = 1;
soul_speed = 0;
soul_speed_temporary = 0;
regeneration = 0;
turns_noitem = 0;
turns_repel = 0;

textbox_alpha = 1;

actstate = 0;
act_table = [
"* Check\n* Wait", //Spamton Regular
"* Check\n* Cut String - 50% TP", //Sigma Spamton
"* Check", //Genocide Spamton
"* Check" //Jevil
];
act_table_amnt = [1,1,0,0];
actstate_text_ranges = [
[97,101],//spamton
[102,111],//spamton sigma
[97,97],//omega spamton
[112,113]//jevil
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
timer = 0;

hide_soul = false;

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
global.MaxHP = 16+(global.LV*4);
global.HP = global.MaxHP;
hud_hp_offset = global.LV*4;
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

//set encounters
switch(global.Chapter) {
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
		actstate = 0;
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
			if ((global.TotalTurns > 4)||(global.Enemy_HP < 200)) {
				func_init_text(116);
				battle_transition = true;
				audio_play_sound(mus_f_destroyed2,0,true);
				}
		break;
		case 1:
		
		break;
		}
	
	menu_state = 9;
	}

function end_turn() {
	if ((!partner_move)&&(global.Party!=0)) {
		curr_partymember = global.Party;
		partner_move = true;
		select_main = 0;
		menu_state = 0;
		image_blend = c_white;
		image_yscale = -1;
		func_init_text(88);
		}
		else
		{
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
		}
	}