switch(state) {
	case 0:
	image_index = 0;
	image_xscale = 2;
	image_alpha = 1;
	
	x = lerp(x,320,.2);
	y = lerp(y,140,.2);
	
	
	if (global.Enemy_Attack == 1) {
		state = 3;
		}
	if (global.Enemy_Attack == 2) {
		if (timer%(3-global.Intensity)==0) {
			object = instance_create_layer(irandom_range(240,400),360,"Bullet",obj_Diamond);
			object.hazard_damage = 5;
			}
		}
	if (global.Enemy_Attack == 3) {
		state = 5;
		knifecount = 5+global.Intensity;
		
		for (i=0;i<knifecount;i++) {
			object = instance_create_layer(1,1,"Bullet",obj_ODevilsknife);
			object.angle = i*(360/knifecount);
			object.x = 320+lengthdir_x(object.offset,object.angle);
			object.y = 240+lengthdir_y(object.offset,object.angle);
			object.hazard_damage = 5;
			}
		}
	if (obj_Soul.battle_transition) {
		state = 5;
		global.Enemy_Attack = 4;
		
		for (i=0;i<soul_amount;i++) {
			object = instance_create_layer(1,1,"Bullet",obj_JevilSoul);
			object.angle = i*(360/soul_amount);
			object.image_blend = soul_colors[i];
			}
		}
	
	
	break;
	case 1:
	state = 2;
	timer = 0;
	image_index = 1;
	
	break;
	case 2:
	if (timer > 30) {
		state = 0;
		}
	break;
	case 3://attack 1 init
		state = 4;
		timer = 8;
		grow = 0;
		image_index = 1;
	break;
	case 4://attack 1
		image_xscale = lerp(image_xscale,grow,0.3);
		image_alpha = image_xscale/2;
		if (image_xscale  < .1) {
			timer = 0;
			grow = 2;
			random_direction = irandom(360);
			audio_play_sound(snd_spearappear,0,0);
			x = 320+lengthdir_x(180-(global.Intensity*15),random_direction);
			y = 240+lengthdir_y(180-(global.Intensity*15),random_direction);
			}
		if (timer == 4) {
			audio_play_sound(snd_text_devil,0,0);
			for (i=-3;i<4;i++) {
				object = instance_create_layer(x,y,"Bullet",obj_CloverSpread);
				object.image_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y)+(i*(13-global.Intensity));
				object.hazard_damage = 5;
				}
			}
		if (timer > 8) {
			grow = 0;
			aim_angle = 0;
			}
		if (global.Enemy_Attack == 0) {
			state = 0;
			image_index = 0;
			}
	break;
	case 5://other attack
		x = lerp(x,320,.2);
		y = lerp(y,140,.2);
		if (global.Enemy_Attack == 0) {
			state = 0;
			image_index = 0;
			}
	break;
	}
	
timer ++;

if (obj_Soul.dead) {
	state = 99;
	}