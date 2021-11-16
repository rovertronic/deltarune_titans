image_angle = sin(sintimer/5) * 20;
sintimer ++;

if (exist == 0) {
	image_xscale += .1;
	image_yscale += .1;
	}
	else
	{
	y += 6;	
	}

if (y > target_y)&&(exist==1) {
	exist = 0;
	audio_play_sound(snd_Pound,0,0);
	aim_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y)
	for (i=-2;i<3;i++) {
		object = instance_create_layer(x,y,"Bullet",obj_Danmaku);
		object.glow_color = c_teal;
		object.image_xscale = 4;
		object.image_yscale = 4;
		object.aim_angle = aim_angle+(i*25);
		object.bullet_speed = 5;
		}
	}
