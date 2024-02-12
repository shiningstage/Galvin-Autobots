X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_boots",
	"item_maelstrom",
	"item_invis_sword",
	"item_travel_boots",
	"item_gungir",
	"item_silver_edge",
	"item_black_king_bar",
	
	"item_satanic",
	"item_sheepstick",
	"item_travel_boots_2"
};			

X["builds"] = {
	{2,3,3,1,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,7,2,4,5,8}, talents
);

return X