X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_boots",
	"item_mekansm",
	"item_vladmir",
	"item_holy_locket",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_heart",
	"item_ultimate_scepter_2",
	"item_pipe"
};			

X["builds"] = {
	{1,3,3,1,3,4,3,1,1,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8,1,4,6,7}, talents
);

return X