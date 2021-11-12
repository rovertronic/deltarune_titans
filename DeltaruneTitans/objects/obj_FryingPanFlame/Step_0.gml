x += lengthdir_x(hazard_speed,aim_angle);
y += lengthdir_y(hazard_speed,aim_angle);


if (charge) {
	hazard_speed += .5;
	}
	else
	{
	if (hazard_speed > 0) {
		hazard_speed -= .25;
		}
		else
		{
		aim_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y) + irandom_range(-30,30);
		charge = true;
		}
	}