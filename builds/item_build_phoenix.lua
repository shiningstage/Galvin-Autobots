X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_boots_of_bearing",
	"item_ring_of_tarrasque",
	"item_shivas_guard",
	"item_refresher",
	"item_ultimate_scepter",
	
	"item_sheepstick",
	"item_heart",
	"item_ultimate_scepter_2",
	"item_silver_edge"
};			

X["builds"] = {
	{1,2,2,3,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7,2,4,6,8}, talents
);

return X