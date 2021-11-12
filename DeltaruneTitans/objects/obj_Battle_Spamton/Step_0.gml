switch(state) {
	case 0:
	image_index = 0;
	sintimer ++;
	x = lerp(x,home_x + sin(sintimer/20)*100,0.2);
	y = lerp(y,home_y,0.2);
	temp_x = x;
	
	if (global.Enemy_Attack == 1)||(global.Enemy_Attack == 2) {
		state = 3;
		}
	if (global.Enemy_Attack == 3) {
		state = 5;
		for (i=0;i<4;i++) {
			object = instance_create_layer(320,50,"Bullet",obj_Email);
			object.angle = i*90;
			object.email_id = i;
			}
		}

	if (obj_Soul.battle_transition) {
		state = 6;
		global.Enemy_Attack = 4;
		}
	
	i_index_float = lerp(i_index_float,0,0.1);
	image_index = round(i_index_float);
	break;
	case 1:
	state = 2;
	timer = 0;
	image_index = 8;
	
	break;
	case 2:
	x = temp_x + 10-irandom(20);
	y = home_y + 5-irandom(10);
	timer ++;
	if (timer > 30) {
		state = 0;
		}
	break;
	case 3://attack 1 init
		state = 4;
		timer = 0;
		grow = 0;
		image_index = 1;
	break;
	case 4://attack 1&2
		x = lerp(x,500,.2);
		y = lerp(y,240+(sin(sintimer/10)*80),.2);
		sintimer++;
		timer ++;
		if (timer%3==0)&&(timer > 7)&&(global.Enemy_Attack == 1) {
			object = instance_create_layer(x,y,"Bullet",obj_Evil_Letter);
			object.char = string_char_at(spit_text[spit_text_choice],spit_text_index);
			spit_text_index++;
			if (spit_text_index > string_length(spit_text[spit_text_choice])) {
				spit_text_index = 1;
				spit_text_choice = irandom(array_length(spit_text)-1);
				timer = 0;
				with(obj_Evil_Letter) {
					letgo = true;
					}
				}
			}
		if (timer % 5 == 0) && (global.Enemy_Attack == 2) {
			object = instance_create_layer(200,irandom_range(100,380),"Bullet",obj_Evil_Kromer);
			}
		
		if (global.Enemy_Attack == 0) {
			state = 0;
			spit_text_index = 1;
			image_index = 0;
			}
	
	i_index_float = lerp(i_index_float,7,0.1);
	image_index = round(i_index_float);
	break;
	case 6://clever?
		soul_attack_hide = false;
		image_index = 9;
		soul_attack ++;
		if ((soul_attack > 16)&&(soul_attack_index<6)) {
			soul_attack = 0;
			audio_play_sound(snd_Heal,0,0);
			color_r = soul_color_two[soul_attack_index][0];
			color_g = soul_color_two[soul_attack_index][1];
			color_b = soul_color_two[soul_attack_index][2];
			soul_attack_index ++;
			}
		if ((soul_attack_index==6)) {
			soul_attack = 0;
			soul_attack_hide = true;
			}
	
	case 5://other attack
		x = lerp(x,320,.2);
		y = lerp(y,120,.2);
		if (global.Enemy_Attack == 0) {
			state = 0;
			image_index = 0;
			}
	break;
	}

color_r = lerp(color_r,255,.2);
color_g = lerp(color_g,255,.2);
color_b = lerp(color_b,255,.2);

image_blend = make_color_rgb(color_r,color_g,color_b);

if (obj_Soul.dead) {
	state = 99;
	}