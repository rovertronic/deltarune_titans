draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(font3);
if global.End == 0
    {
    draw_text(640,360,string_hash_to_newline("Pacifist Ending!"));
    }
if global.End == 1
    {
    draw_text(640,360,string_hash_to_newline("Neutral Ending."));
    }

