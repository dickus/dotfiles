require("settings")
require("keys")

require("plugins.lazy")

--colorscheme
require("themes.fjord")

--basic settings
vim.o.cmdheight      = 2
vim.wo.number        = true --number of line
vim.o.signcolumn     = "yes"
vim.o.foldmethod     = "manual"
vim.o.relativenumber = true

