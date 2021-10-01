title_timer ++;
if (title_state == 1) {
	title_grav += 1;
	title_y += title_grav;
	}
if (title_y > room_height-32) {
	title_y = room_height-32;
	title_grav = (-title_grav/2);
	}

if (title_timer > 150) {
	title_timer = 0;
	title_fade_io = true;
	}
	
if (title_fade_io) {
	if (title_fade_amount < 1) {
		title_fade_amount += .05;
		}
		else
		{
		title_state++;
		title_fade_io = false;
		if (title_state == 2) {
			room_goto(rm_Start);
			}
		}
	}
	else
	{
	if (title_fade_amount > 0) {
		title_fade_amount -= .05;
		}
	}