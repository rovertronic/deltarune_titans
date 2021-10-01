audio_play_sound(snd_Hit,1,0);
if irandom(1) == 0
    {
    audio_play_sound(snd_Oh,1,0);
    }
global.State = 2;
instance_create(x,y,obj_Number);
instance_create(0,0,obj_BossHP);
instance_destroy();

