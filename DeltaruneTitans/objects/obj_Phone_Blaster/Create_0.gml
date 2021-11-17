event_inherited();
image_xscale = 1;
image_yscale = 1;
hazard_damage = 10;
hazard_graze_cooldown = 60;
image_alpha = 1;
offset = 500;
state = 0;
target_x = obj_Soul.x;
target_y = obj_Soul.y;
aim_angle = irandom(359);
image_angle = irandom(359);
timer = 0;
offset_target = irandom_range(100,180);
object = -1;
go_away_speed = 0;

audio_play_sound(snd_blaster1,0,0);