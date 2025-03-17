return {
    { "EdenEast/nightfox.nvim" },
    { 'shaunsingh/nord.nvim',  lazy = false,        priority = 1000 },
    { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true,
            })
        end
    },
    { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 }
}
