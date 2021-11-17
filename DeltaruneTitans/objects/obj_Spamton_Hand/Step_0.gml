sprite_index = spr_Spamton_Hand;
image_angle = 0;
switch(obj_Battle_SigmaSpamton.state) {
	case 1:
		target_y = obj_Battle_SigmaSpamton.y-140+(sin((sintimer/7)+(hand_id*pi))*40);
		x = lerp(x,target_x,.1);
		y = lerp(y,target_y,.1);
	break;
	case 9:
		if (global.Enemy_Attack == 11) {
			sprite_index = spr_fingore;
			target_y = obj_Soul.y+(sin((sintimer/7)+(hand_id*pi))*80);
			image_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y);
			
			if (timer % 31 == (15+(15*hand_id))) {
				audio_play_sound(snd_GenAttack,0,0);
				for (i=-2;i<3;i++) {
					object = instance_create_layer(x,y,"Bullet",obj_DiamondSpread);
					object.image_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y)+(i*15);
					}
				for (i=-2;i<3;i++) {
					object = instance_create_layer(x,y,"Bullet",obj_DiamondSpread);
					object.image_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y)+(i*15);
					object.bullet_speed = 7+global.Intensity;
					}
				}
			
			if (hand_id) {
				image_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y)+180;
				}
			}
			
			y = lerp(y,target_y,.1);
	break;
	case 4:
		fake_image_speed = 0;
		target_y = obj_Battle_SigmaSpamton.y;
		x = lerp(x,target_x,.1);
		y = lerp(y,target_y,.1);
	break;
	case 6:
		target_y = obj_Battle_SigmaSpamton.y-140;
		x = lerp(x,target_x,.1);
		y = lerp(y,target_y,.1);
	break;
	}

image_index += fake_image_speed;
if (image_index == 13) {
	fake_image_speed = -1;
	}
if (image_index == 0) {
	fake_image_speed = 1;
	}

sintimer ++;
timer ++;