require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/plugins/snippets/"})

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<A-k>", function ()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

