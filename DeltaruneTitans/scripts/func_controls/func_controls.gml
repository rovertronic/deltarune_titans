// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function axis() {
	uc = (axisy < -3);
	dc = (axisy > 3);
	lc = (axisx < -3);
	rc = (axisx > 3);
		
	if ((axisy == 0)&&(axisx==0)) {
		holding = false;
		}
		
	if (uc&&(!holding)) {
		holding = true;
		ucp = true;
		}
	if (dc&&(!holding)) {
		holding = true;
		dcp = true;
		}
	if (lc&&(!holding)) {
		holding = true;
		lcp = true;
		}
	if (rc&&(!holding)) {
		holding = true;
		rcp = true;
		}
	}

function func_controls(){
ucp = false;
dcp = false;
lcp = false;
rcp = false;

uc = false;
dc = false;
lc = false;
rc = false;

b1p = false; //Z
b2p = false; //X
b2 = false;
b3p = false; //C

axisx = 0;
axisy = 0;

if (!variable_instance_exists(id, "holding")) {
    holding = false;
}

switch(global.Gamepad) {
	case 0: //Mouse
		centerx = window_get_width()/2;
		centery = window_get_height()/2;

        axisx = window_mouse_get_x()-centerx;
        axisy = window_mouse_get_y()-centery;
		
		if (axisx != 0)||(axisy != 0) {
			window_mouse_set(centerx,centery);
			}
			
		axis();
		
		b1p = mouse_check_button_pressed(mb_left);
		b2 = mouse_check_button(mb_right);
		b2p = mouse_check_button_pressed(mb_right);
		b3p = mouse_check_button_pressed(mb_middle);
	break;
	case 3: //Keyboard
		ucp = keyboard_check_pressed(vk_up);
		dcp = keyboard_check_pressed(vk_down);
		lcp = keyboard_check_pressed(vk_left);
		rcp = keyboard_check_pressed(vk_right);

		uc = keyboard_check(vk_up);
		dc = keyboard_check(vk_down);
		lc = keyboard_check(vk_left);
		rc = keyboard_check(vk_right);

		b1p = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
		b2p = keyboard_check_pressed(ord("X"));
		b2 = keyboard_check(ord("X"));
		b3p = keyboard_check_pressed(ord("C"));
	break;
	case 1: //Controller
		axisx = gamepad_axis_value(0, gp_axislh)*6;
		axisy = gamepad_axis_value(0, gp_axislv)*6;
		
		axis();
	
		b1p = gamepad_button_check_pressed(0,gp_face1);
		b2p = gamepad_button_check_pressed(0,gp_face3);
		b2 = gamepad_button_check(0,gp_face3);
		b3p = gamepad_button_check_pressed(0,gp_face2);
	break;
	}
}