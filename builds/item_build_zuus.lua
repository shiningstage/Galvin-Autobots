X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_phylactery",
	"item_aether_lens",
	"item_ultimate_scepter",
	"item_invis_sword",
	"item_octarine_core",
	"item_ultimate_scepter_2",
	"item_refresher",
	"item_ethereal_blade",
	"item_silver_edge",
	"item_angels_demise",
	"item_guardian_greaves"
};			

X["builds"] = {
	{2,1,2,1,2,4,2,1,1,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8,1,4,6,7}, talents
);

return X