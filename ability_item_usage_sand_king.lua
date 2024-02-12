if GetBot():IsInvulnerable() or not GetBot():IsHero() or not string.find(GetBot():GetUnitName(), "hero") or  GetBot():IsIllusion() then
	return;
end

local ability_item_usage_generic = dofile( GetScriptDirectory().."/ability_item_usage_generic" )
local utils = require(GetScriptDirectory() ..  "/util")
local mutils = require(GetScriptDirectory() ..  "/MyUtility")
local abUtils = require(GetScriptDirectory() ..  "/AbilityItemUsageUtility")

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

local bot = GetBot();

local abilities = {};

local castCombo1Desire = 0;
local castCombo2Desire = 0;
local castQDesire = 0;
local castWDesire = 0;
local castEDesire = 0;
local castRDesire = 0;

local lastCheck = -90;

function AbilityUsageThink()
	
	if #abilities == 0 then abilities = mutils.InitiateAbilities(bot, {0,1,2,5}) end
	
	if mutils.CantUseAbility(bot) then return end
	
	castQDesire, targetQ = ConsiderQ();
	castWDesire, targetW = ConsiderW();
	-- castEDesire, targetE  = ConsiderE();
	castRDesire, targetR = ConsiderR();
	
	if castRDesire > 0 then
		bot:Action_UseAbility(abilities[4]);		
		return
	end
	
	if castQDesire > 0 then
		bot:Action_UseAbilityOnLocation(abilities[1], targetQ);		
		return
	end
	
	if castWDesire > 0 then
		bot:Action_UseAbility(abilities[2]);		
		return
	end
	
	if castEDesire > 0 then
		local typeAOE = mutils.CheckFlag(abilities[3]:GetBehavior(), ABILITY_BEHAVIOR_POINT);
		if typeAOE == true then
			bot:Action_UseAbilityOnLocation( abilities[3], targetE:GetLocation() );
		else
			bot:Action_UseAbilityOnEntity( abilities[3], targetE );
		end	
		return
	end
	
end

function ConsiderQ()
	if not mutils.CanBeCast(abilities[1]) or bot:IsRooted() then
		return BOT_ACTION_DESIRE_NONE, nil;
	end
	
	local nCastRange = mutils.GetProperCastRange(false, bot, abilities[1]:GetCastRange());
	local nCastPoint = abilities[1]:GetCastPoint();
	local manaCost  = abilities[1]:GetManaCost();
	local nRadius   = abilities[1]:GetSpecialValueInt( "burrow_width" );
	
	if mutils.IsStuck(bot)
	then
		local loc = mutils.GetEscapeLoc();
		return BOT_ACTION_DESIRE_HIGH, bot:GetXUnitsTowardsLocation( loc, nCastRange );
	end
	
	if mutils.IsRetreating(bot) and bot:WasRecentlyDamagedByAnyHero(2.0)
	then
		local enemy = bot:GetNearbyHeroes(1600, true, BOT_MODE_NONE);
		if #enemy > 0 then
			local loc = mutils.GetEscapeLoc();
		    return BOT_ACTION_DESIRE_HIGH, bot:GetXUnitsTowardsLocation( loc, nCastRange );
		end
	end
	
	if mutils.IsInTeamFight(bot, 1300)
	then
		local locationAoE = bot:FindAoELocation( true, true, bot:GetLocation(), nCastRange, nRadius, nCastPoint, 0 );
		if ( locationAoE.count >= 2 ) then
			local target = mutils.GetVulnerableUnitNearLoc(true, true, nCastRange, nRadius, locationAoE.targetloc, bot);
			if target ~= nil then
				return BOT_ACTION_DESIRE_HIGH, target:GetLocation();
			end
		end
	end
	
	if ( mutils.IsPushing(bot) or mutils.IsDefending(bot) ) and mutils.CanSpamSpell(bot, manaCost)
	then
		local locationAoE = bot:FindAoELocation( true, false, bot:GetLocation(), nCastRange, nRadius, 0, 0 );
		if ( locationAoE.count >= 3 ) then
			local target = mutils.GetVulnerableUnitNearLoc(false, true, nCastRange, nRadius, locationAoE.targetloc, bot);
			if target ~= nil then
				local enemies = target:GetNearbyHeroes(1200, true, BOT_MODE_NONE);
				if enemies == nil or #enemies <= 1 then
					return BOT_ACTION_DESIRE_HIGH, target:GetLocation();
				end
			end
		end
	end
	
	if mutils.IsGoingOnSomeone(bot)
	then
		local target = bot:GetTarget();
		if mutils.IsValidTarget(target) and mutils.CanCastOnNonMagicImmune(target) and mutils.IsInRange(target, bot, nCastRange) 
			and mutils.IsDisabled(true, target) == false
		then
			return BOT_ACTION_DESIRE_HIGH, target:GetLocation();
		end
	end
	
	return BOT_ACTION_DESIRE_NONE, nil;
end

function ConsiderW()
	if not mutils.CanBeCast(abilities[2]) then
		return BOT_ACTION_DESIRE_NONE, nil;
	end
	
	local nCastRange = mutils.GetProperCastRange(false, bot, abilities[2]:GetCastRange());
	local nCastPoint = abilities[2]:GetCastPoint();
	local manaCost  = abilities[2]:GetManaCost();
	local nRadius   = abilities[2]:GetSpecialValueInt( "sand_storm_radius" );
	
	if mutils.IsRetreating(bot) and ( bot:WasRecentlyDamagedByAnyHero(2.0) or bot:WasRecentlyDamagedByTower(2.0) )
	then
		local enemy = bot:GetNearbyHeroes(2*nRadius, true, BOT_MODE_NONE);
		if #enemy > 0 then
		    return BOT_ACTION_DESIRE_HIGH;
		end
	end
	
	if mutils.IsInTeamFight(bot, 1300) 
	then
		local enemies = bot:GetNearbyHeroes(nRadius/2, true, BOT_MODE_NONE);
		if ( #enemies >= 2 ) 
		then
			return BOT_ACTION_DESIRE_LOW;
		end
	end
	
	if mutils.IsGoingOnSomeone(bot)
	then
		local target = bot:GetTarget();
		if mutils.IsValidTarget(target) and mutils.CanCastOnNonMagicImmune(target) and mutils.IsInRange(target, bot, nRadius/2) and abilities[2]:GetLevel() >= 3
		then
			return BOT_ACTION_DESIRE_HIGH;
		end
	end
	
	return BOT_ACTION_DESIRE_NONE, nil;
end	

function ConsiderE()
	if not mutils.CanBeCast(abilities[3]) 
	then
		return BOT_ACTION_DESIRE_NONE, nil;
	end
	
	local nCastRange = mutils.GetProperCastRange(false, bot, abilities[3]:GetCastRange());
	
	local tableNearbyEnemyHeroes = bot:GetNearbyHeroes( nCastRange + 200, true, BOT_MODE_NONE );
	
	--if we can kill any enemies
	for _,npcEnemy in pairs(tableNearbyEnemyHeroes)
	do
		if mutils.CanCastOnNonMagicImmune(npcEnemy) and  npcEnemy:IsChanneling() then
			return BOT_ACTION_DESIRE_HIGH, npcEnemy;
		end
	end
	
	if ( bot:GetActiveMode() == BOT_MODE_ROSHAN  ) 
	then
		local npcTarget = bot:GetAttackTarget();
		if ( mutils.IsRoshan(npcTarget) and mutils.CanCastOnMagicImmune(npcTarget) and mutils.IsInRange(npcTarget, bot, nCastRange) 
            and not mutils.IsDisabled(true, npcTarget) )
		then
			return BOT_ACTION_DESIRE_LOW, npcTarget;
		end
	end

	if mutils.IsInTeamFight(bot, 1200)
	then
		local highesAD = 0;
		local highesADUnit = nil;
		
		for _,npcEnemy in pairs( tableNearbyEnemyHeroes )
		do
			local EnemyAD = npcEnemy:GetAttackDamage();
			if ( mutils.CanCastOnNonMagicImmune(npcEnemy) and not mutils.IsDisabled(true, npcEnemy) and
				 EnemyAD > highesAD ) 
			then
				highesAD = EnemyAD;
				highesADUnit = npcEnemy;
			end
		end
		
		if highesADUnit ~= nil then
			return BOT_ACTION_DESIRE_HIGH, highesADUnit;
		end
	end
	
	-- If we're going after someone
	if mutils.IsGoingOnSomeone(bot)
	then
		local npcTarget = bot:GetTarget();
		if mutils.IsValidTarget(npcTarget) and mutils.CanCastOnNonMagicImmune(npcTarget) and mutils.IsInRange(npcTarget, bot, nCastRange + 200) 
		   and not mutils.IsDisabled(true, npcTarget)
		then
			return BOT_ACTION_DESIRE_HIGH, npcTarget;
		end
	end
	
	return BOT_ACTION_DESIRE_NONE, 0;
end		

function ConsiderR()
	if not mutils.CanBeCast(abilities[4]) then
		return BOT_ACTION_DESIRE_NONE, nil;
	end
	
	local nCastRange = mutils.GetProperCastRange(false, bot, abilities[4]:GetCastRange());
	local nCastRange2 = mutils.GetProperCastRange(false, bot, abilities[1]:GetCastRange());
	local nCastPoint = abilities[4]:GetCastPoint();
	local manaCost  = abilities[4]:GetManaCost();
	local nRadius   = abilities[4]:GetSpecialValueInt( "epicenter_radius" );
	local nRadius2   = abilities[1]:GetSpecialValueInt( "burrow_width" );
	local nPulses   = abilities[4]:GetSpecialValueInt( "epicenter_pulses" );
	local nMaxRadius = nRadius + 50 * nPulses;
	
	if mutils.IsInTeamFight(bot, 1600)
	then
		if mutils.CanBeCast(abilities[4]) then
			local locationAoE = bot:FindAoELocation( true, true, bot:GetLocation(), nCastRange2, nRadius2, 0, 0 );
			if ( locationAoE.count >= 2 ) then
				local target = mutils.GetVulnerableUnitNearLoc(true, true, nCastRange2, nRadius2, locationAoE.targetloc, bot);
				if target ~= nil and mutils.IsInRange(target, bot, nCastRange2/2) == fasle and mutils.IsInRange(target, bot, nCastRange2-200) 
				then
					return BOT_ACTION_DESIRE_HIGH;
				end
			end
		else
			local nDisabled = 0;
			local enemy = bot:GetNearbyHeroes(nMaxRadius, true, BOT_MODE_NONE);
			for i=1,#enemy do
				if mutils.IsValidTarget(enemy[i]) and mutils.CanCastOnNonMagicImmune(enemy[i]) and mutils.IsDisabled(true, enemy[i]) then
					nDisabled = nDisabled + 1;
				end
			end
			if nDisabled >= 2 then 
				return BOT_ACTION_DESIRE_LOW;
			end
		end	
	end
	
	if mutils.IsGoingOnSomeone(bot)
	then
		local target = bot:GetTarget();
		if mutils.IsValidTarget(target) and mutils.CanCastOnNonMagicImmune(target) and mutils.IsInRange(target, bot, nMaxRadius)
		then
			local enemy = target:GetNearbyHeroes(nMaxRadius/2, false, BOT_MODE_NONE);
			if enemy ~= nil and #enemy >= 3 then
				return BOT_ACTION_DESIRE_LOW;
			end
		end
	end
	
	return BOT_ACTION_DESIRE_NONE, nil;
end
	