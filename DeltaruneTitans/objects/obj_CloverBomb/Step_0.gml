y += 24;

if y > ydet
    {
    bup = instance_create(x,y,obj_Clover);
    bup.dir = 1;
    bup.rot = rot;
    bup = instance_create(x,y,obj_Clover);
    bup.dir = 2;
    bup.rot = rot;
    bup = instance_create(x,y,obj_Clover);
    bup.dir = 3;
    bup.rot = rot;
    bup = instance_create(x,y,obj_Clover);
    bup.dir = 4;
    bup.rot = rot;
    instance_create(x,y,obj_Boom);
    audio_play_sound(snd_Slice,1,0);
    instance_destroy();
    }

