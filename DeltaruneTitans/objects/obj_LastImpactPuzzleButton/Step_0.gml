

isx = global.Button_Array[button_y][button_x];

if place_meeting(x,y,obj_Human) && state == 0 {
	state = 1;
	audio_play_sound(snd_noise,0,0);
	
	if (button_x != 0) {
		global.Button_Array[button_y][button_x-1] = !global.Button_Array[button_y][button_x-1];
		}
	if (button_x != 3) {
		global.Button_Array[button_y][button_x+1] = !global.Button_Array[button_y][button_x+1];
		}
	if (button_y != 0) {
		global.Button_Array[button_y-1][button_x] = !global.Button_Array[button_y-1][button_x];
		}
	if (button_y != 3) {
		global.Button_Array[button_y+1][button_x] = !global.Button_Array[button_y+1][button_x];
		}
		
	x_amount = 0;
	for (i=0;i<4;i++) {
		for (i2=0;i<4;i++) {
			x_amount += global.Button_Array[i][i2];
			}
		}
	if (x_amount == 0) {
		global.Room_Solved[room] = true;
		audio_play_sound(snd_Item,0,0);
		func_solve_room();
		}
	}
	
if !place_meeting(x,y,obj_Human) && state == 1 {
	state = 0;
	audio_play_sound(snd_noise,0,0);
	}
	
image_index = state+(isx*2);

if (func_room_solved()) {
	state = 3;
	image_index = 1;
	}