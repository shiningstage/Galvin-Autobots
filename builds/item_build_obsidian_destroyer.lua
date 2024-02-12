X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",	
	"item_power_treads_int",
	"item_hand_of_midas",
	"item_witch_blade",
	"item_invis_sword",
	"item_dragon_lance",
	"item_black_king_bar",
	"item_parasma",
	"item_hurricane_pike",
	"item_sheepstick",
	"item_ultimate_scepter_2"
};			

X["builds"] = {
	{2,1,3,2,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7,1,3,6,8}, talents
);

return X