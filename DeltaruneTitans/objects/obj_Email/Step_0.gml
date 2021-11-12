center_x += lengthdir_x(email_speed,center_direction);
center_y += lengthdir_y(email_speed,center_direction);
angle += 4;
x = center_x + lengthdir_x(offset,angle);
y = center_y + lengthdir_y(offset,angle);

offset = lerp(offset,offset_total,0.05);
	
timer ++;
if ((timer > 60)&&(notification>0)) {
	random_dir = 45+(email_id *90);
	random_email_speed = 4;
	for (i=0;i<4;i++) {
		object = instance_create_layer(x,y,"Bullet",obj_Email);
		object.angle = i*90;
		object.center_direction = angle;
		object.notification = notification-1;
		object.image_index = notification-1;
		object.email_speed = random_email_speed;
		object.email_id = i;
		image_xscale = 1+(notification/2);
		image_yscale = 1+(notification/2);
		if (notification == 1) {
			object.center_direction = angle;
			}
		}
	instance_destroy();
	}