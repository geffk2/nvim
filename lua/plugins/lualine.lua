local lualine = require 'lualine'
-- local navic = require 'nvim-navic'

lualine.setup {
  extensions = {
    'nvim-tree',
  },
  options = {
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = {{ 'mode', fmt = function() return ' ' end, gui = 'bold'}},
    -- { 'mode', fmt = function() return 'λ' end, gui = 'bold'}},
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      {
        'diagnostics',
        diagnostics_color = {
          error = 'LspDiagnosticsSignError',
          warn = 'LspDiagnosticsSignWarning',
          info = 'LspDiagnosticsSignInformation',
          hint = 'LspDiagnosticsSignHint'
        },
      },
    },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress', 'location' },
    lualine_z = { { 'mode', fmt =
      function()
        local sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #sbar) + 1
        return sbar[i]
        -- return string.rep(sbar[i], 2)
      end,
      gui = 'regular'} }
  },
  tabline = {
    lualine_a = { 'buffers' }
  },
  winbar = {
    -- lualine_c = { { navic.get_location, cond = navic.is_available } }
  }
}
