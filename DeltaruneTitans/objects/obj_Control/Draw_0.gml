draw_set_color(c_black);
draw_rectangle((room_width/2)-26,704,(room_width/2)+26,716,false);
draw_set_color(c_red);
draw_rectangle((room_width/2)-25,705,(room_width/2)+25,715,false);
draw_set_color(c_yellow);
draw_rectangle((room_width/2)-25,705,(room_width/2)-25+global.HP,715,false);
draw_set_color(c_black);
draw_rectangle((room_width/2)-26,704-20,(room_width/2)+26,716-20,false);
draw_set_color(c_orange);
if global.MP != 0
    {
    draw_rectangle((room_width/2)-25,705-20,(room_width/2)-25+global.MP,715-20,false);
    }
draw_set_color(c_black);
draw_set_alpha(fade);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);
draw_set_color(c_white);

