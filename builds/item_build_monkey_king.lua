X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_agi",
	"item_echo_sabre",
	"item_invis_sword",
	"item_black_king_bar",
	"item_silver_edge",	
	"item_satanic",
	"item_abyssal_blade",
	"item_harpoon",
	"item_ultimate_scepter_2"
};			

X["builds"] = {
	{1,3,3,2,3,2,2,2,4,1,1,1,3,4,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,7,1,4,5,8}, talents
);

return X