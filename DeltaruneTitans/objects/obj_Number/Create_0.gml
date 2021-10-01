image_blend = c_red;
grav = -6;
alarm_set(0,30);
rainbow = 0;
image_speed = 0;
chance = irandom(2);
sped = 0;

if global.Super = true
    {
    sped = -5+irandom(10);
    if chance == 0
        {
        image_index = 2;
        global.BossQue += 5;
        }
    if chance == 1
        {
        image_index = 3;
        global.BossQue += 8;
        }
    if chance == 2
        {
        image_index = 4;
        global.BossQue += 9;
        }
    }
    else
    {
    if irandom(1) == 0
        {
        image_index = 0;
        global.BossQue += 1;
        }
        else
        {
        image_index = 1;
        global.BossQue += 2;
        }
    }
    
if global.SavedSouls == 6
    {
    sprite_index = spr_Nintey;
    global.BossQue += 99;
    }


