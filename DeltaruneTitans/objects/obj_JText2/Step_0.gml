if active == 1
    {
    alarm_set(0,2);
    audio_play_sound(snd_J1,1,0);
    active = 2;
    }
    
if keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0,gp_face1)
    {
    if message == stop
        {
        obj_FirstTV.go = 1;
        }
        else
        {
        if active == 2 and string_length(talk[message]) == read
            {
            read = 0;
            audio_stop_sound(snd_J1+message);
            message += 1;
            audio_play_sound(snd_J1+message,1,0);
            }
        }
    }

if keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0,gp_face3)
    {
    read = string_length(talk[message]);
    }

