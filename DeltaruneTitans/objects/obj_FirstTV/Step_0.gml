if y > 20 and go == 0
    {
    y -= 20;
    }
    else
    {
    if sent == 0
        {
        sent = 1;
        obj_JText2.active = 1;
        }
    }
if go == 1
    {
    y += 20
    if y > 720
        {
        audio_stop_sound(snd_Circus);
        room_goto(rm_Fight);
        }
    }

