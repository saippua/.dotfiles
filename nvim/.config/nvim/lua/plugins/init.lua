return {
  'rgarver/Kwbd.vim',


  { 'mfussenegger/nvim-dap' },

  -- { 'ray-x/lsp_signature.nvim' },

  'tpope/vim-fugitive',
  'tpope/vim-surround',
  { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },

  {
    'RREthy/vim-illuminate',
    config = function()
      require('illuminate').configure( {
        modes_allowlist = { 'n' },
        min_count_to_hightlight = 2,
        delay=500,
      })
    end,
    init = function()
      vim.api.nvim_set_hl(0, "IlluminatedWordText",  { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead",  { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end
  },

  -- {
  --   'folke/which-key.nvim',
  --   config = function()
  --     vim.o.timeout=true
  --     vim.o.timeoutlen = 300
  --     require("which-key").setup({
  --     })
  --   end,
  -- },


  -- Languages
  'lervag/vimtex',
  'NoahTheDuke/vim-just',
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}