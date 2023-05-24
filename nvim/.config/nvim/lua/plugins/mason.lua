return {
  'williamboman/mason.nvim',
  dependecies = {
    { 'williamboman/mason-lspconfig.nvim' },
  },
  build = ":MasonUpdate",
  config = function()
    print("Mason SETUP")
    require("mason").setup()

    print("Mason lspconfig SETUP")
    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup_handlers {
      function (server_name)
        require("lspconfig")[server_name].setup {}
      end,
      -- -- Overrides
      -- ["rust_analyzer"] = function()
      --   require("rust-tools").setup{}
      -- end,
    }
  end
}
