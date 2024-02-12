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
	"item_invis_sword",
	"item_ultimate_scepter",
	
	"item_gungir",
	"item_black_king_bar",
	"item_silver_edge",
	"item_ultimate_scepter_2",
	"item_sheepstick",
	"item_guardian_greaves"
};			

X["builds"] = {
	{2,3,1,1,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7,2,4,6,8}, talents
);

return X