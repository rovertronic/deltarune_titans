draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(font_new);

e = 0;
for (i = chapter_scroll_value; ((i < chapter_total)&&(i < chapter_scroll_value+5)); i++) {
	draw_set_color(c_white);
	selectcolor = c_white;
	if (i == scroll_vertical) {
		draw_set_color(c_yellow);
		selectcolor = c_yellow;
		}
	
	if (i <= chapter_unlocks) {
		if (global.chapters_played[i] == true) {
			//spoiled
			draw_sprite_ext(spr_ChapterImages,0,16,(e*chapter_spacing)+2,1,1,0,selectcolor,1);
			draw_sprite(spr_ChapterImages,i+3,16,(e*chapter_spacing)+2);
			draw_text(66,(e*chapter_spacing)+26, "Chapter " + string(i+1) + " - " + chapter_text[i]);
			
			for (i2 = 0; i2 < 3; i2++) {
				draw_sprite_ext(spr_Stars,global.star_table[i][i2],432+(64*i2),(e*chapter_spacing)+2,1,1,0,selectcolor,1);
				}
				
			if (global.MiniStarTable[i] == ministar_max[i]) {
				draw_sprite_ext(spr_Stars,1,380,(e*chapter_spacing)+2,1,1,0,selectcolor,1);
				}
				
			for (i2 = 0; i2 < global.MiniStarTable[i]; i2++) {
				draw_sprite_ext(spr_ministar,0,76+(8*i2),(e*chapter_spacing)+40,1,1,0,selectcolor,1);
				}
				
			
			}
			else
			{
			//unspoiled
			draw_sprite_ext(spr_ChapterImages,2,16,(e*chapter_spacing)+2,1,1,0,selectcolor,1);
			draw_text(66,(e*chapter_spacing)+26, "Chapter " + string(i+1) + " - ???");
			}
		}
		else
		{
		//Chapter not unlocked yet
		if (i != scroll_vertical) {
			draw_set_color(make_color_rgb(100,100,100));
			selectcolor = make_color_rgb(100,100,100);
			}
		draw_sprite_ext(spr_ChapterImages,1,16,(e*chapter_spacing)+2,1,1,0,selectcolor,1);
		draw_text(66,(e*chapter_spacing)+26, "Chapter " + string(i+1) + " - Not Yet Unlocked");
		}
	
	draw_set_color(c_grey)
	draw_line(16,(e*chapter_spacing)-1,624,(e*chapter_spacing)-1)
		
	e++;
	}

for (i = 0; i < array_length(menu_text); i ++) {
	draw_set_color(c_white);
	selectcolor = c_white;
	if ((i == scroll_horizontal)&&(scroll_vertical == 7)) {
		draw_set_color(c_yellow);
		selectcolor = c_yellow;
		}
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(menu_spacing+(i*menu_spacing),(chapter_spacing*5)+32,menu_text[i])
	}

if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
	}

surface_set_target(surf);
draw_clear_alpha( c_white, 0);

gpu_set_colorwriteenable(1,1,1,1);

if (submenu_width > 1) {
	draw_sprite_stretched(spr_NineSlice,0,(room_center_x)-submenu_width,(room_height/2)-submenu_height,submenu_width*2,submenu_height*2);
	}
	
gpu_set_colorwriteenable(1,1,1,0);

//if (submenu_open_full) {
	switch(submenu_type) {
		case 0:
		for (i = 0; i < array_length(options_value); i ++) {
			draw_set_color(c_white);
			selectcolor = c_white;
			if (i == scroll_submenu) {
				draw_set_color(c_yellow);
				selectcolor = c_yellow;
				}
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
	
			draw_text(room_center_x,64+(i*16),options_text[i][options_value[i]])
			
			draw_sprite(spr_control_guide, gamepad_temporary,room_center_x, 250);
			}
		break;
		case 1:
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text(room_center_x,room_height/2,
			"Undertale/Deltarune:\nToby Fox\n\nVoice Acting:\nChapter 1 - its cazsu\n\nMusic:\nChapter 1 - RoomTone\nChapter 2 - RoomTone\nAll other music: Toby"
			);
		break;
		case 2://items
			draw_set_color(c_lime);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_text(room_center_x,48,"Items:");
			draw_set_color(c_white);
			for (i=0; i<8; i++) {
				draw_text(room_center_x,64+(i*12),global.Item_Names[global.Inventory[i]]);
				}
			draw_line(0,158,room_width,158);
			draw_set_color(c_red);
			draw_text(room_center_x,174,"Upgrades:");
			draw_set_color(c_white);
			for (i=0; i<global.UpgradeLevel; i++) {
				draw_text(room_center_x,194+(i*12),upgrade_text[i]);
				}
			draw_set_color(c_gray);
			draw_text(room_center_x,194+(global.UpgradeLevel*12),"Next: (" + string(global.Stars) + "/" + string(upgrade_stars[global.UpgradeLevel]) + ")" );
		break;
		case 3:
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_sprite_ext(spr_ChapterImages,0,(room_center_x)-36,35,1.5,1.5,0,c_white,1);
			if (global.chapters_played[global.Chapter]) {
				draw_sprite_ext(spr_ChapterImages,global.Chapter+3,(room_center_x)-36,35,1.5,1.5,0,c_white,1);
				}
				else
				{
				draw_sprite_ext(spr_ChapterImages,2,(room_center_x)-36,35,1.5,1.5,0,c_white,1);
				}
			draw_text_ext_transformed(room_center_x,room_height/2,chapter_descriptions[global.Chapter],16,180,1,1,0);
			
			draw_sprite_ext(spr_Soul,0,room_center_x-84,260+(scroll_submenu*16),1,1,0,c_red,1);
			
			draw_set_halign(fa_left);
			for (i=0;i<4;i++) {
				draw_set_color(c_white);
				if (i != 3) {
					if (!runs_unlocked[global.Chapter][i]) {
						draw_set_color(c_grey);
						}
					}
				draw_text(room_center_x-68,260+(i*16),runs_text[i]);
				}
			
			draw_set_color(c_white);
		break;
		}
	//}

	gpu_set_colorwriteenable(1,1,1,1);

	surface_reset_target();

	gpu_set_colorwriteenable(1,1,1,1);
	draw_surface(surf,0,0);
	surface_free(surf);

draw_set_color(c_black);
draw_set_alpha(transition_fade);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);
draw_set_color(c_white);