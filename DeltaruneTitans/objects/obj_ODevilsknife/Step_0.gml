image_angle += 20;

if (delay < 1) {
	offset = cos(timer*.07)*150;

	if ((abs(offset) < 20)&&(!audio_is_playing(snd_ultraswing))) {
		audio_play_sound(snd_ultraswing,0,0);
		}

	x = 320+lengthdir_x(offset,angle);
	y = 240+lengthdir_y(offset,angle);

	timer ++;
	angle += 3;
	}
	else
	{
	delay --;
	}
