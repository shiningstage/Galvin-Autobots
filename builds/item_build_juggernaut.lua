X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_phase_boots",
	"item_maelstrom",
	"item_bfury",
	"item_ultimate_scepter",
	"item_mjollnir",
	
	"item_abyssal_blade",
	"item_butterfly",
	"item_ultimate_scepter_2",
	"item_satanic"
};			

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7,2,3,6,8}, talents
);

return X