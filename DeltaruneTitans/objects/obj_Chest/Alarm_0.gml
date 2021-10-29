ini_open("Deltarune_Titans_Save.ini");
if (ini_read_real("Inventory",string(itemid),0) != 0) {
	open = true;
	image_index = 1;
	}
ini_close();