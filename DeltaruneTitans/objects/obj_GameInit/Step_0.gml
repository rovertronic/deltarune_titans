title_timer ++;
if (keyboard_check_pressed(vk_escape))||(keyboard_check_pressed(vk_enter))||(keyboard_check_pressed(ord("X"))) {
	title_skip = true;
	title_fade_io = true;
	}

if (title_state == 1) {
	title_grav += 1;
	title_y += title_grav;
	}
if (title_y > room_height-32) {
	if (title_grav > 1) {
		audio_play_sound(snd_Pound,0,0);
		}
	title_y = room_height-32;
	title_grav = (-title_grav/2);
	}

if ((title_timer > 60) && (title_state==0)) {
	title_second_layer = lerp(title_second_layer,1,.1);
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
		if (title_state == 1)&&(!title_skip) {
			audio_play_sound(snd_Freeze,0,0);
			}
		if (title_state == 2)||(title_skip) {
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