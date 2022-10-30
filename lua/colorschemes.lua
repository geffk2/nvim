-- Colorschemes
vim.g.everforest_background = 'soft'
vim.g.everforest_diagnostic_virtual_text = 'colored'

vim.g.edge_better_performance = 1
vim.g.edge_style = 'aura'
vim.g.edge_diagnostic_virtual_text = 'colored'

vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1
vim.g.sonokari_diagnostic_virtual_text = 'colored'

vim.g.doom_one_cursor_coloring = false
vim.g.doom_one_terminal_colors = true
vim.g.doom_one_italic_comments = false
vim.g.doom_one_enable_treesitter = true
vim.g.doom_one_diagnostics_text_color = true
vim.g.doom_one_transparent_background = false

-- Plugins integration
vim.g.doom_one_plugin_telescope = true
vim.g.doom_one_plugin_nvim_tree = true
vim.g.doom_one_plugin_vim_illuminate = true
vim.g.doom_one_plugin_lspsaga = false

local theme = 'edge'
vim.cmd ('colorscheme ' .. theme)

return theme
