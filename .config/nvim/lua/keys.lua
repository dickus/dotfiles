vim.g.mapleader = " "

--clear search highlighting on Esc in normal mode
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true })

--find and replace
vim.keymap.set("n", "<leader>ss", ":s//g<Left><Left>", { noremap = true })
vim.keymap.set("n", "<leader>sg", ":%s//g<Left><Left>", { noremap = true })

vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true })

