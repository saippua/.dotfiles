return {
  'williamboman/mason.nvim',
  dependecies = {
    { 'williamboman/mason-lspconfig.nvim' },
  },
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls" }
    }
  end
}
