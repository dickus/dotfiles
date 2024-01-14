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
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.scrolloff = 99 --scrolling with cursor
vim.o.guicursor = 'n:block-Cursor,i:hor20-Cursor'
vim.o.wildmenu = true --menu with Tab for command input
vim.o.hls = true --this
vim.o.is = true --and this enable highlighting words while searching
vim.o.lc = true
vim.o.cmdheight = 1
vim.o.formatoptions = 'tcqrn1'
vim.o.lbr = true --softwrap
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus' --enable copying from nvim to system buffer
vim.o.mouse = '' --disable mouse
vim.o.spelllang = 'en_us'
vim.o.spell = true
vim.o.sol = true


--colorscheme
function ColorNeoVim(color)
    color = color or 'nord'
    vim.cmd.colorscheme(color)
end
ColorNeoVim()


--limelight
vim.g.limelight_conceal_guifg = '#3B4252'


--keybindings
vim.api.nvim_set_keymap('n', '<M-q>', ':q!<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-w>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-e>', ':setlocal spell spelllang=en_us<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-r>', ':setlocal spell spelllang=ru_ru<CR>', {noremap = true})


--limelight keybindings
vim.api.nvim_set_keymap('n', '<C-g>', ':Limelight <bar> :Goyo 75<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':Limelight! <bar> :Goyo!<CR>', {noremap = true})


--packer
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'shaunsingh/nord.nvim'
    
    use 'junegunn/limelight.vim'

    use 'junegunn/goyo.vim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'brenoprata10/nvim-highlight-colors'
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


require('nvim-highlight-colors').setup {}
