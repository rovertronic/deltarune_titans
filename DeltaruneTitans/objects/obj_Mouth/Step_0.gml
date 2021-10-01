if global.State == 0
    {
    if global.attack == 2
        {
        move_towards_point(obj_Soul.x,obj_Soul.y,8);
        }
        else
        {
        move_towards_point(obj_Soul.x,obj_Soul.y,0);
        x = room_width/2;
        y = y + grav
        
        if y < oy
            {
            grav += 1;
            }
            else
            {
            grav -= 1;
            }
        }

    }
if global.State == 1
    {
    x = room_width/2;
    grav = 13;
    x = ox;
    y = oy;
    }
if global.State == 2
    {
    x = (room_width/2)+irandom(30);
    y = oy+irandom(30);
    }

if global.State == 3
    {
    animate += 1;
    switch(animate)
        {
        case 2:
        x = 624;
        y = 464;
        break;
        case 4:
        x = 512;
        y = 432;
        break;
        case 6:
        x = 432;
        y = 384;
        break;
        case 8:
        x = 624;
        y = 464;
        break;
        case 10:
        x = 752;
        y = 432;
        break;
        case 12:
        x = 864;
        y = 384;
        break;
        case 14:
        animate = 0;
        break;
        }
    }
if global.State == 5
    {
    move_towards_point(obj_Soul.x,obj_Soul.y,0);
    }
if global.attack == 7
    {
    y = 352;
    grav = 13;
    }

