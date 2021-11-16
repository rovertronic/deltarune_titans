yvel += 0.5;
timer++
if (timer > 5) {
	image_xscale = -image_xscale;
	timer = 0;
	}
y+=yvel;
x+=xvel;

if (y > 1000) {
	instance_destroy();
	}