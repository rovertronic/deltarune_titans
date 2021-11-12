if (global.Enemy_Attack != 0) {
	angle = point_direction(x,y,obj_Battle_Spamton.x,obj_Battle_Spamton.y);
	}
x += lengthdir_x(5,angle);
y += lengthdir_y(5,angle);

if (distance_to_object(obj_Battle_Spamton) < 2) {
	exist = 0;
	}