if global.State == 0
    {
    scale = 1+(irandom(100)/1000);
    image_xscale = sign(image_xscale)*scale;
    image_yscale = scale;
    }
    
if global.SavedSouls == 6
    {
    y -= 3;
    }

