soul=obj_Soul;
if place_meeting(x,y,soul) && (soul.cooldown == 0) && (!soul.player_move)
    {
    soul.cooldown = 40;
	global.DissalowGraze = 40;
    global.HP -= hazard_damage;
    audio_play_sound(snd_Hurt,1,0);
    global.NoHitRun = false;
    }
soul.mask_index = spr_SoulGraze;
if (place_meeting(x,y,soul))&&(graze_cooldown < 1)&&(global.DissalowGraze < 1) && (!soul.player_move) {
	global.Graze = 10;
	graze_cooldown = hazard_graze_cooldown;
	soul.enemy_attack_time -= 5;
	soul.tp_reserve += .25;
	audio_play_sound(snd_Graze,0,false);
	}
soul.mask_index = spr_Soul_Hitbox;
	
if (graze_cooldown > 0) {
	graze_cooldown--;
	}
	
if (soul.player_move) {
	exist = 0;
	}
	
if (soul.dead) {
	instance_destroy();
	}
	
image_alpha = lerp(image_alpha,exist,0.2);
if (image_alpha < .1) {
	instance_destroy();
	}