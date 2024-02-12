X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_int",
	"item_hand_of_midas",
	"item_invis_sword",
	"item_ultimate_scepter",
	"item_orchid",
	"item_black_king_bar",
	"item_silver_edge",
	"item_bloodthorn",
	"item_ultimate_scepter_2",
	"item_assault",
	"item_satanic"
};			

X["builds"] = {
	{1,2,3,1,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7,1,4,6,8}, talents
);

return X