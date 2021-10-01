alarm_set(0,2);

if string_length(talk[message]) > read
    {
    read += 1;
	current_char = string_char_at(talk[message], read);
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

