-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt

-- General Editor Settings
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.shiftwidth = 2
opt.scrolloff = 8

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Neovim 0.12 Native Features
opt.autocomplete = true -- Enables native insert-mode completion

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- spell checking
opt.spell = true
opt.spelllang = "en_us"
opt.spelloptions = "camel"

