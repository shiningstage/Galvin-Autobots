X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_orchid",
	"item_lesser_crit",
	"item_ultimate_scepter",
	"item_black_king_bar",
	"item_dagon",
	"item_bloodthorn",
	"item_greater_crit",
	"item_dagon_5",
	"item_ultimate_scepter_2",
	"item_heart"
};			

X["builds"] = {
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7,1,3,6,8}, talents
);

return X