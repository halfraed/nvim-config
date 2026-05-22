return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- Optional: For using Telescope to pick prompts
    },
    config = function()
        require("codecompanion").setup({
            ignore_warnings = true,
            strategies = {
                chat = {
                    adapter = "gemini",
                },
                inline = {
                    adapter = "gemini",
                },
                agent = {
                    adapter = "gemini",
                },
            },
            adapters = {
                http = {
                    gemini = function()
                        return require("codecompanion.adapters").extend("gemini", {
                            env = {
                                api_key = os.getenv("GEMINI_API_KEY"),
                            },
                        })
                    end,
                }
            },
        })
    end,
}
