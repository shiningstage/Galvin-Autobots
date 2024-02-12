X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_str",
	"item_hand_of_midas",
	"item_dragon_lance",
	"item_witch_blade",
	"item_orchid",
	"item_moon_shard",
	"item_moon_shard",
	"item_hurricane_pike",
	"item_bloodthorn",
	"item_parasma",
	"item_sheepstick",
	"item_ultimate_scepter_2"
};			

X["builds"] = {
	{1,3,1,3,1,4,1,2,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7,1,4,6,8}, talents
);

return X