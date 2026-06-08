-- ~/.config/nvim/lua/config/lsp.lua
-- Native Neovim 0.12 LSP & Autocomplete Configuration

-- 1. Native Autocomplete Opt-in and UI Settings
vim.opt.autocomplete = true -- Enables 0.12 native insert-mode completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- 2. Map Tab and Enter to control the native popup menu naturally
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true })

-- Force trigger native LSP autocomplete menu
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { desc = 'Trigger LSP completion' })

-- 3. Format code on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
  callback = function(args)
    vim.lsp.buf.format({ 
      bufnr = args.buf, 
      async = false 
    })
  end,
})

-- 3.5 Auto-trigger LSP completion on typing
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_completion_attach", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    
    -- Enable native autocomplete feeding and auto-triggering
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

-- Disable LSP Semantic Tokens to restore pure Treesitter colors
    if client and client.server_capabilities.semanticTokensProvider then
       client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

-- Disable built-in keyword completion inside Telescope prompts
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function()
    vim.opt_local.complete = ""
    vim.opt_local.completefunc = ""
    vim.opt_local.omnifunc = ""
  end,
})

-- ==========================================
-- 4. Language Server Configurations
-- ==========================================

-- Go
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  settings = {
    gopls = {
      usePlaceholders = true, 
    }
  }
})
vim.lsp.enable('gopls')

-- Angular
vim.lsp.config("angularls", {
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    vim.fn.getcwd() .. "/node_modules",
    "--ngProbeLocations",
    vim.fn.getcwd() .. "/node_modules",
  },
  filetypes = { "typescript", "html", "typescriptreact" },
  root_markers = { "angular.json", "project.json", "package.json", ".git" },
})
vim.lsp.enable("angularls")

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

-- CSpell LSP (Code-aware spell checker)
vim.lsp.config("cspell_ls", {
  cmd = { "cspell-lsp", "--stdio" },
  filetypes = {
    "go", "gomod", "gowork", "typescript", "typescriptreact",
    "javascript", "javascriptreact", "html", "css", "scss",
    "json", "jsonc", "yaml", "markdown", "lua", "sql",
  },
  root_markers = { "go.mod", "package.json", ".git" },
})
vim.lsp.enable("cspell_ls")
