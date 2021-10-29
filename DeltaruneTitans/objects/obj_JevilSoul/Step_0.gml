x = 320 + lengthdir_x(distance,angle);
y = 160 + lengthdir_y(distance,angle);

distance -= 10;
angle += 6;

if (distance < 50) {
	distance = 50;
	}