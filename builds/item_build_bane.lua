X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_arcane_boots",
	"item_aether_lens",
	"item_force_staff",
	"item_glimmer_cape",
	"item_meteor_hammer",
	"item_ultimate_scepter_2",
	"item_sheepstick",
	"item_guardian_greaves",
	"item_hurricane_pike"
};

X["builds"] = {
	{3,2,2,1,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8,1,4,6,7}, talents
);

return X