X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_soul_ring",
	"item_travel_boots",
	"item_aether_lens",
	"item_orchid",
	"item_invis_sword",
	"item_dagon_5",
	"item_bloodthorn",
	"item_ethereal_blade",
	"item_ultimate_scepter_2",
	"item_travel_boots_2"
};			

X["builds"] = {
	{1,2,1,2,1,2,1,2,4,3,3,4,3,3,4},
	{1,2,1,3,3,3,4,3,2,2,2,4,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8,2,3,6,7}, talents
);

return X