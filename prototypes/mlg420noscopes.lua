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
	energy_required = 0.5,
	ingredients = 
		{
			{"iron-plate", 6},
			{"copper-plate", 9}
		},
	result = "headshot"
},

{ --------- hitmark effect ------------
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
},
{
	type = "sound",
	name = "hitmarkerFX",
	filename = "__MLG_FactOreo__/sickw0bs/hitmarker.ogg",
	audible_distance_modifier = 0.5,
	volume = 0.42,
	aggregation =
		{
			max_count = 69,
			remove = false
		}
},

{ ---------------------------- sound bites -----------
	type = "sound",
	name = "wombocombo",
	audible_distance_modifier = 0.6,
	variations=
		{
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/1.ogg",
			volume = 0.46
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/2.ogg",
			volume = 0.41
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/3.ogg",
			volume = 0.73
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/4.ogg",
			volume = 0.46
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/5.ogg",
			volume = 0.63
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/6.ogg",
			volume = 0.63
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/7.ogg",
			volume = 1.5
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/8.ogg",
			volume = 0.6
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/9.ogg",
			volume = 1.5
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/10.ogg",
			volume = 1.5
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/11.ogg",
			volume = 0.63
			}
		},
	aggregation =
		{
			max_count = 3,
			remove = true,
			count_already_playing = true
		}
},

{ ------------ OOOOOOOOOHHHHHHHHHHH -------------
	type = "sound",
	name = "ooooo",
	audible_distance_modifier = 0.6,
	variations=
		{
			{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/1.ogg",
			volume = 0.31
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/2.ogg",
			volume = 0.36
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/3.ogg",
			volume = 0.63
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/4.ogg",
			volume = 0.63
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/5.ogg",
			volume = 0.63
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/6.ogg",
			volume = 0.63
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/7.ogg",
			volume = 0.63
			}
		},
	aggregation =
		{
			max_count = 1,
			remove = true,
			count_already_playing = true,
			progress_threshold = 0.9
		}
},

{ ---------------------BGM-----------------
	type = "sound",
	name = "backtrack",
	audible_distance_modifier = 0.75,
	variations=
		{
			{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/1.ogg",
			volume = 0.41
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/2.ogg",
			volume = 0.75
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/3.ogg",
			volume = 0.75
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/4.ogg",
			volume = 0.75
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/5.ogg",
			volume = 1.23
			},
			{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/6.ogg",
			volume = 1.23
			}
		},
	aggregation =
		{
			max_count = 1,
			remove = true,
			count_already_playing = true,
			progress_threshold = 0.95
		}
},

{
	type = "animation",
	name = "MLGglow",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/circle.png",
	size = 64,
	frame_count = 50,
	line_length = 5,
	animation_speed = 0.9
},
-------------------------------------
{
	type = "animation",
	name = "pog1",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/rainbowfrog.png",
	size = 64,
	frame_count = 20,
	line_length = 5,
	animation_speed = 0.33333
},
{
	type = "animation",
	name = "pog2",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/airhorn.png",
	size = 64,
	frame_count = 35,
	line_length = 5,
	animation_speed = 0.5
},
{
	type = "animation",
	name = "pog3",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/FXSpam.png",
	size = {227,128},
	frame_count = 25,
	line_length = 5,
	animation_speed = 0.5
},
{
	type = "animation",
	name = "pog4",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/snoop.png",
	size = 64,
	frame_count = 24,
	line_length = 6,
	animation_speed = 0.5
},
{
	type = "animation",
	name = "pog5",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/steve.png",
	size = {64,78},
	frame_count = 33,
	line_length = 3,
	animation_speed = 0.3
},
{
	type = "animation",
	name = "pog6",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/mtndw.png",
	size = 64,
	frame_count = 40,
	line_length = 5,
	animation_speed = 0.3
},
{
	type = "animation",
	name = "pog7",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/dorito.png",
	size = 64,
	frame_count = 40,
	line_length = 5,
	animation_speed = 0.3
},
{
	type = "animation",
	name = "pog8",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/blunt.png",
	size = 64,
	frame_count = 42,
	line_length = 6,
	animation_speed = 2
},
{
	type = "animation",
	name = "pog9",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/flare.png",
	size = {227,128},
	frame_count = 25,
	line_length = 5,
	animation_speed = 0.4
},
{
	type = "animation",
	name = "pog10",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/doge.png",
	size = {64,78},
	frame_count = 30,
	line_length = 5,
	animation_speed = 0.3
},
{
	type = "animation",
	name = "pog11",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/FX/deal.png",
	size = {621,64},
	frame_count = 40,
	line_length = 5,
	animation_speed = 0.25,
	scale = 0.2
},
------------------
{
	type = "animation",
	name = "rekt1",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/scoped.png",
	size = 64,
	frame_count = 20,
	line_length = 5,
	animation_speed = 0.33333,
	scale = 1.5
},
{
	type = "animation",
	name = "rekt2",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/boom.png",
	size = 64,
	frame_count = 24,
	line_length = 4,
	animation_speed = 0.3,
	scale = 1.5
},
{
	type = "animation",
	name = "rekt3",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/rekt.png",
	size = 64,
	frame_count = 50,
	line_length = 5,
	animation_speed = 0.5,
	scale = 1.5
},
{
	type = "animation",
	name = "rekt4",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/ooohhh.png",
	size = {142,80},
	frame_count = 45,
	line_length = 5,
	animation_speed = 0.5
},
{
	type = "animation",
	name = "rekt5",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/AL.png",
	size = {125,100},
	frame_count = 4,
	line_length = 4,
	animation_speed = 0.2,
	scale = 0.8
},
{
	type = "animation",
	name = "rekt6",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/1v1me.png",
	size = {147,64},
	frame_count = 6,
	line_length = 3,
	animation_speed = 0.3,
	scale = 0.6
},
{
	type = "animation",
	name = "rekt7",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/boom2.png",
	size = {64,90},
	frame_count = 17,
	line_length = 1,
	animation_speed = 0.3
},
{
	type = "animation",
	name = "rekt8",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/ko.png",
	size = {113,64},
	frame_count = 25,
	line_length = 5,
	animation_speed = 0.3
},
{
	type = "animation",
	name = "rekt9",
	filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/rekt/wasted.png",
	size = {192,64},
	frame_count = 6,
	line_length = 3,
	animation_speed = 0.3,
	scale = 0.5
}

})
table.insert(data.raw["technology"]["military"].effects,{type="unlock-recipe",recipe="awwman"})	
table.insert(data.raw["technology"]["military"].effects,{type="unlock-recipe",recipe="thegoods"})	