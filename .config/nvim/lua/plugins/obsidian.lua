require("obsidian").setup({
    ui = { enable = false },

    workspaces = {
        {
            name = "docs",
            path = "~/.docs",
        },
    },

    notes_subdir = "drafts",
    new_notes_location = "notes_subdir",

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },

    mappings = {
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },

        ["<CR>"] = {
            action = function()
                return require("obsidian").util.smart_action()
            end,
            opts = { buffer = true, expr = true },
        },
    },

    wiki_link_func = function(opts)
        return require("obsidian.util").wiki_link_id_prefix(opts)
    end,

    preferred_link_style = "wiki",

    templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
    },

    follow_url_func = function(url)
        vim.fn.jobstart({"xdg-open", url})
    end,

    follow_img_func = function(img)
        vim.fn.jobstart({"xdg-open", img})
    end,
})

vim.opt_local.conceallevel = 1

--set current directory to .docs
vim.keymap.set("n", "<leader>ww", ":cd $HOME/.docs<CR>", { noremap = true })
--use template in current note
vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<CR>", { noremap = true, silent = true })
--remove date from first heading
vim.keymap.set("n", "<leader>of", ":%s/# [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]_/# /g<CR>", { noremap = true, silent = true })
--move note from drafts to notes
vim.keymap.set("n", "<leader>ok", ":!mv '%:p' ~/.docs/notes<CR>:bd<CR>")
--delete note
vim.keymap.set("n", "<leader>od", ":!rm '%:p'<CR>:bd<CR>")
--save and close current buffer
vim.keymap.set("n", "<leader>oq", ":w<CR>:bd<CR>")

