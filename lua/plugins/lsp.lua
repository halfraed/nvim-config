return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    -- 1. Enable Native Autocomplete UI Settings
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

    -- Force trigger native LSP autocomplete menu at any time
    vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { desc = 'Trigger LSP completion' })

    -- 3. Auto-enable LSP completion and Inlay Hints when a server attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_completion_attach", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        
        -- Enable native autocomplete feeding
        if client and client:supports_method("textDocument/completion") then
          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        -- Enable native inlay hints if the server supports it
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
      end,
    })

    -- 4. Setup Language Servers Natively (No require('lspconfig') used here)
    
    -- Go
    vim.lsp.config('gopls', {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
      root_markers = { 'go.mod', 'go.work', '.git' },
      settings = {
        gopls = {
          usePlaceholders = true, -- Automatically inject () and parameters
        }
      }
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

    -- Format code on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
}
