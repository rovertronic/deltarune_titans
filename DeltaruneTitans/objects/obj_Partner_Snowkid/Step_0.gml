if (in_party) {
	bounce_index = (obj_Human.image_index%1)*2;
	x = global.Partner_Path[8][0];
	y = global.Partner_Path[8][1]-bounce_index;
	switch(global.Partner_Path[8][2]) {
		case 0:
		image_index = 0;
		image_xscale = 1;
		break;
		case 1:
		image_index = 1;
		image_xscale = 1;
		break;
		case 2:
		image_index = 1;
		image_xscale = -1;
		break;
		case 3:
		image_index = 2;
		image_xscale = 1;
		break;
		}
	if (y-4 < obj_Human.y) {
		layer = layer_get_id("Instances_Below");
		}	
		else
		{
		layer = layer_get_id("Instances_Above");
		}
	}
	else
	{
	x = lerp(x,global.Partner_Path[8][0],.2);
	y = lerp(y,global.Partner_Path[8][1],.2);
	if ((round(x) == round(global.Partner_Path[8][0]))&&(round(y) == round(global.Partner_Path[8][1])) || (timer > 30)) {
		in_party = true;
		}
	}
	
timer ++;