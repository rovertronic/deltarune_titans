image_speed = 0;
solid_object = -1;
if (func_room_solved()) {
	image_index = 1;
	}
	else
	{
	solid_object = instance_create(x,y,obj_Solid);
	}