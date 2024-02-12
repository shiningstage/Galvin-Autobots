X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = {
	"item_magic_wand",
	"item_arcane_boots",
	"item_vanguard",
	"item_pipe",
	"item_crimson_guard",
	"item_guardian_greaves",
	"item_shivas_guard",
	"item_lotus_orb",
	"item_heart",
	"item_ultimate_scepter_2"
};	

X["builds"] = {
	{1,3,1,3,1,4,1,2,2,2,4,2,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7,1,3,5,8}, talents
);

return X