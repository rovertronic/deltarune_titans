if (distance_to_object(obj_Human) < 25) && (global.Equipment == 0) && (state == 0) {
	global.CutsceneMode = true;
	audio_stop_sound(global.CurrentMusic);
	state = 1;
	timer = 0;
	global.Encounter = 20;
	}
	
if (state == 1) {
	timer ++;
	if (timer > 120) {
		image_index = 1;
		func_init_text(305);
		state = 2;
		}
	}
	
if (global.Current_Interacting_Object == id) {
	dialogid = 320;
	}