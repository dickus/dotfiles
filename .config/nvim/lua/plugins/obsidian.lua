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

--use template in current note
vim.keymap.set("n", "<leader>oi", ":ObsidianTemplate<CR>", { desc = "Use note template", noremap = true, silent = true })
--show links within current buffer
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>", { desc = "Open links" })
--show backlinks
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Open backlinks" })
--open tags search
vim.keymap.set({ "n", "v" }, "<leader>ot", ":ObsidianTags<CR>", { desc = "Open tags search" })

