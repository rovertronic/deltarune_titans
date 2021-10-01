if global.State == 0 or global.State == 3
    {
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
if global.State == 1
    {
    x = room_width/2;
    grav = 3;
    x = ox;
    y = oy;
    }
if global.State == 2
    {
    x = (room_width/2)+irandom(30);
    y = oy+irandom(30);
    }

