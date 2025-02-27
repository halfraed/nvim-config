vim.g.mapleader = " "
local map = vim.keymap.set
map("n", "<C-B>", vim.cmd.Ex)
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
