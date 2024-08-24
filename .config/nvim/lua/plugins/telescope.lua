require("telescope")
vim.keymap.set("n", "ff", ":Telescope find_files hidden=true<CR>", { noremap = true })
vim.keymap.set("n", "fg", ":Telescope live_grep hidden=true<CR>", { noremap = true })
