local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
    s({
        trig = "keybind",
        name = "Add new keybind for nvim",
        desc = "vim.keymap.set('$1', '$2', $3, { desc = '$4' })",
    }, {
        t('vim.keymap.set("'),
        i(1),
        t('", "'),
        i(2),
        t('", '),
        i(3),
        t(', { desc = "'),
        i(4),
        t('" })'),
    })
})

