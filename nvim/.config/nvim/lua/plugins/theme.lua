return {
  'rebelot/kanagawa.nvim',
  opts = {
    theme = "wave",
    background = {
      dark = "wave",
      light = "lotus",
    },
  },
  init = function()
    vim.cmd('colorscheme kanagawa')
  end
}
