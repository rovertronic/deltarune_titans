global.TextIndex = 0;
global.Gamepad = 3;
global.RetryMode = 0;
global.MusicOn = true;

//Text voices: 0: Jevil; 1: Spamton; 2: Default; 3: Snowkid; 4: Battle Letterbox

//[Voice,Continue,Fun Value, String]
global.TextTable = [
	[0,true,0,"* Tee hee, Tee hee!"], //0
	[0,true,0,"* Soon, no one will be free!"], //1
	[0,true,0,"* Why I'm here, I don't know."], //2
	[0,true,0,"* I was in my little freedom..."], //3
	[0,true,0,"* ...Sleeping low."], //4
	[0,true,0,"* Suddenly, I was no longer there."], //5
	[0,true,0,"* In a world, where freedom\n  everywhere!"], //6
	[0,true,0,"* No one is trapped, no one is\n  stuck."], //7
	[0,true,0,"* Everything is about Luck, Luck,\n  Luck!"], //8
	[0,true,0,"* But lo, you've come in time!"], //9
	[0,true,0,"* In time to see my little\n  project!"], //10
	[0,true,0,"* I was and will be the only free\n  one!"], //11
	[0,true,0,"* Nobody will stop me!"], //12
	[0,true,0,"* What's this? It's finally\n  taking form!"], //13
	[0,true,0,"* Prepare, lightner."], //14
	[0,false,1,"* This will be your final norm!"], //15
	
    [0,true,0,"* Coming back for more fun?"], //16
    [0,true,0,"* Hip-hip-hooray!"], //17
    [0,true,0,"* Why waste time talking?!"], //18
    [0,false,1,"* LET'S GET REVOLVING!"], //19
	
    [0,true,0,"* I can't do anything..."], //20
    [0,true,0,"* I'm in a f***ing wheelchair..."], //21
    [0,true,0,"* I got Hepatitis C"], //22
    [0,true,0,"* I can't bounce around"], //23
    [0,true,0,"* and do my magic"], //24
    [0,true,0,"* or even make jokes"], //25
    [0,true,0,"* or I can't even turn into\n  the devilsknife!"], //26
    [0,true,0,"* My life is misery, misery,"], //27
    [0,true,0,"* My life is pointless, pointless!"], //28
    [0,true,0,"* But on the bright side, at least\n  I got this wheelchair!"], //29
    [0,false,1,"* Aaaand the wheel's broken"], //30 //Fun Value 1 = Teleport to Omega Jevil
	
	[2,false,0,"* I'm sleeping because...\n  ...I'm sleepy. I don't like\n  being disturbed. Please\n  walk quietly."], //31
	[2,true,0,"* Hello, I am a starrite.\n  We light up when a new branch\n  of the spacetime continuum is\n  formed."], //32
	[2,false,0,"* Each one of us represents a\n  possible different branch."], //33
	[2,false,0,"* Hey, hey, hey! No hit champ!\n* Congratulations on completing\n  this timeline without taking a\n  single point of damage!"], //34
	
	[2,false,0,"* RUINS VOID RIFT\n  This pocket dimension exists\n  in-between the event horizons\n  of two nearby realities."], //35
	
	[2,true,0,"* (You tried to call on the\n  cell phone.)"], //36
	[2,false,8,"* It's nothing but garbage noise."], //37 //Fun Value 8 is Garbage Noise.
	
	[3,true,0,"* I'm a bit worried right now..."], //38
	[3,true,0,"* I'm lost in the woods, and I\n  can't stop thinking about this\n  creepy puppet! I can't get it\n  out of my mind..."], //39
	[3,false,9,"* Name's Snowkid, by the way.\n  Since we're both lost, let's \n  stick together, sound good?"], //40 //Fun Value 9 snowkid joins party
	
	[2,true,0,"* The shadow portal fills you\n  with terror and dread."], //41
	[2,false,0,"* You may return from the\n  in-between once you complete\n  your assignment."], //42
	
	[2,true,0,"* PUZZLE GUIDE\n  The brown walls can be pushed.\n  Water is dangerous, but can be\n  cleared out using brown walls."], //43
	[2,true,0,"* The green arrows will force\n  anything in the direction it\n  faces."], //44
	[2,false,0,"* Good luck with this puzzle!"], //45
	
	[3,true,0,"* ...I just remembered! I can\n  freeze water all around me!"], //46
	[3,true,0,"* Now we can use this to freeze\n  the lake and get across!"], //47
	[3,false,0,"* ...Why you giving me that nasty\n  look?"], //48
	
	[2,true,0,"* (You kicked the dumpster, but\n  It didn't budge.)"], //49
	[2,false,0,"* Maybe there is another way to\n  get it open?"], //50
	
	[2,false,0,"* The dumpster is calling your\n  name, begging to be opened."], //51
	
	[2,false,0,"* The air rings with hints on\n  how to open the dumpster."], //52
	
	[1,false,0,"* USE YOUR [[Mobile Cellular\n  Device]] YOU [[Single-Celled\n  Organism]]!"], //53
	
	//Item Descriptions
	[2,false,0,"* Tensionbit\n  Raises TP by 32% in battle."], //54
	[2,false,0,"* Repel Gel\n  Makes your soul invulnerable for\n  two turns."], //55
	[2,false,0,"* Sea Tea\n  Restores 10 HP and ups SPEED.\n  Made from glowing marshwater."], //56
	[2,false,0,"* Golden Apple\n  Raises max HP by 10."], //57
	[2,false,0,"* Herb\n  Replenishes 50 HP."], //58
	[2,false,0,"* Regeneration Potion\n  Provides life regeneration.\n  Can't use items for 2 turns."], //59
	[2,false,0,"..."], //60
	[2,false,0,"..."], //61
	[2,false,0,"..."], //62
	[2,false,0,"..."], //63
	
	[2,true,0,"* The VOID does not follow the\n  conventional rules of time, nor\n  the rules of cause and effect."], //64
	[2,false,0,"* Therefore, items in your shadow\n  inventory persist after battles,\n  even if consumed."], //65
	
	//Item consumption text
	[4,false,0,"* Used Tensionbit\n* TP raised by 32%!"], //66
	[4,false,0,"* Used Repel Gel\n* Soul is invincible for\n  two turns."], //67
	[4,false,0,"* Used Sea Tea\n* Restored 10 HP!\n* SPEED increased!"], //68
	[4,false,0,"* Used Golden Apple\n* Max HP raised by 10!"], //69
	[4,false,0,"* Used Herb\n* Restored 50 HP!"], //70
	[4,false,0,"* Used Regeneration Potion!\n* Induced HP Regeneration.\n* Can't use items for 2 turns."], //71
	[4,false,0,"..."], //72
	[4,false,0,"..."], //73
	[4,false,0,"..."], //74
	[4,false,0,"..."], //75
	
	//Item Chest Text
	[2,false,0,"* Found Tensionbit!\n  Raises TP by 32% in battle."], //76
	[2,false,0,"* Found Repel Gel!\n  Makes your soul invulnerable for\n  two turns."], //77
	[2,false,0,"* Found Sea Tea!\n  Restores 10 HP and ups SPEED.\n  Made from glowing marshwater."], //78
	[2,false,0,"* Found Golden Apple!\n  Raises max HP by 10."], //79
	[2,false,0,"* Found Herb!\n  Replenishes 50 HP."], //80
	[2,false,0,"* Found Regeneration Potion!\n  Provides life regeneration.\n  Can't use items for 2 turns."], //81
	[2,false,0,"..."], //82
	[2,false,0,"..."], //83
	[2,false,0,"..."], //84
	[2,false,0,"..."], //85
	
	[2,false,0,"* Item already found."], //86
	
	[4,false,0,"* Your turn."], //87
	[3,false,0,"* My Turn!"], //88
	[4,false,0,"* Snowkid Defends.\n* TP Raised by 16%.\n* DF increased for this turn."], //89
	[4,false,0,"* You tried to use an item,\n  but you had potion sickness."], //90
	
	[4,false,0,"* SPAMTON 10 ATK 20 DEF\n* He wants to make a DEAL,\n  but don't give him your MONEY!"], //91
	[4,false,0,"* SPAMTON SIGMA 50 ATK 25 DEF\n* 2nd of the seven titans.\n* Infused with 6 stolen souls."], //92
	[4,true,0,"* SPAMTON OMEGA 99 ATK 99 DEF\n* Has figured out what's going\n  on. Wants to stop you."], //93
	[4,false,0,"* Keep cracking at those souls.\n* We need to release more\n  DETERMINATION."], //94
	[4,false,0,"* You sliced a wire!\n* A human soul was freed."], //95
	[4,false,0,"* You don't want to fight now.\n* It's best to wait it out."], //96
	
	[4,false,0,"* Smells like KROMER."], //97
	[4,false,0,"* CONGRULATIONS YOU ARE THE\n  100th VISITOR!!!\n  CLICK HERE TO [Die]"], //98
	[4,false,0,"* Spamton flashes an\n  award-losing smile."], //99
	[4,false,0,"* Great ENEMY! SUSCRIBE NOW!"], //100
	[4,false,0,"* Spamton mutters \"1997.\""], //101
	
	[4,false,0,"* You feel flies crawling all\n  over your skin."], //102
	[4,false,0,"* You feel flies crawling inside\n  your skin."], //103
	[4,false,0,"* You cough out a fly...\n  disgusting!"], //104
	[4,false,0,"* You accidentally swallow\n  a fly... gross!"], //105
	[4,false,0,"* You really hate flies."], //106
	[4,false,0,"* Smells like rotting wood."], //107
	[4,false,0,"* Spamton Sigma maniacally\n  cackles."], //108
	[4,false,0,"* Bed bugs, Lice, larvae."], //109
	[4,false,0,"* You scream in fear./w\n* You are really afraid\n  of heights."], //110
	[4,false,0,"* The falling never stops."], //111
	
	[4,false,0,"* Jevil prepares to absorb seven\n  human souls."], //112
	[4,false,0,"* Jevil prepares to embrace his\n  ultimate form."], //113
	[4,false,0,"* JEVIL 15 ATK 15 DEF\n* Finally given a taste of\n  true freedom."],//114
	
	[0,false,0,"HA, HA. LET'S MAKE THE DEVILS KNIFE."], //115
	[0,false,0,"IT IS NOW THE TIME TO EMBRACE TRUE FREEDOM"], //116
	[0,false,0,"CHAOS, CHAOS, CATCH ME IF YOU CAN!"], //117
	[0,false,0,"HEARTS, DIAMONDS, I CAN DO ANYTHING!"], //118
	
	[4,false,0,"* There's nowhere to run...\n  ...Except away from bullets!\n* SPEED increased for this turn!"], //119
	
	[2,false,0,"* This pillar requires the power\n  of x stars to be moved.\nYou currently have x."], //120
	
	[2,true,0,"* It's a corpse.\n* There's no life left in whatever\n  that thing is."], //121
	[2,false,0,"* You did what you needed to do.\n* Return to the shadow portal\n  and continue your journey."], //122
	
	[0,true,0,"* Well done, lightner."], //123
	[0,true,0,"* Despite being filled with\n  DETERMINATION, I still couldn't\n  defeat you."], //124
	[0,true,0,"* The entity that brought us here\n  tricked me and lied to me."], //125
	[0,true,0,"* No more silly games...\n  ...This is serious buisness."], //126
	[0,true,0,"* Keep saving those souls, kid.\n* Save as many as you can."], //127
	[0,true,0,"* Once you step out of that portal,\n  everything here, including me,\n  will cease to be."], //128
	[0,false,0,"* I'll be rooting for you from\n  the shadows, lightner."], //129
    ];

global.Item_Names = [
"---",
"Tensionbit",
"Repel Gel",
"Sea Tea",
"Golden Apple",
"Herb",
"Regen Potion"
];

title_timer = 0;
title_state = 0;
title_y = 0;
title_grav = 0;
title_fade_amount = 1;
title_fade_io = false;
title_skip = false;