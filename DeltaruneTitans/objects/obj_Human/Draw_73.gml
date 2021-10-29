draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font_new_dialog);
draw_set_color(c_white);

if (text_open) {
	draw_sprite_ext(spr_Textbox,0,160+camera_get_view_x(view_camera),textbox_y_offset+camera_get_view_y(view_camera),
	0.75,0.75,0,c_white,1)
	
	draw_text_transformed(60+camera_get_view_x(view_camera),textbox_y_offset+5+camera_get_view_y(view_camera),text_display,.75,.75,0);
	}

if (menu_open) {
	draw_sprite_ext(spr_StatMenu,(menu_state>0),camera_get_view_x(view_camera),camera_get_view_y(view_camera)-10,0.75,0.75,0,c_white,1)	
	draw_sprite_ext(spr_Soul,0,camera_get_view_x(view_camera)+22,camera_get_view_y(view_camera)+73+(13*menu_select),.5,.5,0,c_red,1)
	switch(menu_state) {
		case 1:
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_text_transformed(80+camera_get_view_x(view_camera),camera_get_view_y(view_camera)+25,
			"\"Frisk"+global.Party_Names[global.Party]+"\"\n\nLV " + string(global.LV) + "\nHP " + string(global.MaxHP) + "/" + string(global.MaxHP) + "\n\nAT 0(0)    EXP:0\nDF 0(0)    NEXT:" + string(global.XP_Table[global.LV]) + "\n\nWEAPON: Stick\n\ARMOR: Bandage\nGOLD: 0"
			,.75,.75,0);
		break;
		case 2:
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			for (i=0; i<8; i++) {
				
				draw_set_color(c_white);
				if (i==item_select) {
					draw_set_color(c_yellow);
					}
				draw_text_transformed(80+camera_get_view_x(view_camera),camera_get_view_y(view_camera)+25+(i*16),global.Item_Names[global.Inventory[i]],.75,.75,0);
				}
		break;
		}
	}
	
draw_set_color(c_black);
draw_set_alpha(transition_fade);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);
draw_set_color(c_white);