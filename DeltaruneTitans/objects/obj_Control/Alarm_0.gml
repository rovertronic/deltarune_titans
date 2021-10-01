alarm_set(0,300);

if global.State == 0 and instance_number(obj_Fight) == 0
    {
    instance_create(0,0,obj_Fight);
    }

