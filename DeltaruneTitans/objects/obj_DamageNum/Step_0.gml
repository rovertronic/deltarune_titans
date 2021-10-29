timer ++;
if (timer > 30) {
	instance_destroy();
	}
	
y+=yvel;
yvel ++;
if (y > yhome) {
	y = yhome;
	yvel = 0;
	}