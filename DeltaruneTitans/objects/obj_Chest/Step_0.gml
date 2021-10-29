if (open == false) {
	dialogid = itemid + 75;
	}
	else
	{
	dialogid = 86;
	}
if (global.Current_Interacting_Object == id)&&(open==false) {
	dialogid = 86;
	open = true;
	image_index = 1;
	audio_play_sound(snd_bump,0,0);
	audio_play_sound(snd_Item,0,0);
	
	ini_open("Deltarune_Titans_Save.ini");
	ini_write_real("Inventory",string(itemid),1);
	ini_close();
	
	func_inv_additem(itemid);
	}