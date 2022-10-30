
local saga = require("lspsaga")

saga.init_lsp_saga({
  code_action_lightbulb = {
    enable = false,
  },
})

-- vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<cr>', { silent = true })
