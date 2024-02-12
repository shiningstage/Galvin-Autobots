X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_phase_boots",
	"item_ring_of_tarrasque",
	"item_blade_mail",
	"item_heart",
	"item_eternal_shroud",
	
	"item_shivas_guard",
	"item_overwhelming_blink"
};	
			
X["builds"] = {
	{1,2,2,1,2,4,1,2,2,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7,2,3,5,8}, talents
);

return X