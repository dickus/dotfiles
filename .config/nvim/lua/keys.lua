vim.g.mapleader = " "

--clear search highlighting on Esc in normal mode
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true })

--find and replace
vim.keymap.set("n", "<leader>ss", ":s//g<Left><Left>", { noremap = true })
vim.keymap.set("n", "<leader>sg", ":%s//g<Left><Left>", { noremap = true })

--move between nvim windows
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true })

--move highlighted lines down and up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

--markdown workflow
---set current directory to .docs
vim.keymap.set("n", "<leader>ww", ":cd $HOME/.docs<CR>", { noremap = true })
---delete note
vim.keymap.set("n", "<leader>od", ":!rm '%:p'<CR>:bd<CR>")
---save and close current buffer
vim.keymap.set("n", "<leader>oq", ":w<CR>:bd<CR>")

