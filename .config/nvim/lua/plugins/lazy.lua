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

    require("plugins.nvim-treesitter"),
    require("plugins.highlight-colors"),
    require("plugins.undotree"),
    require("plugins.lsp"),
    require("plugins.luasnip"),
    require("plugins.which-keys"),
    require("plugins.lualine"),
    require("plugins.obsidian"),
    require("plugins.outline"),
    require("plugins.footnote"),
    require("plugins.snacks"),
    require("plugins.comfy-line-numbers"),
    require("plugins.noice"),
    require("plugins.vim-tmux-navigator"),
    require("plugins.cmps"),
}
local opts = {}

require("lazy").setup(plugins, opts)

