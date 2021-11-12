switch(state) {
	case 0:
		obj_Soul.menu_state = 9;
	case 2:
		sprite_index = spr_SigmaSpamton_Idle;
		state = 1;
	break;
	case 3:
		sprite_index = spr_SigmaSpamton_Hurt;
		state = 2;
		image_speed = 1;
	break;
	}