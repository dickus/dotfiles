return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },

    opts = {
        servers = {
            bashls = {
                filetypes = { "sh", "zsh" }
            },
            clangd = {},
            lua_ls = {},
            marksman = {},
            pyright = {},
            gopls = {
                on_attach = function(client, bufnr)
                    vim.o.expandtab  = true
                    vim.o.tabstop    = 4
                    vim.o.shiftwidth = 4
                end
            },
            csharp_ls = {},
        },
    },

    config = function(_, opts)
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "bashls", "clangd", "lua_ls", "marksman", "pyright", "gopls" },
        })

        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        for server, cfg in pairs(opts.servers) do
            vim.lsp.config(server, cfg)
            vim.lsp.enable(server)
        end

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true })
    end
}

