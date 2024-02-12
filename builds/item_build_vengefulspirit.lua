
X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_agi",
	"item_invis_sword",
	"item_orchid",
	"item_rod_of_atos",
	"item_aether_lens",
	"item_ultimate_scepter",
	
	"item_ultimate_scepter_2",
	"item_heart",
	"item_bloodthorn",
	"item_gungir",
	"item_silver_edge"
};			

X["builds"] = {
	{1,2,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8,2,3,5,7}, talents
);

return X