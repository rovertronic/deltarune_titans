switch(objstate) {
	case 0:
		if keyboard_check_pressed(ord("Z")) {
			if place_meeting(x-5,y,obj_Human) {
				//push from left
				dir = 3;
				objstate = 1;
				}
			if place_meeting(x+5,y,obj_Human) {
				//push from right
				dir = 2;
				objstate = 1;
				}
			if place_meeting(x,y-5,obj_Human) {
				//push from top
				dir = 1;
				objstate = 1;
				}
			if place_meeting(x,y+5,obj_Human) {
				//push from bottom
				dir = 0;
				objstate = 1;
				}
			}
	break;
	case 1:
		audio_play_sound(snd_bump,0,0);
		if place_meeting(x+(dirtable[dir][0]*32),y+(dirtable[dir][1]*32),obj_OpenTile)&&(!(place_meeting(x+(dirtable[dir][0]*32),y+(dirtable[dir][1]*32),obj_TilePushable))) {
			objstate = 2;
			}
			else
			{
			objstate = 0;
			}
	break;
	case 2:
		x += dirtable[dir][0]*4;
		y += dirtable[dir][1]*4;
		while(place_meeting(x,y,obj_Human)){
			obj_Human.y --;
			}
		if (x%32==0)&&(y%32==0) {
			objstate = 0;
			if place_meeting(x,y,obj_Arrows) {
				dir = 0;
				objstate = 1;
				}
			objint = instance_place(x,y,obj_Water)
			if objint {
				instance_create_layer(x,y,"Instances_puzzle",obj_Mud);
				instance_destroy(objint);
				instance_destroy();
				}
			}
	break;
	}