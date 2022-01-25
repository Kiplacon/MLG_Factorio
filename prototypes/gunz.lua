data:extend({
{------------intervention-------------
	type = "gun",
	name = "creeper",
	icon = "__MLG_FactOreo__/graphics/smokeweedeveryday/getnoscoped.png",
	icon_size = 64,
	subgroup = "gun",
	order = "a[basic-clips]-d[pistol]",
	attack_parameters =
	{
	  type = "projectile",
	  ammo_category = "bullet",
	  cooldown = 100,
	  movement_slow_down_factor = 0.69,
	  movement_slow_down_cooldown = 69,
	  damage_modifier = 5.2,
	  shell_particle =
	  {
		name = "shell-particle",
		direction_deviation = 0.1,
		speed = 0.1,
		speed_deviation = 0.03,
		center = {0, 0.1},
		creation_distance = -0.5,
		starting_frame_speed = 0.4,
		starting_frame_speed_deviation = 0.1
	  },
	  projectile_creation_distance = 1.125,
	  range = 69,
	  sound =
		{
		type = "sound",
		name = "boomheadshot",
		filename = "__MLG_FactOreo__/sickw0bs/intervention-mw2.ogg",
		audible_distance_modifier = 1,
		volume = 0.7,
		aggregation =
			{
				max_count = 3,
				remove = true,
				count_already_playing = true
			}
		}
	},
	stack_size = 69
},

{ --------- intervention recipie ----------
	type = "recipe",
	name = "awwman",
	enabled = false,
	energy_required = 0.5,
	ingredients =
		{
			{"iron-plate", 69},
			{"copper-plate", 69}
		},
	result = "creeper"
},

{ ---- damage type -----
	type = "damage-type",
	name = "ProAsHeck"
},

{ --------- ammo ------------
	type = "ammo",
	name = "headshot",
	icon = "__MLG_FactOreo__/graphics/smokeweedeveryday/MemeMagazine.png",
	icon_size = 64, icon_mipmaps = 4,
	ammo_type =
	{
	  category = "bullet",
	  action =
	  {
		{
		  type = "direct",
		  action_delivery =
		  {
			{
			  type = "instant",
			  source_effects =
			  {
				{
				  type = "create-explosion",
				  entity_name = "explosion-gunshot"
				}
			  },
			  target_effects = --------------- create hitmark effect
			  {
				{
				  type = "create-entity",
				  entity_name = "hitmarker",
				  offsets = {{0, 1}},
				  offset_deviation = {{-1, -1}, {1, 1}} --{{-0.5, -0.5}, {0.5, 0.5}}
				},
				{
				  type = "damage",
				  damage = { amount = 6.9 , type = "ProAsHeck"}
				}
			  }
			}
		  }
		}
	  }
	},
	magazine_size = 10,
	subgroup = "ammo",
	order = "a[basic-clips]-a[firearm-magazine]",
	stack_size = 200
},

{ --------- ammo recipie ----------
	type = "recipe",
	name = "thegoods",
	enabled = false,
	energy_required = 2,
	ingredients =
		{
			{"iron-plate", 6},
			{"copper-plate", 9}
		},
	result = "headshot",
	result_count = 2
},

{ --------- hitmark effect the meme bullets use------------
	type = "explosion",
	name = "hitmarker",
	flags = {"not-on-map"},
	subgroup = "explosions",
	animations =
	{
	  filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/hitmarker.png",
	  width = 64,
	  height = 64,
	  line_length = 1,
	  frame_count = 1,
	  animation_speed = 0.1,
	  scale = 0.5
	},
	light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
	smoke = "smoke-fast",
	smoke_count = 1,
	smoke_slow_down_factor = 1
}
})
table.insert(data.raw["technology"]["military"].effects,{type="unlock-recipe",recipe="awwman"})
table.insert(data.raw["technology"]["military"].effects,{type="unlock-recipe",recipe="thegoods"})
