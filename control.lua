script.on_init( -- new saves
function()
	global.EntityList = {}
	global.stickers = {}
	global.dummies = {}
	global.hover = {}
	--- count rekt GFXs
	local KillGFXScan = true
	local count = 1
	while (KillGFXScan == true) do
		if (pcall(
			function()
				rendering.draw_animation
					{
						animation = "rekt"..count,
						target = {0,0},
						surface = game.surfaces[1],
						time_to_live = 1
					}
			end)
		) then
			count = count+1
		else
			global.RektGFXCount = count-1
			KillGFXScan = false
		end
	end
	--- count montage GFXs
	local EuphoriaGFXScan = true
	local count = 1
	while (EuphoriaGFXScan == true) do
		if (pcall(
			function()
				rendering.draw_animation
					{
						animation = "pog"..count,
						target = {0,0},
						surface = game.surfaces[1],
						time_to_live = 1
					}
			end)
		) then
			count = count+1
		else
			global.PogGFXCount = count-1
			EuphoriaGFXScan = false
		end
	end
	--- count various stickers
	global.BGMCount = game.recipe_prototypes["MLG_SickW0bs"].emissions_multiplier
	global.HYPECount = game.recipe_prototypes["MLG_Euphoria"].emissions_multiplier
	global.MEMECount = game.recipe_prototypes["MLG_Maymays"].emissions_multiplier
end)

script.on_configuration_changed( -- existing saves/mod update
function()
	if (global.EntityList == nil) then
		global.EntityList = {}
	end
	if (global.stickers == nil) then
		global.stickers = {}
	end
	if (global.dummies == nil) then
		global.dummies = {}
	end
	if (global.hover == nil) then
		global.hover = {}
	end
	for _, force in pairs(game.forces) do
	  force.reset_recipes()
	  force.reset_technologies()

	  -- create tech/recipe table once
	  local techs = force.technologies
	  local recipes = force.recipes

	  if techs["military"].researched then
		recipes["awwman"].enabled = true
		recipes["thegoods"].enabled = true
		recipes["thegoods2"].enabled = true
	  end
	end
	--- count rekt GFXs
	local KillGFXScan = true
	local count = 1
	while (KillGFXScan == true) do
		if (pcall(
			function()
				rendering.draw_animation
					{
						animation = "rekt"..count,
						target = {0,0},
						surface = game.surfaces[1],
						time_to_live = 1
					}
			end)
		) then
			count = count+1
		else
			global.RektGFXCount = count-1
			KillGFXScan = false
		end
	end
	--- count montage GFXs
	local EuphoriaGFXScan = true
	local count = 1
	while (EuphoriaGFXScan == true) do
		if (pcall(
			function()
				rendering.draw_animation
					{
						animation = "pog"..count,
						target = {0,0},
						surface = game.surfaces[1],
						time_to_live = 1
					}
			end)
		) then
			count = count+1
		else
			global.PogGFXCount = count-1
			EuphoriaGFXScan = false
		end
	end
	--- count various stickers
	global.BGMCount = game.recipe_prototypes["MLG_SickW0bs"].emissions_multiplier
	global.HYPECount = game.recipe_prototypes["MLG_Euphoria"].emissions_multiplier
	global.MEMECount = game.recipe_prototypes["MLG_Maymays"].emissions_multiplier
end)


script.on_nth_tick(2,
function(event)
	for number, stuff in pairs(global.EntityList) do
		if (stuff.entity.valid) then
			if (rendering.get_visible(stuff.StreakTimer) == true) then
				rendering.set_to(stuff.StreakTimer, rendering.get_to(stuff.StreakTimer).entity, {rendering.get_to(stuff.StreakTimer).entity_offset[1]-0.02, 0.75})
			end
			if (global.EntityList[number].LastKill and game.tick > global.EntityList[number].LastKill + 200) then
				global.EntityList[number].streak = 0
				rendering.set_visible(stuff.count, false)
				rendering.set_visible(stuff.glow, false)
				rendering.set_x_scale(stuff.glow, 1)
				rendering.set_y_scale(stuff.glow, 1)
				rendering.set_visible(stuff.StreakTimerBG, false)
				rendering.set_visible(stuff.StreakTimer, false)
			end
		else
			global.EntityList[number] = nil
		end
	end
end)

script.on_event(defines.events.on_entity_died, -- .entity=entity .cause=entity .loot=inventory .force=force .damage_type=damageprototype
function(event)
	if (event.cause and event.damage_type and event.damage_type.name == "ProAsHeck") then
		---- sound stickers ------
		local StickerTarget = nil
		if (event.cause.type == "character" or event.cause.type == "unit" or event.cause.type == "car") then
			StickerTarget = event.cause
		else
			if (global.dummies[event.cause.unit_number] == nil) then
				global.dummies[event.cause.unit_number] = event.cause.surface.create_entity
				{
					name = "CHEEKYSCRUB",
					position = event.cause.position
				}
				global.dummies[event.cause.unit_number].destructible = false
				script.register_on_entity_destroyed(event.cause)
			end
			StickerTarget = global.dummies[event.cause.unit_number]
		end
		----------- applying sound stickers
		if (global.stickers[StickerTarget.unit_number] == nil) then
			global.stickers[StickerTarget.unit_number] = {BMG = nil, HYPE=nil, MEME1=nil, MEME2=nil, MEME3=nil}
		end
		local stickers = global.stickers[StickerTarget.unit_number]
		if (stickers.BGM == nil or stickers.BGM.valid == false or stickers.BGM.time_to_live < 20) then
			local track = math.random(1,global.BGMCount)
			stickers.BGM = StickerTarget.surface.create_entity
			{
				name="BGM"..track,
				target=StickerTarget,
				position={420,69}
			}
		end
		if (stickers.HYPE == nil or stickers.HYPE.valid == false or stickers.HYPE.time_to_live < 20) then
			local track = math.random(1,global.HYPECount)
			stickers.HYPE = StickerTarget.surface.create_entity
			{
				name="HYPE"..track,
				target=StickerTarget,
				position={420,69}
			}
		end
		if (stickers.MEME1 == nil or stickers.MEME1.valid == false) then
			local track = math.random(1,global.MEMECount)
			stickers.MEME1 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		elseif (stickers.MEME2 == nil or stickers.MEME2.valid == false) then
			local track = math.random(1,global.MEMECount)
			stickers.MEME2 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		elseif (stickers.MEME3 == nil or stickers.MEME3.valid == false) then
			local track = math.random(1,global.MEMECount)
			stickers.MEME3 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		end

		--- kill streak +
		global.EntityList[event.cause.unit_number].streak = global.EntityList[event.cause.unit_number].streak+1
		MemeStacks = global.EntityList[event.cause.unit_number].streak/settings.global["RIP_Leviathan"].value
		global.EntityList[event.cause.unit_number].LastKill = game.tick
		if (global.EntityList[event.cause.unit_number].streak > 1) then
			rendering.set_visible(global.EntityList[event.cause.unit_number].count, true)
			rendering.set_visible(global.EntityList[event.cause.unit_number].StreakTimer, true)
			rendering.set_to(global.EntityList[event.cause.unit_number].StreakTimer, rendering.get_to(global.EntityList[event.cause.unit_number].StreakTimer).entity, {1, 0.75})
			rendering.set_visible(global.EntityList[event.cause.unit_number].StreakTimerBG, true)
		end
		local wow = "!"
		-- for ayy = 1, math.floor(global.EntityList[event.cause.unit_number].streak/10) do
		-- 	wow = wow.."!"
		-- end
		rendering.set_text(global.EntityList[event.cause.unit_number].count, {"labels.killstreak", global.EntityList[event.cause.unit_number].streak..wow})
		rendering.set_visible(global.EntityList[event.cause.unit_number].glow, true)
		rendering.set_x_scale(global.EntityList[event.cause.unit_number].glow, 1 + 0.5*MemeStacks)
		rendering.set_y_scale(global.EntityList[event.cause.unit_number].glow, 1 + 0.5*MemeStacks)

		-- effect on thing killed
		memeID = math.random(1,global.RektGFXCount)
		rendering.draw_animation
		{
			animation = "rekt"..memeID,
			target = event.entity.position,
			surface = event.entity.surface.name,
			time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)),
			animation_offset = math.random(0,100),
			x_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks),
			y_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks)
		}

		-- effect on killer
		for i = 1, 1 + math.floor(MemeStacks/settings.global["SaltyRunback"].value) do
			if (math.random(1,settings.global["KillCam"].value) == 1) then
				memeID = math.random(1,global.PogGFXCount)
				local turnt = math.random(-50,50)*0.01*(1/50)*MemeStacks
				if (memeID == 3 or memeID == 9) then
					offset = {0,-1}
					turnt = math.random(-30,30)*0.001
				else
					local SpreadRange = 3 + 0.3*MemeStacks
					offset = {math.random(-SpreadRange ,SpreadRange), math.random(-SpreadRange, SpreadRange)}
				end
				rendering.draw_animation
				{
					animation = "pog"..memeID,
					target = event.cause,
					target_offset = offset,
					orientation = turnt,
					surface = event.cause.surface.name,
					time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)),
					animation_offset = math.random(0,100),
					animation_speed = 1+((math.random(0,100)*0.1)^6/100000),
					x_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks),
					y_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks)
				}
			end
		end
	end
end)

script.on_event(defines.events.on_entity_damaged,
function(event)
	if (event.cause and event.damage_type and event.damage_type.name == "ProAsHeck") then
		---- Glowup.png -------
		if (global.EntityList[event.cause.unit_number] == nil) then
			global.EntityList[event.cause.unit_number] = {}
			global.EntityList[event.cause.unit_number].entity = event.cause
			global.EntityList[event.cause.unit_number].streak = 0
			global.EntityList[event.cause.unit_number].glow = rendering.draw_animation
				{
					animation = "MLGglow",
					target = event.cause,
					target_offset = {0,-0.75},
					surface = event.entity.surface.name,
					x_scale = 1,
					y_scale = 1,
					visible = false
				}
			global.EntityList[event.cause.unit_number].count = rendering.draw_text
				{
					text = 0,
					color = {1,1,1},
					scale = 1.25,
					target = event.cause,
					target_offset = {0,0},
					alignment="center",
					surface = event.entity.surface.name,
					visible = false
				}
				global.EntityList[event.cause.unit_number].StreakTimerBG = rendering.draw_line
					{
						color = {0.25,0.25,0.25,1},
						width = 10,
						from = event.cause,
						from_offset = {-1.05,0.75},
						to = event.cause,
						to_offset = {1.05,0.75},
						surface = event.entity.surface.name,
						visible = false
					}
			global.EntityList[event.cause.unit_number].StreakTimer = rendering.draw_line
				{
					color = {0.8,0.8,0.5},
					width = 6,
					from = event.cause,
					from_offset = {-1,0.75},
					to = event.cause,
					to_offset = {1,0.75},
					surface = event.entity.surface.name,
					visible = false
				}
			global.EntityList[event.cause.unit_number].LastKill = 0
		end
		if (rendering.get_visible(global.EntityList[event.cause.unit_number].glow) == false) then
			rendering.set_visible(global.EntityList[event.cause.unit_number].glow, true)
			global.EntityList[event.cause.unit_number].LastKill = game.tick
		end

		---- setup sound stickers ------
		local StickerTarget = nil
		if (event.cause.type == "character" or event.cause.type == "unit" or event.cause.type == "car") then
			StickerTarget = event.cause
		else
			if (global.dummies[event.cause.unit_number] == nil) then
				global.dummies[event.cause.unit_number] = event.cause.surface.create_entity
				{
					name = "CHEEKYSCRUB",
					position = event.cause.position
				}
				global.dummies[event.cause.unit_number].destructible = false
				global.dummies[event.cause.unit_number].active = false
				script.register_on_entity_destroyed(event.cause)
			end
			StickerTarget = global.dummies[event.cause.unit_number]
		end
		----------- applying stickers
		if (global.stickers[StickerTarget.unit_number] == nil) then
			global.stickers[StickerTarget.unit_number] = {BMG = nil, HYPE=nil, MEME1=nil, MEME2=nil, MEME3=nil}
		end
		local stickers = global.stickers[StickerTarget.unit_number]
		if (stickers.BGM == nil or stickers.BGM.valid == false or stickers.BGM.time_to_live < 20) then
			local track = math.random(1,global.BGMCount)
			stickers.BGM = StickerTarget.surface.create_entity
			{
				name="BGM"..track,
				target=StickerTarget,
				position={420,69}
			}
		end

		----- Hitmark sound -----
		event.entity.surface.play_sound
			{
				path = "hitmarkerFX",
				position = event.cause.position
			}

		----- Effects spawning ------
		if (math.random(1,settings.global["Hitmark"].value) == 1) then
			-- effect on thing killed
			MemeStacks = global.EntityList[event.cause.unit_number].streak/settings.global["RIP_Leviathan"].value
			if (math.random(1,settings.global["KillCam"].value) == 1) then
				memeID = math.random(1,global.RektGFXCount)
				rendering.draw_animation
				{
					animation = "rekt"..memeID,
					target = event.entity.position,
					surface = event.entity.surface.name,
					time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)),
					animation_offset = math.random(0,100),
					x_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks),
					y_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks)
				}
			end
			-- effect on killer
			for i = 1, 1 + math.floor(MemeStacks/settings.global["SaltyRunback"].value) do
				if (math.random(1,settings.global["KillCam"].value) == 1) then
					memeID = math.random(1,global.PogGFXCount)
					local turnt = math.random(-50,50)*0.01*(1/50)*MemeStacks
					if (memeID == 3 or memeID == 9) then
						offset = {0,-1}
						turnt = math.random(-5,5)*0.01
					else
						local SpreadRange = 3 + 0.3*MemeStacks
						offset = {math.random(-SpreadRange ,SpreadRange), math.random(-SpreadRange, SpreadRange)}
					end
					rendering.draw_animation
					{
						animation = "pog"..memeID,
						target = event.cause,
						target_offset = offset,
						orientation = turnt,
						surface = event.cause.surface.name,
						time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)),
						animation_offset = math.random(0,100),
						animation_speed = 1+((math.random(0,100)*0.1)^6/100000),
						x_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks),
						y_scale = 1 + (settings.global["FXSize_"].value*0.01*MemeStacks)
					}
				end
			end
		end
	end
end)

script.on_event(defines.events.on_entity_destroyed,
function(event)
	if (global.dummies[event.registration_number]) then
		global.dummies[event.registration_number].destroy()
	elseif (global.dummies[event.unit_number]) then
		global.dummies[event.unit_number].destroy()
	end
end
)

script.on_event(defines.events.on_selected_entity_changed,
-- player_index :: uint, The player whose selected entity changed.
-- last_entity :: LuaEntity, Optional The last selected entity if it still exists and there was one.
-- name :: defines.events, Identifier of the event
-- tick :: uint, Tick the event was generated.
function(event)
	local player = game.players[event.player_index]
	local selected = player.selected
	local LastSelected = event.last_entity
	if (selected and selected.type == "character-corpse") then
		global.hover[selected.position.x..","..selected.position.y..selected.surface.name] = rendering.draw_text
		{
			text = {"labels.F"},
			surface = player.surface,
			target = selected,
			target_offset = {0,-1.6},
			color = {1,1,1},
			alignment="center",
			scale = 1.5
		}
	elseif (selected == nil
	and LastSelected
	and LastSelected.type == "character-corpse"
	and global.hover[LastSelected.position.x..","..LastSelected.position.y..LastSelected.surface.name]) then
		rendering.destroy(global.hover[LastSelected.position.x..","..LastSelected.position.y..LastSelected.surface.name])
		global.hover[LastSelected.position.x..","..LastSelected.position.y..LastSelected.surface.name] = nil
	end
end
)

-- On Interact
script.on_event("xXx_P4yRe$p3c+S_xXx",
function(event)
	local player = game.players[event.player_index]
	if (player.selected and player.selected.type == "character-corpse") then
		local corpse = player.selected
		local registration_number = script.register_on_entity_destroyed(corpse)
		if (global.dummies[registration_number] == nil) then
			global.dummies[registration_number] = corpse.surface.create_entity
			{
				name = "CHEEKYSCRUB",
				position = corpse.position
			}
			global.dummies[registration_number].destructible = false
			global.dummies[registration_number].active = false

		end
		local StickerTarget = global.dummies[registration_number]
		StickerTarget.surface.create_entity
		{
			name="MEME9",
			target=StickerTarget,
			position={420,69}
		}

		rendering.draw_text
		{
			text = {"RIP.RIP"..math.random(1,7)},
			surface = player.surface,
			target = player.character,
			target_offset = {math.random(-10,10)*0.1, math.random(-20,0)*0.1},
			color = {1,1,1},
			alignment="center",
			time_to_live = 60*2.5
		}
	end
end)
