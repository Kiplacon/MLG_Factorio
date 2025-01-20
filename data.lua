BGM_Base = 1.5
HYPE_Base = 0.95
MEME_Base = 1.1
AllMultiplier = 0.7

require("prototypes.gunz") --sniper rifle and meme magazines
require("prototypes.FX") --animations
require("prototypes.mlg420noscopes") --sticker dummy
require("prototypes.tech") --tech

require("prototypes.SFX_killcam")
require("prototypes.SFX_music")
require("prototypes.SFX_hype")

data:extend({
{
  type = "custom-input",
  name = "PayRespects",
  key_sequence = "F"
},
{
  type = "custom-input",
  name = "MIXTAPE",
  key_sequence = "SHIFT + EQUALS",
  order="zzz"
},
{
  type = "sound",
  name = "VINEBOOM",
  filename = "__MLG_FactOreo__/sickw0bs/VineBoom.ogg",
  volume = 1.0
}
})
