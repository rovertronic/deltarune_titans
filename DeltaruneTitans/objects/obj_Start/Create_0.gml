surface_resize(application_surface, 640, 360);

audio_stop_all();

e = 0;
i = 0;
i2 = 0;
ix = 0;
iy = 0;

transition_io = true;
transition_fade = 1;
transition_room = noone;

scroll_vertical = 0;
scroll_horizontal = 0;

chapter_unlocks = 1; //including 0 (6 max)
chapter_total = 7; //not including 0 lmao
chapter_spacing = 54;

selectcolor = c_white;

chapter_scroll_value = 0;
chapter_scroll_table = [0,0,0,1,2,2,2,2];

chapter_rooms = [
rm_OW1,
rm_OW2_sub2,
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
snd_Circus,
mus_Spamton_Intro,
]

chapter_text = [
"Omega Jevil",
"Sigma Spamton",
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

options_text = [
["Fullscreen","Windowed"],["Keyboard","Mouse","Controller"],["Credits"],["Delete Save","Are you sure?","Are you DOUBLE sure???","Save Deleted."],["Exit"]
]
options_value = [0,0,0,0,0];
options_spacing = room_width/(array_length(options_value)+1);

global.Chapter = 0;

global.Party = 1; //1 = snowkid
global.StartX = 0;
global.StartY = 0;
global.StartMatter = false;

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



//init save variables
global.Gamepad = 3;

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

//save
ini_open("Deltarune_Titans_Save.ini");
for (iy = 0; iy < 10; iy ++) {
	for (ix = 0; ix < 4; ix ++) {
		global.star_table[iy][ix] = ini_read_real(string(iy),string(ix),0);
		global.Stars += global.star_table[iy][ix];
		if ((ix == 3)&&(global.star_table[iy][3])) {
			global.chapters_played[iy] = true;
			}
		}
	}
ini_close();

