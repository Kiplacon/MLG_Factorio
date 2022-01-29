local BGMScan = true
local count = 1
while (BGMScan == true) do
	if (data.raw.sticker["BGM"..count]) then
		count = count+1
	else
		data:extend{(
			{
				type = "recipe",
				name = "MLG_SickW0bs",
				enabled = false,
				hidden = true,
				emissions_multiplier = count-1,
				ingredients =
					{
						{"infinity-chest", 360}
					},
				result = "infinity-chest"
			}
		)}
		BGMScan = false
	end
end

local HYPEScan = true
local count = 1
while (HYPEScan == true) do
	if (data.raw.sticker["HYPE"..count]) then
		count = count+1
	else
		data:extend{(
			{
				type = "recipe",
				name = "MLG_Euphoria",
				enabled = false,
				hidden = true,
				emissions_multiplier = count-1,
				ingredients =
					{
						{"infinity-chest", 360}
					},
				result = "infinity-chest"
			}
		)}
		HYPEScan = false
	end
end

local MEMEScan = true
local count = 1
while (MEMEScan == true) do
	if (data.raw.sticker["MEME"..count]) then
		count = count+1
	else
		data:extend{(
			{
				type = "recipe",
				name = "MLG_Maymays",
				enabled = false,
				hidden = true,
				emissions_multiplier = count-1,
				ingredients =
					{
						{"infinity-chest", 360}
					},
				result = "infinity-chest"
			}
		)}
		MEMEScan = false
	end
end
