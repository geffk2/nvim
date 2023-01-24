local wk = require 'which-key'
local dap = require 'dap'

wk.register({
  ca = {
    vim.lsp.buf.code_action, "Code Action"
  },
  cd = {
    require 'lsp_lines'.toggle, "Show Diagnostics"
  },
  g = {
    name = "Goto [LSP]",
    d = { vim.lsp.buf.definition, 'Definition' },
    D = { vim.lsp.buf.declaration, 'Declaration' },
    i = { vim.lsp.buf.implementation, 'Implementation' },
  },
  r = { vim.lsp.buf.rename, 'Rename' },
  w = {
    name = 'Workspace [LSP]',
    a = { vim.lsp.buf.add_workspace_folder, 'Add folder' },
    r = { vim.lsp.buf.remove_workspace_folder, 'Remove folder' },
    l = { function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'List folders' },
  },
  d = {
    name = 'Debugger',
    n = { dap.continue, 'Continue' },
    ['_'] = { dap.run_last, 'Run last' },
    h = { dap.toggle_breakpoint, 'Toggle breakpoint' },
    k = { dap.step_out, 'Step out' },
    l = { dap.step_into, 'Step into' },
    j = { dap.step_over, 'Step over' },
    r = { dap.repl.toggle, 'Toggle REPL', },
  }
}, { prefix = "<leader>" })

wk.register('g<cr>',{ '<cmd>LeapAnywhere', 'Leap to letter pair'}, { mode = 'n' })
wk.register('<cr>',{ '<cmd>LeapInWin', 'Leap to letter pair within window'}, { mode = "n" })


