if (func_room_solved()) {
	with(obj_Water) {
		instance_create_layer(x,y,"Instances_puzzle",obj_OpenTile);
		instance_destroy();
		}
	}