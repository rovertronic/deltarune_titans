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

credits_ypos = 0;
credits_scroll = 320;
credits_text = [
[c_white,"CREDITS"],
[c_aqua,"Press [DOWN] to speed up!"],
[c_white,""],
[c_red,"SPOILERS AHEAD!!"],
[c_white,""],
[c_white,"Undertale / Deltarune"],
[c_yellow,"Toby Fox"],
[c_white,""],
[c_lime,"Voices:"],
[c_white,""],
[c_white,"Omega Jevil"],
[c_yellow,"its cazsu"],
[c_white,""],
[c_lime,"Music:"],
[c_white,""],
[c_white,"The World Revolving"],
[c_white,"But it's Chaos"],
[c_yellow,"RoomTone"],
[c_white,""],
[c_white,"BIG SHOT but it sounds like"],
[c_white,"a chance to be a [[BIG SHOT]]"],
[c_yellow,"RoomTone"],
[c_white,""],
[c_white,"Deal Gone Wrong"],
[c_yellow,"RoomTone"],
[c_white,""],
[c_white,"The Circus"],
[c_yellow,"Toby Fox"],
[c_white,""],
[c_white,"DialTone"],
[c_yellow,"Toby Fox"],
[c_white,""],
[c_white,"Spamton"],
[c_yellow,"Toby Fox"],
[c_white,""],
[c_white,"Basement"],
[c_yellow,"Toby Fox"],
[c_white,""],
[c_white,"Nightmare Knight"],
[c_yellow,"Toby Fox"],
[c_white,""],
[c_lime,"Social Media:"],
[c_white,""],
[c_red,"YouTube"],
[c_white,"Youtube.com/c/Rovert_YT/"],
[c_white,""],
[c_aqua,"Twitter"],
[c_white,"@RRRovert"],
[c_white,""],
[c_green,"Gamejolt"],
[c_white,"Gamejolt.com/@Rovert"],
[c_white,""],
[c_gray,"Thank you so much"],
[c_gray,"for playing my fangame!"],

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
[1,3,8],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1],
[1,1,1]
]

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

chapter_atk_def_start = [
[0,0],
[3,3],
[5,7],
[0,0],
[0,0],
[0,0],
[0,0],
[0,0],
[0,0],
[0,0]
]

upgrade_text = ["Default","No Black Outline","Red Outline","Spade","Diamond","Clover","Spamton","hacker"];
upgrade_stars = [0,1,3,6,7,8,9,15];
global.UpgradeLevel = 0;

//
global.Current_Interacting_Object = -1;
//

global.Chapter = 0;
global.CutsceneMode = false;

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
global.Equipment = 0;

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
global.WorkSouls = 0;

global.Intensity = 0;

global.Encounter = 0;

global.FirstPipis = true;

global.Run = 0; //0 = pacifist, 1=neutral, 2=genocide


//init save variables
global.chapters_played = [false,false,false,false,false,false,false,false,false,false];
global.Stars = 0;

global.MiniStarTable = [0,0,0,0,0,0,0,0,0,0];
ministar_max = [4,9,1,1,1,1,1,1,1,1];

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

global.Best_Chapter = 0;

//load
ini_open("Deltarune_Titans_Save.ini");

//main stars

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
			global.Best_Chapter = iy;
			}
		}
	}


//mini stars
for (iy = 0; iy < 10; iy ++) {
	for (ix = 1; ix < ministar_max[iy]+1; ix ++) {
		global.MiniStarTable[iy] += ini_read_real(string(iy)+"mini",string(ix),0);
		}
	if (global.MiniStarTable[iy] == ministar_max[iy]) {
		global.Stars ++;
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
	
//settings
global.Current_Soul_Skin = ini_read_real("Settings","Skin",0);
global.MusicOn = ini_read_real("Settings","Music",1);
global.EquipmentMode = ini_read_real("Settings","Equipment",0);
	
ini_close();

options_text = [
["Fullscreen","Windowed"],["Keyboard","Mouse","Controller"],["Delete Save","Are you sure?","Are you DOUBLE sure???","Save Deleted."],["Normal Retry","Quick Retry","No-Hit Retry"],["Music ON","Music OFF"],["Use Best Equipment","Use Chapter Equipment","Use NO Equipment"],["Exit"]
]
options_value = [window_get_fullscreen(),0,0,global.RetryMode,!global.MusicOn,global.EquipmentMode,0];


global.UpgradeHP = 0;
global.UpgradeDF = 0;
global.UpgradeATK = 0;
global.UpgradeOWSP = 0;
global.UpgradeTP = 1;

//upgrades
for (i=0;i<array_length(upgrade_stars);i++) {
	if (global.Stars >= upgrade_stars[i]) {
		global.UpgradeLevel++;
		
		if (false) {
			switch(i) {//SCRAPPED, but i want to keep the code for soul skins
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
				global.UpgradeOWSP+=1;
				break;
				case 4:
				global.UpgradeHP+=5;
				break;
				case 5:
				global.UpgradeTP+=1;
				break;
				case 6:
				global.UpgradeATK+=2;
				break;
				}
			}
		}
	}

global.SafeInventory = global.Inventory;

//just to be safe : )
global.Button_Array = [
[1,0,1,1],
[1,0,0,0],
[1,0,0,0],
[1,0,1,1],
]

function save_settings() {
	ini_open("Deltarune_Titans_Save.ini");
		ini_write_real("Settings","Skin",global.Current_Soul_Skin);
		ini_write_real("Settings","Music",global.MusicOn);
		ini_write_real("Settings","Equipment",global.EquipmentMode);
	ini_close();
	}
