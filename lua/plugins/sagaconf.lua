local saga = require("lspsaga")

saga.setup({
  ui = {
    border = 'single',
    diagnostic = '',
    -- sainnhe/edge colors
    colors = {
      normal_bg = '#2b2d37',
      title_bg = '#a0c980',
    },
  },
  lightbulb = {
    enable = false,
  },
  symbol_in_winbar = { 
    enable = false,
  }
})

-- vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<cr>', { silent = true })
