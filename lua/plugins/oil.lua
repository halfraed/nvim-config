return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      -- Opens oil in a clean floating window instead of taking up the whole screen
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<ESC>"] = "actions.close",
      },
    })

    -- Map it to Space + e (for Explorer)
    vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open File Explorer" })
  end,
}
