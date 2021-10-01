switch(global.SavedSouls)
    {
    case 0:
        image_blend = c_aqua;
    break;
    case 1:
        image_blend = c_purple;
    break;
    case 2:
        image_blend = c_orange;
    break;
    case 3:
        image_blend = c_lime;
    break;
    case 4:
        image_blend = c_blue;
    break;
    case 5:
        image_blend = c_yellow;
    break;
    }
    
alarm_set(0,150);
alarm_set(1,180);
audio_play_sound(snd_Alarm,1,1);

