// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_solve_room(){
	if (func_room_solved()) {
		return true;
		}
		else
		{
		switch(room) {
			case rm_OW2_sub1:
				if (instance_number(obj_Water) == 0) {
					return true;
					}
			break;
			}
		return false;
		}
	}