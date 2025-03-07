require("obsidian").setup({
    disable_frontmatter = true,

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
        ["<CR>"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },

        ["<leader>ch"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
    },

    wiki_link_func = function(opts)
        return require("obsidian.util").wiki_link_id_prefix(opts)
    end,

    preferred_link_style = "wiki",

    templates = {
        folder = "templates",
        date_format = "",
        substitutions = {},
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
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { noremap = true, silent = true })
--delete note
vim.keymap.set("n", "<leader>od", ":!rm '%:p'<CR>:bd<CR>")
--save and close current buffer
vim.keymap.set("n", "<leader>oq", ":w<CR>:bd<CR>")
--show links within current buffer
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>")
--show backlinks
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>")

--move note from drafts to notes
vim.keymap.set("n", "<leader>mn", ":!mv '%:p' ~/.docs/notes<CR>:bd<CR>")
--move note from drafts to LORE notes
vim.keymap.set("n", "<leader>ml", ":!mv '%:p' ~/.docs/lore<CR>:bd<CR>")
--move note from drafts to D&D notes
vim.keymap.set("n", "<leader>md", ":!mv '%:p' ~/.docs/DND<CR>:bd<CR>")
--move note from drafts to code notes
vim.keymap.set("n", "<leader>mc", ":!mv '%:p' ~/.docs/code<CR>:bd<CR>")

