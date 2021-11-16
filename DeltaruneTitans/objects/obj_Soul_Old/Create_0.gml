sprite_index = global.Soul_Skins[global.Current_Soul_Skin];

slowdown = 0;
slowdown_input = false;

image_speed = 0;
x = room_width/2;
centerx = room_width/2;
centery = room_height/2;
sped = 0;
cooldown = 0;

haxis = 0;
vaxis = 0;

//instance_create(x,y,obj_RainbowCircle);
alarm_set(0,5);
image_blend = c_red;

