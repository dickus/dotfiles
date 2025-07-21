require("obsidian").setup({
    legacy_commands = false,

    statusline = { enabled = false },

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

    callbacks = {
        enter_note = function(_, note)
            vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<CR>", { buffer = note.bufnr, desc = "Toggle checkbox" })
        end,
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

--use template in current note
vim.keymap.set("n", "<leader>ot", ":Obsidian template<CR>", { desc = "Use note template", noremap = true, silent = true })
--show links within current buffer
vim.keymap.set("n", "<leader>ol", ":Obsidian links<CR>", { desc = "Open links" })
--show backlinks
vim.keymap.set("n", "<leader>ob", ":Obsidian backlinks<CR>", { desc = "Open backlinks" })
--open tags search
vim.keymap.set({ "n", "v" }, "<leader>oh", ":Obsidian tags<CR>", { desc = "Open tags search" })

