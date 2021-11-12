i_index_float = 0;
sintimer = 0;
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
y = 120;
home_x = x;
home_y = y;
temp_x = x;
pointsize = 0;
object = -1;
grow = 2;
random_direction = 0;
image_speed = 0;
text = "";
spit_text = [
"DEALS",
"KROMER",
"BUY",
"SELL",
"STOCKS",
"SALES",
"BRAND"
]
spit_text_choice = 0;
spit_text_index = 1;

color_r = 255;
color_g = 255;
color_b = 255;

soul_amount = 6-global.SavedSouls;

soul_attack = 0;
soul_attack_index = global.SavedSouls;
soul_attack_hide = true;

soul_colors = [c_yellow,c_blue,c_lime,c_orange,c_purple,c_aqua,c_aqua];
soul_color_two = [
[255,255,0],
[0,0,255],
[0,255,0],
[255,127,0],
[255,0,255],
[0,255,255],
]