-- Navigate splits smoothly
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })

-- Move selected lines up/down in Visual Mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Selection Down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Selection Up' })

-- Keep cursor centered during page jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor centered during search matches
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Join lines without moving cursor position
vim.keymap.set('n', 'J', 'mzJ`z')

-- Paste over selection without losing current clipboard content
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Create splits instantly
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>-', '<cmd>split<CR>', { desc = 'Horizontal Split' })

-- Resize splits using Ctrl + Arrow Keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase Window Width' })

-- Show diagnostic error under the cursor
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show Diagnostic Error' })

-- LSP Navigation and Refactoring
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })

-- Wrap these in function() ... end to lazy-load them on keypress
vim.keymap.set('n', 'gI', function() require('telescope.builtin').lsp_implementations() end, { desc = 'Go to Implementation' })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { desc = 'Find References' })

-- Jump forward through snippet placeholders (e.g., inside function arguments)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if vim.snippet.active({ direction = 1 }) then
    vim.snippet.jump(1)
  end
end, { desc = "Jump to next snippet placeholder" })

-- Jump backward through snippet placeholders
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if vim.snippet.active({ direction = -1 }) then
    vim.snippet.jump(-1)
  end
end, { desc = "Jump to previous snippet placeholder" })


-- LSP Navigation Keymaps
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
vim.keymap.set('n', 'gI', function() require('telescope.builtin').lsp_implementations() end, { desc = 'Go to Implementation' })
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { desc = 'Find References' })



vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  desc = "Clear search highlight",
})
