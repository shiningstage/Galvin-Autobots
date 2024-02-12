X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_dagon",
	"item_glimmer_cape",
	"item_dagon_5",
	"item_ultimate_scepter",
	
	"item_rod_of_atos",
	"item_heart",
	"item_ultimate_scepter_2",
	"item_sheepstick",
	"item_guardian_greaves",
	"item_gungir"
};			

X["builds"] = {
	{2,1,1,3,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,7,1,4,5,8}, talents
);

return X