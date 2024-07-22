--basic settings
vim.cmd('syntax on') --enables syntax highlight
vim.cmd('set nocompatible')
vim.o.expandtab = true --spaces instead of tabs
vim.o.tabstop = 4 --4 spaces for tab
vim.o.shiftwidth = 4 --autotab width
vim.o.swapfile = false --disable swapfile
vim.cmd('filetype plugin indent on')
vim.o.encoding = 'utf-8'
vim.o.hidden = true --hide buffers with unsaved changes
vim.o.backup = false --this
vim.o.writebackup = false --and this disable backups
vim.o.updatetime = 300 --idle time for status bar update
vim.o.shortmess = 'c'
vim.o.scrolloff = 99 --scrolling with cursor
vim.o.guicursor = 'n-v-c:block-Cursor/lCursor-blinkwait0-blinkon0-blinkoff0,i:hor20-Cursor/lCursor-blinkwait0-blinkon100-blinkoff100'
vim.o.wildmenu = true --menu with Tab for command input
vim.o.hls = true --this
vim.o.is = true --and this enable highlighting words while searching
vim.o.cmdheight = 1
vim.o.formatoptions = 'tcqrn1'
vim.o.lbr = true --softwrap
vim.o.clipboard = 'unnamedplus' --enable copying from nvim to system buffer
vim.o.mouse = '' --disable mouse
vim.o.spelllang = 'en_us'
vim.o.spell = true
vim.o.sol = true


--colorscheme
vim.o.background = "light"
vim.cmd('colorscheme everforest')


--keybindings
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<M-e>', ':setlocal spell spelllang=en_us<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-r>', ':setlocal spell spelllang=ru_ru<CR>', {noremap = true})

--clear search highlighting on Esc in normal mode
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', {noremap = true})

--find and replace
vim.api.nvim_set_keymap('n', '<leader>ss', ':s///g<Left><Left><Left>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>sg', ':%s///g<Left><Left><Left>', {noremap = true})

--limelight keybindings
vim.api.nvim_set_keymap('n', '<C-g>', ':Limelight <bar> :Goyo 75<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':Limelight! <bar> :Goyo!<CR>', {noremap = true})


--packer
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'shaunsingh/nord.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'neanias/everforest-nvim'
    
    use 'junegunn/limelight.vim'

    use 'junegunn/goyo.vim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }
end)


--lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}


vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
    command = "set guicursor=a:hor20-Cursor/lCursor-blinkwait0-blinkon100-blinkoff100",
	desc = "Set cursor back to beam when leaving Neovim."
})
