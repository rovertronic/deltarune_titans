global.TextTable[120][3] = "* This pillar requires the power\n  of " + string(starpower) + " stars to be moved.\n* You currently have " + string(global.Stars) + "."; //120
image_alpha = 1;
if (global.Stars >= starpower) {
	instance_destroy();
	}