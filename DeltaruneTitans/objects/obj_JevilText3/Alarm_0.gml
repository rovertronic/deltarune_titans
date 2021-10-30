alarm_set(0,2);

if string_length(talk[messag]) > read
    {
    read += 1;
	current_char = string_char_at(talk[messag], read);
	if (current_char != " " )&&(current_char != "." )&&(current_char != "-" ) {
	    audio_play_sound(snd_Talk,0,0);
		}
    }
    else
    {
    if okgoback == 0
        {
        okgoback = 1;
        }
    }

