// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_set_mini_star(star_to_set){
	ini_open("Deltarune_Titans_Save.ini");
	if (star_to_set != 0) {
		ini_write_real(string(global.Chapter)+"mini",string(star_to_set),1);
		}
	ini_close();
}