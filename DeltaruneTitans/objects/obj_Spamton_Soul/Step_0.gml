switch(state) {
	case 1:
		if (!obj_Soul.player_move) {
			state = 2;
			timer = 0;
			}
	case 0:
		target_x = soul_parent.x - 50 + ((soul_id%3)*50) + (sin(sintimer/3)*2);
		target_y = soul_parent.y + 100;
		
		if (global.Enemy_HP < 1) {
			state = 5;
			timer = 0;
			}
	break;
	case 2:
	
	attack_chose = 0;
	do_attack = false;
	if (global.Enemy_ID == 3) {
		switch(global.Enemy_Attack) {
			case 1: //purple and yellow
				if (soul_id == 0 || soul_id == 4) {
					do_attack = true;
					}
			break;
			case 2: //green and orange
				if (soul_id == 2 || soul_id == 3) {
					do_attack = true;
					}
			break;
			case 3: //blue and pipis
				if (soul_id == 1) {
					do_attack = true;
					}
			break;
			case 4: //teal and pipis
				if (soul_id == 5) {
					do_attack = true;
					}
			break;
			}
		if (do_attack) {
			attack_chose = soul_id + 1;	
			}
		}
		else
		{
		attack_chose = global.Enemy_Attack;
		}
	
	//attacking
	switch(attack_chose) {
		case 1: //yellow fella
			target_x = 320 + lengthdir_x(200,attack_angle);
			target_y = 240 + lengthdir_y(200,attack_angle);
			attack_angle += 2;
			image_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y) + 90 + sin(sintimer/4)*30;
			aim_angle = image_angle - 90;
			
			if (timer%4==0)&&(timer > 30) {
				audio_play_sound(snd_soul_fire,0,0);
				object = instance_create_layer(x,y,"Bullet",obj_SoulBullet);
				object.image_angle = aim_angle;
				}
				
			if ((obj_Soul.enemy_attack_time < 100)&&(global.Enemy_ID == 2)) {
				with(obj_SoulBullet) {
					healing = true;
					}
				}
		break;
		case 2: //blue soul
			target_x = 320;
			target_y = 240;
			
			if (timer == 30) {
				object = instance_create_layer(x,y,"Bullet",obj_SoulShoe);
				}
				
			if (timer > 40)&&(timer%10==0) {
				audio_play_sound(snd_GenAttack,0,0);
				for (i = -1; i<2; i++) {
					object = instance_create_layer(x,y,"Bullet",obj_StarSpread);
					object.aim_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y) + (i*15);
					object.bullet_speed = speed_index;
					speed_index++;
					if (speed_index > 4) {
						speed_index = 1;
						}
					}
				}
				
			if ((obj_Soul.enemy_attack_time < 100)&&(global.Enemy_ID == 2)) {
				with(obj_StarSpread) {
					healing = true;
					}
				}
		break;
		case 3: //green (food)
			target_x = 320;
			target_y = 80;
			
			if (timer == 30) {
				object = instance_create_layer(x-20,y,"Bullet",obj_FryingPan);
				}
				
			if ((obj_Soul.enemy_attack_time < 100)&&(global.Enemy_ID == 2)) {
				with(obj_FryingPanFlame) {
					healing = true;
					sprite_index = spr_egg;
					}
				}
		break;
		case 4: //orange (toguh glove)
			target_x = 320;
			target_y = 80;		

			if (timer == 40) {
				object = instance_create_layer(x,y+50,"Bullet",obj_Glove);
				}
			if ((timer % 60 == 0)&&(timer > 40)) {
				object = instance_create_layer(obj_Soul.x,obj_Soul.y,"Bullet",obj_glovewarning);
				}
			if ((timer % 60 == 20)&&(timer > 200)) {
				object = instance_create_layer(irandom_range(230,170),irandom_range(230,170),"Bullet",obj_glovewarning);
				}
			if ((timer % 60 == 40)&&(timer > 300)) {
				object = instance_create_layer(obj_Soul.x,obj_Soul.y,"Bullet",obj_glovewarning);
				}
				
			if ((obj_Soul.enemy_attack_time < 100)&&(global.Enemy_ID == 2)) {
				obj_Glove.healing = true;
				obj_Glove.sprite_index = spr_thumbup;
				}
		break;
		case 5://bookworm
			target_x = 320;
			target_y = 80;
			if (timer == 30) {
				obj_Soul.enemy_attack_time = 1200;
				object = instance_create_layer(320,y,"Bullet",obj_Book);
				}
		break;
		case 6://teal (touhou knifer)
			if (timer == 1) {
				obj_Soul.enemy_attack_time = 1200;
				target_x = 320;
				target_y = 240;
				aim_angle = 0;
				}
				
			if (timer == 30) {
				audio_play_sound(snd_GenAttack,0,0);
				for (i = 0; i<4; i++) {
					object = instance_create_layer(x,y,"Bullet",obj_EvilKnife);
					object.aim_angle = aim_angle+(i*90);
					}
				}
				
			if (timer > 60 && timer < 150 && timer%15==0) {
				audio_play_sound(snd_GenAttack,0,0);
				for (i = 0; i<4; i++) {
					object = instance_create_layer(x,y,"Bullet",obj_EvilKnife);
					object.aim_angle = aim_angle+(i*90);
					}
				aim_angle += 10;
				}
				
			if (timer == 150) {
				audio_play_sound(snd_GenAttack,0,0);
				for (i = 0; i<20; i++) {
					object = instance_create_layer(x,y,"Bullet",obj_Danmaku);
					object.glow_color = c_green;
					object.aim_angle = aim_angle+(i*18);
					object.bullet_speed = 2;
					}
				}
				
			if (timer > 150 && timer < 400) {
				target_x = 320 + lengthdir_x(200,attack_angle);
				target_y = 240 + lengthdir_y(200,attack_angle);
				attack_angle += 4;
				if (timer % 30 == 0) {
					audio_play_sound(snd_GenAttack,0,0);
					for (i = -1; i<2; i++) {
						object = instance_create_layer(x,y,"Bullet",obj_EvilKnife);
						object.aim_angle = point_direction(x,y,320,240)+(i*20);
						}
					for (i = 0; i<5; i++) {
						object = instance_create_layer(x,y,"Bullet",obj_Danmaku);
						object.glow_color = c_blue;
						object.image_xscale = 2;
						object.image_yscale = 2;
						object.aim_angle = point_direction(x,y,320,240);
						object.bullet_speed = i+2;
						}
					}
				}
				
			if (timer == 401) {
				target_x = 320;
				target_y = 80;
				}
				
			if (timer > 420 && timer < 600) {
				if (timer % 8 == 0) {
					audio_play_sound(snd_GenAttack,0,0);
					aim_angle += 2;
					for (i = 0; i<15; i++) {
						object = instance_create_layer(x,y,"Bullet",obj_Danmaku);
						object.glow_color = c_red;
						object.image_xscale = 2;
						object.image_yscale = 2;
						object.aim_angle = aim_angle+(i*24)
						object.bullet_speed = 3.5;
						}
					for (i = 0; i<15; i++) {
						object = instance_create_layer(x,y,"Bullet",obj_Danmaku);
						object.glow_color = c_green;
						object.image_xscale = 2;
						object.image_yscale = 2;
						object.aim_angle = -(aim_angle+(i*24));
						object.bullet_speed = 2.5;
						}
					}
				}
				
			if (timer > 650) {
				if (timer % 5 == 0) {
					audio_play_sound(snd_GenAttack,0,0);
					aim_angle += 4;
					for (i = 0; i<10; i++) {
						object = instance_create_layer(x,y,"Bullet",obj_Danmaku);
						object.glow_color = c_teal;
						object.image_xscale = 2;
						object.image_yscale = 2;
						object.aim_angle = aim_angle+(i*18);
						object.bullet_speed = 5;
						}
					}
					
				if (timer % 30 == 0) {
					audio_play_sound(snd_GenAttack,0,0);
					for (i = 0; i<8; i++) {
						object = instance_create_layer(x,y,"Bullet",obj_Danmaku);
						object.glow_color = c_yellow;
						object.image_xscale = 4;
						object.image_yscale = 4;
						object.aim_angle = aim_angle+(i*45);
						object.bullet_speed = 4;
						object.bullet_curve = 1;
						}
					}

				}
		if ((obj_Soul.enemy_attack_time < 100)&&(global.Enemy_ID == 2)) {
			with(obj_Danmaku) {
				healing = true;
				glow_color = c_lime;
				}
			}
		break;
		}
	
	
	if (obj_Soul.player_move) {
		
		if (global.Enemy_ID == 3) {
			state = 6;
			}
			else
			{
			state = 3;
			}
		if (obj_Soul.dead) {
			state = 4;
			}
		target_y = soul_parent.y + 100;
		image_angle = 0;
		}
	break;
	case 3:
		//fly away
		target_x = soul_parent.x - 50 + ((soul_id%3)*50) + (sin(sintimer/3)*2);
		target_y -= 2;
		image_alpha -= .01;
		if (image_alpha < 0) {
			instance_destroy();
			//free
			}
	break;
	case 4:
	//do noting lol
	break;
	case 5://break
		target_x = soul_parent.x - 50 + ((soul_id%3)*50) + (sin(sintimer/3)*2);
		target_y = soul_parent.y + 100;
		
		if (timer > 15+(soul_id*15)) {
			state = 6;
			audio_play_sound(snd_Crack,0,0);
			image_index = 2;
			}
	break;
	case 6:
		target_x = soul_parent.x - 50 + ((soul_id%3)*50);
		target_y = soul_parent.y + 100;
		
		if (global.Enemy_Attack != 0) {
			state = 2;
			timer = 0;
			}
	break;
	}


x = lerp(x,target_x,.1)
y = lerp(y,target_y,.1);

if (global.WorkSouls > soul_id) {
	if (bound) {
		bound = false;
		instance_create(x,y-30,obj_DecorationSlice);
		state = 1;
		}
	}

if (bound) {
	line_target_x = soul_parent.x;
	line_target_y = soul_parent.y;
	}
	else
	{
	line_target_x = lerp(line_target_x,x,.1);
	line_target_y = lerp(line_target_y,y,.1);
	}
	
sintimer ++;
timer ++;