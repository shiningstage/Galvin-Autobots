X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_hand_of_midas",
	"item_tiara_of_selemene",
	"item_shivas_guard",
	"item_eternal_shroud",
	"item_black_king_bar",
	"item_octarine_core",
	
	"item_ultimate_scepter_2",
	"item_heart",
	"item_travel_boots_2"
};			

X["builds"] = {
	{1,3,3,1,3,4,3,1,1,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7,1,3,5,8}, talents
);

return X