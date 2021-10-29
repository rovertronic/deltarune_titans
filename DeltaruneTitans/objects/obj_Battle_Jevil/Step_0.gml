switch(state) {
	case 0:
	image_index = 0;
	image_xscale = 2;
	image_alpha = 1;
	if (point_distance(x,y,target_x,target_y) < pointsize) {
		target_x = irandom_range(220,420);
		target_y = irandom_range(100,140);
		pointsize = 0;
		}
	pointsize += .5;
	
	speed_x += lengthdir_x(1,point_direction(x,y,target_x,target_y));
	speed_y += lengthdir_y(1,point_direction(x,y,target_x,target_y));
	
	x += speed_x;
	y += speed_y/3;
	
	speed_x = clamp(speed_x,-10,10);
	speed_y = clamp(speed_y,-10,10);
	
	if (global.Enemy_Attack == 1) {
		state = 3;
		}
	if (global.Enemy_Attack == 2) {
		if (timer%4==0) {
			instance_create_layer(irandom_range(240,400),360,"Bullet",obj_Diamond);
			}
		}
	if (global.Enemy_Attack == 3) {
		state = 5;
		for (i=0;i<4;i++) {
			object = instance_create_layer(1,1,"Bullet",obj_ODevilsknife);
			object.angle = i*90;
			object.x = 320+lengthdir_x(object.offset,object.angle);
			object.y = 240+lengthdir_y(object.offset,object.angle);
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
	x += 10-irandom(20);
	y += 10-irandom(20);
	if (timer > 30) {
		state = 0;
		}
	break;
	case 3://attack 1 init
		state = 4;
		timer = 0;
		grow = 0;
		image_index = 1;
	break;
	case 4://attack 1
		image_xscale = lerp(image_xscale,grow,0.25);
		image_alpha = image_xscale/2;
		if (image_xscale  < .1) {
			timer = 0;
			grow = 2;
			random_direction = irandom(360);
			audio_play_sound(snd_spearappear,0,0);
			x = 320+lengthdir_x(150,random_direction);
			y = 240+lengthdir_y(150,random_direction);
			}
		if (timer == 15) {
			audio_play_sound(snd_joker_oh,0,0);
			for (i=-2;i<3;i++) {
				object = instance_create_layer(x,y,"Bullet",obj_CloverSpread);
				object.image_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y)+(i*15);
				}
			}
		if (timer > 15) {
			grow = 0;
			}
		if (global.Enemy_Attack == 0) {
			state = 0;
			image_index = 0;
			}
	break;
	case 5://other attack
		x = lerp(x,320,.2);
		y = lerp(y,120,.2);
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