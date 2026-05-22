return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtin = require('telescope.builtin')
    
    -- Essential Keymaps
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep (Search Codebase)' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Open Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help Tags' })

    -- Clean, minimal UI configuration
    require("telescope").setup({
      defaults = {
        prompt_prefix = "   ", -- Requires a Nerd Font in your terminal
        selection_caret = "  ",
        path_display = { "smart" }, -- Shortens file paths smartly
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
      }
    })
  end
}
