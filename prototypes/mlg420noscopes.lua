local BGM_Base = 1.2
local HYPE_Base = 1
local MEME_Base = 1
local AllMultiplier = 0.7

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
		animation =
			{
				direction_count = 1,
				filename = "__MLG_FactOreo__/graphics/smokeweedeveryday/hitmarker.png",
				size = 1
			},
	},
	movement_speed = 0,
	distance_per_frame = 0,
	pollution_to_join_attack = 0,
	distraction_cooldown = 0,
	vision_distance = 0
},
------ XXXXXXXXXXXXXXXXX-----------
{
	type = "sound",
	name = "hitmarkerFX",
	filename = "__MLG_FactOreo__/sickw0bs/hitmarker.ogg",
	audible_distance_modifier = 0.5,
	volume = 0.42*AllMultiplier*settings.startup["S1ckw0bS"].value,
	aggregation =
		{
			max_count = 69,
			remove = false
		}
},
---------------------------- sound bites -----------------------
{
	type = "sticker",
	name = "MEME1",
	duration_in_ticks = math.floor(60*2.9),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/AIRHORN.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME2",
	duration_in_ticks = math.floor(60*4.9),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/OHBABYATRIPLE.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME3",
	duration_in_ticks = math.floor(60*2.2),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/WHATCHASAY.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME4",
	duration_in_ticks = math.floor(60*1.9),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/SMOKEWEEDEVERYDAY.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME5",
	duration_in_ticks = math.floor(60*1.1),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/HAPPYFEET.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME6",
	duration_in_ticks = math.floor(60*1.2),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/WOMBOCOMBO.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME7",
	duration_in_ticks = math.floor(60*5.25),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/CANTSEEME.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME8",
	duration_in_ticks = math.floor(60*0.43),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/PUNCH.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME9",
	duration_in_ticks = math.floor(60*4.85),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/SADBELLS.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME10",
	duration_in_ticks = math.floor(60*2),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/EXPLOSION1.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "MEME11",
	duration_in_ticks = math.floor(60*1),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/killcam/DAMNSON.ogg",
			volume = MEME_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},



------------ OOOOOOOOOHHHHHHHHHHH -------------
{
	type = "sticker",
	name = "HYPE1",
	duration_in_ticks = math.floor(60*3.4),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/1.ogg",
			volume = HYPE_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "HYPE2",
	duration_in_ticks = math.floor(60*3),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/2.ogg",
			volume = HYPE_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "HYPE3",
	duration_in_ticks = math.floor(60*10.8),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/3.ogg",
			volume = HYPE_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "HYPE4",
	duration_in_ticks = math.floor(60*5.8),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/4.ogg",
			volume = HYPE_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "HYPE5",
	duration_in_ticks = math.floor(60*7.3),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/5.ogg",
			volume = HYPE_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "HYPE6",
	duration_in_ticks = math.floor(60*8.7),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/6.ogg",
			volume = HYPE_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "HYPE7",
	duration_in_ticks = math.floor(60*11),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/ooooo/7.ogg",
			volume = HYPE_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},

----------------- "music" ------------
{
	type = "sticker",
	name = "BGM1",
	duration_in_ticks = math.floor(60*9.08),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/BANGARANG.ogg",
			volume = BGM_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "BGM2",
	duration_in_ticks = math.floor(60*13.9),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/BARELYALIVE.ogg",
			volume = BGM_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "BGM3",
	duration_in_ticks = math.floor(60*8.8),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/COMEANDGETIT.ogg",
			volume = BGM_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "BGM4",
	duration_in_ticks = math.floor(60*9.2),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/COMEANDGETIT2.ogg",
			volume = BGM_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "BGM5",
	duration_in_ticks = math.floor(60*11.6),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/GETBLAZED.ogg",
			volume = BGM_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
},
{
	type = "sticker",
	name = "BGM6",
	duration_in_ticks = math.floor(60*11.4),
	working_sound =
	{
		sound =
		{
			filename = "__MLG_FactOreo__/sickw0bs/yoskrilldropithard/MYHOPEWILLNEVERDIE.ogg",
			volume = BGM_Base*AllMultiplier*settings.startup["S1ckw0bS"].value,
			audible_distance_modifier = 0.6,
			max_sounds_per_type = 1,
			aggregation =
				{
					max_count = 1,
					remove = true,
					count_already_playing = true,
					progress_threshold = 0.95
				}
		},
		use_doppler_shift = false
	}
}

})
