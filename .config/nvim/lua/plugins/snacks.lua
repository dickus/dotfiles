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
})

local function open_obsidian_image_picker()
    Snacks.picker.files({
        cwd = vim.fn.expand("$HOME/.docs/files"),
        ft = { "png", "jpg", "jpeg", "webp" },
    })
end

local function open_obsidian_file_picker()
    Snacks.picker.files({
        cwd = vim.fn.expand("$HOME/.docs")
    })
end

local function open_image_picker()
    Snacks.picker.files({
        ft = { "png", "jpg", "jpeg", "webp" },
    })
end

local function open_obsidian_content_picker()
    Snacks.picker.grep({
        cwd = vim.fn.expand("$HOME/.docs")
    })
end

local function open_file_picker()
    Snacks.picker.files()
end

local function open_content_picker()
    Snacks.picker.grep()
end


vim.keymap.set("n", "<leader>oi", open_obsidian_image_picker, { desc = "Find Obsidian images" })
vim.keymap.set("n", "<leader>of", open_obsidian_file_picker, { desc = "Find Obsidian files" })
vim.keymap.set("n", "<leader>og", open_obsidian_content_picker, { desc = "Find Obsidian files by content" })

vim.keymap.set("n", "<leader>fi", open_image_picker, { desc = "Find images" })
vim.keymap.set("n", "<leader>ff", open_file_picker, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", open_content_picker, { desc = "Find files by content" })

