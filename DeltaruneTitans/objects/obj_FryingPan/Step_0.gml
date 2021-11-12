image_angle = lerp(image_angle,0,0.1);


if (timer%40==39) {
	image_angle = -30;
	for (i = 0; i < intense; i++) {
		object = instance_create_layer(x-50,y-40,"Bullet",obj_FryingPanFlame);
		}
	intense++;
	}
timer++;