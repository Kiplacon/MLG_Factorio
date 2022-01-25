script.on_init( -- new saves
function()
	global.EntityList = {}
	global.stickers = {}
	global.dummies = {}
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
	for _, force in pairs(game.forces) do
	  force.reset_recipes()
	  force.reset_technologies()

	  -- create tech/recipe table once
	  local techs = force.technologies
	  local recipes = force.recipes

	  if techs["military"].researched then
		recipes["awwman"].enabled = true
		recipes["thegoods"].enabled = true
	  end
	end
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
			local track = math.random(1,6)
			stickers.BGM = StickerTarget.surface.create_entity
			{
				name="BGM"..track,
				target=StickerTarget,
				position={420,69}
			}
		end
		if (stickers.HYPE == nil or stickers.HYPE.valid == false or stickers.HYPE.time_to_live < 20) then
			local track = math.random(1,7)
			stickers.HYPE = StickerTarget.surface.create_entity
			{
				name="HYPE"..track,
				target=StickerTarget,
				position={420,69}
			}
		end
		if (stickers.MEME1 == nil or stickers.MEME1.valid == false) then
			local track = math.random(1,11)
			stickers.MEME1 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		elseif (stickers.MEME2 == nil or stickers.MEME2.valid == false) then
			local track = math.random(1,11)
			stickers.MEME2 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		elseif (stickers.MEME3 == nil or stickers.MEME3.valid == false) then
			local track = math.random(1,11)
			stickers.MEME3 = StickerTarget.surface.create_entity
			{
				name="MEME"..track,
				target=StickerTarget,
				position={420,69}
			}
		end

		--- kill streak +
		if (global.EntityList[event.cause.unit_number].streak < settings.global["HypeMax"].value - 1) then
			global.EntityList[event.cause.unit_number].streak = global.EntityList[event.cause.unit_number].streak+1
			global.EntityList[event.cause.unit_number].LastKill = game.tick
			if (global.EntityList[event.cause.unit_number].streak > 1) then
				rendering.set_visible(global.EntityList[event.cause.unit_number].count, true)
				rendering.set_visible(global.EntityList[event.cause.unit_number].StreakTimer, true)
				rendering.set_to(global.EntityList[event.cause.unit_number].StreakTimer, rendering.get_to(global.EntityList[event.cause.unit_number].StreakTimer).entity, {1, 0.75})
				rendering.set_visible(global.EntityList[event.cause.unit_number].StreakTimerBG, true)
			end
			rendering.set_text(global.EntityList[event.cause.unit_number].count, {"labels.killstreak", global.EntityList[event.cause.unit_number].streak})
			rendering.set_visible(global.EntityList[event.cause.unit_number].glow, true)
		else
			global.EntityList[event.cause.unit_number].streak = global.EntityList[event.cause.unit_number].streak+1
			global.EntityList[event.cause.unit_number].LastKill = game.tick
			rendering.set_to(global.EntityList[event.cause.unit_number].StreakTimer, rendering.get_to(global.EntityList[event.cause.unit_number].StreakTimer).entity, {1, 0.75})
			rendering.set_text(global.EntityList[event.cause.unit_number].count, {"labels.maxkillstreak", global.EntityList[event.cause.unit_number].streak})
		end
		rendering.set_x_scale(global.EntityList[event.cause.unit_number].glow, 1 + 0.5*global.EntityList[event.cause.unit_number].streak)
		rendering.set_y_scale(global.EntityList[event.cause.unit_number].glow, 1 + 0.5*global.EntityList[event.cause.unit_number].streak)

		local FriedFactor = global.EntityList[event.cause.unit_number].streak / settings.global["HypeMax"].value
		if (FriedFactor > 1) then
			FriedFactor = 1
		end

		-- effect on thing killed
		if (math.random(1,settings.global["KillCam"].value) == 1) then
			memeID = math.random(1,9)
			rendering.draw_animation
			{
				animation = "rekt"..memeID,
				target = event.entity.position,
				surface = event.entity.surface.name,
				time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)*FriedFactor),
				animation_offset = math.random(0,100),
				x_scale = settings.global["FXSize"].value,
				y_scale = settings.global["FXSize"].value
			}
		end
		-- effect on killer
		for i = 1, math.floor((1+global.EntityList[event.cause.unit_number].streak)/10) do
			if (math.random(1,settings.global["KillCam"].value) == 1) then
				memeID = math.random(1,11)
				if (memeID == 3 or memeID == 9) then
					offset = {0,-1}
				else
					local SpreadRange = settings.global["FXSpread"].value + 0.3*global.EntityList[event.cause.unit_number].streak
					if (global.EntityList[event.cause.unit_number].streak > settings.global["HypeMax"].value) then
						SpreadRange = settings.global["FXSpread"].value + 0.3*settings.global["HypeMax"].value
					end
					offset = {math.random(-SpreadRange ,SpreadRange), math.random(-SpreadRange, SpreadRange)}
				end
				rendering.draw_animation
				{
					animation = "pog"..memeID,
					target = event.cause,
					target_offset = offset,
					orientation = math.random(0,100)*0.01*FriedFactor,
					surface = event.cause.surface.name,
					time_to_live = settings.global["FXTime"].value * (1+(math.random(1,20)*0.1)*FriedFactor),
					animation_offset = math.random(0,100),
					animation_speed = 1+(math.random(0,90)^2/900)*FriedFactor,
					x_scale = settings.global["FXSize"].value * (2*FriedFactor),
					y_scale = settings.global["FXSize"].value * (2*FriedFactor)
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
			local track = math.random(1,6)
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
			---- effect on target
			memeID = math.random(1,9)
			rendering.draw_animation
			{
				animation = "rekt"..memeID,
				target = event.entity.position,
				surface = event.entity.surface.name,
				time_to_live = settings.global["FXTime"].value,
				x_scale = settings.global["FXSize"].value,
				y_scale = settings.global["FXSize"].value
			}
			---- effect around attacker
			memeID = math.random(1,11)
			if (memeID == 3 or memeID == 9) then
				offset = {0,-1}
			else
				local SpreadRange = settings.global["FXSpread"].value + 0.5*global.EntityList[event.cause.unit_number].streak
				offset = {math.random(-SpreadRange ,SpreadRange), math.random(-SpreadRange, SpreadRange)}
			end
			rendering.draw_animation
			{
				animation = "pog"..memeID,
				target = event.cause,
				target_offset = offset,
				surface = event.cause.surface.name,
				time_to_live = settings.global["FXTime"].value,
				x_scale = settings.global["FXSize"].value,
				y_scale = settings.global["FXSize"].value
			}
		end
	end
end)

script.on_event(defines.events.on_entity_destroyed,
function(event)
	if (global.dummies[event.unit_number]) then
		global.dummies[event.unit_number].destroy()
	end
end
)
