switch(obj_Battle_SigmaSpamton.state) {
	case 1:
		target_y = obj_Battle_SigmaSpamton.y-140+(sin((sintimer/7)+(hand_id*pi))*40);
		x = lerp(x,target_x,.1);
		y = lerp(y,target_y,.1);
	break;
	case 4:
		fake_image_speed = 0;
		target_y = obj_Battle_SigmaSpamton.y;
		x = lerp(x,target_x,.1);
		y = lerp(y,target_y,.1);
	break;
	case 6:
		target_y = obj_Battle_SigmaSpamton.y-140;
		x = lerp(x,target_x,.1);
		y = lerp(y,target_y,.1);
	break;
	}

image_index += fake_image_speed;
if (image_index == 13) {
	fake_image_speed = -1;
	}
if (image_index == 0) {
	fake_image_speed = 1;
	}

sintimer ++;
timer ++;