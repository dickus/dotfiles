vim.cmd("syntax on") --enables syntax highlight
vim.o.expandtab = true --spaces instead of tabs
vim.o.tabstop = 4 --4 spaces for tab
vim.o.shiftwidth = 4 --autotab width
vim.o.swapfile = false --disable swapfile
vim.cmd("filetype plugin indent on")
vim.o.encoding = "utf-8"
vim.o.hidden = true --hide buffers with unsaved changes
vim.o.backup = false --this
vim.o.writebackup = false --and this disable backups
vim.o.updatetime = 300 --idle time for status bar update
vim.o.shortmess = "c"
vim.o.scrolloff = 99 --scrolling with cursor
vim.o.guicursor = "n-v-c:block-Cursor/lCursor-blinkwait0-blinkon0-blinkoff0,i:hor20-Cursor/lCursor-blinkwait0-blinkon100-blinkoff100"
vim.o.wildmenu = true --menu with Tab for command input
vim.o.hls = true --this
vim.o.is = true --and this enable highlighting words while searching
vim.o.formatoptions = "tcqrn1"
vim.o.lbr = true --softwrap
vim.o.clipboard = "unnamedplus" --enable copying from nvim to system buffer
vim.o.mouse = "" --disable mouse
vim.o.sol = true
vim.g.netrw_banner = 0 --remove text above files in search
vim.g.netrw_liststyle = 3 --make a tree in search

--cursor fix for alacritty
vim.api.nvim_create_autocmd("ExitPre", {
    group = vim.api.nvim_create_augroup("Exit", { clear = true }),
    command = "set guicursor=a:hor20-Cursor/lCursor-blinkwait0-blinkon100-blinkoff100",
    desc = "Set cursor back to beam when leaving Neovim.",
})

