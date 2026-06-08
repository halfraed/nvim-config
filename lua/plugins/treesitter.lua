return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- You must explicitly target the new branch for Neovim 0.12
  build = ":TSUpdate",
  init = function()
    -- Enable Treesitter natively via autocmd (replaces the old config module)
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
      callback = function()
        -- Attempt to start the native Neovim Treesitter engine for the current buffer
        pcall(vim.treesitter.start)
        
        -- Optional: Enable native Treesitter indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
