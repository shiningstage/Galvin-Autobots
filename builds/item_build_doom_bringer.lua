X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_hand_of_midas",
	"item_ring_of_tarrasque",
	"item_blink",
	"item_black_king_bar",
	"item_shivas_guard",
	"item_heart",
	
	"item_ultimate_scepter_2",
	"item_radiance",
	"item_overwhelming_blink",
	"item_silver_edge"
};	

X["builds"] = {
	{1,2,2,3,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7,1,4,6,8}, talents
);

return X