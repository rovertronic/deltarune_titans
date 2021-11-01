if (global.StartMusic != global.CurrentMusic)&&(global.MusicOn) {
	audio_stop_sound(global.CurrentMusic);
	audio_play_sound(global.StartMusic,0,true);
	global.CurrentMusic = global.StartMusic;
	}

if (global.StartMatter) {
	x=global.StartX;
	y=global.StartY;
	}

dirtable=[
[0,1],
[-1,0],
[1,0],
[0,-1],
];

sliding = false;
jumpout = true;

walkspeed = 3+global.UpgradeOWSP;

transition_io = true;
transition_fade = 1;
transition_room = noone;

item_select = 0;

dir = 0;

for (i = 0; i < 30; i++) {
	global.Partner_Path[i][0] = x;
	global.Partner_Path[i][1] = y;
	global.Partner_Path[i][2] = dir;
	}
oldx = x;
oldy = y;
moving = false;

image_speed = 0;

menu_open = false;
menu_state = 0;
menu_select = 0;

interact_object = noone;

textbox_y_offset = 118;

global.MaxHP = 16+(global.LV*4)+global.UpgradeHP;
global.HP = global.MaxHP;

func_init_text_engine();

switch(global.Party) {
	case 1:
	instance_create(x,y,obj_Partner_Snowkid);
	break;
	}