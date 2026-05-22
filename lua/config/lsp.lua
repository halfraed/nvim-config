-- ~/.config/nvim/lua/config/lsp.lua

-- Go
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork' },
  root_markers = { 'go.mod', 'go.work', '.git' },
})
vim.lsp.enable('gopls')

-- Angular
vim.lsp.config('angularls', {
  cmd = { 'ngserver', '--stdio', '--tsProbeLocations', '', '--ngProbeLocations', '' },
  filetypes = { 'html', 'typescript', 'typescriptreact' },
  root_markers = { 'angular.json', 'project.json', '.git' },
})
vim.lsp.enable('angularls')

-- SQL
vim.lsp.config('sqlls', {
  cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
  filetypes = { 'sql', 'mysql' },
})
vim.lsp.enable('sqlls')

-- HTML
vim.lsp.config('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
})
vim.lsp.enable('html')

-- CSS
vim.lsp.config('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
})
vim.lsp.enable('cssls')

-- JSON
vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
})
vim.lsp.enable('jsonls')

-- Markdown
vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
})
vim.lsp.enable('marksman')
-- Format code on save using native LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
