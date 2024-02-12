X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_agi",
	"item_hand_of_midas",
	"item_diffusal_blade",
	"item_black_king_bar",
	"item_basher",
	"item_silver_edge",
	"item_abyssal_blade",
	"item_skadi",
	"item_ultimate_scepter_2",
	"item_disperser"
};			

X["builds"] = {
	{3,2,1,1,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8,2,4,6,7}, talents
);

return X