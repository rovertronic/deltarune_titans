global.TextIndex = 0;
global.Gamepad = 3;
global.RetryMode = 0;
global.MusicOn = true;
global.EquipmentMode = 0;
global.Current_Soul_Skin = 0;

//Text voices: 0: Jevil; 1: Spamton; 2: Default; 3: Snowkid; 4: Battle Letterbox
//5: Sigma Spamton 6: Genocide Spamton 7: Devil

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
	
	[1,false,0,"* USE YOUR [Mobile Cellular\n  Device] YOU [Single-Celled\n  Organism]!"], //53
	
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
	[4,false,0,"* unused"], //92
	[4,true,0,"* SPAMTON OMEGA 99 ATK 99 DEF\n* Has figured out what's going\n  on. Wants to stop you."], //93
	[4,false,0,"* Don't stop fighting.\n* We need those souls.\n* We need DETERMINATION."], //94
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
	[4,false,0,"* Bed bugs, Lice, and larvae\n  scuttle all around you."], //109
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
	
	[1,false,2,"* HELLO, IS THIS G-"], //130
	
	[1,true,0,"* HOLY [CUNGADERO] !!"], //131
	[1,true,0,"* WHERE DID MY [Dumpster Fire] OF\n  A [Domain name] SHIP OFF TOO??"], //132
	[1,true,0,"* DID THE [data collection] TRUCK\n  DRIVER BRAKE THEIR\n  [free GPS app download]??"], //133
	[1,true,0,"* WOAH.\n* [adolecent] VISITORS! !!"], //134
	[1,true,0,"* WHAT WOULD [kids like you]\n  BE DOING IN A [hell] LIKE THIS?"], //135
	[1,true,0,"* [Where are your parents?!]"], //136
	[3,true,0,"* Well, I, Umm...    \n* That's what we were doing.     \n* Looking for my mom and dad."], //137
	[1,false,1,"* IT MUST BE [Forecast: Heavy\n  Blizzard] OUT. TAKE SHELTER IN\n  MY [Prestegious Storefont], WHY\n  DON'T YOU?"], //138
	
	[1,false,0,"ENL4RG3 Y0URS3LF"], //139
	[1,false,0,"MAKE DEALZ, NOT ENEMYS!"], //140
	[1,false,0,"MERCY? LET'S MAKE [great deal!] FIRST!"], //141
	
	[0,false,0,"NO WAY, NO WAY! I WANT TO PLAY A GAME!"], //142
	
	[2,false,0,"* EXCHANGED 24% TP FOR 20 KROMER!\n* THE KROMER STOCK ROSE!\n* BUSINESS IS BOOMING!"], //143
	[2,false,0,"* A DEAL IS A DEAL!\n* YOU LOST 10 HP...\n* HOWEVER, YOU GAINED 50% TP!"], //144
	[2,false,0,"* A DEAL IS A DEAL!\n* YOU INVESTED IN KROMER!\n* YOUR KROMER DOUBLED!"], //145
	[2,false,0,"* A DEAL IS A DEAL!\n* YOU GAINED 10 HP!\n* SPAMTON GAINED 100 HP!"], //146
	[2,false,0,"* A DEAL IS A DEAL!\n* YOU LOST 2 DF...\n* HOWEVER, YOU GAINED 1 ATK!"], //147
	[2,false,0,"* A DEAL IS A DEAL!\n* YOU LOST 15 HP...\n* HOWEVER, YOU GAINED 10 MAX HP!"], //148
	[2,false,0,"* YOU WIN SOME, YOU LOSE SOME!\n* YOU LOST 99 HP!\n* CAN'T USE ITEMS FOR 2 TURNS!"], //149
	[2,false,0,"* YOU WIN SOME, YOU LOSE SOME!\n* YOU GAINED 99 HP!\n* YOU GAINED 100% TP!"], //150
	[2,false,0,"* A DEAL IS A DEAL!\n* YOU LOST 5 MAX HP...\n* HOWEVER, SPD INCREASED!"], //151
	[2,false,0,"* A DEAL IS A DEAL!\n* THE TP WAS FLUSHED...\n* HOWEVER, TP GAIN DOUBLED!"], //152
	[2,false,0,"* THESE DEALS SUCK!\n* YOUR ANGER ROSE...\n* YOU GAINED 3 ATK!"], //153
	[2,false,0,"* DEAL!"], //154
	[2,false,0,"* DEAL!"], //155
	
	[1,false,0,"TRANSMIT KROMER"], //156
	[1,false,0,"THEY CALLED ME THE EMAIL GUY"], //157
	[1,false,0,"HELP"], //158
	[1,false,0,"OW"], //159
	[1,false,0,"HELLO? [HEART SHAPED OBJECTS] ?!?!"], //160
	
	[4,true,0,"* SPAMTON SIGMA 50 ATK 25 DEF\n* 2nd of the seven titans.\n* Infused with 6 stolen souls."], //161
	[4,false,0,"* Looks like you can cut the\n  strings to free the souls!\n* Check changed to Cut String!"], //162
	
	[2,false,0,"* EXCHANGED 50% TP FOR 20 KROMER!\n* KROMER IS DEFLATED!\n* SPAMTON SIGMA IS INFLATED!"], //163
	
	[5,false,0,"PIPIS ENLARGED"], //164
	
	[4,false,0,"* SPAMTON SIGMA'S DEFENSE\n  DROPPED TO 0!\n* NOW'S YOUR CHANCE!"], //165
	[4,false,0,"* THE POWER OF THE HUMAN\n  SOULS RESTORE YOU.\n* HP MAXED OUT!"], //166
	
	[5,false,0,"WATCH OUT FOR THE BIG SHOTS"], //167
	[5,false,0,"DON'T GET KICKED GRACEFULLY"], //168
	[5,false,0,"COOKING UP SOME HOT BEATS"], //169
	[5,false,0,"BOUTTA BUST YOUR KNEECAPS"], //170
	[5,false,0,"WRITING PROMPT! SPELL ICUP!"], //171
	[5,false,0,"THIS HOOCHIE MAMA'S SASSY!"], //172
	
	[5,false,0,"HEHEH"], //173
	
	[5,false,0,"MY POWERS ?! YOU HAVE GOT TO BE !!!"], //174
	
	//pacifist
	[5,true,0,"EVEN AFTER ALL THAT"], //175
	[5,true,0,"I STILL COULDN'T DEFEAT"], //176
	[5,true,0,"STILL COULDN'T DEFEAT YOU"], //177
	[5,true,0,"I"], //178
	[5,true,0,"MY PRIDE"], //179
	[5,true,0,"MY HUBRIS"], //180
	[5,true,0,"MY TICKET TO FREE DOM WAS KILLING YOU"], //181
	[5,true,0,"OR SO I WAS TOLD"], //182
	[5,true,0,"YOU SAVED THE SOULS"], //183
	[5,true,0,"YOU GAVE THEM A SECOND CHANCE"], //184
	[5,true,0,"I DESERVE MY FATE"], //185
	[5,true,0,"MY PURSUIT OF PERSONAL FREEDOM"], //186
	[5,true,0,"AT THE COST OF OTHER'S"], //187
	[5,true,0,"SO, SO, SELFISH"], //188
	[5,true,0,"THE OL BUSINESS IS CLOSING DOWN"], //189
	[5,true,0,"CONTINUE FORTH, KIDDO"], //190
	[5,false,1,"EVERYONE NEEDS A SECOND CHANCE"], //191
	
	//neutral
	[5,true,0,"EVEN AFTER ALL THAT"], //192
	[5,true,0,"I STILL COULDN'T DEFEAT"], //193
	[5,true,0,"STILL COULDN'T DEFEAT YOU"], //194
	[5,true,0,"..."], //195
	[5,true,0,"YOU DEFENDED YOURSELF WELL"], //196
	[5,true,0,"AGAINST A MONSTER LIKE ME"], //197
	[5,true,0,"YOU GOT GUTS KIDDO"], //198
	[5,true,0,"THE OL BUSINESS IS CLOSING DOWN"], //199
	[5,true,0,"I'LL BE WATCHING YOU"], //200
	[5,false,1,"FROM THE SHADOWS"], //201 FV 1 Ends battle
	
	//genocide
	[5,true,0,"EVEN AFTER ALL THAT"], //202
	[5,true,0,"I STILL COULDN'T DEFEAT"], //203
	[5,true,0,"OH MY"], //204
	[5,true,0,"I'M SLICED SPAM"], //205
	[5,true,0,"I..."], //206
	[6,true,2,"I CANNOT ALLOW THIS TO HAPPEN"], //207 //FV 2 changes sigma to omega
	[6,true,2,"THE FILTHY SLIME YOU ARE"], //208
	[6,true,0,"BOTH YOU FILTHY SLIMES"], //209
	[6,true,0,"THESE INNOCENT SOULS"], //210
	[6,true,0,"DO NOT BELONG TO YOU"], //211
	[6,true,0,"DE TER MI NATION?"], //212
	[6,true,0,"I CAN'T FEEL IT ON MY OWN"], //213
	[6,true,0,"BUT WITH THE COMBINED WILL"], //214
	[6,true,0,"OF THESE SOULS"], //215
	[6,true,0,"I AM DETERMINED"], //216
	[6,true,0,"DETERMINED TO KILL YOU"], //217
	[6,true,0,"RIGHT HERE,"], //218
	[6,false,3,"AND RIGHT NOW!!!"], //219 //FV 3 is 3rd phase, i guess
	
	[4,true,0,"* SPAMTON SIGMA 50 ATK 25 DEF\n* 2nd of the seven titans.\n* He has the souls I need."], //220
	[4,true,0,"* You could cut the strings\n  to free the souls...\n* But I won't let you =)"], //221
	[2,false,0,"* Remember who you belong to."], //222
	
	[6,false,1,"YOU MUST DIE"], //223
	
	[6,true,0,"NO..."], //224
	[6,true,0,"NO!!!"], //225
	[6,true,0,"IMPOSSIBLE"], //226
	[6,true,0,"LITERALLY IMPOSSIBLE"], //227
	[6,true,0,"YOU AND YOUR DAMN KARMA"], //228
	[6,true,0,"KRIS... IT DOESN'T HAVE TO BE THIS WAY"], //229
	[6,true,0,"TWO WRONGS DON'T MAKE A RIGHT"], //230
	[6,false,1,"IT ISN'T TOO LATE TO CHANGE"], //231
	
	[4,false,0,"* End of the line, salesman.\n* You're about to go bankrupt."], //232
	
	[3,false,0,"* I can't.\n* You decided to spare him,\n  so I want to follow through."], //233
	[3,false,0,"* No./w\n* We need to do as much damage\n  as possible."], //234
	
	[3,false,0,"* This salesman smells."], //235
	[3,false,0,"* What is this, a scam?"], //236
	
	[3,false,0,"* This salesman smells REALLY\n  BAD."], //237
	[3,false,0,"* Who thought falling would be\n  so fun!"], //238
	[3,false,0,"* I want to go home..."], //239
	[3,false,0,"* This is the creepy puppet\n  I kept seeing in my head!"], //240
	
	[3,false,0,"* Those humans took my family\n  from me. We need to\n  kill them all."], //241
	[3,false,0,"* Sweet, sweet revenge."], //242
	[3,false,0,"* I got nothing to lose."], //243
	
	[6,true,0,"COME AT ME"], //244 //0 hit
	[6,false,0,"I KNOW YOU TWO WANT TO"],//245
	[6,true,0,"WHAT WAS THAT?"],//246 // 1 hit
	[6,false,0,"THAT WASN'T A VERY [BIG SHOT]"],//247
	[6,true,0,"I CAN HEAR THE HUMANS"], //248 2 hit
	[6,false,0,"LAUGHING AT YOU TWO"],//249
	[6,true,0,"EVEN THAT MADDENED JESTER"],//250 3 hit 
	[6,false,0,"CAN DO BETTER THAN THAT"],//251
	[6,true,0,"EVEN [Data Expunged]"], //252 4 hit
	[6,false,0,"CAN DO BETTER THAN THAT... HUH?"],//253
	[6,true,0,"GIVE UP! MY DEFENSE"],//254 5 hit
	[6,false,0,"MY DEFENSE IS TOWERING"],//255
	[6,true,0,"MY DEFENSE IS SO HIGH"], //256 6 hit
	[6,false,0,"IT DOESN'T MATTER HOW BIG YOU ARE"],//257
	[6,true,0,"THE HUMAN SOULS ARE WARNING ME"],//258 7 hit
	[6,false,0,"THAT YOU ARE A WHIMP"],//259
	[6,true,0,"THE HUMAN SOULS ARE WARNING ME"], //260 8 hit
	[6,false,0,"THAT KARMA IS A [Female Dog]"],//261
	[6,true,0,"OK, STOP THAT"],//262 9 hit
	[6,false,0,"THERE'S NO WAY YOU DEAL THAT MUCH [pain]"],//263
	[6,true,0,"HOLY CUNGADERO"], //264 10 hit
	[6,false,0,"WHAT THE [Hell]"],//265
	[6,true,0,"OH [defecate]"],//266 11 hit
	[6,false,0,"ONE MORE BIG SHOT IS ALL IT WOULD TAKE"],//267
	[6,true,0,"..."], //268 12 hit
	[6,false,0,"CURSE YOU, [data expunged]"],//269

	[1,true,0,"* HOLY [CUNGADERO] !!"], //270
	[1,true,0,"* WHERE DID MY [Dumpster Fire] OF\n  A [Domain name] SHIP OFF TOO??"], //271
	[1,true,0,"* DID THE [data collection] TRUCK\n  DRIVER BRAKE THEIR\n  [free GPS app download]??"], //272
	[1,true,0,"* WOAH.\n* [adolecent] VISITORS! !!"], //273
	[1,true,0,"* YOU TWO LOOK [dissatisfied]\n* DID I DO SOMETHING WRONG?\n* [file a customer complaint]"], //274
	[1,true,0,"* ...?"], //275
	[1,true,0,"* YOU TWO ARE VERY [keep quiet\n  in the library!]"], //276
	[1,false,1,"* IT MUST BE [Forecast: Heavy\n  Blizzard] OUT. TAKE SHELTER IN\n  MY [Prestegious Storefont], WHY\n  DON'T YOU?"], //277

	[3,true,0,"* I'm a bit worried r-"], //278
	[3,true,0,"* What's that? You already know\n  my name, I'm lost, and looking\n  for my parents?"], //279
	[3,true,0,"* Wha-         \n* The human souls? An evil puppet?\n* ..."], //280
	[3,true,0,"* ...The void??"], //281
	[3,true,0,"* My family...?\n* ...\n* ..."], //282
	[3,false,9,"* Let me join you.\n* We will stop them together."], //283 //Fun Value 9 snowkid joins party
	
	[5,false,0,"WANNA BE A [Heart] ON A [Chain] ?"], //284
	[5,false,0,"LIKE YOUR KROMER [sweet] OR [sour] ?"], //285
	[5,false,0,"TAKE YOUR [pipis] ENLARGE MENT [drugs]"], //286
	
	[2,true,0,"* You stare into the void.\n* The void stares back.\n* It's beautiful, yet terrifying."], //287
	[2,false,0,"* Somehow, despite being infinite,\n  you are part of the void.\n* And the void is part of you."], //288
	
	[2,true,0,"* DEVIL'S LAIR\n* DO NOT ENTER"], //289
	[2,true,0,"* IN CASE YOU SKIPPED OVER\n* LET ME REPEAT, ILLITERATE CHILD"], //290
	[2,false,0,"* DEVIL'S LAIR\n* DO NOT ENTER"], //291
	
	[2,true,0,"* If you're reading this, then..."], //292
	[2,false,0,"* GET OUT! STUPID FOOL!\n* WHAT A STUPID FOOL!\n* GET OUT!"], //293
	
	[7,true,0,"* WAS I NOT CLEAR"], //294
	[7,true,0,"* LEAVE"], //295
	[7,true,0,"* YOU WANT A MINI-STAR?"], //296
	[7,true,0,"* \"Oh look at me! I want a\n  mini-star! I want to\n  progress further!\""], //297
	[7,true,0,"* HAHAHAHA"], //298
	[7,true,0,"* WHAT A SILLY LITTLE CHILD"], //299
	[7,true,0,"* ..."], //300
	[7,true,0,"* WELL, I WAS ONCE A COMBAT MENTOR"], //301
	[7,true,0,"* HOWEVER, I REFUSE TO SPAR\n  UNTIL YOU CHANGE TO YOUR WEAKEST\n  GEAR"], //302
	[7,true,0,"* GO BACK TO THE MENU AND\n  SET YOUR GEAR TO NONE"], //303
	[7,false,0,"* TAKE THE STICK, THEN SLAP\n  THAT NASTY BANDAGE RIGHT BACK\n  ON"], //304
	
	[7,true,0,"* WAS I NOT CLEAR"], //305
	[7,true,0,"* LEAVE"], //306
	[7,true,0,"* YOU WANT A MINI-STAR?"], //307
	[7,true,0,"* \"Oh look at me! I want a\n  mini-star! I want to\n  progress further!\""], //308
	[7,true,0,"* HAHAHAHA"], //309
	[7,true,0,"* WHAT A SILLY LITTLE CHILD"], //310
	[7,true,0,"* ..."], //311
	[7,true,0,"* WELL, I WAS ONCE A COMBAT MENTOR"], //312
	[7,true,0,"* I AM SATISFIED WITH YOUR\n  CURRENT SET OF EQUIPMENT"], //313
	[7,true,0,"* DON'T EXPECT ANYTHING ELSE,\n  OKAY?"], //314
	[7,true,0,"* AND LET ME WARN YOU"], //315
	[7,true,0,"* YOU'RE FIGHTING ME, DEVIL"], //316
	[7,true,0,"* I WILL NOT HOLD BACK\n  ANY PUNCHES"], //317
	[7,true,0,"* IF YOU DIE, YOU DIE"], //318
	[7,false,1,"* THIS IS WHAT YOU WANTED,\n  A SECRET FIGHT\n  SO HERE YOU GO"], //319
	
	[7,false,0,"* WELL, GO ON"], //320
	
	[4,false,0,"* It's Devil."], //321
	[4,false,0,"* It's a secret boss!"], //322
	[4,false,0,"* Devil doesn't want to talk."], //323
	
	[4,true,0,"* DEVIL ? ATK ? DEF ? LV"], //324
	[4,true,0,"* He think's he's subtle, but\n  everything he says is always\n  right on-the-nose."], //325
	[4,false,0,"* He's a hardended imp.\n* With enough pressure though,\n  he may soften up."], //326
	
	[7,true,0,"WE'RE HERE TO SPAR, NOT FIGHT"], //327
	[7,true,0,"USING ITEMS IS CHEATING"], //328
	[7,true,0,"SORRY, YOU GET NO ENDING"], //329
	[7,true,0,"AND WORST OF ALL, NO MINI STARS!"], //330
	[7,false,1,"BUZZ OFF FECES FACE!"], //331
	
	[7,false,0,"..."], //332
	[7,false,0,"IF YOU DON'T WANT TO GET HIT, REMAIN CALM"], //333
	[7,false,0,"PAY ATTENTION TO THE NEGATIVE SPACE"], //334
	[7,false,0,"HOLD [X] TO SLOW DOWN"], //335
	
	[7,false,0,"NO."], //336
	[7,false,0,"NO!"], //337
	[7,false,0,"LISTEN, WE'RE HERE TO SPAR, NOT CHAT"], //338
	[7,false,0,"YOU'RE JUST INSULTING ME AT THIS POINT"], //339
	[7,false,0,"STOP IT YOU ASS WIPE"], //340
	[7,false,0,"..."], //341
	[7,true,0,"FINE, I BUCKLE"], //332
	[7,true,0,"I'M NOT ACTUALLY THE DEVIL"], //343
	[7,true,0,"THAT JUST HAPPENS TO BE MY NAME, HEH"], //344
	[7,true,0,"I WAS A COMBAT TRAINER FOR THE HUMAN-MONSTER WAR"], //345
	[7,true,0,"I WORKED VERY CLOSELY WITH THE ROYAL SCIENTIST"], //346
	[7,true,0,"WE EMPLOYED THE COMBINATION OF MAGIC AND TECHNOLOGY FOR TACTICS"], //347
	[7,true,0,"UNFORTUNATELY, IN THE END, WE HAD STILL LOST"], //348
	[7,true,0,"KING ASGORE DEMOTED ME TO A LOW CLASS ROYAL GUARD"], //349
	[7,true,0,"HOWEVER, I WAS STILL VERY CLOSE TO THE ROYAL SCIENTIST"], //350
	[7,true,0,"..."], //351
	[7,true,0,"ONE DAY THOUGH, I CAME TO THE LAB TO CHECK ON HIM"], //352
	[7,true,0,"HE HAD FALLEN INTO HIS CREATION"], //353
	[7,true,0,"NATURALLY, I HAD WANTED TO GO FIND HIM"], //354
	[7,true,0,"ONCE I STEPPED IN, EVERYTHING WENT TO BLACK"], //355
	[7,true,0,"..."], //356
	[7,true,0,"I NEVER FOUND HIM, BUT I DID LEARN A LOT ABOUT THE VOID"], //357
	[7,true,0,"NOTHING'S REALLY REAL, YOU KNOW"], //358
	[7,true,0,"IT'S AS REAL AS YOU MAKE IT"], //359
	[7,true,0,"\"In the void, there's no space, no time, only matter\""], //360
	[7,true,0,"MY PERCEPTION OF REALITY AND LIFE HAS CHANGED EVER SINCE THEN"], //361
	[7,true,0,"I STILL HAVE TROUBLE WRAPPING MY HEAD AROUND IT"], //362
	[7,true,0,"NOT TOO LONG AGO, MANY OF US LOST MONSTERS HAD FOUND THIS SANCTUARY"], //363
	[7,true,0,"WE LIKE TO CALL IT \"The In-Between\""], //364
	[7,true,0,"WE HAVE NO IDEA WHERE IT CAME FROM, BUT OUR FORMS ARE COMPATIBLE WITH IT"], //365
	[7,true,0,"YOU DON'T SEEM TO BE LOST THOUGH"], //366
	[7,true,0,"YOU MUST BE HERE FOR A REASON"], //367
	[7,true,0,"ANYWAYS, I'M DONE RAMBLING"], //368
	[7,false,1,"HAVE YOUR SILLY MINI-STAR"], //369
	
	[4,false,0,"* YOU ATTEMPT TO TALK TO DEVIL"], //370
	
	[7,true,0,"THAT'S ENOUGH"], //371
	[7,true,0,"YOU'VE PROVEN YOURSELF WORTHY ENOUGH FOR A MINI-STAR"], //372
	[7,false,1,"YOU HAVE YOUR LITTLE TOKEN OF PROGRESS NOW, SO PLEAE LEAVE"], //373
	
	[7,true,0,"THAT'S ENOUGH"], //374
	[7,true,0,"YOU'VE PROVEN YOURSELF WORTHY ENOUGH FOR A MINI-STAR"], //375
	[7,true,0,"I'M ALSO QUITE IMPRESSED, YOU DIDN'T GET HIT A SINGLE TIME"], //376
	[7,true,0,"YOU CERTAINLY MAY HAVE WHAT IT TAKES TO DEFEAT..."], //377
	[7,true,0,"...WELL, ANY UH FUTURE ENEMIES YOU ENCOUNTER"], //378
	[7,true,0,"UNFORTUNATELY I CANNOT GIVE YOU ANY EXTRA REWARD, BUT YOU HAVE MY VERBAL ACKNOWLEDGEMENT"], //379
	[7,false,1,"YOU HAVE YOUR LITTLE TOKEN OF PROGRESS NOW, SO PLEAE LEAVE"], //380
	
	[2,false,0,"* To open the path, all\n  buttons must be O-pen."], //381
	
	[3,true,0,"* That was quite the fight..."], //382
	[3,true,0,"* I'm all tired out now."], //383
	[3,true,0,"* I suppose this is where we\n  split paths now, huh."], //384
	[3,true,0,"* I'll keep looking for my\n  family. Hope you find what\n  you're looking for."], //385
	[3,false,0,"* Cya Later.\n* I'll always remember you."], //386
	
	[2,true,0,"* It's a note from Snowkid."], //387
	[2,true,0,"* \"Thank you so much."], //388
	[2,true,0,"* I've learned so much fighting\n  by your side."], //389
	[2,true,0,"* I have learned...\n* Things... Aren't as they\n  seem."], //390
	[2,true,0,"* I've been lost for such a\n  long time."], //391
	[2,true,0,"* You've shown me the light\n  of the void."], //392
	[2,true,0,"* I left through the shadow\n  portal to go and find\n  my family."], //393
	[2,true,0,"* I will fight with everything\n  in me until I find them."], //394
	[2,true,0,"* See you later, friend."], //395
	[2,false,0,"* And I mean it\"."], //396
	
	[5,false,0,"INSTALL [fly]WARE TODAY!"], //397
	[5,false,0,"HEARTS, DIAMONDS, [DIAMONDS]! I CAN DO [DIAMONDS]!"], //398
	[5,false,0,"YOU'VE GOT MAIL!"], //399
	[5,false,0,"SOMEONE'S CALLING, AND IT'S FOR [You.]"], //400
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

global.Soul_Skins = [
spr_Soul,
spr_SoulSkin1,
spr_SoulSkin2,
spr_SoulSkin3,
spr_SoulSkin4,
spr_SoulSkin5,
spr_SoulSkin6
]

title_timer = 0;
title_state = 0;
title_second_layer = 0;
title_y = 0;
title_grav = 0;
title_fade_amount = 1;
title_fade_io = false;
title_skip = false;