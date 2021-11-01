x = homex + (sin(timer/30)*20);
timer ++;
target_y = camera_get_view_y(view_camera[0])+32;
y = lerp(y,target_y,.1);

if (timer > 60)&&(state == 0) {
	state = 1;
	func_init_text(131);
	}