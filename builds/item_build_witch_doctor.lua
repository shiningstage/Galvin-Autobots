X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_solar_crest",
	"item_glimmer_cape",
	"item_ultimate_scepter",
	"item_black_king_bar",
	"item_sheepstick",
	"item_ultimate_scepter_2",
	"item_sphere",
	"item_guardian_greaves"
};			

X["builds"] = {
	{1,2,3,3,1,4,3,3,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8,2,4,5,7}, talents
);

return X