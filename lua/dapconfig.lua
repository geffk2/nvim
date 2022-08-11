-- DAP keybindings
vim.keymap.set('n', '<leader>dui', require 'dapui'.toggle)
vim.keymap.set('n', '<leader>dn', require 'dap'.continue)
vim.keymap.set('n', '<leader>d_', require 'dap'.run_last)
vim.keymap.set('n', '<leader>dh', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>dk', require 'dap'.step_out)
vim.keymap.set('n', '<leader>dl', require 'dap'.step_into)
vim.keymap.set('n', '<leader>dj', require 'dap'.step_over)

-- DAP adapters
local dap = require 'dap'
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = '/Users/katja/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
    args = {'--port', '${port}'}
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
dap.configurations.c = dap.configurations.cpp
