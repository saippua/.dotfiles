vim.g.mapleader = " "
vim.keymap.set('n', '<leader>conf', ":tabnew ~/.config/nvim/<CR>", { noremap = true })

IS_WSL = (function()
  local output = vim.fn.systemlist "uname -r"
  return not not string.find(output[1] or "", "WSL")
end)()


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require('lazy').setup('plugins', {
  change_detection = {
    notify = false,
  },
})
require('saippua')

