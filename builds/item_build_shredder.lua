X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_arcane_boots",
	"item_blade_mail",
	"item_eternal_shroud",
	"item_sange",
	"item_shivas_guard",
	"item_kaya_and_sange",
	"item_octarine_core",
	"item_guardian_greaves"
};			

X["builds"] = {
	{3,2,3,1,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7,2,4,6,8}, talents
);

return X