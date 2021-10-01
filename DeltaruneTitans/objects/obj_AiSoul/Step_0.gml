switch(ide)
{
case 0:
x = obj_Face.x -146+149
y = obj_Face.y -187+141
break;
case 1:
x = obj_Face.x -146+148
y = obj_Face.y -187+252
break;
case 2:
x = obj_Face.x -146+102
y = obj_Face.y -187+79
break;
case 3:
x = obj_Face.x -146+230
y = obj_Face.y -187+213
break;
case 4:
x = obj_Face.x -146+57
y = obj_Face.y -187+191
break;
case 5:
x = obj_Face.x -146+213
y = obj_Face.y -187+93
break;
}

if global.Destoul == ide + 1 and dead == 0
    {
    dead = 1;
    audio_play_sound(snd_Crack,0,0);
    image_index = 1;
    global.KK += 1;
    if ide == 0
        {
        alarm_set(1,180);
        }
    }
    
if global.SavedSouls > ide
    {
    instance_destroy();
    }

