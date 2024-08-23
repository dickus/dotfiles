--colorscheme
require('colors.nord')

--basic settings
vim.cmd('syntax on') --enables syntax highlight
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
vim.o.cmdheight = 2
vim.o.formatoptions = 'tcqrn1'
vim.o.lbr = true --softwrap
vim.wo.number = true --number of line
vim.o.clipboard = 'unnamedplus' --enable copying from nvim to system buffer
vim.o.mouse = '' --disable mouse
vim.o.sol = true
vim.o.signcolumn = 'yes'
vim.o.foldmethod = 'manual'
vim.o.relativenumber = true

vim.g.netrw_banner = 0 --remove text above files in search
vim.g.netrw_liststyle = 3 --make a tree in search


--keybindings
local opts = { noremap=true, silent=true }
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', {noremap = true})

--clear search highlighting on Esc in normal mode
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', {noremap = true})

--find and replace
vim.api.nvim_set_keymap('n', '<leader>ss', ':s//g<Left><Left>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>sg', ':%s//g<Left><Left>', {noremap = true})


--packer
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    use 'shaunsingh/nord.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'neanias/everforest-nvim'

    use 'theprimeagen/harpoon'

    use 'mbbill/undotree'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'brenoprata10/nvim-highlight-colors'

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }
end)


--telescope
require('telescope')
vim.api.nvim_set_keymap('n', 'ff', ':Telescope find_files hidden=true<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'fg', ':Telescope live_grep hidden=true<CR>', {noremap = true})


--harpoon
local markh = require('harpoon.mark')
local uih = require('harpoon.ui')
vim.keymap.set('n', '<leader>a', markh.add_file)
vim.keymap.set('n', '<C-e>', uih.toggle_quick_menu)

vim.keymap.set('n', '<leader>1', function() uih.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() uih.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() uih.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() uih.nav_file(4) end)


--undotree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true})


--lsp
local lsp = require('lsp-zero')

lsp.preset('recommended')
require('lspconfig').clangd.setup{}
require('lspconfig').rust_analyzer.setup{}
require('lspconfig').bashls.setup{}
require('lspconfig').marksman.setup{}

lsp.set_preferences({
    sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.lsp.buf.diagnostic() end, opts)
    vim.keymap.set('n', '[d', function() vim.lsp.buf.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.lsp.buf.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm { select = true },

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
})


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


--highlight colors
require('nvim-highlight-colors').setup {}


--mason
require('mason').setup {}
require('mason-lspconfig').setup {}


--cursor fix for alacritty
vim.api.nvim_create_autocmd("ExitPre", {
    group = vim.api.nvim_create_augroup("Exit", { clear = true }),
    command = "set guicursor=a:hor20-Cursor/lCursor-blinkwait0-blinkon100-blinkoff100",
    desc = "Set cursor back to beam when leaving Neovim."
})


--lsp quickfix
local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, opts)

