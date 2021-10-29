// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function func_inv_sort(){
	pass = false;
	while(!pass) {//if array is not in order loop
		foundzero = false;
		pass = true;
		tempslot = 0;
		//check if array is in order
		for (i=0;i<8;i++) {
			if (global.Inventory[i] == 0) {
				foundzero = true;
				}
				else
				{//found item
				if (foundzero == true) {
					pass = false;
					tempslot = global.Inventory[i];
					global.Inventory[i] = 0;
					global.Inventory[i-1] = tempslot;
					}
				}
			}
		
		
		}
	}