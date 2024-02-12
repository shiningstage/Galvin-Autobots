X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_hand_of_midas",
	"item_radiance",
	"item_basher",
	"item_black_king_bar",
	"item_assault",
	"item_abyssal_blade",
	"item_travel_boots_2",
	"item_ultimate_scepter_2",
	"item_silver_edge"
};			

X["builds"] = {
	{2,3,1,3,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,8,1,3,5,7}, talents
);

return X