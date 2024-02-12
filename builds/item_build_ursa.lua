X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_bfury",
	"item_blade_mail"
	"item_black_king_bar",
	"item_basher",
	"item_satanic",
	"item_abyssal_blade",
	
	"item_ultimate_scepter_2"
};			

X["builds"] = {
	{3,1,3,2,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8,2,4,5,7}, talents
);

return X