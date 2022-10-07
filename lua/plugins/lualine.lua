require 'lualine'.setup {
  extensions = {
    'nvim-tree',
  },
  options = {
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = { 'mode' },
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
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { 'buffers' }
  }
}
