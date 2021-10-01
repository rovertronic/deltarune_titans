alarm_set(0,4);

if string_length(talk[message]) > read
    {
    read += 1;
    }
    else
    {
    audio_play_sound(snd_Scare,5,0);
    room_goto(rm_End1);
    }

