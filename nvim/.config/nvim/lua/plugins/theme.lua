return {
  -- 'navarasu/onedark.nvim',
  'rebelot/kanagawa.nvim',
  config = {
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
