script.on_init( -- new saves
function()
	if (global.EntityList == nil) then
		global.EntityList = {}		
	end
end)

script.on_configuration_changed( -- existing saves/mod update
function()
	if (global.EntityList == nil) then
		global.EntityList = {}		
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

script.on_nth_tick(60, 
function(event)
	for number, entity in pairs(global.EntityList) do
		if (global.EntityList[number].streak == nil) then
			global.EntityList[number].streak = 0
		elseif (global.EntityList[number].streak > 0) then
			global.EntityList[number].streak = global.EntityList[number].streak-1
		end
	end
end)

script.on_event(defines.events.on_entity_died, -- .entity=entity .cause=entity .loot=inventory .force=force .damage_type=damageprototype
function(event)
if (event.damage_type and event.damage_type.name == "ProAsHeck") then
	event.entity.surface.play_sound
		{
			path = "backtrack",
			position = event.cause.position,
			volume_modifier = settings.global["S1ckw0bS"].value
		}
	event.entity.surface.play_sound
		{
			path = "wombocombo",
			position = event.cause.position,
			volume_modifier = settings.global["S1ckw0bS"].value
		}
	event.entity.surface.play_sound
		{
			path = "ooooo",
			position = event.cause.position,
			volume_modifier = settings.global["S1ckw0bS"].value
		}
	if (global.EntityList[event.cause.unit_number].streak < settings.global["HypeMax"].value) then
		global.EntityList[event.cause.unit_number].streak = global.EntityList[event.cause.unit_number].streak+1
	end
	
	if (math.random(1,settings.global["KillCam"].value) == 1) then
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
	end

	if (math.random(1,settings.global["KillCam"].value) == 1) then
		memeID = math.random(1,11)
		if (memeID == 3 or memeID == 9) then
			offset = {0,-1}
		else
			offset = {math.random(-settings.global["FXSpread"].value,settings.global["FXSpread"].value), math.random(-settings.global["FXSpread"].value,settings.global["FXSpread"].value)}
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

script.on_event(defines.events.on_entity_damaged,
function(event)
if (event.cause and event.damage_type and event.damage_type.name == "ProAsHeck") then
	if (global.EntityList[event.cause.unit_number] == nil) then
		global.EntityList[event.cause.unit_number] = {}
		global.EntityList[event.cause.unit_number].LastHit = 0
		global.EntityList[event.cause.unit_number].streak = 0
	end
	
	event.entity.surface.play_sound
		{
			path = "backtrack",
			position = event.cause.position,
			volume_modifier = settings.global["S1ckw0bS"].value
		}
	event.entity.surface.play_sound
		{
			path = "hitmarkerFX",
			position = event.cause.position,
			volume_modifier = settings.global["S1ckw0bS"].value
		}
		
	if (game.tick-global.EntityList[event.cause.unit_number].LastHit > 120) then	
		rendering.draw_animation
			{
				animation = "MLGglow",
				target = event.cause,
				target_offset = {0,-0.75},
				--render_layer = 128, -- this would put it under the player
				surface = event.entity.surface.name,
				time_to_live = 150,
				x_scale = 1+ 0.5*global.EntityList[event.cause.unit_number].streak,
				y_scale = 1+ 0.5*global.EntityList[event.cause.unit_number].streak
			}
		global.EntityList[event.cause.unit_number].LastHit = game.tick
	end
	
	
	if (math.random(1,settings.global["Hitmark"].value) == 1) then

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

		memeID = math.random(1,11)
		if (memeID == 3 or memeID == 9) then
			offset = {0,-1}
		else
			offset = {math.random(-settings.global["FXSpread"].value,settings.global["FXSpread"].value), math.random(-settings.global["FXSpread"].value,settings.global["FXSpread"].value)}
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







