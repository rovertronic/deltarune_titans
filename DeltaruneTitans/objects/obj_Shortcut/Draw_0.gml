shader_set(shade_portal);

shader_set_uniform_f(uni1,timer);

draw_sprite_ext(spr_PortalBase,0,x,y,1,1,timer*5,c_white,1);

shader_reset();
