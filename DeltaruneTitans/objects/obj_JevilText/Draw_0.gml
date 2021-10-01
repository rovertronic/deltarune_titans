draw_set_font(font_2);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2),__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2),string_hash_to_newline(string_copy(talk[message],1,read)));

