return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,

  config = function()
    vim.opt.termguicolors = true

    require("rose-pine").setup({
      variant = "moon",
    })

    vim.cmd.colorscheme("rose-pine-moon")
  end,
}
