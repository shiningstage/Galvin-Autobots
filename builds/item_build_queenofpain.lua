X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_str",
	"item_hand_of_midas",
	"item_witch_blade",
	"item_black_king_bar",
	"item_orchid",
	
	"item_sphere",
	"item_ultimate_scepter_2",
	"item_bloodthorn",
	"item_parasma",
	"item_sheepstick"
};			

X["builds"] = {
	{3,2,1,1,3,4,3,3,2,2,4,2,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7,2,3,6,8}, talents
);

return X