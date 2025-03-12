local Snacks = require("snacks")

Snacks.setup({
    indent = { enabled = true },
    scroll = { enabled = true },
    image = {
        enabled = true,
        doc = {
            inline = false,
            float = true,
        },
    },
    picker = {
        enabled = true,
        win = {
            input = {
                keys = {
                    ["yy"] = {"explorer_yank", mode = { "n" }},
                },
            },
        },
    },
    explorer = {
        enabled = true,
        replace_netrw = true,
    },
})

local function open_image_picker()
    Snacks.picker.files({
        cwd = vim.fn.expand("$HOME/.docs/files"),
        ft = { "png", "jpg", "jpeg", "webp" },
    })
end

local function open_file_picker()
    Snacks.picker.files({
        cwd = vim.fn.expand("$HOME/.docs"),
    })
end


vim.keymap.set("n", "<leader>fi", open_image_picker, { desc = "Find images" })

vim.keymap.set("n", "<leader>ff", open_file_picker, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function () Snacks.picker.grep() end, { desc = "Find content" })

vim.keymap.set("n", "<C-e>", function () Snacks.explorer() end)

