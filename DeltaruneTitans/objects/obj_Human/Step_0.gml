func_controls();

//Control
image_speed = 0;
inputted = false;


sliding = place_meeting(x,y,obj_Ice);
jumpout = false;
if ((!text_open)&&(!menu_open)&&(transition_io)&&(!sliding)&&(!global.CutsceneMode))
    {
    if (!jumpout)&&dc
        {
        sprite_index = spr_FriskDown;
		image_xscale = 1;
        y += walkspeed;
		dir = 0;
		inputted = true;
		if (place_meeting(x,y,obj_Solid)) {
			y -= walkspeed;
			}
		sliding = place_meeting(x,y,obj_Ice);
		jumpout = sliding;
        }
    if (!jumpout)&&((uc)||(place_meeting(x,y,obj_Arrows)))
        {
        sprite_index = spr_FriskUp;
		image_xscale = 1;
        y -= walkspeed;
		dir = 3;
		inputted = true;
		if (place_meeting(x,y,obj_Solid)) {
			y += walkspeed;
			}
		sliding = place_meeting(x,y,obj_Ice);
		jumpout = sliding;
        }
    if (!jumpout)&&lc
        {
        sprite_index = spr_FriskSide;
        image_xscale = 1;
        x -= walkspeed;
		dir = 1;
		inputted = true;
		if (place_meeting(x,y,obj_Solid)) {
			x += walkspeed;
			}
		sliding = place_meeting(x,y,obj_Ice);
		jumpout = sliding;
        }
    if (!jumpout)&&rc
        {
		dir = 2;
        x += walkspeed;
        sprite_index = spr_FriskSide;
        image_xscale = -1;
		inputted = true;
		if (place_meeting(x,y,obj_Solid)) {
			x -= walkspeed;
			}
		sliding = place_meeting(x,y,obj_Ice);
		jumpout = sliding;
        }
		
	if (b1p) {
		interact_object = collision_rectangle(x-12,y-15,x+12,y+18,obj_NPC,false,true);
		if (interact_object) {
			func_init_text(interact_object.dialogid);
			global.Current_Interacting_Object = interact_object;
			}
		}
		
	image_speed = 0;
	moving = false;
	if ((x != oldx)||(y != oldy)) {
		moving = true;
		}
	oldx = x;
	oldy = y;
	
	if (place_meeting(x,y,obj_Water)&&(transition_io)) {
		transition_io = false;
		transition_room = room;
		audio_play_sound(snd_Akward,0,0);
		}
	
	//go to another room
	interact_object = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_Room_Change,false,true);
	if (interact_object) {
		global.Room_Solved[room] = func_solve_room();
		global.StartMatter = !interact_object.room_pos_default;
		global.StartX = interact_object.room_x;
		global.StartY = interact_object.room_y;
		global.StartMusic = interact_object.room_music;
		transition_io = false;
		transition_room = interact_object.room_id;
		}
    }

if (sliding) {
	x += dirtable[dir][0]*4;
	y += dirtable[dir][1]*4;
	
	if place_meeting(x,y,obj_Solid) {
		x -= dirtable[dir][0]*4;
		y -= dirtable[dir][1]*4;
		switch(dir) {
			case 0:
				dir = 3;
			break;
			case 3:
				dir = 0;
			break;
			case 1:
				dir = 2;
			break;
			case 2:
				dir = 1;
			break;
			}
		}
	}
	
if (moving) {
	image_speed = 0.2;
		
	for (i = 29; i > 0; i--) {
		global.Partner_Path[i][0] = global.Partner_Path[i-1][0];
		global.Partner_Path[i][1] = global.Partner_Path[i-1][1];
		global.Partner_Path[i][2] = global.Partner_Path[i-1][2];
		}
	global.Partner_Path[0][0] = x;
	global.Partner_Path[0][1] = y;
	global.Partner_Path[0][2] = dir;
	}


//Menu
if (menu_open) {
	
	if (!menu_state) {
	    if dcp {
			if (menu_select < 2) {
				menu_select++;
				audio_play_sound(snd_Menu,0,false);
				}
	        }
	    if ucp {
			if (menu_select > 0) {
				menu_select--;
				audio_play_sound(snd_Menu,0,false);
				}
	        }
		}
		
	if (menu_state == 2) {//item menu
	    if dcp {
			item_select ++;
	        }
	    if ucp {
			item_select --;
	        }
		item_cap = func_inv_itemcount()-1;
		item_select = clamp(item_select,0,item_cap);
		}
		
	if b1p {
		if (menu_state == 0) {
			switch(menu_select) {
				case 0:
				if (func_inv_itemcount() > 0) {
					menu_state = 2;
					item_select = 0;
					}
					else
					{
					audio_play_sound(snd_MenuError,0,0);
					}
				break;
				case 1:
				menu_state = 1;
				break;
				case 2:
				menu_open = false;
				func_init_text(36);
				//func_init_text(131);
				audio_play_sound(snd_Phone,0,false);
				break;
				}
			}
			else
			{
			if (menu_state == 2) {
				menu_open = false;
				func_init_text(53+global.Inventory[item_select]);
				}
			}
		}
	
	if (b2p) {
		if (menu_state) {
			//close stats
			menu_state = 0;
			}
			else
			{
			//close menu
			menu_open = false;
			}
		}
	}

//Menu Toggle
if (b3p) && (!text_open) && (!global.CutsceneMode) {
	menu_open = !menu_open;
	menu_select = 0;
	menu_state = 0;
	audio_play_sound(snd_Menu,0,false);
	}
	
if (inputted == false) {
	image_index = 0;
	}

//Textbox
if (text_open) {
	func_text_engine_loop();
	
	if (b2p) {
		text_display = text_read;
		text_index = string_length(text_read);
		}
	
	if (b1p) && text_index >= string_length(text_read) {
		if (global.TextTable[global.TextIndex][1]) {
			//Continue
			text_index = 0; //Character Index
			global.TextIndex++; //Dialog ID
			text_read = global.TextTable[global.TextIndex][3];
			text_display = "";
			text_voice = global.TextTable[global.TextIndex][0];
			
			switch(global.TextTable[global.TextIndex][2]) {
				case 8:
					//spamton dumpster
					activate = false;
					if (instance_number(obj_Dumpster) == 1) {
						if (distance_to_object(obj_Dumpster) < 60) {
							activate = true;
							}
						}
						
					if (activate) {
						global.TextIndex = 130;
						text_read = global.TextTable[global.TextIndex][3];
						text_voice = global.TextTable[global.TextIndex][0];
						global.CutsceneMode = true;
						}
						else
						{
						audio_play_sound(snd_smile,0,0);
						}
				break;
				}
			}
			else
			{
			//Stop
			text_open = false;
			global.Current_Interacting_Object = -1;
			
			switch(global.TextTable[global.TextIndex][2]) {
				case 1://start battle
					global.CurrentMusic = mus_prejevil;
					room_goto(rm_Battle);
				break;
				case 2://activate dumpster
					obj_Dumpster.state = 1;
				break;
				case 8:
					//spamton dumpster
					audio_stop_sound(snd_smile);
				break;
				case 9:
					global.Party = 1;
					instance_create(obj_IceKid.x,obj_IceKid.y,obj_Partner_Snowkid);
					instance_destroy(obj_IceKid);
				break;
				}

			}
		}
	}

textbox_y_offset = 118;
if (y > room_height-100) {
	textbox_y_offset = 4;
	}

if x < 8
    {
    x = 8;
    }
if x > room_width-8
    {
    x = room_width-8;
    }
if y < 8
    {
    y = 8;
    }
if y > room_height-8
    {
    y = room_height-8;
    }

if (keyboard_check_pressed(vk_escape)) {
	transition_room = rm_Start;
	transition_io = false;
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
		room_goto(transition_room);
		}
	}
	
global.Soul_X = (x-camera_get_view_x(view_camera[0]))*2;
global.Soul_Y = (y-camera_get_view_y(view_camera[0]))*2.6666666;