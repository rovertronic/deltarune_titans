if active == 1
    {
    alarm_set(0,2);
    active = 2;
    }

if okgoback > 0
    {
    okgoback += 1;
    if okgoback > 59
        {
        if global.Deaths != 66
            {
            global.Deaths += 1;
            }
        room_goto(rm_Battle);
        }
    }

