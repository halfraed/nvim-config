return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,    -- We want the theme to load immediately on startup
  priority = 1000, -- Highest priority to load before everything else
  config = function()
    require("rose-pine").setup({
      variant = "main", -- Options: 'auto', 'main', 'moon', or 'dawn'
      dark_variant = "main",
      
      styles = {
        bold = true,
        italic = true,
        transparency = false, -- Set to true if your terminal has a transparent background
      },
    })
    
    vim.cmd("colorscheme rose-pine")
  end
}
