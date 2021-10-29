if (global.Current_Interacting_Object == id) {
	u8 = true;
	}
	else
	{
	if (u8) {
		u8 = false;
		interacts++;
		if (interacts > 3) {
			interacts = 3;
			}
		dialogid = dialoglist[interacts];
		}
	}