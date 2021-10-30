surface_resize(application_surface, 640, 360);

audio_sound_pitch(mus_prejevil,1);

audio_stop_all();

surf = -1;

room_center_x = room_width/2;

e = 0;
i = 0;
i2 = 0;
ix = 0;
iy = 0;

gamepad_temporary = global.Gamepad;

submenu_width = 0;
submenu_height = 0;
submenu_open = false;
submenu_open_full = false;

transition_io = true;
transition_fade = 1;
transition_room = noone;

scroll_vertical = 0;
scroll_horizontal = 0;
scroll_submenu = 0;
submenu_type = 0;

chapter_unlocks = 1; //including 0 (6 max)
chapter_total = 7; //not including 0 lmao
chapter_spacing = 54;

selectcolor = c_white;

chapter_scroll_value = 0;
chapter_scroll_table = [0,0,0,1,2,2,2,2];

chapter_rooms = [
rm_OW1,
rm_OW2,
rm_OW1,
rm_OW1,
rm_OW1,
rm_OW1,
rm_OW1,
rm_OW1,
rm_OW1,
rm_OW1,
];

chapter_musics = [
mus_prejevil,
mus_Wind,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0
]

chapter_text = [
"Omega Jevil",
"Spamton Sigma",
"Chapter 3 Secret Boss",
"Chapter 4 Secret Boss",
"Chapter 5 Secret Boss",
"Chapter 6 Secret Boss",
"Chapter 7 Secret Boss",
"Chapter 8 Secret Boss",
"Chapter 9 Secret Boss",
"Chapter 10 Secret Boss"
];
//i heard somewhere there might be 10 chapters LOL

chapter_descriptions = [
"Your Undertale run is a typical experience until you get past Toriel in the ruins. Before you exit, a dark shadowy portal absorbs you.",
"After you defeated Omega Jevil, the first titan, you finally proceed through Snowdin. However, after your encounter with Papyrus, another portal absorbs you.",
"...",
"...",
"...",
"...",
"...",
"...",
"...",
"..."
];

runs_text = [
"Pacifist","Neutral","Soulcrusher","Back"
];

start_lvs = [
[1,1,1],
[1,2,4],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1]
]

options_text = [
["Fullscreen","Windowed"],["Keyboard","Mouse","Controller"],["Delete Save","Are you sure?","Are you DOUBLE sure???","Save Deleted."],["Normal Retry","Quick Retry","No-Hit Retry"],["Music ON","Music OFF"],["Exit"]
]
options_value = [window_get_fullscreen(),0,0,global.RetryMode,!global.MusicOn,0];
switch(global.Gamepad) {
	case 0:
	options_value[1] = 1;
	break;
	case 1:
	options_value[1] = 2;
	break;
	}
menu_text = [
"Character","Credits","Options","Exit"
]
//options_spacing = room_height/(array_length(options_value)+1);
menu_spacing = room_width/(array_length(menu_text)+1);

upgrade_text = ["+5 HP","+1 ATK","+2 DEF","+10 HP","+Overworld SPD","+2 ATK","+2x TP Gain","+Double Dip"];
upgrade_stars = [2,3,4,6,7,9,11,13];
global.UpgradeLevel = 0;

//
global.Current_Interacting_Object = -1;
//

global.Chapter = 0;

global.Party = 0; //1 = snowkid
global.StartX = 0;
global.StartY = 0;
global.StartMatter = false;
global.StartMusic = -1;
global.CurrentMusic = -1;

global.NoHitRun = true;

global.Soul_X = 0;
global.Soul_Y = 0;

for (i=0;i<30;i++) {
	global.Room_Solved[i] = false;
	}

global.LV = 1;
global.MaxHP = 20;

global.XP_Table = [
0,10,20,40,50,80,100,200,300,400,500,800,1000,1500,2000,
3000,5000,10000,25000,49999,0
];

global.Party_Names = [
"",
" & Snowkid",
]
//
global.Deaths = 0;
global.SavedSouls = 0;

global.Run = 0; //0 = pacifist, 1=neutral, 2=genocide


//init save variables
global.chapters_played = [false,false,false,false,false,false,false,false,false,false];
global.Stars = 0;
global.star_table = [
//the fourth "star" is just the highest star you've ever gotten anywhere
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
];

global.Inventory = [0,0,0,0,0,0,0,0];

runs_unlocked = [
[0,1,0],
[0,0,0],
[0,0,0],
[0,0,0],
[0,0,0],
[0,0,0],
[0,0,0],
[0,0,0],
[0,0,0],
[0,0,0]
]

//load
ini_open("Deltarune_Titans_Save.ini");

for (iy = 0; iy < 10; iy ++) {
	for (ix = 0; ix < 4; ix ++) {
		global.star_table[iy][ix] = ini_read_real(string(iy),string(ix),0);
		if ((iy != 0)&&(ix != 3)) {
			runs_unlocked[iy][ix] = global.star_table[iy-1][ix];
			}
		if (ix != 3) {//the secret 4th star doesn't count
			global.Stars += global.star_table[iy][ix];
			}
		if ((ix == 3)&&(global.star_table[iy][3])) {
			global.chapters_played[iy] = true;
			}
		}
	}

//inventory
for (i=0;i<8;i++) {
	if (ini_read_real("Inventory",string(i+1),false) != false) {
		global.Inventory[i] = i+1;
		}
	}
	func_inv_sort();
	
	//i wanted to use my add item function but gamemaker is fucking high
	// i had to write a fucking sorting algorithm!!!
	// 
ini_close();

global.UpgradeHP = 0;
global.UpgradeDF = 0;
global.UpgradeATK = 0;
global.UpgradeOWSP = 0;
global.UpgradeTP = 1;

//upgrades
for (i=0;i<array_length(upgrade_stars);i++) {
	if (global.Stars >= upgrade_stars[i]) {
		global.UpgradeLevel++;
		switch(i) {
			case 0:
			global.UpgradeHP+=5;
			break;
			case 1:
			global.UpgradeATK++;
			break;
			case 2:
			global.UpgradeDF+=2;
			break;
			case 3:
			global.UpgradeHP+=10;
			break;
			case 4:
			global.UpgradeOWSP+=1;
			break;
			case 5:
			global.UpgradeATK+=2;
			break;
			case 6:
			global.UpgradeTP+=1;
			break;
			}
		}
	}

global.SafeInventory = global.Inventory;

