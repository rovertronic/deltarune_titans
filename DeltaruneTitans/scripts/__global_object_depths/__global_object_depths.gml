function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = -50; // obj_Control
	global.__objectDepths[1] = 0; // obj_HazardPar
	global.__objectDepths[2] = 0; // obj_HardHazard
	global.__objectDepths[3] = 0; // obj_Bells
	global.__objectDepths[4] = 20; // obj_Soul
	global.__objectDepths[5] = 1; // obj_Face
	global.__objectDepths[6] = 2; // obj_Mouth
	global.__objectDepths[7] = 25; // obj_Throat
	global.__objectDepths[8] = 2; // obj_Ears
	global.__objectDepths[9] = 21; // obj_Hands
	global.__objectDepths[10] = 24; // obj_Sequins
	global.__objectDepths[11] = 23; // obj_Muscle
	global.__objectDepths[12] = -1; // obj_Number
	global.__objectDepths[13] = 21; // obj_Fight
	global.__objectDepths[14] = 21; // obj_Act
	global.__objectDepths[15] = 0; // obj_Strike
	global.__objectDepths[16] = 50; // obj_RainbowCircle
	global.__objectDepths[17] = 0; // obj_BossHP
	global.__objectDepths[18] = 0; // obj_Start
	global.__objectDepths[19] = 0; // obj_GameOver
	global.__objectDepths[20] = 26; // obj_Spindle
	global.__objectDepths[21] = 0; // obj_Duck
	global.__objectDepths[22] = 0; // obj_GiantKnife
	global.__objectDepths[23] = 0; // obj_Clover
	global.__objectDepths[24] = 0; // obj_CloverBomb
	global.__objectDepths[25] = 0; // obj_AiSoul
	global.__objectDepths[26] = 0; // obj_Human
	global.__objectDepths[27] = 1; // obj_Container
	global.__objectDepths[28] = 0; // obj_Jevil
	global.__objectDepths[29] = 0; // obj_JevilText
	global.__objectDepths[30] = 0; // obj_JText2
	global.__objectDepths[31] = 0; // obj_JevilText3
	global.__objectDepths[32] = -60; // obj_CharaText
	global.__objectDepths[33] = 0; // obj_FirstTV
	global.__objectDepths[34] = 0; // obj_Jumpscare
	global.__objectDepths[35] = 0; // obj_DeltaTale
	global.__objectDepths[36] = 0; // obj_Bell
	global.__objectDepths[37] = 0; // obj_Knife
	global.__objectDepths[38] = 5; // obj_ScaryFace
	global.__objectDepths[39] = -10; // obj_InGameTv
	global.__objectDepths[40] = -9; // obj_SoulWarning
	global.__objectDepths[41] = 0; // obj_MiniKnife
	global.__objectDepths[42] = 0; // obj_CardMaze
	global.__objectDepths[43] = 0; // obj_End
	global.__objectDepths[44] = 0; // obj_StarMan
	global.__objectDepths[45] = -1; // obj_Boom


	global.__objectNames[0] = "obj_Control";
	global.__objectNames[1] = "obj_HazardPar";
	global.__objectNames[2] = "obj_HardHazard";
	global.__objectNames[3] = "obj_Bells";
	global.__objectNames[4] = "obj_Soul";
	global.__objectNames[5] = "obj_Face";
	global.__objectNames[6] = "obj_Mouth";
	global.__objectNames[7] = "obj_Throat";
	global.__objectNames[8] = "obj_Ears";
	global.__objectNames[9] = "obj_Hands";
	global.__objectNames[10] = "obj_Sequins";
	global.__objectNames[11] = "obj_Muscle";
	global.__objectNames[12] = "obj_Number";
	global.__objectNames[13] = "obj_Fight";
	global.__objectNames[14] = "obj_Act";
	global.__objectNames[15] = "obj_Strike";
	global.__objectNames[16] = "obj_RainbowCircle";
	global.__objectNames[17] = "obj_BossHP";
	global.__objectNames[18] = "obj_Start";
	global.__objectNames[19] = "obj_GameOver";
	global.__objectNames[20] = "obj_Spindle";
	global.__objectNames[21] = "obj_Duck";
	global.__objectNames[22] = "obj_GiantKnife";
	global.__objectNames[23] = "obj_Clover";
	global.__objectNames[24] = "obj_CloverBomb";
	global.__objectNames[25] = "obj_AiSoul";
	global.__objectNames[26] = "obj_Human";
	global.__objectNames[27] = "obj_Container";
	global.__objectNames[28] = "obj_Jevil";
	global.__objectNames[29] = "obj_JevilText";
	global.__objectNames[30] = "obj_JText2";
	global.__objectNames[31] = "obj_JevilText3";
	global.__objectNames[32] = "obj_CharaText";
	global.__objectNames[33] = "obj_FirstTV";
	global.__objectNames[34] = "obj_Jumpscare";
	global.__objectNames[35] = "obj_DeltaTale";
	global.__objectNames[36] = "obj_Bell";
	global.__objectNames[37] = "obj_Knife";
	global.__objectNames[38] = "obj_ScaryFace";
	global.__objectNames[39] = "obj_InGameTv";
	global.__objectNames[40] = "obj_SoulWarning";
	global.__objectNames[41] = "obj_MiniKnife";
	global.__objectNames[42] = "obj_CardMaze";
	global.__objectNames[43] = "obj_End";
	global.__objectNames[44] = "obj_StarMan";
	global.__objectNames[45] = "obj_Boom";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
