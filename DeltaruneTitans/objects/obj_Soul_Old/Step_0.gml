centerx = window_get_width()/2;
centery = window_get_height()/2;
window_mouse_set(centerx,centery);

if keyboard_check_pressed(vk_escape)
    {
    room_goto(rm_Start);
    }
	
slowdown_input = false;
sped = 12-slowdown;
if (global.State < 3) {
    if global.Gamepad == 0
        {
        speedx = window_mouse_get_x()-centerx;
        speedy = window_mouse_get_y()-centery;
		
        if mouse_check_button(mb_right)
            {
            slowdown_input = true;
            }
        }
    if global.Gamepad == 1
        {
        haxis = gamepad_axis_value(0, gp_axislh);
        vaxis = gamepad_axis_value(0, gp_axislv);
		
        if gamepad_button_check(0,gp_face3)
            {
            slowdown_input = true;
            }

        }
    if global.Gamepad == 3
        {
        haxis = 0;
        vaxis = 0;
        if keyboard_check(vk_up)
            {
            vaxis = -1;
            }
        if keyboard_check(vk_down)
            {
            vaxis = 1;
            }
        if keyboard_check(vk_left)
            {
            haxis = -1;
            }
        if keyboard_check(vk_right)
            {
            haxis = 1;
            }

        if keyboard_check(ord("X"))
            {
            slowdown_input = true;
            }
        }
    }
    else
    {//soul is frozen, cannot move
    speedx = 0;
    speedy = 0;
    }

if slowdown_input {
	slowdown ++;
	}
	else
	{
	slowdown --;
	}
slowdown = clamp(slowdown,0,10);

if (global.Gamepad != 0) {
	speedx = round(haxis*sped);
	speedy = round(vaxis*sped);
	}

if abs(speedx) > 10
    {
    speedx = sign(speedx)*10
    }
if abs(speedy) > 10
    {
    speedy = sign(speedy)*10
    }
x += speedx;
y += speedy;

window_set_size(room_width,room_height);

if x < 8
    {
    x = 8;
    }
if x > room_width-8
    {
    x = room_width-8;
    }
if y < 8
    {
    y = 8;
    }
if y > room_height-8
    {
    y = room_height-8;
    }
if cooldown > 0
    {
    cooldown -= 1;
    }
    
if (global.Graze > 0) {
	global.Graze --;
	}
if (global.DissalowGraze > 0) {
	global.DissalowGraze --;
	}

