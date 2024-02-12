X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

--[[ NOT SURE IF STILL AN ISSUE: warning if meepo does not have an item other than 
brown boots / power treads at any time he will think he 
is a clone and skill/item decisions will possilby break! ]]

X["items"] = { 
	"item_power_treads",
	"item_diffusal_blade",
	"item_blink",
	"item_skadi",
	"item_sheepstick",
	"item_butterfly",
	"item_swift_blink",
	"item_disperser"
};			

X["builds"] = {
	{1,3,2,4,3,2,2,2,3,4,3,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "meepo", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8,1,4,6,7}, talents
);

return X