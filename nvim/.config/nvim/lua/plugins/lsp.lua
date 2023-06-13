return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  config = function()
    -- Setup Mason.nvim to automatically load LSPs
    require("mason-lspconfig").setup_handlers {
      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  'vim',
                },
              },
              completion = {
                workspaceWord = false,
                showWord = "Disable",
              },
            },
          },
        }
      end,
      ["clangd"] = function()
        require("lspconfig").clangd.setup {
          cmd = {
            "clangd-15",
            "--background-index"
          },
        }
      end,
      function(server_name)
        require("lspconfig")[server_name].setup {}
      end,
      --   -- -- Overrides
      --   -- ["rust_analyzer"] = function()
      --   --   require("rust-tools").setup{}
      --   -- end,
    }


    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
        vim.keymap.set('n', '<C-S>', vim.lsp.buf.signature_help, opts)

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>vf', vim.lsp.buf.code_action, opts)

        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
      end
    })
  end
}
