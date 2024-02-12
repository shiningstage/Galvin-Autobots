X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_int",
	"item_manta",
	"item_butterfly",
	"item_skadi",
	"item_diffusal_blade",
	
	"item_ultimate_scepter_2",
	"item_greater_crit",
	"item_disperser"
};			

X["builds"] = {
	{2,3,2,3,2,4,2,3,3,1,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8,2,3,5,7}, talents
);

return X