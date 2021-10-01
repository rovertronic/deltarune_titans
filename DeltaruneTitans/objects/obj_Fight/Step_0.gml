if cool > 0
    {
    cool -= 1;
    }
if sfight == 0
    {
    image_index = place_meeting(x,y,obj_Soul);
    }
    else
    {
    if place_meeting(x,y,obj_Soul)
        {
        image_index = 1;
        }
        else
        {
        image_index = 2;
        }
    }

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

if place_meeting(x,y,obj_Soul) and icheck and cool == 0
    {
    instance_destroy(obj_Act);
    audio_play_sound(snd_Attack,1,0);
    instance_create(0,0,obj_Strike);
    if sfight == 0
        {
        obj_Control.mpque += 3;
        instance_destroy();
        }
        else
        {
        global.Super = true;
        cool = 6;
        if global.HP < 50
            {
            if irandom(2) == 0
                {
                global.HP += 1;
                }
            }
        if shake == 0
            {
            global.MP = 0;
            shake = 1;
            }
        }
    }
if shake == 1
    {
    timer += 1;
    x = 718+irandom(4);
    y = 588+irandom(4);
    }
    
if timer > 119
    {
    global.Super = false;
    instance_destroy();
    }

