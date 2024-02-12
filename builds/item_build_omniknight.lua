X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_hand_of_midas",
	"item_echo_sabre",
	"item_invis_sword",
	"item_black_king_bar",
	
	"item_silver_edge",
	"item_heart",
	"item_ultimate_scepter_2",
	"item_harpoon",
	"item_shivas_guard"
};			

X["builds"] = {
	{3,1,3,1,3,4,1,1,3,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8,1,4,5,7}, talents
);

return X