switch(state) {
	case 0:
	image_index = 0;
	sintimer ++;
	x = home_x + sin(sintimer/20)*100;
	temp_x = x;
	
	if (global.Enemy_Attack == 1) {
		state = 3;
		}

	if (obj_Soul.battle_transition) {
		state = 5;
		global.Enemy_Attack = 4;
		
		for (i=0;i<soul_amount;i++) {
			object = instance_create_layer(1,1,"Bullet",obj_JevilSoul);
			object.angle = i*(360/soul_amount);
			object.image_blend = soul_colors[i];
			}
		}
	
	
	break;
	case 1:
	state = 2;
	timer = 0;
	image_index = 1;
	
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
	case 4://attack 1
		x = lerp(x,500,.2);
		y = lerp(y,240+(sin(timer/10)*80),.2);
		timer ++;
		if (timer%10) {
			object = instance_create_layer(x,y,"Bullet",obj_Evil_Letter);
			}
		
		if (global.Enemy_Attack == 0) {
			state = 0;
			image_index = 0;
			}
	break;
	case 5://other attack
		x = lerp(x,320,.2);
		y = lerp(y,120,.2);
		if (global.Enemy_Attack == 0) {
			state = 0;
			image_index = 0;
			}
	break;
	}

if (obj_Soul.dead) {
	state = 99;
	}