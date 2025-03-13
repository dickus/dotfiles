local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "shaunsingh/nord.nvim",
    "ellisonleao/gruvbox.nvim",
    "neanias/everforest-nvim",
    "catppuccin/nvim",

    "brenoprata10/nvim-highlight-colors",

    "mbbill/undotree",

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },

    "folke/which-key.nvim",

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "obsidian-nvim/obsidian.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        lazy = true,
        ft = "markdown",
    },

    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<C-o>", "<cmd>Outline<CR>", desc = "Toggle outline" }
        },
        opts = {  },
    },

    {
        "chenxin-yan/footnote.nvim",
        ft = "markdown",
    },

    {
        "folke/snacks.nvim",
        dependencies = { "echasnovski/mini.icons", version = false },
        priority = 1000,
        lazy = false,
    },
}
local opts = {}

require("lazy").setup(plugins, opts)

