X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_agi",
	"item_hand_of_midas",
	"item_manta",
	"item_angels_demise",
	"item_black_king_bar",
	"item_satanic",
	"item_butterfly"
};			

X["builds"] = {
	{3,2,1,2,3,1,1,1,4,2,2,4,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7,1,4,6,8}, talents
);

return X