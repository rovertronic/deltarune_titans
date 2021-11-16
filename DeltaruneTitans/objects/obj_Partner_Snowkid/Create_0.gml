image_speed = 0;
in_party = false;
timer = 0;

home_x = x;
home_y = y;

old_x = x;
old_y = y;
shift = 0;

if ((room == rm_OW2_sub2)&&(!func_room_solved())) {
	alarm_set(0,40);
	}