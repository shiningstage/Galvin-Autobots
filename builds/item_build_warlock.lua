X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_hand_of_midas",
	"item_glimmer_cape",
	"item_ultimate_scepter",
	"item_orchid",
	"item_refresher",
	"item_ultimate_scepter_2",
	"item_sheepstick",
	"item_bloodthorn",
	"item_octarine_core"
};			

X["builds"] = {
	{2,1,2,1,1,4,1,2,2,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7,2,4,6,8}, talents
);


return X