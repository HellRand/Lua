local Puck = {}

Puck.optionEnable = Menu.AddOption({"Hero Specific", "Puck"}, "Enable",  "TEIIEPb Tbl IIPO HA IIAKE, IIO3DPAB/|9l|-0 :P")
Puck.optionKey = Menu.AddKeyOption({"Hero Specific", "Puck"}, "Key Use", Enum.ButtonCode.KEY_F)
Puck.BKB = Menu.AddOption({"Hero Specific", "Puck"}, "USE BKB",  "")

function Puck.OnUpdate()
    if not Menu.IsEnabled(Puck.optionEnable) then return true end
    if not Menu.IsKeyDown(Puck.optionKey) then return end
	
	local MyHero = Heroes.GetLocal()
	
	if NPC.GetUnitName(MyHero) ~= "npc_dota_hero_puck" then return end	
	
	local MyMana = NPC.GetMana(MyHero)
	
	--Skills
	
	local ult = NPC.GetAbilityByIndex(MyHero, 4)
	local silence = NPC.GetAbilityByIndex(MyHero, 1)
	local orb = NPC.GetAbilityByIndex(MyHero, 0)
	local getout = NPC.GetAbilityByIndex(MyHero, 2)
	
	local bye = NPC.GetAbilityByIndex(MyHero, 3)
	
	--Items
	
	local blink = NPC.GetItem(myHero, "item_blink", true)
	local bkb = NPC.GetItem(myHero, "item_black_king_bar", true)
	local shiva = NPC.GetItem(myHero, "item_shivas_guard", true)
	local lotusorb = NPC.GetItem(myHero, "item_lotus_orb", true)

	
	--Positions
	
	local mousePos = Input.GetWorldCursorPos()
	local myPos = NPC.GetAbsOrigin(MyHero)
	
	--Enemy
	
	local enemies = NPC.GetHeroesInRadius(MyHero, 1600, Enum.TeamType.TEAM_ENEMY)	
	local firstenemy = NPC.GetNearestHeroToCursor(MyTeam, Enum.TeamType.TEAM_ENEMY)
	
	-----------------CAST----------------------
	
	if (ult == nill or not Ability.IsReady(ult)) then return end
		if (Puck.checkCenter(myPos, mousePos, MyHero, 600) > 1) then
			if blink ~= nill and Ability.IsCastable(ult, MyMana) and Ability.IsReady(blik) then
			if NPC.IsPositionInRange(myHero, pos, 1200, 0) then
			if lotusorb and Ability.IsCastable(lotusorb, MyMana) then Ability.CastTarget(lotusorb, MyHero) end
			if bkb and Menu.IsEnabled(Puck.BKB) and Ability.IsReady(bkb) then Ability.CastNoTarget(bkb) end
		
			Ability.CastPosition(blink, mousePos)					
			Ability.CastPosition(ult, mousePos)
			if (Ability.IsCastable(silence, MyMana)) then Ability.CastNoTarget(silence) end
			if (Ability.IsCastable(orb, MyMana)) then Ability.CastPosition(MyPos) end
			if (Ability.IsCastable(getout, MyMana) and Ability.IsReady(getout)) then Ability.CastNoTarget(getout) end
			sleep(3)
			Ability.CastNoTarget(bye)
			
	
		end
		return
	end
	return
	end
	return
	end
	
	-----------------CAST----------------------
	
	function Puck.checkCenter(MyPos ,center, MyHero, Radius)
	
	if MyPos:Length2D(center) < 1200 then
    local numOfEnemyInRadius = 0
    local MyTeam = Entity.GetTeamNum( MyHero )

		for i = 1, Heroes.Count() do
			local hero = Heroes.Get(i)
			if not NPC.IsIllusion(hero) then
				local sameTeam = Entity.GetTeamNum(hero) == MyTeam
				if not sameTeam then
					if NPC.IsPositionInRange(hero, center, Radius, 0) then 
						numOfEnemyInRadius = numOfEnemyInRadius + 1
					end
				end
			end
		end
		return
	end
    
    return numOfEnemyInRadius
	end

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end
