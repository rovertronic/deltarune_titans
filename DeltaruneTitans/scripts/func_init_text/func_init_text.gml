// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_init_text(global_text_id){
global.TextIndex = global_text_id;
obj_Human.text_display = "";
obj_Human.text_read = global.TextTable[global.TextIndex][3];
obj_Human.text_index = 0;
obj_Human.text_open = true;
obj_Human.text_voice = global.TextTable[global.TextIndex][0];
}