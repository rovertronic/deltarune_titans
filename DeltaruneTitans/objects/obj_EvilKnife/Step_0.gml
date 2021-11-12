x = home_x + lengthdir_x(bullet_distance,image_angle);
y = home_y + lengthdir_y(bullet_distance,image_angle);
image_angle += (angle_difference(aim_angle,image_angle)/4);

if (timer < 30) {
	bullet_distance = lerp(bullet_distance,15,0.2);
	}
	else
	{
	bullet_distance += bullet_speed;
	bullet_speed += .25;
	}
	
timer++;