if (timer > 4) {
	timer = 0;
	flip = !flip;
	}
timer ++;

if (global.Current_Interacting_Object == id) {
	if (flip) {
		image_index = 0;
		}
		else
		{
		image_index = 3;
		}
	}