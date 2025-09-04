local function reload()
	for name, _ in pairs(package.loaded) do
		if name:match "^suazppuccin" then package.loaded[name] = nil end
	end
	vim.g.suazppuccin_flavour = nil
	vim.cmd [[highlight clear]]
end

-- TODO: Move this to setup_spec
describe("get palette", function()
	before_each(function() reload() end)
	it("before setup", function()
		assert.equals(pcall(function() require("suazppuccin.palettes").get_palette() end), true)
	end)
	it("after setup", function()
		require("suazppuccin").setup()
		assert.equals(pcall(function() require("suazppuccin.palettes").get_palette() end), true)
	end)
end)
