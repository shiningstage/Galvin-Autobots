X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_diffusal_blade",
	"item_maelstrom",
	"item_ultimate_scepter",
	"item_black_king_bar",
	"item_basher",
	"item_abyssal_blade",
	"item_ultimate_scepter_2",
	"item_rod_of_atos",
	"item_gungir",
	"item_heart",
	"item_disperser",
	"item_guardian_greaves"
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