event_inherited();
image_xscale = .5;
image_yscale = .5;
hazard_damage = 15; //explode
hazard_graze_cooldown = 60;
sintimer = 0;

aim_angle = 0;
target_y = obj_Soul.y+irandom_range(-50,50);

describe = false;
if (global.FirstPipis) {
	global.FirstPipis = false;
	describe = true;
	}