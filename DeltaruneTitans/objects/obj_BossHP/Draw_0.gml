
draw_set_color(c_black);
draw_rectangle(offset+339,329,offset+941,391,false);
draw_set_color(c_lime);
if global.BossHP > 0
    {
    draw_rectangle(340+offset,330,offset+330+global.BossHP,390,false);
    }
draw_set_color(c_white);

