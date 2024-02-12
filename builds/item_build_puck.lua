X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_str",
	"item_witch_blade",
	"item_invis_sword",
	"item_ultimate_scepter",
	
	"item_sphere",
	"item_octarine_core",
	"item_parasma",
	"item_silver_edge",
	"item_ultimate_scepter_2",
	"item_heart"
};			

X["builds"] = {
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7,2,3,6,8}, talents
);

return X