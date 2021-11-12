

if (delay < 1) {
	offset = lerp(offset,10,0.2)

	x = 320+lengthdir_x(offset,angle);
	y = 240+lengthdir_y(offset,angle);

	timer ++;
	angle += anglespeed;
	image_angle += anglespeed;
	
	if (anglespeed <= 4) {
		anglespeed += .1;
		}
	}
	else
	{
	delay --;
	}
