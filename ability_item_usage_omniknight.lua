local bot = GetBot();

if bot:IsInvulnerable() or bot:IsHero() == false or GetBot():IsIllusion() then return; end

local ability_item_usage_generic = dofile( GetScriptDirectory().."/ability_item_usage_generic" )
local utils = require(GetScriptDirectory() ..  "/util")
local mutils = require(GetScriptDirectory() ..  "/MyUtility")

function AbilityLevelUpThink()  
	ability_item_usage_generic.AbilityLevelUpThink(); 
end
function BuybackUsageThink()
	ability_item_usage_generic.BuybackUsageThink();
end
function CourierUsageThink()
	ability_item_usage_generic.CourierUsageThink();
end
function ItemUsageThink()
	ability_item_usage_generic.ItemUsageThink();
end

--[[ Abilities
"Ability1"		"omniknight_purification"
"Ability2"		"omniknight_repel"
"Ability3"		"omniknight_degen_aura"
"Ability4"		"generic_hidden"
"Ability5"		"generic_hidden"
"Ability6"		"omniknight_guardian_angel"
"Ability10"		"special_bonus_gold_income_15"
"Ability11"		"special_bonus_unique_omniknight_4"
"Ability12"		"special_bonus_exp_boost_35"
"Ability13"		"special_bonus_attack_damage_90"
"Ability14"		"special_bonus_unique_omniknight_2"
"Ability15"		"special_bonus_mp_regen_4"
"Ability16"		"special_bonus_unique_omniknight_1"
"Ability17"		"special_bonus_unique_omniknight_3"
]]--

--[[ Modifier
modifier_omniknight_martyr
modifier_omniknight_degen_aura
modifier_omniknight_degen_aura_effect
modifier_omninight_guardian_angel
]]--

local abilities = mutils.InitiateAbilities(bot, {0,1,2,5});

local castQDesire = 0;
local castWDesire = 0;
local castEDesire = 0;
local castRDesire = 0;

local lastCheck = -90;

local npcBot = nil;


local function ConsiderQ()

	if  mutils.CanBeCast(abilities[1]) == false then
		return BOT_ACTION_DESIRE_NONE, nil;
	end
	
	local nCastRange = mutils.GetProperCastRange(false, bot, abilities[1]:GetCastRange());
	local nCastPoint = abilities[1]:GetCastPoint();
	local manaCost   = abilities[1]:GetManaCost();
	local nRadius    = abilities[1]:GetSpecialValueInt( "radius" );
	local nDamage    = abilities[1]:GetSpecialValueInt( "heal" );
	
	if mutils.IsRetreating(bot) and bot:HasModifier('modifier_omniknight_martyr') == false and mutils.CanCastOnNonMagicImmune(bot) 
	then
		local enemies = bot:GetNearbyHeroes(1200, true, BOT_MODE_NONE);
		if #enemies > 0 and bot:GetHealth() <= (0.2+(#enemies*0.1))*bot:GetMaxHealth() then
			return BOT_ACTION_DESIRE_HIGH, bot;
		end
	end

	if DotaTime() >= lastCheck + 2.0 then 
		local weakest = nil;
		local minHP = 100000;
		local allies = bot:GetNearbyHeroes(nCastRange, false, BOT_MODE_NONE);
		if #allies > 0 then
			for i=1,#allies do
				if mutils.CanCastOnNonMagicImmune(allies[i])
				   and allies[i]:WasRecentlyDamagedByAnyHero(2.0) and allies[i]:GetAttackTarget() == nil
				   and allies[i]:GetHealth() <= minHP
     			   and allies[i]:GetHealth() <= 0.55*allies[i]:GetMaxHealth() 
				then
					weakest = allies[i];
					minHP = allies[i]:GetHealth();
				end
			end
		end
		if weakest ~= nil then
			return BOT_ACTION_DESIRE_HIGH, weakest;
		end
		lastCheck = DotaTime();
	end
	
	if mutils.IsGoingOnSomeone(bot) and bot:GetHealth() + nDamage <= bot:GetMaxHealth()
	then
		local target = bot:GetTarget();
		if mutils.IsValidTarget(target) and mutils.CanCastOnNonMagicImmune(target) and mutils.IsInRange(target, bot, nRadius) 
		then
			return BOT_ACTION_DESIRE_HIGH, bot;
		end
	end

	return BOT_ACTION_DESIRE_NONE, nil;
end

local function ConsiderW()

	if  mutils.CanBeCast(abilities[2]) == false then
		return BOT_ACTION_DESIRE_NONE, nil;
	end
	
	local nCastRange = mutils.GetProperCastRange(false, bot, abilities[2]:GetCastRange());
	local nCastPoint = abilities[2]:GetCastPoint();
	local manaCost   = abilities[2]:GetManaCost();
	
	if mutils.IsRetreating(bot) and bot:HasModifier('modifier_omniknight_martyr') == false and mutils.CanCastOnNonMagicImmune(bot) 
	then
		local enemies = bot:GetNearbyHeroes(1200, true, BOT_MODE_NONE);
		if #enemies > 0 and bot:GetHealth() <= (0.3+(#enemies*0.1))*bot:GetMaxHealth() then
			return BOT_ACTION_DESIRE_HIGH, bot;
		end
	end

	if mutils.IsInTeamFight(bot, 1200) then
		local allies = bot:GetNearbyHeroes(nCastRange, false, BOT_MODE_NONE);
		local target = nil;
		local maxOP = 0;
		local allies = bot:GetNearbyHeroes(nCastRange, false, BOT_MODE_NONE);
		if #allies > 0 then
			for i=1,#allies do
				if mutils.CanCastOnNonMagicImmune(allies[i])
				   and allies[i]:GetAttackTarget() ~= nil	
				   and allies[i]:GetRawOffensivePower() >= maxOP
				then
					target = allies[i];
					maxOP = allies[i]:GetRawOffensivePower();
				end
			end
		end
		if target == nil then
			local minHP = 100000;
			if #allies > 0 then
				for i=1,#allies do
					if mutils.CanCastOnNonMagicImmune(allies[i])
					   and mutils.IsDisabled(false, allies[i])	
					   and allies[i]:GetHealth() <= minHP
					then
						target = allies[i];
						minHP = allies[i]:GetHealth();
					end
				end
			end
		end
		if target ~= nil then
			return BOT_ACTION_DESIRE_HIGH, target;
		end
	end
	
	if DotaTime() >= lastCheck + 2.0 then 
		local weakest = nil;
		local minHP = 100000;
		local allies = bot:GetNearbyHeroes(nCastRange, false, BOT_MODE_NONE);
		if #allies > 0 then
			for i=1,#allies do
				if mutils.CanCastOnNonMagicImmune(allies[i])
				   and allies[i]:WasRecentlyDamagedByAnyHero(2.0) and allies[i]:GetAttackTarget() == nil
				   and allies[i]:GetHealth() <= minHP
     			   and allies[i]:GetHealth() <= 0.55*allies[i]:GetMaxHealth() 
				then
					weakest = allies[i];
					minHP = allies[i]:GetHealth();
				end
			end
		end
		if weakest ~= nil then
			return BOT_ACTION_DESIRE_HIGH, weakest;
		end
		lastCheck = DotaTime();
	end
	
	return BOT_ACTION_DESIRE_NONE, nil;
end

local function ConsiderE()

	if  mutils.CanBeCast(abilities[3]) == false then
		return BOT_ACTION_DESIRE_NONE, nil;
	end

	local nCastRange = abilities[3]:GetCastRange();
	local nCastPoint = abilities[3]:GetCastPoint();
	local nManaCost  = abilities[3]:GetManaCost();
	local nDamage    = abilities[3]:GetAbilityDamage() ;
	
	local tableNearbyEnemyHeroes = npcBot:GetNearbyHeroes( nCastRange+300, true, BOT_MODE_NONE );
	
	--if we can kill any enemies
	for _,npcEnemy in pairs(tableNearbyEnemyHeroes)
	do
		if mutils.CanCastOnNonMagicImmune(npcEnemy) and mutils.CanKillTarget(npcEnemy, nDamage, DAMAGE_TYPE_PURE) then
				return BOT_ACTION_DESIRE_HIGH, npcEnemy;
		end
	end
	
	-- If we're seriously retreating, see if we can land a stun on someone who's damaged us recently
	if mutils.IsRetreating(npcBot)
	then
		for _,npcEnemy in pairs( tableNearbyEnemyHeroes )
		do
			if ( npcBot:WasRecentlyDamagedByHero( npcEnemy, 2.0 ) and mutils.CanCastOnNonMagicImmune(npcEnemy) and not mutils.IsDisabled(true, npcEnemy) ) 
			then
				return BOT_ACTION_DESIRE_HIGH, npcEnemy;
			end
		end
	end
	
	if ( npcBot:GetActiveMode() == BOT_MODE_ROSHAN  ) 
	then
		local npcTarget = npcBot:GetAttackTarget();
		if ( mutils.IsRoshan(npcTarget) and mutils.CanCastOnNonMagicImmune(npcTarget) and mutils.IsInRange(npcTarget, npcBot, nCastRange)  )
		then
			return BOT_ACTION_DESIRE_HIGH, npcTarget;	
		end
	end
	
	if mutils.IsInTeamFight(bot, 1200)
	then
		local target = mutils.GetVulnerableWeakestUnit(true, true, nCastRange+300, bot);
		--local target = mutils.GetStrongestUnit(nCastRange, bot, true, false, 5.0);
		if target ~= nil then
			return BOT_ACTION_DESIRE_HIGH, target;
		end
	end

	-- If we're going after someone
	if mutils.IsGoingOnSomeone(npcBot)
	then
		local npcTarget = npcBot:GetTarget();
		if mutils.IsValidTarget(npcTarget) and mutils.CanCastOnNonMagicImmune(npcTarget) and mutils.IsInRange(npcTarget, npcBot, nCastRange)
		then
			return BOT_ACTION_DESIRE_MODERATE, npcTarget;
		end
	end
	
	return BOT_ACTION_DESIRE_NONE, 0;
end

local function ConsiderR()

	if  mutils.CanBeCast(abilities[4]) == false then
		return BOT_ACTION_DESIRE_NONE, nil;
	end

	local nCastRange = abilities[4]:GetCastRange()
	
	if bot:HasScepter() then nRadius = 1600 end
	
	if mutils.IsRetreating(bot) and bot:WasRecentlyDamagedByAnyHero(2.0) and bot:GetHealth() <= 0.45*bot:GetMaxHealth() 
		and bot:HasModifier('modifier_omninight_guardian_angel') == false then
		return BOT_ACTION_DESIRE_HIGH, bot;
	end
	
	if mutils.IsInTeamFight(bot, 1200) then
		local allies = bot:GetNearbyHeroes(nCastRange, false, BOT_MODE_NONE);
		if #allies > 0 then
			for i=1,#allies do
				if allies[i]:WasRecentlyDamagedByAnyHero(2.0) 
				   and allies[i]:GetHealth() <= 0.45*allies[i]:GetMaxHealth()
				   and bot:HasModifier('modifier_omninight_guardian_angel') == false
				then
				return BOT_ACTION_DESIRE_HIGH, allies[i];
				end
			end
		end
	end
	
	return BOT_ACTION_DESIRE_NONE;
end


function AbilityUsageThink()

	if npcBot == nil then npcBot = GetBot(); end
	if mutils.CantUseAbility(bot) then return end
	
	castQDesire, qTarget = ConsiderQ();
	castWDesire, wTarget = ConsiderW();
	castEDesire, eTarget = ConsiderE();
	castRDesire, rTarget = ConsiderR();
	
	if castRDesire > 0 then
		bot:Action_UseAbilityOnEntity(abilities[4], rTarget);
		return
	end
	
	if castEDesire > 0 then
		bot:Action_UseAbilityOnEntity(abilities[3], eTarget);
		return
	end
	
	if castQDesire > 0 then
		bot:Action_UseAbilityOnEntity(abilities[1], qTarget);		
		return
	end
	
	if castWDesire > 0 then
		bot:Action_UseAbilityOnEntity(abilities[2], wTarget);	
		return
	end
	
end