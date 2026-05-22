vim.g.mapleader = " "
local map = vim.keymap.set
map("n", "<C-B>", vim.cmd.Ex)
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

map('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic detail under cursor', silent = true })


-- Toggle the Chat Window
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>i", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'ga' (Go AI) to add visually selected code to the chat context
