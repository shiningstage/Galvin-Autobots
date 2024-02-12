X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

X["items"] = {
	"item_magic_wand",
	"item_arcane_boots",
	"item_hand_of_midas",
	"item_ultimate_scepter",
	"item_black_king_bar",
	
	"item_blink",
	"item_shivas_guard",
	"item_ultimate_scepter_2",
	"item_dagon_5",
	"item_octarine_core",
	"item_overwhelming_blink"
};

X["builds"] = {
	{1,2,1,2,1,4,1,2,2,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8,2,4,5,7}, talents
);

return X