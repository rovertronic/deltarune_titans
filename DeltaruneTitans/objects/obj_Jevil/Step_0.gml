timer ++;
y = oHomeY + (sin(timer/10) * 3);


if y > oy+10
    {
    flip = 1;
    }
if y < oy
    {
    flip = 0;
    }

if distance_to_object(obj_Human) < 30 and stop == 0
    {
    stop = 1;
	func_init_text(jevil_text_path[global.star_table[0][3]]);
	
    if (global.star_table[0][3] == 2) {
        audio_stop_sound(mus_prejevil);
        }
    }
    
if (global.star_table[0][3] == 2)
    {
    sprite_index = spr_SadJevil;
    }

