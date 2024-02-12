X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_hand_of_midas",
	"item_rod_of_atos",
	"item_maelstrom",
	"item_ultimate_scepter",
	"item_invis_sword",
	"item_gungir",
	"item_orchid",
	"item_ultimate_scepter_2",
	"item_dragon_lance",
	"item_guardian_greaves",
	"item_bloodthorn",
	"item_silver_edge",
	"item_hurricane_pike",
	"item_heart"
};	

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8,1,3,6,7}, talents
);

return X