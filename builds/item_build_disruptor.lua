X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_hand_of_midas",
	"item_force_staff",
	"item_glimmer_cape",
	"item_ultimate_scepter",
	
	"item_heart",
	"item_guardian_greaves",
	"item_ultimate_scepter_2",
	"item_octarine_core",
	"item_sheepstick"
};		

X["builds"] = {
	{1,2,2,3,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8,2,3,6,7}, talents
); 

return X