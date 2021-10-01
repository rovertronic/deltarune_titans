if (distance_to_object(obj_Human) < 60) {
	if (!surface_exists(surf)) {
		surf = surface_create(sprite_width,sprite_height);
		}

	surface_set_target(surf);

	draw_sprite(sprite_index,image_index,sprite_xoffset,sprite_yoffset);

	gpu_set_colorwriteenable(1,1,1,0);

	draw_sprite_ext(obj_Human.sprite_index,obj_Human.image_index,obj_Human.x-x,obj_Human.y-y+30,obj_Human.image_xscale,-1,0,c_white,0.5);
	draw_sprite_ext(obj_Partner_Snowkid.sprite_index,obj_Partner_Snowkid.image_index,obj_Partner_Snowkid.x-x,obj_Partner_Snowkid.y-y+24,obj_Partner_Snowkid.image_xscale,-1,0,c_white,0.5);

	gpu_set_colorwriteenable(1,1,1,1);

	surface_reset_target();

	draw_surface(surf,x-sprite_xoffset,y-sprite_yoffset);

	surface_free(surf);
	}
	else
	{
	draw_self();//no reflection
	}

draw_set_color(c_white);
draw_set_alpha(shine);
draw_rectangle(x,y,x+31,y+31,false);
draw_set_alpha(1);