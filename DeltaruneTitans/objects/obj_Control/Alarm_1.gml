alarm_set(1,30);

if global.attack == 1
    {
    if canspawn == 1
        {
        audio_play_sound(snd_Summon,1,0);
        instance_create(-100,180,obj_Duck);
        instance_create(-100,540,obj_Duck);
        }
    }
if global.attack == 4
    {
    alarm_set(1,25);
    audio_play_sound(snd_Summon,1,0);
    instance_create(obj_Soul_Old.x+irandom(200)-10,-60,obj_CloverBomb);
    }
bindex = 0;
if flunk == 0
    {
    osett = 0;
    }
    else
    {
    osett = 87;
    }
if global.attack == 5
    {
    alarm_set(1,12);
    audio_play_sound(snd_Bell,1,0);
    repeat(10)
        {
        instance_create(osett+(174*bindex),0,obj_Bell);
        bindex += 1;
        }
    flunk = !flunk;
    }
if global.attack == 6
    {
    audio_play_sound(snd_Slice,1,0);
    instance_create(0,0,obj_MiniKnife);
    instance_create(room_width,0,obj_MiniKnife);
    instance_create(room_width,room_height,obj_MiniKnife);
    instance_create(0,room_height,obj_MiniKnife);
    }

