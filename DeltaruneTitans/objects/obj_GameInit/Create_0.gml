global.TextIndex = 0;

//Text voices: 1: Jevil 2: Spamton 3: Default

//[Voice,Continue,Fun Value, String]
global.TextTable = [
	[0,true,0,"Tee hee, Tee hee!"], //0
	[0,true,0,"Soon, no one will be free!"], //1
	[0,true,0,"Why I'm here, I don't know."], //2
	[0,true,0,"I was in my little freedom..."], //3
	[0,true,0,"...Sleeping low."], //4
	[0,true,0,"Suddenly, I was no longer there."], //5
	[0,true,0,"In a world, where freedom\neverywhere!"], //6
	[0,true,0,"No one is trapped, no one is\nstuck."], //7
	[0,true,0,"Everything is about Luck, Luck,\nLuck!"], //8
	[0,true,0,"But lo, you've come in time!"], //9
	[0,true,0,"In time to see my little project!"], //10
	[0,true,0,"I was and will be the only free\none!"], //11
	[0,true,0,"Nobody will stop me!"], //12
	[0,true,0,"What's this? It's finally\ntaking form!"], //13
	[0,true,0,"Prepare, lightner."], //14
	[0,false,1,"This will be your final norm!"], //15
	
    [0,true,0,"Coming back for more fun?"], //16
    [0,true,0,"Hip-hip-hooray!"], //17
    [0,true,0,"Why waste time talking?!"], //18
    [0,false,1,"LET'S GET REVOLVING!"], //19
	
    [0,true,0,"I can't do anything..."], //20
    [0,true,0,"I'm in a f***ing wheelchair..."], //21
    [0,true,0,"I got Hepatitis C"], //22
    [0,true,0,"I can't bounce around"], //23
    [0,true,0,"and do my magic"], //24
    [0,true,0,"or even make jokes"], //25
    [0,true,0,"or I can't even turn into\nthe devilsknife!"], //26
    [0,true,0,"My life is misery, misery,"], //27
    [0,true,0,"My life is pointless, pointless!"], //28
    [0,true,0,"But on the bright side, at least\nI got this wheelchair!"], //29
    [0,false,1,"Aaaand the wheel's broken"], //30 //Fun Value 1 = Teleport to Omega Jevil
	
	[2,false,0,"I'm sleeping because...\n...I'm sleepy. I don't like being\ndisturbed. Please walk quietly."], //31
	[2,true,0,"Hello, I am a starrite.\nWe light up when a new branch of\nthe spacetime continuum is formed."], //32
	[2,false,0,"Each one of us represents a\npossible different branch."], //33
	[2,false,0,"Hey, hey, hey!\nNo hit champ! Congratulations on\ncompleting this timeline without\ntaking a single point of damage!"], //34
	
	[2,false,0,"* RUINS VOID RIFT\nKeep shadow portals within these\nwalls at all costs!"], //35
	
	[2,true,0,"* (You tried to call on the\ncell phone.)"], //36
	[2,false,8,"* It's nothing but garbage noise."], //37 //Fun Value 8 is Garbage Noise.
	
	[3,true,0,"I'm a bit worried right now..."], //38
	[3,true,0,"I'm lost in the woods, and I\ncan't stop thinking about this\ncreepy puppet! I can't get it\nout of my mind..."], //39
	[3,false,9,"Name's Snowkid, by the way.\nSince we're both lost, let's \nstick together, sound good?"], //40 //Fun Value 9 snowkid joins party
	
	[2,true,0,"* The shadow portal fills you\nwith terror and dread."], //41
	[2,false,0,"* You may return from the\nin-between once you complete\nyour assignment."], //42
	
	[2,true,0,"* PUZZLE GUIDE\nThe brown walls can be pushed.\nWater is dangerous, but can be\ncleared out using brown walls."], //43
	[2,true,0,"* The green arrows will force\nanything in the direction it faces."], //44
	[2,false,0,"* Good luck with this puzzle!"], //45
	
	[3,true,0,"...I just remembered! I can\nfreeze water all around me!"], //46
	[3,true,0,"Now we can use this to freeze\nthe lake and get across!"], //47
	[3,false,0,"...Why you giving me that nasty\nlook?"], //48
    ];

title_timer = 0;
title_state = 0;
title_y = 0;
title_grav = 0;
title_fade_amount = 1;
title_fade_io = false;