X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_glimmer_cape",
	"item_ultimate_scepter",
	"item_orchid",
	"item_refresher",
	"item_dagon",
	"item_ultimate_scepter_2",
	"item_octarine_core",
	"item_bloodthorn",
	"item_dagon_5",
	"item_guardian_greaves"
};			

X["builds"] = {
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8,1,3,6,7}, talents
);

return X