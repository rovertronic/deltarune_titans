image_blend = c_red;
grav = -6;
alarm_set(0,30);
rainbow = 0;
image_speed = 0;
chance = irandom(2);
sped = 0;
damage = 0;
damage_multiplier = 1+(global.UpgradeATK/2);

if global.Super = true
    {
    sped = -5+irandom(10);
    if chance == 0
        {
        image_index = 2;
        damage = 5;
        }
    if chance == 1
        {
        image_index = 3;
        damage = 8;
        }
    if chance == 2
        {
        image_index = 4;
        damage = 9;
        }
    }
    else
    {
    if irandom(1) == 0
        {
        image_index = 0;
        damage = 1;
        }
        else
        {
        image_index = 1;
        damage = 2;
        }
    }
    
if global.SavedSouls == 6
    {
    sprite_index = spr_Nintey;
    damage = 99;
    }

damage *= damage_multiplier;
global.BossQue += damage;
