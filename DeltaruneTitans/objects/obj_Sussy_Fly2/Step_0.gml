if (!obj_Soul.player_move) {
	gox = obj_Soul.x;
	goy = obj_Soul.y;
	}

if (state == 0) {
	x = gox+lengthdir_x(offset,go_angle);
	y = goy+lengthdir_y(offset,go_angle);
	go_angle += 3;
	offset = lerp(offset,200,.1);
	if (timer < 1) {
		state = 1;
		aim_angle = point_direction(x,y,obj_Soul.x,obj_Soul.y);
		}
	timer --;
	image_angle = go_angle;
	}
	else
	{
	timer ++;
	if (timer < 4) {
		aim_angle = 0;
		if (x > 320) {
			aim_angle = 180;
			}
		}
	go_angle = aim_angle+(sin(timer/2)*15);
	x += lengthdir_x(12,go_angle);
	y += lengthdir_y(12,go_angle);
	image_angle = go_angle - 90;
	}
