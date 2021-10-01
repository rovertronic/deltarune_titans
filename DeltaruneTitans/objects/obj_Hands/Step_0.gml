if global.State != 5
    {
    image_angle += grav;
    if image_angle < ogang
        {
        grav += 0.5;
        }
        else
        {
        grav -= 0.5;
        }
    }
    
if global.SavedSouls == 6
    {
    instance_destroy();
    }

