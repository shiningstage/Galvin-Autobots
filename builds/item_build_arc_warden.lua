X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_boots",
	"item_hand_of_midas",
	"item_maelstrom",
	"item_travel_boots",
	"item_invis_sword",
	"item_gungir",
	"item_black_king_bar",
	"item_bloodthorn",
	"item_silver_edge",
	"item_daedalus",
	"item_ultimate_scepter_2"
};

X["builds"] = {
	{3,1,3,1,3,4,3,1,1,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,8,1,3,5,7}, talents
);

return X