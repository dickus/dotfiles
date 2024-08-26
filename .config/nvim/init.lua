--colorscheme
require("themes.gruvbox-dark")

require("settings")
require("keys")

require("plugins.lazy")
require("plugins.telescope")
require("plugins.telescope-ui-select")
require("plugins.undotree")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.highlight-colors")
require("plugins.neo-tree")
require("plugins.which-keys")
require("plugins.cmps")

--basic settings
vim.o.cmdheight = 2
vim.wo.number = true --number of line
vim.o.signcolumn = "yes"
vim.o.foldmethod = "manual"
vim.o.relativenumber = true

