X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_maelstrom",
	"item_blade_mail",
	"item_black_king_bar",
	"item_basher",
	
	"item_butterfly",
	"item_mjollnir",
	"item_abyssal_blade"
};

X["builds"] = {
	{3,2,3,1,3,4,1,1,1,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7,2,4,6,8}, talents
);

return X