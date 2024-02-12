X = {}

local IBUtil  = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot  = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

X["items"] = { 
	"item_magic_wand",
	"item_boots",
	"item_vanguard",
	"item_phase_boots",
	"item_blink",
	"item_blade_mail",
	"item_black_king_bar",
	"item_crimson_guard",
	"item_heart",
	"item_ultimate_scepter_2",
	"item_overwhelming_blink"
};			

X["builds"] = {
	{2,3,3,1,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7,1,4,6,8}, talents
);

return X