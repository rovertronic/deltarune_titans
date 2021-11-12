sintimer ++;
timer ++;

x = home_x;

if ((global.Enemy_HP == 0)&&(state < 4)) {
	state = 4;
	timer = 0;
	image_speed = 0;
	sprite_index = spr_SigmaSpamton_Static;
	image_index = 0;
	if (global.Run == 2) {
		image_index = 1;
		}
	}

switch(state) {
	case 4:
	x = home_x + irandom_range(-30,30);
	if (timer > 30) {
		state = 5;
		}
	break;
	case 5:
		if (global.TextTable[global.TextIndex][2] == 2) {
			global.CurrentMusic = mus_GenocideSpamton;
			global.StartMusic = mus_GenocideSpamton;
			audio_play_sound(global.CurrentMusic,0,true);
			obj_BG_Dumpster.transition = true;
			image_index = 2;
			state = 6;
			sintimer = 0;
			angry = true;
			}
	break;
	case 6:
		y = home_y + sin(sintimer/30)*30;
		
		if (global.Enemy_Attack > 2) {

			if (timer % 60 == 0) {
				pipis_alternate = !pipis_alternate;
				object = instance_create_layer(x,10,"Bullet",obj_pipis);
				object.x = 520;
				if (pipis_alternate) {
					object.x = 120;
					}
				}
			}
	break;
	case 7://anger damage
		x = home_x + irandom_range(-30,30);
		if (timer > 30) {
			if (global.Enemy_HP == 0) {
				image_index = 3;
				state = 8;
				}
				else
				{
				state = 6;
				sintimer = 0;
				}
			}
	break;
	case 8://broke anger
		x = home_x + irandom_range(-5,5);
	break;
	}