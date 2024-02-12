
X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_phase_boots",
	"item_cornucopia",
	"item_radiance",
	"item_black_king_bar",
	"item_assault",
	"item_basher",
	"item_bfury",
	"item_abyssal_blade"
};

X["builds"] = {
	{2,1,1,2,1,4,1,2,2,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8,1,3,6,7}, talents
);			

return X