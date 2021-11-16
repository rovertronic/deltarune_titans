// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_print_bubble(bubble_x,bubble_y){
if (obj_Soul.menu_state == 9)&&(obj_Soul.player_move) {
	if (string_length(global.TextTable[global.TextIndex][3]) < 40) {
		draw_sprite(spr_DialogBubble,0,x+bubble_x,y+bubble_y);
		draw_set_color(c_black);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(font_bubble)
		draw_text_ext(x+bubble_x-4,y+bubble_y,text,13,68);
		draw_set_color(c_white);
		}
		else
		{
		draw_sprite(spr_DialogBubble,1,x+bubble_x,y+bubble_y);
		draw_set_color(c_black);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(font_bubble)
		draw_text_ext(x+bubble_x-4,y+bubble_y,text,13,136);
		draw_set_color(c_white);
		}
	}
}