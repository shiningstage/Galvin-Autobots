X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_agi",
	"item_diffusal_blade",
	"item_black_king_bar",
	"item_heart",
	"item_assault",
	"item_disperser",
	"item_ultimate_scepter_2",
	"item_butterfly"
};			

X["builds"] = {
	{1,2,2,1,1,4,1,3,3,3,4,3,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8,2,3,5,7}, talents
);
return X