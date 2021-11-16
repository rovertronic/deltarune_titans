global.Button_Array = [
[1,0,1,1],
[1,0,0,0],
[1,0,0,0],
[1,0,1,1],
]
button = -1;
for (i=0;i<16;i++) {
	button = instance_create_layer(x+((i%4)*40),y+(floor(i/4)*40),"Instances_Below",obj_LastImpactPuzzleButton);
	button.button_x = i%4
	button.button_y = floor(i/4);
	button.isx = !global.Button_Array[button.button_y][button.button_x];
	
	if (func_room_solved()) {
		button.isx = 0;
		button.state = 3;
		button.image_index = 1;
		}
	}