soul=obj_Soul_Old;
if place_meeting(x,y,soul) and global.State < 3 and soul.cooldown == 0
    {
    soul.cooldown = 2;
    global.HP -= hazard_damage;
    audio_play_sound(snd_Hurt,1,0);
    global.NoHitRun = false;
	global.DissalowGraze = 60;
	if (global.RetryMode==2) {
		global.HP = 0;
		}
    }
soul.mask_index = spr_SoulGraze;
if (place_meeting(x,y,soul))&&(graze_cooldown < 1)&&(global.DissalowGraze < 1) {
	global.Graze = 10;
	graze_cooldown = hazard_graze_cooldown;
	obj_Control.mpque += global.UpgradeTP;
	audio_play_sound(snd_Graze,0,false);
	}
soul.mask_index = spr_Soul_Hitbox;
	
if (graze_cooldown > 0) {
	graze_cooldown--;
	}
