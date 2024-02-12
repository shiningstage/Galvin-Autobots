X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_power_treads_str",
	"item_blade_mail",
	"item_black_king_bar",
	"item_satanic",
	
	"item_greater_crit",
	"item_swift_blink",
	"item_ultimate_scepter_2"
};			
--{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
X["builds"] = {
	{2,3,2,3,3,4,3,2,2,1,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,7,8,1,4,5,6}, talents
);

return X