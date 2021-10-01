x = obj_Face.x;
y = obj_Face.y;

if global.State != 5
    {
    image_angle += grav;
    if image_angle < 0
        {
        grav += 1;
        }
        else
        {
        grav -= 1;
        }
    }

