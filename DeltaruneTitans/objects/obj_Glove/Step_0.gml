image_angle = aim_angle;

angle_to_target = point_direction(home_x,home_y,target_x,target_y);
aim_angle += (angle_difference(angle_to_target,aim_angle)/2);

punch = lerp(punch,punch_amount,0.2);
punch_amount = point_distance(home_x,home_y,target_x,target_y)*hit;

x = home_x + lengthdir_x(punch,aim_angle);
y = home_y + lengthdir_y(punch,aim_angle);

if (point_distance(x,y,target_x,target_y) < 10) {
	hit = 0;
	audio_play_sound(snd_damage,0,0);
	}