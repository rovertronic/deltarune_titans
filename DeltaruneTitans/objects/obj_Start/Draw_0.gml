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
			draw_sprite(spr_ChapterImages,i+3,16,(e*chapter_spacing)+2)
			draw_text(66,(e*chapter_spacing)+26, "Chapter " + string(i+1) + " - " + chapter_text[i]);
			
			for (i2 = 0; i2 < 3; i2++) {
				draw_sprite_ext(spr_Stars,global.star_table[i][i2],432+(64*i2),(e*chapter_spacing)+2,1,1,0,selectcolor,1);
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

for (i = 0; i < array_length(options_value); i ++) {
	draw_set_color(c_white);
	selectcolor = c_white;
	if ((i == scroll_horizontal)&&(scroll_vertical == 7)) {
		draw_set_color(c_yellow);
		selectcolor = c_yellow;
		}
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(options_spacing+(i*options_spacing),(chapter_spacing*5)+32,options_text[i][options_value[i]])
	}
	

draw_set_color(c_black);
draw_set_alpha(transition_fade);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);
draw_set_color(c_white);