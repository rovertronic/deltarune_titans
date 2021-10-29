// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_inv_additem(itemid) {
	for (i=0;i<8;i++) {
		if (global.Inventory[i] == 0) {
			global.Inventory[i] = itemid;
			return;
			}
		}
	}