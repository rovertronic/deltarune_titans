// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_setstar(star_to_set){
	ini_open("Deltarune_Titans_Save.ini");
	current_star = global.star_table[global.Chapter][star_to_set];
	current_general = global.star_table[global.Chapter][3];
	new_star = 1+global.NoHitRun;
	
	if (new_star > current_star) {
		ini_write_real(string(global.Chapter),string(star_to_set),new_star);
		}
	if (new_star > current_general) {
		ini_write_real(string(global.Chapter),string(3),new_star);
		}
	ini_close();
}