--colorscheme
require('themes.gruvbox-dark')

require("settings")
require("keys")

require("plugins.telescope")
require("plugins.lualine")
require("plugins.limelight")
require("plugins.neo-tree")
require("plugins.which-keys")

--basic settings
vim.cmd("set nocompatible")
vim.o.cmdheight = 1
vim.o.spelllang = "en_us"
vim.o.spell = true

--keybindings
vim.keymap.set("n", "<M-e>", ":setlocal spell spelllang=en_us<CR>", { noremap = true })
vim.keymap.set("n", "<M-r>", ":setlocal spell spelllang=ru_ru<CR>", { noremap = true })

