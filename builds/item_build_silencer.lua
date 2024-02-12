X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_int",
	"item_hand_of_midas",
	"item_witch_blade",
	"item_invis_sword",
	"item_black_king_bar",
	"item_bloodthorn",
	"item_silver_edge",
	"item_parasma",
	"item_rod_of_atos",
	"item_gungir",
	"item_ultimate_scepter_2"
};			

X["builds"] = {
	{2,1,3,1,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8,2,4,6,7}, talents
);

return X