X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_hand_of_midas",
	"item_shivas_guard",
	"item_pipe",
	"item_ultimate_scepter",
	
	"item_black_king_bar",
	"item_guardian_greaves",
	"item_ultimate_scepter_2",
	"item_sheepstick",
	"item_dagon_5"
};

X["builds"] = {
	{2,3,2,1,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8,2,4,6,7}, talents
);

return X