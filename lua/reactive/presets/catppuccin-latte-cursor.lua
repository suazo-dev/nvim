local palette = require("suazppuccin.palettes").get_palette "latte"
local presets = require "suazppuccin.utils.reactive"

local preset = presets.cursor("suazppuccin-latte-cursor", palette)

preset.modes.R.hl.ReactiveCursor = { bg = palette.flamingo }

return preset
