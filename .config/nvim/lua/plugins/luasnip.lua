return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },

    config = function()
        require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/plugins/snippets/"})

        local ls = require("luasnip")

        vim.keymap.set({ "i", "s" }, "<A-j>", function ()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<A-k>", function ()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })
    end
}

