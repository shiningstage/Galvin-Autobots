X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_hand_of_midas",
	"item_eternal_shroud",
	"item_bloodstone",
	"item_invis_sword",
	
	"item_black_king_bar",
	"item_guardian_greaves",
	"item_silver_edge",
	"item_shivas_guard"
};			

X["builds"] = {
	{3,1,3,1,3,4,3,2,2,2,4,2,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8,1,4,5,7}, talents
);

return X