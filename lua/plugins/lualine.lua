local lualine = require 'lualine'

lualine.setup {
  extensions = {
    'nvim-tree',
  },
  options = {
    theme = 'auto',
    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' }
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = {
      -- { 'mode', fmt = function() return 'λ' end, gui = 'bold'}},
      { 'mode', fmt = function() return ' ' end, gui = 'bold'}},
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
      lualine_z = { { 'mode', fmt = function() return ' ' end, gui = 'bold'} }
    },
    tabline = {
      lualine_a = { 'buffers' }
    }
  }
