
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', function() vim.cmd('Ex') end, { desc = "Project View: Enter filesystem view." })

-- Config shortcut
vim.keymap.set("n", 'confe', ':tabnew ~/.config/nvim<CR>')

-- Navigation
-- Splits
vim.keymap.set( "n", "<C-h>", "<C-w>h", { noremap = true })
-- vim.keymap.set( "n", "<C-j>", "<C-w>j", { noremap = true })
-- vim.keymap.set( "n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set( "n", "<C-l>", "<C-w>l", { noremap = true })
-- Tabs
vim.keymap.set( "n", "<A-H>", "gT", { noremap = true })
vim.keymap.set( "n", "<A-L>", "gt", { noremap = true })

-- Redirect delete and change to null register to avoid overwriting clipboard
vim.keymap.set( "n", "d", "\"_d", { noremap = true })
vim.keymap.set( "v", "d", "\"_d", { noremap = true })
vim.keymap.set( "v", "c", "\"_c", { noremap = true }, { desc = "test 2" })

vim.keymap.set( "n", "<C-j>", "4j", { noremap = true })
vim.keymap.set( "n", "<C-k>", "4k", { noremap = true })
