X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = {
	"item_magic_wand",
	"item_boots",
	"item_hand_of_midas",
	"item_radiance",
	"item_travel_boots",
	
	"item_black_king_bar",
	"item_heart",
	"item_assault"
}; 

X["builds"] = {
	{1,2,3,3,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8,2,3,6,7}, talents
);

return X