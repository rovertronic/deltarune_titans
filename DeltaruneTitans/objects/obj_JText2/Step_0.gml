func_controls();

if active == 1
    {
    alarm_set(0,2);
    audio_play_sound(snd_J1,1,0);
    active = 2;
    }
    
if (b1p)
    {
    if mess == stop
        {
        obj_FirstTV.go = 1;
        }
        else
        {
        if active == 2 and string_length(talk[mess]) == read
            {
            read = 0;
            audio_stop_sound(jevil_talktable[mess]);
            mess += 1;
            audio_play_sound(jevil_talktable[mess],1,0);
            }
        }
    }

if (b2p)
    {
    read = string_length(talk[mess]);
    }

