draw_self();
draw_sprite_ext(spr_SoulGraze,0,x,y,image_xscale,image_yscale,image_angle,make_color_rgb(255,((global.Graze/10)*255),((global.Graze/10)*255)),global.Graze/10)
draw_sprite_ext(spr_Soul_Hitbox,0,x,y,image_xscale,image_yscale,image_angle,c_white,slowdown/10)