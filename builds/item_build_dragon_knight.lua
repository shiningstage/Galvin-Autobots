X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_str",
	"item_hand_of_midas",
	"item_invis_sword",
	"item_black_king_bar",
	"item_assault",
	"item_eternal_shroud",
	"item_silver_edge",
	"item_heart",
	"item_ultimate_scepter_2"
};	

X["builds"] = {
	{2,3,3,1,1,4,1,1,2,2,4,2,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8,2,3,6,7}, talents
);

return X