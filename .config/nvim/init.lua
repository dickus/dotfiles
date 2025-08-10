require("settings")
require("keys")

require("plugins.lazy")
require("plugins.undotree")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.highlight-colors")
require("plugins.which-keys")
require("plugins.cmps")
require("plugins.obsidian")
require("plugins.footnote")
require("plugins.snacks")
require("plugins.luasnip")
require("plugins.comfy-line-numbers")

--colorscheme
require("themes.fjord")

--basic settings
vim.o.cmdheight = 2
vim.wo.number = true --number of line
vim.o.signcolumn = "yes"
vim.o.foldmethod = "manual"
vim.o.relativenumber = true

