X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_agi",
	"item_diffusal_blade",
	"item_manta",
	"item_heart",
	"item_butterfly",
	"item_bloodthorn",
	
	"item_disperser"
};			

X["builds"] = {
	{1,3,2,1,1,3,1,3,3,4,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,7,1,4,5,8}, talents
);

return X