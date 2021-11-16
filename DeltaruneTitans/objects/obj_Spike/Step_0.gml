if (solid_object) {
	if (func_room_solved()) {
		image_index = 1;
		instance_destroy(solid_object);
		}
	}