if global.State == 1
    {
    global.State = 0;
    }
if global.State == 2
    {
    dcount -= 1;
    if dcount < 1
        {
        dcount = 60;
        global.State = 1;
        }
    }
    
if fade > 0
    {
    fade -= 0.05;
    }
    
if mpque > 0
    {
    mpque -= 1;
    global.MP += 1;
    }
if global.BossQue > 0
    {
    global.BossQue -= 1;
    global.BossHP -= 1;
    }
    
    
if global.State < 3
    {
    if global.attack == 0
        {
        wait += 1;
        if wait > 119
            {
            if global.SavedSouls > 2 or global.BossHP < 250
                {
                global.attack = irandom(6)+1;
                }
                else
                {
                global.attack = irandom(4)+1;
                }
            if global.attack == lasta
                {
                global.attack = 0;
                }
                else
                {
                lasta = global.attack;
                wait = 0;
                if irandom(1) == 0
                    {
                    audio_play_sound(snd_Chaos,1,0);
                    }
                    else
                    {
                    audio_play_sound(snd_Bye,1,0);
                    }
                if global.attack == 3
                    {
                    instance_create(-673,42,obj_GiantKnife);
                    windowy = 750;
                    global.red = 255;
                    global.green = 0;
                    global.blue = 0;
                    }
                if global.attack == 1
                    {
                    global.red = 255;
                    global.green = 255;
                    global.blue = 0;
                    }
                if global.attack == 4
                    {
                    global.red = 0;
                    global.green = 50;
                    global.blue = 0;
                    }
                if global.attack == 5
                    {
                    global.red = 200;
                    global.green = 0;
                    global.blue = 200;
                    if global.SavedSouls != 6
                        {
                        instance_create(-673,680,obj_Knife);
                        }
                    }
                if global.attack == 6
                    {
                    global.red = 50;
                    global.green = 0;
                    global.blue = 0;
                    audio_stop_sound(snd_Chaos);
                    audio_stop_sound(snd_Bye);
                    audio_play_sound(snd_MetaMorph,1,0);
                    }
                if global.attack == 7
                    {
                    global.red = 50;
                    global.green = 50;
                    global.blue = 50;
                    instance_create(room_width/2,(room_height/2)-720,obj_CardMaze);
                    }
                }
            }
        }
        else
        {
        await += 1;
        if global.attack == 1 and await == 180
            {
            canspawn = 0;
            if instance_number(obj_Duck) > 0
                {
                obj_Duck.trigger = 1;
                }
            }
        if global.attack == 1 and await > 229
            {
            canspawn = 1;
            global.red = 255;
            global.green = 255;
            global.blue = 255;
            global.attack = 0;
            mpque += 10;
            await = 0;
            }
        if global.attack == 2 and await > 89
            {
            global.red = 255;
            global.green = 255;
            global.blue = 255;
            global.attack = 0;
            await = 0;
            global.State = 1;
            mpque += 15;
            }
        if global.attack == 3 and await > 89
            {
            global.red = 255;
            global.green = 255;
            global.blue = 255;
            global.attack = 0;
            await = 0;
            windowy = 720;
            mpque += 5;
            }
        if global.attack == 4 and await > 199
            {
            global.red = 255;
            global.green = 255;
            global.blue = 255;
            global.attack = 0;
            await = 0;
            mpque = 20;
            }
        if global.attack == 5 and await > 199
            {
            global.red = 255;
            global.green = 255;
            global.blue = 255;
            global.attack = 0;
            await = 0;
            mpque = 20;
            }
        if global.attack == 6 and await > 119
            {
            global.red = 255;
            global.green = 255;
            global.blue = 255;
            global.attack = 0;
            await = 0;
            mpque = 25;
            }
        if global.attack == 7 and await > 299
            {
            global.red = 255;
            global.green = 255;
            global.blue = 255;
            global.attack = 0;
            await = 0;
            mpque = 25;
            }
        }
    }

if room_width > windowx
    {
    room_width -= 1;
    }
if room_width < windowx
    {
    room_width += 1;
    }
if room_height > windowy
    {
    room_height -= 1;
    }
if room_height < windowy
    {
    room_height += 1;
    }
    
if global.HP < 1 and global.SavedSouls != 6
    {
    global.GOx = obj_Soul.x;
    global.GOy = obj_Soul.y;
    room_goto(rm_GameOver);
    }
    
if global.MP > 50
    {
    global.MP = 50;
    }

if global.BossHP < 1 and global.State != 5
    {
    global.State = 5;
    global.attack = 0;
    wait = 0;
    global.red = 0;
    global.green = 0;
    global.blue = 0;
    audio_stop_sound(snd_Music);
    alarm_set(4,150);
    }
    
if global.SavedSouls == 6
    {
    windowx = 640;
    global.red = 0;
    global.green = 0;
    global.blue = 200;
    global.MP = 0;
    if global.HP < 10
        {
        global.HP = 10;
        }
    }


if keyboard_check(vk_f1) {
	global.BossHP = 1;
	global.MP = 100;
	}
