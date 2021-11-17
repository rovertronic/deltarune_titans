x = target_x + lengthdir_x(offset,aim_angle);
y = target_y + lengthdir_y(offset,aim_angle);

if (state == 0) {
	offset = lerp(offset,offset_target,0.2);
	image_angle = lerp(image_angle,aim_angle+180,0.15);
	if (timer == 45) {
		audio_play_sound(snd_blaster2,0,0);
		}
		//im starting to feel a tad burnt out so sorry if this code is shit lol
	if (timer > 45 && timer < 55) {
		object = instance_create_layer(x+lengthdir_x(15,aim_angle+90),y+lengthdir_y(15,aim_angle+90),"Bullet",obj_Wave);
		object.image_angle = aim_angle+180;
		object = instance_create_layer(x+lengthdir_x(15,aim_angle-90),y+lengthdir_y(15,aim_angle-90),"Bullet",obj_Wave);
		object.image_angle = aim_angle+180;
		}
	if (timer == 55) {
		state = 1;
		}
	timer ++;
	}
	else
	{
	offset += go_away_speed;
	go_away_speed += 2;
	}