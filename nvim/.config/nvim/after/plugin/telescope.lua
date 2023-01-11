local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Project Find: Fuzzy find file in project."})
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git find: Fuzzy find file in git." })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Project String: Fuzzy find string in project files." })
