draw_set_alpha(textbox_alpha);
if (!hide_box) {
	draw_sprite_stretched(spr_NineSlice,0,battle_box_x_v,battle_box_y_v,battle_box_w_v,battle_box_h_v);
	}
draw_set_alpha(1);
if (player_move) {

	switch(menu_state) {
		case 0:
			draw_set_font(font_battle);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_text(65,270,text_display);
		break;
		case 1:
			draw_sprite_ext(spr_AttackHUD,0,320,260,attack_hud_size,1,0,c_white,attack_hud_size);
			draw_sprite(spr_AttackBar,attack_stick_anim,attack_stick_x,260);
		break;
		case 2: //act
			draw_set_font(font_battle);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_text(87,262,act_table[actstate]);
		break;
		case 3:
			draw_set_font(font_battle);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			for (i=0; i<4; i++) {
				draw_text(87,280+(i*24),global.Item_Names[global.Inventory[i]]);
				}
			for (i=0; i<4; i++) {
				draw_text(307,280+(i*24),global.Item_Names[global.Inventory[i+4]]);
				}
		break;
		case 4: //mercy
			draw_set_font(font_battle);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_text(87,262,"* Spare\n* Run");
		break;
		case 5:
			draw_set_font(font_battle);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_text(87,280,"* "+ global.Enemy_Name);
			
			draw_set_color(c_grey);
			draw_rectangle(350,270,450,290,false);
			draw_set_color(c_lime);
			draw_rectangle(350,270,350+(100*(global.Enemy_HP/global.Enemy_MaxHP)),290,false);
		break;
		case 6:
			draw_set_font(font_battle);
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_text(65,270,text_display);
		break;
		}
	}
	
if (hp_bar_timer > 0) {
	draw_set_color(c_grey);
	draw_rectangle(320-(hp_bar_size/2),150,(hp_bar_size/2)+320,170,false);
	draw_set_color(c_lime);
	if (global.Enemy_HP > 0) {
		draw_rectangle(320-(hp_bar_size/2),150,320-(hp_bar_size/2)+((hp_bar_visual/global.Enemy_MaxHP)*hp_bar_size),170,false);
		}
	}
	

draw_set_color(c_white);
draw_set_font(font_small);
draw_set_halign(fa_left);
draw_set_valign(fa_left);

if (!partner_move) {
	if (global.Run == 2) {
		draw_text(30,402,"KRIS");
		}
		else
		{
		draw_text(30,402,"FRISK");
		}
	draw_text(131,402,"LV " + string(global.LV));
	}
	else
	{
	draw_text(30,402,"SNOWKID");
	}

draw_text(243,402,"HP")

global.HP = clamp(global.HP,0,global.MaxHP);

draw_text(313+hud_hp_offset,402, string(global.HP) + "/" + string(global.MaxHP));

draw_text(498+hud_hp_offset,402,string(global.MP*2) + "%")
draw_text(408+hud_hp_offset,402,"TP")

//DRAW TP
draw_set_color(c_grey)
draw_rectangle(440+hud_hp_offset,400,490+hud_hp_offset,420,false);
if (global.MP > 0) {
	draw_set_color(c_orange)
	draw_rectangle(440+hud_hp_offset,400,440+global.MP+hud_hp_offset,420,false);
	}

//DRAW HP
draw_set_color(c_red)
draw_rectangle(275,400,275+global.MaxHP,420,false);
if (global.HP > 0) {
	draw_set_color(c_yellow)
	if ((regeneration > 0)&&(!player_move)) {
		draw_set_color(c_fuchsia);//what the fuck gamemaker
		}
	draw_rectangle(275,400,275+global.HP,420,false);
	}

if (!partner_move) {
	for (i = 0; i<(4-soul_nomercy); i++) {
		draw_sprite(button_sprites[i],(i==select_main),32+(154*i),430);
		}
	}
	else
	{
	for (i = 0; i<2; i++) {
		draw_sprite(partner_button_sprites[global.Party][i],(i==select_main),32+(154*i),430);
		}
	}
	
//block menu off
//kinda bad but idc
if (!player_move)||(menu_state != 0) {
	if (!partner_move) {
		for (i = 0; i<(4-soul_nomercy); i++) {
			draw_sprite(button_sprites[i],0,32+(154*i),430);
			}
		}
		else
		{
		for (i = 0; i<2; i++) {
			draw_sprite(partner_button_sprites[global.Party][i],0,32+(154*i),430);
			}
		}
	}

//Draw KROMER for chapter 2 fihgt
if (global.Chapter == 1) {
	draw_set_font(font_battle);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	if (global.Enemy_ID == 3) {
		draw_text(5,5,"KARMA: " + string(soul_attack_script_index));
		}
		else
		{
		draw_text(5,5,"KROMER: " + string(round(soul_kromer_hud)));
		}
	}

draw_set_color(c_black);
draw_set_alpha(fade);
if (dead) {
	draw_set_alpha(1);
	}
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);
draw_set_color(c_white);

if (!hide_soul) {
	draw_self();
	draw_sprite_ext(spr_SoulGraze,0,x,y,image_xscale,image_yscale,image_angle,make_color_rgb(255,((global.Graze/10)*255),((global.Graze/10)*255)),global.Graze/10);
	draw_sprite_ext(spr_Soul_Hitbox,0,x,y,image_xscale,image_yscale,image_angle,c_white,slowdown/10);
	}
	
draw_set_alpha(whitefade);
draw_rectangle(0,0,room_width,room_height,false);

if (battle_end) {
	draw_set_color(c_black);
	draw_set_alpha(battle_end_fade/2);
	draw_rectangle(0,220,room_width,260,false);
	draw_set_color(c_white);
	draw_set_font(font_battle);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_alpha(battle_end_fade);
	draw_text(320,240,battle_end_text)
	}

draw_set_alpha(1);

//DEBUG
if (debug_mode) {
	soul_kromer = 999;
	for (i=0;i<array_length(deal_table);i++) {
		draw_text(200,i*32,string(deal_table[i]));
		}
		draw_text(150,deal_index*32,">");
	}