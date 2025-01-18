data:extend({
--------------- dummy (like you lol) -----------------
{
	type = "unit",
	name = "CHEEKYSCRUB",
	icon = "__base__/graphics/icons/wooden-chest.png",
	icon_size = 1,
	run_animation =
	{
		direction_count = 1,
		filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/hitmarker.png",
		size = 1
	},
	attack_parameters =
	{
		type = "beam",-- of the steel variety
		range = 69,
		cooldown = 420,
		ammo_type = {category = "bullet"},
		ammo_category = "bullet",
		animation =
			{
				direction_count = 1,
				filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/hitmarker.png",
				size = 1
			},
	},
	movement_speed = 0,
	distance_per_frame = 0,
	--pollution_to_join_attack = 0,
	distraction_cooldown = 0,
	vision_distance = 0
},
------ XXXXXXXXXXXXXXXXX-----------
{
	type = "sound",
	name = "hitmarkerFX",
	filename = "__MLG_FactOreo__/sickw0bs/hitmarker.ogg",
	--audible_distance_modifier = 0.5,
	volume = 0.42*AllMultiplier*settings.startup["S1ckw0bS"].value,
	aggregation =
		{
			max_count = 69,
			remove = false
		}
},

})

