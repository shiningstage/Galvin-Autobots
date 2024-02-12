X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_boots",
	"item_hand_of_midas",
	"item_travel_boots",
	"item_black_king_bar",
	"item_orchid",
	"item_octarine_core",
	
	"item_sheepstick",
	"item_bloodthorn",
	"item_ultimate_scepter_2",
	"item_shivas_guard"
};			

X["builds"] = {
	{2,1,2,1,2,1,2,1,2,3,3,3,3,3,3,3,2,2,1,1,1}
}

X["skills"] = IBUtil.GetBuildPattern(
	"invoker", 
	IBUtil.GetRandomBuild(X['builds']), skills, 
	{2,4,5,8,1,3,6,7}, talents
);

return X