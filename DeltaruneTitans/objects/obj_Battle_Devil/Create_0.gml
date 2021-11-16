state = 0;
room_center_x = room_width/2;
target_x = irandom_range(320,320);
target_y = irandom_range(120,120);
image_xscale = 2;
image_yscale = 2;
timer = 0;
speed_x = 0;
speed_y = 0;
x = 320;
y = 140;
pointsize = 0;
object = -1;
grow = 2;
random_direction = 0;
image_speed = 0;
text = "";

knifecount = 0;

aim_angle = 0;

soul_amount = 7-global.SavedSouls;

soul_colors = [c_red,c_yellow,c_blue,c_lime,c_orange,c_purple,c_aqua];