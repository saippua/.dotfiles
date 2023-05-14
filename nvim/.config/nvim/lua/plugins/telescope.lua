return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>pf', builtin.find_files, { noremap = true, desc = "Find File: Fuzzy find file in project."})
      vim.keymap.set('n', '<leader>ps', builtin.live_grep,  { noremap = true, desc = "Find String: Fuzzy find string in project files." })
      vim.keymap.set('n', '<leader>fg', builtin.git_files,  { noremap = true, desc = "Find Git: Fuzzy find file in git." })
      vim.keymap.set('n', '<leader>fb', builtin.buffers,    { noremap = true, desc = "Find Buffer: Fuzzy find buffer." })

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key",
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            }
          }
        },
      }
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      local fb_actions = require "telescope._extensions.file_browser.actions"
      require('telescope').setup {
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            depth=1,
            auto_depth=true,
            hide_parent_dir=false,
            prompt_path=false,
            initial_mode = "normal",

            mappings= {
              ["i"] = {
                ["<M-c>"] = false, -- unmap create
              },
              ["n"] = {
                ["g"] = false,
                ["<BS>"] = fb_actions.backspace,
                ["c"] = false,
                ["%"] = fb_actions.create,
              }
            }
          }
        }
      }
      require('telescope').load_extension 'file_browser'
      vim.keymap.set('n', '<leader>pv', ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
      vim.keymap.set('n', '<leader>conf', ":Telescope file_browser path=~/.config/nvim/ select_buffer=true<CR>", { noremap = true })
    end,
  },
}