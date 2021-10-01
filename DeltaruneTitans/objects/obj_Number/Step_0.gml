grav += 0.25;
y += grav;
if rainbow == 1
    {
    image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));
    }
if y > 730
    {
    instance_destroy();
    }
x += sped;

