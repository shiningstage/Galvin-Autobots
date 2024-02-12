X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_hand_of_midas",
	"item_maelstrom",
	"item_invis_sword",
	"item_shivas_guard",
	"item_black_king_bar",
	"item_silver_edge",
	"item_gungir",
	"item_ultimate_scepter_2",
	
	"item_sphere"
};			

X["builds"] = {
	{3,2,3,1,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,7,2,4,5,8}, talents
);

return X