require 'lualine'.setup {
  extensions = {
    'nvim-tree',
  },
  options = {
    theme = 'edge',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    -- lualine_c = { 'buffers' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_c = { 'buffers' }
  }
}
