image_speed = 0;
icheck = 0;
place = irandom(4);
sfight = 0;
cool = 0;
shake = false;
timer = 0;

switch (place)
    {
        case 0:
        x = 560;
        y = 592;
    break;
        case 1:
        x = 336;
        y = 528;
    break;
        case 2:
        x = 272;
        y = 384;
    break;
        case 3:
        x = 800;
        y = 400;
    break;
    case 4:
        x = 1009;
        y = 432;
        break;
    }

if global.MP == 50
    {
    instance_create(0,0,obj_Act);
    x = 720;
    y = 592;
    sfight = 1;
    }
    
if global.SavedSouls == 6
    {
   x=144;
   y=608;
    }

