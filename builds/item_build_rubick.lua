X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_orchid",
	"item_ultimate_scepter",
	"item_dagon",
	"item_glimmer_cape",
	"item_heart",
	"item_guardian_greaves",
	"item_bloodthorn",
	"item_dagon_5",
	"item_ultimate_scepter_2",
	"item_sheepstick"
};			

X["builds"] = {
	{1,2,2,3,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8,1,4,6,7}, talents
);

return X