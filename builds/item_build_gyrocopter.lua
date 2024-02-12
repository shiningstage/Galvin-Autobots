X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_maelstrom",
	"item_ultimate_scepter",
	"item_invis_sword",
	"item_black_king_bar",
	"item_satanic",
	
	"item_silver_edge",
	"item_ultimate_scepter_2",
	"item_butterfly",
	"item_mjollnir"
};			

X["builds"] = {
	{2,3,3,2,3,4,3,2,2,1,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7,1,3,6,8}, talents
);

return X