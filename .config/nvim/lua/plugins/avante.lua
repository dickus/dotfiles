return {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
    event = "VeryLazy",
    version = false,

    ---@module 'avante'
    ---@type avante.Config
    opts = {
        provider = "gemini",
        auto_suggestions_provider = "gemini",
        cursor_applying_provider = "gemini",
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "echasnovski/mini.pick",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "folke/snacks.nvim",

        {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                },
            },
        },

        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },

            ft = { "markdown", "Avante" },
        },
    },
}

