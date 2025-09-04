local palette = require("suazppuccin.palettes").get_palette "macchiato"
local presets = require "suazppuccin.utils.reactive"
local darken = require("suazppuccin.utils.colors").darken

local preset = presets.cursorline("suazppuccin-macchiato-cursorline", palette)

preset.static.winhl.inactive.CursorLine = { bg = darken(palette.surface0, 0.8) }
preset.static.winhl.inactive.CursorLineNr = { bg = darken(palette.surface0, 0.8) }

return preset
