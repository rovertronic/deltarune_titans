image_xscale = 1.5;
image_yscale = 1.5;
if rot == 0
    {
    switch(dir)
        {
        case 1:
        x += 10;
        break;
        case 2:
        x -= 10;
        break;
        case 3:
        y += 10;
        break;
        case 4:
        y -= 10;
        break;
        }
    }
    else
    {
    switch(dir)
        {
        case 1:
        x += 8;
        y += 8;
        break;
        case 2:
        x -= 8;
        y += 8;
        break;
        case 3:
        x -= 8;
        y -= 8;
        break;
        case 4:
        x += 8;
        y -= 8;
        break;
        }
    }
    
image_angle += 10;

if x < 0 or x > room_width or y < 0 or y > room_height+60
    {
    instance_destroy();
    }

