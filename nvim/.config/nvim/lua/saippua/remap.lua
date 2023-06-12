
-- Config shortcut

-- Navigation
-- Splits
-- vim.keymap.set( "n", "<C-h>", "<C-w>h", { noremap = true })
-- vim.keymap.set( "n", "<C-j>", "<C-w>j", { noremap = true })
-- vim.keymap.set( "n", "<C-k>", "<C-w>k", { noremap = true })
-- vim.keymap.set( "n", "<C-l>", "<C-w>l", { noremap = true })
-- Tabs
vim.keymap.set( "n", "<C-w><C-h>", "gT", { noremap = true })
vim.keymap.set( "n", "<C-w><C-l>", "gt", { noremap = true })

-- Redirect delete and change to null register to avoid overwriting clipboard
vim.keymap.set( "n", "d", "\"_d", { noremap = true })
vim.keymap.set( "v", "d", "\"_d", { noremap = true })
vim.keymap.set( "v", "c", "\"_c", { noremap = true })

vim.keymap.set( "n", "<C-j>", "4j", { noremap = true })
vim.keymap.set( "n", "<C-k>", "4k", { noremap = true })

vim.keymap.set( "t", "<Esc>", "<C-\\><C-n>", { noremap = true })

vim.keymap.set( "i", "<C-j>", "<Down>",  { noremap = true })
vim.keymap.set( "i", "<C-k>", "<Up>",    { noremap = true })
vim.keymap.set( "i", "<C-h>", "<Left>",  { noremap = true })
vim.keymap.set( "i", "<C-l>", "<Right>", { noremap = true })

