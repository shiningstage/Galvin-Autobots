X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_vanguard",
	"item_blade_mail",
	"item_mekansm",
	"item_pipe",
	"item_ultimate_scepter",
	"item_guardian_graves",
	"item_crimson_guard",
	"item_heart",
	"item_ultimate_scepter_2",
	"item_shivas_guard"
};			

X["builds"] = {
	{1,3,1,3,1,4,1,3,3,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8,2,4,6,7}, talents
);

return X