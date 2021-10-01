global.Graze = 0;
global.DissalowGraze = 0;
global.HP = 50;
global.MP = 0;
global.Super = false;
global.BossQue = 0;
mpque = 0;
global.Destoul = 0;
global.KK = 0;

flunk = 0;

global.State = 3;
global.BossHP = 611;
dcount = 60;
windowx = 1280;
windowy = 720;
global.red = 0;
global.green = 0;
global.blue = 0;
lasta = 0;
canspawn = 1;
alarm_set(2,180);
audio_play_sound(snd_MegaLaugh,0,0);

alarm_set(0,300);
alarm_set(1,30);
wait = 0;
await = 0
global.attack = 0;

fade = 1;

souls = 0;
repeat(6)
    {
    sole = instance_create(0,0,obj_AiSoul);
    sole.ide = souls;
    souls += 1;
    }

