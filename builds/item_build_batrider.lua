X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = {
	"item_magic_wand",
	"item_boots",
	"item_hand_of_midas",
	"item_blink",
	"item_black_king_bar",
	"item_invis_sword",
	
	"item_shivas_guard",
	"item_ultimate_scepter_2",
	"item_silver_edge",
	"item_overwhelming_blink",
	"item_octarine_core"
};

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X