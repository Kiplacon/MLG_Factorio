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
if (event.damage_type.name == "ProAsHeck") then
	event.entity.surface.play_sound
		{
			path = "backtrack",
			position = event.cause.position
		}
	event.entity.surface.play_sound
		{
			path = "wombocombo",
			position = event.cause.position
		}
	event.entity.surface.play_sound
		{
			path = "ooooo",
			position = event.cause.position
		}
	if (global.EntityList[event.cause.unit_number].streak < 11) then
		global.EntityList[event.cause.unit_number].streak = global.EntityList[event.cause.unit_number].streak+1
	end
	
	if (math.random(1,2) == 1) then
		memeID = math.random(1,9)
		rendering.draw_animation
		{
			animation = "rekt"..memeID,
			target = event.entity.position,
			surface = event.entity.surface.name,
			time_to_live = 60
		}
	end

	if (math.random(1,3) == 3) then
		memeID = math.random(1,11)
		if (memeID == 3 or memeID == 9) then
			offset = {0,-1}
		else
			offset = {math.random(-3,3), math.random(-3,3)}
		end
		rendering.draw_animation
		{
			animation = "pog"..memeID,
			target = event.cause,
			target_offset = offset,
			surface = event.cause.surface.name,
			time_to_live = 100
		}
	end
end
end)

script.on_event(defines.events.on_entity_damaged,
function(event)
if (event.cause and event.damage_type.name == "ProAsHeck") then
	if (global.EntityList[event.cause.unit_number] == nil) then
		global.EntityList[event.cause.unit_number] = {}
		global.EntityList[event.cause.unit_number].LastHit = 0
		global.EntityList[event.cause.unit_number].streak = 0
	end
	
	event.entity.surface.play_sound
		{
			path = "backtrack",
			position = event.cause.position
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
end	
end)







