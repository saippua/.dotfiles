local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find File: Fuzzy find file in project."})

vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files()
  error("Don't use this hotkey anymore! use <leader>ff")
end, { desc = "Find File: Fuzzy find file in project."}) -- TODO remove this

vim.keymap.set('n', '<leader>fs', builtin.live_grep,  { desc = "Find String: Fuzzy find string in project files." })

vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep()
  error("Don't use this hotkey anymore! use <leader>ff")
end,  { desc = "Find String: Fuzzy find string in project files." }) -- TODO remove this

vim.keymap.set('n', '<leader>fg', builtin.git_files,  { desc = "Find Git: Fuzzy find file in git." })
vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = "Find Buffer: Fuzzy find buffer." })

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  }
}
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end, { desc = "Project String: Fuzzy find string in project files." })

