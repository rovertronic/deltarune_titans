if trigger == 0
    {
    y = y + grav
    if y < oy
        {
        grav += 1;
        }
        else
        {
        grav -= 1;
        }
    x += 9;
    }
    else
    {
    y += 24;
    }

if y > 820 or x > 1480
    {
    instance_destroy();
    }

