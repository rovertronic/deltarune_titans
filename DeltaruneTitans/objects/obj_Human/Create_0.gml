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

walkspeed = 3;

transition_io = true;
transition_fade = 1;
transition_room = noone;

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

no_text_noise_table = [" ","?","!","*",".","'",","]
text_voice_table = [snd_Talk,snd_TalkSpamton,snd_TalkRegular,snd_TalkIceKid]

text_open = false;
text_voice = 1;
text_index = 0;
text_pause = 0;
text_char = "";
text_read = "";
text_display = "";
text_command_char = "";

switch(global.Party) {
	case 1:
	instance_create(x,y,obj_Partner_Snowkid);
	break;
	}