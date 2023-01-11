local dap = require('dap')

dap.adapters.cpp = {
  type = 'executable',
  command = 'lldb-vscode-15',
}

dap.configurations.cpp = {
  name = 'Launch',
  type = 'cpp',
  request = 'launch',
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
  args = {},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
