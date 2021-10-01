if active == 1
    {
    alarm_set(0,2);
    active = 2;
    }
    
if keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0,gp_face1)
    {
    if message == stop
        {
        audio_sound_gain(snd_Circus, 0.25, 5000);
        room_goto(rm_TVrm);
        }
        else
        {
        if active == 2 and string_length(talk[message]) == read
            {
            read = 0;
            message += 1;
            }
        }
    }

if keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0,gp_face3)
    {
    if active == 2
        {
        read = string_length(talk[message]);
        }
    }
    


