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
