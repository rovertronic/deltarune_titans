if (!dead) {
	if (timer > 8) {
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
			image_index = 1;
			}
		}
	}