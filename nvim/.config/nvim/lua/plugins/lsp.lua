return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- Autocomplete
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },

    -- Snippets TODO need to figure out some smart way to trigger this
    {
      'saadparwaiz1/cmp_luasnip',
      dependencies = { 'L3MON4D3/LuaSnip' }
    },
  },

  config = function()
    local lz = require('lsp-zero')
    -- local cmp_action = lz.cmp_action()

    -- lz.preset('lsp-compe')
    lz.preset("recommended")

    lz.ensure_installed({
      'clangd',
    })

    require('luasnip.loaders.from_snipmate').lazy_load()
    local cmp = require('cmp')
    local cmp_select_opts = {behavior = cmp.SelectBehavior.Insert}
    local cmp_mappings = lz.defaults.cmp_mappings({
      ['<Tab>'] = cmp.mapping.select_next_item(cmp_select_opts),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    })

    lz.setup_nvim_cmp({
      completion = { completeopt = 'menu,menuone,noselect' },
      mapping = cmp_mappings,
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        -- { name = 'cmdline' },
        { name = 'buffer' },
      },
    })



    lz.set_preferences({
      suggest_lsp_servers = true,
      sign_icons = {
        error = 'E',
        warn  = 'W',
        hint  = 'H',
        info  = 'I'
      }
    })

    lz.on_attach(function(client, bufnr)
        local opts = {desc = "", buffer = bufnr, remap = false}

        opts.desc = "Goto Declaration.";      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        opts.desc = "Goto Definition.";       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        opts.desc = "Goto Type Definition.";  vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
        opts.desc = "Goto References.";       vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        opts.desc = "Goto Implementation.";   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        opts.desc = "Display hover information.";   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        opts.desc = "Signature help.";              vim.keymap.set('n', '<C-S>', vim.lsp.buf.signature_help, opts)

        opts.desc = "Workspace Add: Add workspace folder.";       vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        opts.desc = "Workspace Remove: Remove workspace folder";  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        opts.desc = "Workspace List: List workspace folders.";    vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        opts.desc = "Open float: Open popup at cursor position."; vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)

        opts.desc = "Rename symbol.";                       vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        opts.desc = "Code Actions: ?";                      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        opts.desc = "Formatting: LSP powered formatting.";  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, opts)


    end)

    lz.nvim_workspace()
    lz.setup()

-- TODO figure out a better key for snippets
-- vim.keymap.set('i', "<leader>s", function ()
--   return require('luasnip').expand_or_jumpable() and '<Plug>luasnip-expand-or-jump' or '<leader>s'
-- end, {silent=true, expr=true, remap=true})

-- vim.cmd("imap <silent><expr> <leader><leader> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<leader><leader>'")
  end
}
