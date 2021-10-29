if cool > 0
    {
    cool -= 1;
    }

image_index = place_meeting(x,y,obj_Soul_Old);

if global.Gamepad == false
    {
    icheck = mouse_check_button_pressed(mb_left);
    }
if global.Gamepad == 1
    {
    icheck = gamepad_button_check_pressed(0,gp_face1);
    }
if global.Gamepad == 3
    {
    icheck = keyboard_check_pressed(ord("Z"))
    }

if place_meeting(x,y,obj_Soul_Old) and icheck
    {
    global.MP = 0;
    global.State = 6;
    instance_create(0,1000,obj_SoulWarning);
    instance_destroy(obj_Fight);
    instance_destroy();
    }

