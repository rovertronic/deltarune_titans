sintimer ++;
timer ++;

if (state < 9) {
	x = home_x;
	}

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
	case 1:
		if (global.Enemy_Attack > 7) {
			state = 9;
			timer = 0;
			}
	break;
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
			if (global.MusicOn) {
				audio_play_sound(global.CurrentMusic,0,true);
				}
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
	
	case 9: //normal, attacking
		if (timer == 1) {
			obj_Soul.battle_box_x = 120;
			obj_Soul.battle_box_y = 120;
			obj_Soul.battle_box_w = 400;
			obj_Soul.battle_box_h = 250;
			}//make the box really big
	
		if (global.Enemy_Attack == 8) {
			if (timer % 25-(global.Intensity*2) == 0) {
				object = instance_create_layer(irandom_range(120,520),10,"Bullet",obj_pipis);
				}
			}
	
		if (global.Enemy_Attack == 9) {
			state = 10;
			sprite_index = spr_SigmaSpamton_Turn;
			image_index = 0;
			image_speed = 0;
			obj_Soul.soul_bound = true;
			}
	
		if (global.Enemy_Attack == 0) {
			state = 1;
			}
	break;
	case 10: //heart on a chain attack
		target_x = 30;
		target_y = 240;
		
		float_image_index = lerp(float_image_index,((global.Enemy_Attack==9)*13),.1);
		image_index = round(float_image_index);
		
		
		//actual attack lol
		if (x < 40) && ((timer % 40 == 0) || (timer % 40 == 3) || (timer % 40 == 6)) {
			audio_play_sound(snd_GenAttack,0,0);
			
			aim_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y) + irandom_range(-5,5);
			
			for (i = 0; i<3+global.Intensity; i++) {
				object = instance_create_layer(x-20,y-30,"Bullet",obj_Danmaku);
				object.glow_color = c_yellow;
				object.image_xscale = 3;
				object.image_yscale = 3;
				object.aim_angle = aim_angle;
				object.bullet_speed = i+3;
				object.hazard_damage = 7;
				}

			aim_angle = irandom_range(-30,30);

			for (i = 0; i<3+global.Intensity; i++) {
				object = instance_create_layer(x+10,y-30,"Bullet",obj_Danmaku);
				object.glow_color = c_purple;
				object.image_xscale = 3;
				object.image_yscale = 3;
				object.aim_angle = aim_angle;
				object.bullet_speed = i+3;
				object.hazard_damage = 7;
				}
			
			}
	
		if (global.Enemy_Attack == 0)||(obj_Soul.dead) {
			target_x = 320;
			target_y = 240;
			if (image_index == 0) {
				x = 320;
				state = 1;
				sprite_index = spr_SigmaSpamton_Idle;
				image_speed = 1;
				}
			}
			
		x = lerp(x,target_x,0.1);
	break;
	}