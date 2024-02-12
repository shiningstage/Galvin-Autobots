X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_str",
	"item_hand_of_midas",
	"item_black_king_bar",
	"item_ultimate_scepter",
	"item_blade_mail",
	
	"item_satanic",
	"item_ultimate_scepter_2",
	"item_assault",
	"item_sange",
	"item_sange_and_yasha"
};			

X["builds"] = {
	{1,3,2,2,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8,2,4,5,7}, talents
);

return X