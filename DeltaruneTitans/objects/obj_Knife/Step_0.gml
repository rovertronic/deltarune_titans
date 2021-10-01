if global.attack == 5
    {
    x += go;
    }
    else
    {
    y += 30;
    if y > 2000
        {
        instance_destroy();
        }
    }

