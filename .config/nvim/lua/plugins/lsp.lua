return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "bashls", "clangd", "lua_ls", "marksman", "pyright", "gopls" },
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")
        lspconfig.bashls.setup({
            capabilities = capabilities,
        })
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.marksman.setup({
            capabilities = capabilities,
        })
        lspconfig.pyright.setup({
            capabilities = capabilities,
        })
        lspconfig.gopls.setup({
            capabilities = capabilities,
        })

        vim.lsp.enable("bashls")
        vim.lsp.enable("clangd")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("marksman")
        vim.lsp.enable("pyright")
        vim.lsp.enable("gopls")

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true })
    end
}

