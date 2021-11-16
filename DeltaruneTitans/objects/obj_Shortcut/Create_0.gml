event_inherited();
room_setparty = true;

uni1 = shader_get_uniform(shade_portal,"time");
timer = 0;
dialogid = 41;

if (global.star_table[global.Chapter][3] == 0) {
    instance_destroy();
    }