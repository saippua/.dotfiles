return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    {
      'saadparwaiz1/cmp_luasnip',
      dependencies = { 'L3MON4D3/LuaSnip' }
    },
  },
  config = function()
    -- require('luasnip.loaders.from_snipmate').lazy_load()
    -- require('luasnip').config.setup({ history=false })

    local cmp = require('cmp')

    -- local luasnip = require('luasnip')
    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = {
          i = cmp.mapping.abort(),
          c = cmp.mapping.abort(),
        },
        ['<CR>'] = cmp.mapping({
          i = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        ['<Tab>'] = cmp.mapping({
          i = function(fb) if cmp.visible() then cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert }) else fb() end end,
          c = function() if cmp.visible() then cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert }) else cmp.complete() end end,
        }),
        ['<S-Tab>'] = cmp.mapping({
          i = function(fb) if cmp.visible() then cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) else fb() end end,
          c = function() if cmp.visible() then cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) else cmp.complete() end end,
        }),
        -- ['<C-n>'] = cmp.mapping(function() if luasnip.jumpable(1) then luasnip.jump(1) end end, { 'i', 's' }),
        -- ['<C-p>'] = cmp.mapping(function() if luasnip.jumpable(-1) then luasnip.jump(-1) end end, { 'i', 's' }),
      },

      sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        -- { name = 'buffer' },
      }),
    }

    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        {
          name = 'path',
          option = {
            trailing_slash = true,
          }
        }
      }, {
        { name = 'cmdline' }
      }),
      matching = {
        disallow_fuzzy_matching = true,
        disallow_partial_matching = true,
      },
    })
  end
}
