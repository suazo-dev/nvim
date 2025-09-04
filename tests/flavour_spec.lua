local function reload()
	for name, _ in pairs(package.loaded) do
		if name:match "^suazppuccin" then package.loaded[name] = nil end
	end
	vim.g.suazppuccin_flavour = nil
	vim.cmd [[highlight clear]]
end

describe("set background to", function()
	before_each(function()
		reload()
		vim.cmd.colorscheme "suazppuccin"
	end)
	it("light", function()
		vim.o.background = "light"
		assert.equals("suazppuccin-latte", vim.g.colors_name)
	end)
	it("dark", function()
		vim.o.background = "dark"
		assert.equals("suazppuccin-mocha", vim.g.colors_name)
	end)
end)

describe("respect vim.o.background =", function()
	before_each(function() reload() end)
	it("light", function()
		vim.o.background = "light"
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-latte", vim.g.colors_name)
	end)
	it("dark", function()
		vim.o.background = "dark"
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-mocha", vim.g.colors_name)
	end)
end)

describe("change flavour to", function()
	before_each(function() reload() end)
	it("latte", function()
		vim.cmd.colorscheme "suazppuccin-latte"
		assert.equals("suazppuccin-latte", vim.g.colors_name)
	end)
	it("frappe", function()
		vim.cmd.colorscheme "suazppuccin-frappe"
		assert.equals("suazppuccin-frappe", vim.g.colors_name)
	end)
	it("macchiato", function()
		vim.cmd.colorscheme "suazppuccin-macchiato"
		assert.equals("suazppuccin-macchiato", vim.g.colors_name)
	end)
	it("mocha", function()
		vim.cmd.colorscheme "suazppuccin-mocha"
		assert.equals("suazppuccin-mocha", vim.g.colors_name)
	end)
end)

describe("respect setup flavour =", function()
	before_each(function() reload() end)
	it("latte", function()
		require("suazppuccin").setup { flavour = "latte" }
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-latte", vim.g.colors_name)
	end)
	it("frappe", function()
		require("suazppuccin").setup { flavour = "frappe" }
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-frappe", vim.g.colors_name)
	end)
	it("macchiato", function()
		require("suazppuccin").setup { flavour = "macchiato" }
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-macchiato", vim.g.colors_name)
	end)
	it("mocha", function()
		require("suazppuccin").setup { flavour = "mocha" }
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-mocha", vim.g.colors_name)
	end)
end)

describe("(deprecated) respect vim.g.suazppuccin_flavour =", function()
	before_each(function() reload() end)
	it("latte", function()
		vim.g.suazppuccin_flavour = "latte"
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-latte", vim.g.colors_name)
	end)
	it("frappe", function()
		vim.g.suazppuccin_flavour = "frappe"
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-frappe", vim.g.colors_name)
	end)
	it("macchiato", function()
		vim.g.suazppuccin_flavour = "macchiato"
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-macchiato", vim.g.colors_name)
	end)
	it("mocha", function()
		vim.g.suazppuccin_flavour = "mocha"
		vim.cmd.colorscheme "suazppuccin"
		assert.equals("suazppuccin-mocha", vim.g.colors_name)
	end)
end)
