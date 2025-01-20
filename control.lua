if script.active_mods["gvv"] then require("__gvv__.gvv")() end

script.on_init( -- new saves
function()
	storage.EntityList = {}
	storage.stickers = {}
	storage.dummies = {}
	storage.hover = {}
	storage.players = {}
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
			storage.RektGFXCount = count-1
			KillGFXScan = false
		end
	end
	--- count montage GFXs
	local EuphoriaGFXScan = true
	count = 1
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
			storage.PogGFXCount = count-1
			EuphoriaGFXScan = false
		end
	end
	--- count various stickers
	storage.BGMCount = prototypes.recipe["MLG_SickW0bs"].emissions_multiplier
	storage.HYPECount = prototypes.recipe["MLG_Euphoria"].emissions_multiplier
	storage.MEMECount = prototypes.recipe["MLG_Maymays"].emissions_multiplier
end)

script.on_configuration_changed( -- existing saves/mod update
function()
	if (storage.EntityList == nil) then
		storage.EntityList = {}
	end
	if (storage.stickers == nil) then
		storage.stickers = {}
	end
	if (storage.dummies == nil) then
		storage.dummies = {}
	end
	if (storage.hover == nil) then
		storage.hover = {}
	end
	if (storage.players == nil) then
		storage.players = {}
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
			storage.RektGFXCount = count-1
			KillGFXScan = false
		end
	end
	--- count montage GFXs
	local EuphoriaGFXScan = true
	count = 1
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
			storage.PogGFXCount = count-1
			EuphoriaGFXScan = false
		end
	end
	--- count various stickers
	storage.BGMCount = prototypes.recipe["MLG_SickW0bs"].emissions_multiplier
	storage.HYPECount = prototypes.recipe["MLG_Euphoria"].emissions_multiplier
	storage.MEMECount = prototypes.recipe["MLG_Maymays"].emissions_multiplier
end)


script.on_nth_tick(2,
function(event)
	for number, stuff in pairs(storage.EntityList) do
		if (stuff.entity.valid and stuff.StreakTimer.valid) then
			if (stuff.StreakTimer.visible == true) then
				--rendering.set_to(stuff.StreakTimer, rendering.get_to(stuff.StreakTimer).entity, {rendering.get_to(stuff.StreakTimer).entity_offset[1]-0.02, 0.75})
				stuff.StreakTimer.to = {entity=stuff.StreakTimer.to.entity, offset={stuff.StreakTimer.to.offset[1]-0.02, 0.75}}
			end
			if (storage.EntityList[number].LastKill and game.tick > storage.EntityList[number].LastKill + 200) then
				storage.EntityList[number].streak = 0
				stuff.count.visible = false
				stuff.glow.visible = false
				stuff.glow.x_scale = 1
				stuff.glow.y_scale = 1
				stuff.StreakTimerBG.visible = false
				stuff.StreakTimer.visible = false
			end
		else
			storage.EntityList[number] = nil
		end
	end
end)

script.on_event(defines.events.on_entity_died, -- .entity=entity .cause=entity .loot=inventory .force=force .damage_type=damageprototype
function(event)
	if (event.cause and event.damage_type and event.damage_type.name == "ProAsHeck") then
		local properties = storage.EntityList[script.register_on_object_destroyed(event.cause)]
		---- sound stickers ------
		local StickerTarget
		if (event.cause.type == "character" or event.cause.type == "unit" or event.cause.type == "car") then
			StickerTarget = event.cause
		else
			-- only characters, units, and cars can have stickers
			local DestroyNumber = script.register_on_object_destroyed(event.cause)
			if (storage.dummies[DestroyNumber] == nil) then
				storage.dummies[DestroyNumber] = event.cause.surface.create_entity
				{
					name = "CHEEKYSCRUB",
					position = event.cause.position
				}
				storage.dummies[DestroyNumber].destructible = false
				script.register_on_object_destroyed(event.cause)
			end
			StickerTarget = storage.dummies[DestroyNumber]
		end
		----------- applying sound stickers
		local StickerTargetDestroyNumber = script.register_on_object_destroyed(StickerTarget)
		if (storage.stickers[StickerTargetDestroyNumber] == nil) then
			storage.stickers[StickerTargetDestroyNumber] = {BMG = nil, HYPE=nil, MEME1=nil, MEME2=nil, MEME3=nil}
		end
		local stickers = storage.stickers[StickerTargetDestroyNumber]
		-- 1 music track at a time
		if (stickers.BGM == nil or stickers.BGM.valid == false or stickers.BGM.time_to_live < 30) then
			local track = math.random(1,storage.BGMCount)
			stickers.BGM = StickerTarget.surface.create_entity
			{
				name="BGM"..track,
				target=StickerTarget,
				position={420,69}
			}
		end
		-- 1 hype track at a time
		if (stickers.HYPE == nil or stickers.HYPE.valid == false or stickers.HYPE.time_to_live < 30) then
			local track = math.random(1,storage.HYPECount)
			stickers.HYPE = StickerTarget.surface.create_entity
			{
				name="HYPE"..track,
				target=StickerTarget,
				position={420,69}
			}
		end
		-- 3 meme sound effects at once
		if (stickers.MEME1 == nil or stickers.MEME1.valid == false) then
			local track = math.random(1,storage.MEMECount)
			stickers.MEME1 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		elseif (stickers.MEME2 == nil or stickers.MEME2.valid == false) then
			local track = math.random(1,storage.MEMECount)
			stickers.MEME2 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		elseif (stickers.MEME3 == nil or stickers.MEME3.valid == false) then
			local track = math.random(1,storage.MEMECount)
			stickers.MEME3 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		end

		--- kill streak +
		properties.streak = properties.streak+1
		MemeStacks = properties.streak/settings.global["RIP_Leviathan"].value
		properties.LastKill = game.tick
		if (properties.streak > 1) then
			properties.count.visible =  true
			properties.StreakTimer.visible =  true
			properties.StreakTimer.to = {entity=properties.StreakTimer.to.entity, offset={1, 0.75}}
			properties.StreakTimerBG.visible =  true
		end
		if (properties.streak%50 == 0) then
			if (event.cause.type == "character" and event.cause.player) then
				event.cause.player.clear_cursor()
				event.cause.player.cursor_stack.set_stack({name="TACTICLE_NUKE_INCOMING", count=1})
				event.cause.character_build_distance_bonus = event.cause.character_build_distance_bonus + 420
				if (storage.players[event.cause.player.index] == nil) then
					storage.players[event.cause.player.index] = {}
				end
				storage.players[event.cause.player.index].NukeRangeBuff = true
				rendering.draw_rectangle
				{
					color = {0,0,0,0.5},
					left_top = {entity=event.cause, offset={-20, -10}},
					right_bottom = {entity=event.cause, offset={20, -4}},
					filled = true,
					surface = event.cause.surface,
					time_to_live = 60*5
				}
				rendering.draw_text
				{
					text = properties.streak.." KILL STREAK!",
					surface = event.cause.surface,
					target = {entity=event.cause, offset={0,-10.6}},
					color = {1,1,1},
					alignment="center",
					scale = 7,
					time_to_live = 60*5
				}
				rendering.draw_text
				{
					text = "Press LMB for TACTICLE NUKE!",
					surface = event.cause.surface,
					target = {entity=event.cause, offset={0,-7.6}},
					color = {1,1,1},
					alignment="center",
					scale = 7,
					time_to_live = 60*5
				}
			end
		end

		local wow = "!"
		-- for ayy = 1, math.floor(properties.streak/10) do
		-- 	wow = wow.."!"
		-- end
		properties.count.text = {"labels.killstreak", properties.streak..wow}
		properties.glow.visible = true
		properties.glow.x_scale = 1 + 0.5*MemeStacks
		properties.glow.y_scale = 1 + 0.5*MemeStacks

		-- effect on thing killed
		local memeID = math.random(1,storage.RektGFXCount)
		rendering.draw_animation
		{
			animation = "rekt"..memeID,
			target = event.entity.position,
			surface = event.entity.surface.name,
			time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)),
			animation_offset = math.random(0,100),
			x_scale = math.random(1, math.ceil(1 + (settings.global["FXSize_"].value*0.01*MemeStacks))),
			y_scale = math.random(1, math.ceil(1 + (settings.global["FXSize_"].value*0.01*MemeStacks)))
		}

		-- effect on killer
		for i = 1, 1 + math.floor(MemeStacks/settings.global["SaltyRunback"].value) do
			if (math.random(1, settings.global["KillCam"].value) == 1) then
				memeID = math.random(1,storage.PogGFXCount)
				local SpreadRange = 3 + 0.3*MemeStacks
				local offset = {math.random(-SpreadRange ,SpreadRange), math.random(-SpreadRange, SpreadRange)}
				local turnt = math.random(-50,50)*0.01*(1/50)*MemeStacks
				if (memeID == 3 or memeID == 9) then
					turnt = math.random(-30,30)*0.001
				end
				rendering.draw_animation
				{
					animation = "pog"..memeID,
					target = {entity=event.cause, offset=offset},
					orientation = turnt,
					surface = event.cause.surface.name,
					time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)),
					animation_offset = math.random(0,100),
					animation_speed = 1+((math.random(0,100)*0.1)^6/100000),
					x_scale = math.ceil(1 + (settings.global["FXSize_"].value*0.01*MemeStacks)),
					y_scale = math.ceil(1 + (settings.global["FXSize_"].value*0.01*MemeStacks))
				}
			end
		end
	end
end)

script.on_event(defines.events.on_entity_damaged,
function(event)
	if (event.cause and event.damage_type and event.damage_type.name == "ProAsHeck") then
		---- Glowup.png -------
		local DamagerDestroyNumber = script.register_on_object_destroyed(event.cause)
		if (storage.EntityList[DamagerDestroyNumber] == nil) then
			storage.EntityList[DamagerDestroyNumber] = {}
			storage.EntityList[DamagerDestroyNumber].entity = event.cause
			storage.EntityList[DamagerDestroyNumber].streak = 0
			storage.EntityList[DamagerDestroyNumber].glow = rendering.draw_animation
				{
					animation = "MLGglow",
					target = {entity=event.cause, offset={0,-0.75}},
					surface = event.entity.surface.name,
					x_scale = 1,
					y_scale = 1,
					visible = false
				}
			storage.EntityList[DamagerDestroyNumber].count = rendering.draw_text
				{
					text = 0,
					color = {1,1,1},
					scale = 1.25,
					target = event.cause,
					alignment="center",
					surface = event.entity.surface.name,
					visible = false
				}
				storage.EntityList[DamagerDestroyNumber].StreakTimerBG = rendering.draw_line
					{
						color = {0.25,0.25,0.25,1},
						width = 10,
						from = {entity=event.cause, offset={-1.05,0.75}},
						to = {entity=event.cause, offset={1.05,0.75}},
						surface = event.entity.surface.name,
						visible = false
					}
			storage.EntityList[DamagerDestroyNumber].StreakTimer = rendering.draw_line
				{
					color = {0.8,0.8,0.5},
					width = 6,
					from = {entity=event.cause, offset={-1,0.75}},
					to = {entity=event.cause, offset={1,0.75}},
					surface = event.entity.surface.name,
					visible = false
				}
			storage.EntityList[DamagerDestroyNumber].LastKill = 0
		end
		if (storage.EntityList[DamagerDestroyNumber].glow.visible == false) then
			storage.EntityList[DamagerDestroyNumber].glow.visible = true
			storage.EntityList[DamagerDestroyNumber].LastKill = game.tick
		end

		---- setup sound stickers ------
		local StickerTarget = nil
		if (event.cause.type == "character" or event.cause.type == "unit" or event.cause.type == "car") then
			StickerTarget = event.cause
		else
			-- only characters, units, and cars can have stickers
			local DestroyNumber = script.register_on_object_destroyed(event.cause)
			if (storage.dummies[DestroyNumber] == nil) then
				storage.dummies[DestroyNumber] = event.cause.surface.create_entity
				{
					name = "CHEEKYSCRUB",
					position = event.cause.position
				}
				storage.dummies[DestroyNumber].destructible = false
				storage.dummies[DestroyNumber].active = false
				script.register_on_object_destroyed(event.cause)
			end
			StickerTarget = storage.dummies[DestroyNumber]
		end
		----------- applying stickers
		local StickerTargetDestroyNumber = script.register_on_object_destroyed(StickerTarget)
		if (storage.stickers[StickerTargetDestroyNumber] == nil) then
			storage.stickers[StickerTargetDestroyNumber] = {BMG = nil, HYPE=nil, MEME1=nil, MEME2=nil, MEME3=nil}
		end
		local stickers = storage.stickers[StickerTargetDestroyNumber]
		if (stickers.BGM == nil or stickers.BGM.valid == false or stickers.BGM.time_to_live < 30) then
			local track = math.random(1,storage.BGMCount)
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
		if (math.random(1, settings.global["Hitmark"].value) == 1) then
			-- effect on thing killed
			local MemeStacks = storage.EntityList[script.register_on_object_destroyed(event.cause)].streak/settings.global["RIP_Leviathan"].value
			if (math.random(1, settings.global["KillCam"].value) == 1) then
				memeID = math.random(1,storage.RektGFXCount)
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
				if (math.random(1, settings.global["KillCam"].value) == 1) then
					memeID = math.random(1,storage.PogGFXCount)
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
						target = {entity=event.cause, offset=offset},
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

script.on_event(defines.events.on_object_destroyed,
function(event)
	if (storage.dummies[event.registration_number]) then
		storage.dummies[event.registration_number].destroy()
		storage.dummies[event.registration_number] = nil
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
		storage.hover[selected.position.x..","..selected.position.y..selected.surface.name] = rendering.draw_text
		{
			text = {"labels.F"},
			surface = player.surface,
			target = {entity=selected, offset={0,-1.6}},
			color = {1,1,1},
			alignment="center",
			scale = 1.5
		}
	elseif (LastSelected
	and LastSelected.type == "character-corpse"
	and storage.hover[LastSelected.position.x..","..LastSelected.position.y..LastSelected.surface.name]) then
		storage.hover[LastSelected.position.x..","..LastSelected.position.y..LastSelected.surface.name].destroy()
		storage.hover[LastSelected.position.x..","..LastSelected.position.y..LastSelected.surface.name] = nil
	end
end
)

-- On Interact
script.on_event("PayRespects",
function(event)
	local player = game.players[event.player_index]
	if (player.selected and player.selected.type == "character-corpse") then
		local corpse = player.selected
		local registration_number = script.register_on_object_destroyed(corpse)
		if (storage.dummies[registration_number] == nil) then
			storage.dummies[registration_number] = corpse.surface.create_entity
			{
				name = "CHEEKYSCRUB",
				position = corpse.position
			}
			storage.dummies[registration_number].destructible = false
			storage.dummies[registration_number].active = false

		end
		local StickerTarget = storage.dummies[registration_number]
		StickerTarget.surface.create_entity
		{
			name="MEME9",
			target=StickerTarget,
			position={420,69}
		}

		rendering.draw_text
		{
			text = {"RIP.RIP"..math.random(1,8)},
			surface = player.surface,
			target = {entity=player.character, offset={math.random(-10,10)*0.1, math.random(-20,0)*0.1}},
			color = {1,1,1},
			alignment="center",
			time_to_live = 60*2.5
		}
	end
end)


-- DEBUG JUKEBOX
script.on_event("MIXTAPE",
function(event)
	local player = game.players[event.player_index]
	if (player.gui.screen.MLG_RADIO) then
		player.gui.screen.MLG_RADIO.destroy()
	else
		if (player.character) then
			player.play_sound
			{
				path="VINEBOOM",
				volume_modifier=1
			}
			local frame = player.gui.screen.add{type="frame", name="MLG_RADIO", direction="vertical", tags={ID=script.register_on_object_destroyed(player.character)}}
			frame.force_auto_center()
			add_titlebar(player.gui.screen.MLG_RADIO, "MLG DEBUG RADIO", "DEALWITHIT")
			local layout = frame.add{type="table", name="layout", column_count=3}
				--layout.style.font = "heading-1"
				layout.add{type="label", caption="SONGS"}.style.font = "heading-1"
				layout.add{type="label", caption=""}
				layout.add{type="label", caption=""}
				for i = 1, storage.BGMCount do
					layout.add{type="button", caption="BGM"..i, tags={effect="PlayBGM", ID=i, TargetDestroyNumber=script.register_on_object_destroyed(player.character)}}
				end
				for i = 1, 3-storage.BGMCount%3 do
					layout.add{type="label", caption=""}
				end

				layout.add{type="label", caption="FREAKOUTS"}.style.font = "heading-1"
				layout.add{type="label", caption=""}
				layout.add{type="label", caption=""}
				for i = 1, storage.HYPECount do
					layout.add{type="button", caption="HYPE"..i, tags={effect="PlayHYPE", ID=i, TargetDestroyNumber=script.register_on_object_destroyed(player.character)}}
				end
				for i = 1, 3-storage.HYPECount%3 do
					layout.add{type="label", caption=""}
				end

				layout.add{type="label", caption="MEMES"}.style.font = "heading-1"
				layout.add{type="label", caption=""}
				layout.add{type="label", caption=""}
				for i = 1, storage.MEMECount do
					layout.add{type="button", caption="MEME"..i, tags={effect="PlayMEME", ID=i, TargetDestroyNumber=script.register_on_object_destroyed(player.character)}}
				end
			player.opened = frame
		end
	end

end)

script.on_event(defines.events.on_gui_click,
-- element :: LuaGuiElement: The clicked element.
-- player_index :: uint: The player who did the clicking.
-- button :: defines.mouse_button_type: The mouse button used if any.
-- alt :: boolean: If alt was pressed.
-- control :: boolean: If control was pressed.
-- shift :: boolean: If shift was pressed.
function(event)
	local player = game.players[event.player_index]
	local TriggerEffect = event.element.tags.effect
	if (player.character and (TriggerEffect == "PlayBGM" or TriggerEffect == "PlayHYPE" or TriggerEffect == "PlayMEME")) then
		local StickerTargetDestroyNumber = script.register_on_object_destroyed(player.character)
		if (storage.stickers[StickerTargetDestroyNumber] == nil) then
			storage.stickers[StickerTargetDestroyNumber] = {}
		end
		local stickers = storage.stickers[StickerTargetDestroyNumber]
		if (stickers.BGM) then
			stickers.BGM.destroy()
		end
		if (TriggerEffect == "PlayBGM") then
			stickers.BGM = player.character.surface.create_entity
			{
				name="BGM"..event.element.tags.ID,
				target=player.character,
				position={420,69}
			}
		elseif (TriggerEffect == "PlayHYPE") then
			stickers.BGM = player.character.surface.create_entity
			{
				name="HYPE"..event.element.tags.ID,
				target=player.character,
				position={420,69}
			}
		elseif (TriggerEffect == "PlayMEME") then
			stickers.BGM = player.character.surface.create_entity
			{
				name="MEME"..event.element.tags.ID,
				target=player.character,
				position={420,69}
			}
		end
	end
end)


script.on_event(defines.events.on_gui_closed,
function(event)
	local player = game.players[event.player_index]
	if (player.gui.screen.MLG_RADIO) then
		player.gui.screen.MLG_RADIO.destroy()
	end
end)

function add_titlebar(gui, caption, close_button_name)
	local titlebar = gui.add{type = "flow"}
	titlebar.drag_target = gui
	titlebar.add{
		type = "label",
		style = "frame_title",
		caption = caption,
		ignored_by_interaction = true,
	}
	local filler = titlebar.add{
		type = "empty-widget",
		style = "draggable_space",
		ignored_by_interaction = true,
	}
	filler.style.height = 24
	filler.style.horizontally_stretchable = true
	titlebar.add{
		type = "sprite-button",
		name = close_button_name,
		style = "frame_action_button",
		sprite = "utility/close",
		hovered_sprite = "utility/close_black",
		clicked_sprite = "utility/close_black",
		tooltip = {"gui.close-instruction"},
		tags = {RTEffect="RTCloseGUI"}
	}
end

script.on_event(defines.events.on_built_entity, --| built by hand ----,
function(event)
	local entity = event.entity
	local player = game.players[event.player_index]
	if (entity.name == "TACTICLE_NUKE") then
		rendering.draw_animation
		{
			animation = "TACTICLE_NUKE_INCOMING",
			target = {entity.position.x+3, entity.position.y},
			tint = {0.7, 0.7, 0.7, 0.7},
			surface = entity.surface.name,
			render_layer = "above-inserters",
			time_to_live = 60*5.7,
			animation_offset = ((375 - (game.tick%375)) * (175/375)) + 12,
			x_scale = 4,
			y_scale = 4
		}
		entity.surface.play_sound
		{
			path = "NUKE_INCOMING",
			position = entity.position
		}
		player.play_sound
		{
			path = "NUKE_INCOMING",
		}
		entity.surface.create_entity
		{
			name="atomic-rocket",
			position = {entity.position.x, entity.position.y-285},
			target = entity.position
		}
		entity.destroy()
	end
end)

script.on_event(defines.events.on_player_cursor_stack_changed,
function(event)
	local player = game.players[event.player_index]
	if (player.character
	and ((player.cursor_stack.valid_for_read and player.cursor_stack.name ~= "TACTICLE_NUKE_INCOMING") or player.cursor_stack.valid_for_read == false)
	and storage.players[event.player_index]
	and storage.players[event.player_index].NukeRangeBuff == true) then
		player.character.character_build_distance_bonus = player.character.character_build_distance_bonus - 420
		storage.players[event.player_index].NukeRangeBuff = false
	end
end)