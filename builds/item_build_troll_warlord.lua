X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_bfury",
	"item_yasha",
	"item_black_king_bar",
	"item_sange_and_yasha",
	"item_basher",
	
	"item_satanic",
	"item_abyssal_blade",
	"item_ultimate_scepter_2"
};			

X["builds"] = {
	{2,1,3,2,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8,1,4,5,7}, talents
);

return X