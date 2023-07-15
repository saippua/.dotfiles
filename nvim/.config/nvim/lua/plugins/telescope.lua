return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>pf', builtin.find_files,     { noremap = true, desc = "Find File: Fuzzy find file in project."})
      vim.keymap.set('n', '<leader>ps', builtin.live_grep,      { noremap = true, desc = "Find String: Fuzzy find string in project files." })
      vim.keymap.set('n', '<leader>fg', builtin.git_files,      { noremap = true, desc = "Find Git: Fuzzy find file in git." })
      vim.keymap.set('n', 'gr',         builtin.lsp_references, { noremap = true, desc = "Find references of symbol under cursor." })
      vim.keymap.set('n', '<leader>va', function() builtin.diagnostics { bufnr=0 } end,    { noremap = true, desc = "Show Diagnostics for all open buffers." })
      vim.keymap.set('n', '<leader>gq', builtin.quickfix,       { noremap = true, desc = "Show quickfix list." })
      vim.keymap.set('n', 'gs',         builtin.lsp_document_symbols,   {noremap = true, desc = "Document symbols."})
      vim.keymap.set('n', 'gS',         builtin.lsp_workspace_symbols,  {noremap = true, desc = "Document symbols."})
      vim.keymap.set('n', '<leader>ls', builtin.buffers,        { noremap = true, desc = "Show buffer list." })

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
            auto_depth=false,
            hide_parent_dir=false,
            prompt_path=false,
            -- initial_mode = "normal",

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
      vim.keymap.set('n', '<leader>pv', ":Telescope file_browser path=%:p:h<CR>", { noremap = true })
      vim.keymap.set('n', '<leader>conf', ":Telescope file_browser path=~/.config/nvim/ select_buffer=true<CR>", { noremap = true })
    end,
  },
}
