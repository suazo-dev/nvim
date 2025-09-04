local M = {}

function M.apply(flavour)
	flavour = flavour or require("suazppuccin").flavour

	local _O, _C, _U = O, C, U -- Borrowing global var (setfenv doesn't work with require)
	O = require("suazppuccin").options
	C = require("suazppuccin.palettes").get_palette(flavour)
	U = require "suazppuccin.utils.colors"

	C.none = "NONE"

	local dim_percentage = O.dim_inactive.percentage
	C.dim = O.dim_inactive.shade == "dark"
			and U.vary_color(
				{ latte = U.darken(C.base, dim_percentage, C.mantle) },
				U.darken(C.base, dim_percentage, C.mantle)
			)
		or U.vary_color(
			{ latte = U.lighten("#FBFCFD", dim_percentage, C.base) },
			U.lighten(C.surface0, dim_percentage, C.base)
		)

	local theme = {}
	theme.syntax = require("suazppuccin.groups.syntax").get()
	theme.editor = require("suazppuccin.groups.editor").get()
	local final_integrations = {}

	-- https://github.com/suazppuccin/nvim/pull/624
	if type(O.integrations.dap) == "table" and O.integrations.dap.enable_ui ~= nil then
		O.integrations.dap_ui = O.integrations.dap.enable_ui
		O.integrations.dap.enable_ui = nil
	end

	for integration in pairs(O.integrations) do
		local cot = false
		if type(O.integrations[integration]) == "table" then
			if O.integrations[integration].enabled == true then cot = true end
		else
			if O.integrations[integration] == true then
				local default = require("suazppuccin").default_options.integrations[integration]
				O.integrations[integration] = type(default) == "table" and default or {}
				O.integrations[integration].enabled = true
				cot = true
			end
		end

		local ok, result = pcall(require, "suazppuccin.groups.integrations." .. integration)
		if ok and result.get and cot then
			final_integrations = vim.tbl_deep_extend("force", final_integrations, result.get())
		end
	end

	theme.integrations = final_integrations -- plugins
	theme.terminal = require("suazppuccin.groups.terminal").get() -- terminal colors
	local user_highlights = O.highlight_overrides
	if type(user_highlights[flavour]) == "function" then user_highlights[flavour] = user_highlights[flavour](C) end
	theme.custom_highlights = vim.tbl_deep_extend(
		"keep",
		user_highlights[flavour] or {},
		type(user_highlights.all) == "function" and user_highlights.all(C) or user_highlights.all or {}
	)

	O, C, U = _O, _C, _U -- Returning global var

	return theme
end

return M
