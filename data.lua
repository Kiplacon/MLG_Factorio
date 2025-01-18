BGM_Base = 1.3
HYPE_Base = 1
MEME_Base = 1
AllMultiplier = 0.7

require("prototypes.gunz") --sniper rifle and meme magazines
require("prototypes.FX") --animations
require("prototypes.mlg420noscopes") --sticker dummy

require("prototypes.SFX_killcam")
require("prototypes.SFX_music")
require("prototypes.SFX_hype")

data:extend({
  {
    type = "custom-input",
    name = "PayRespects",
    key_sequence = "F"
}
})
