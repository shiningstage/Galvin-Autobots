X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_tranquil_boots",
	"item_hand_of_midas",
	"item_blink",
	"item_ultimate_scepter",
	"item_boots_of_bearing",
	"item_invis_sword",
	"item_dagon_5",
	"item_ultimate_scepter_2",
	"item_bloodstone",
	"item_octarine_core"
};			

X["builds"] = {
	{1,3,3,2,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8,2,3,6,7}, talents
);

return X