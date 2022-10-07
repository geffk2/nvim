-- Colorschemes
vim.g.everforest_background = 'hard'
vim.g.everforest_diagnostic_virtual_text = 'colored'

vim.g.edge_better_performance = 1
vim.g.edge_style = 'aura'
vim.g.edge_diagnostic_virtual_text = 'colored'

vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1
vim.g.sonokari_diagnostic_virtual_text = 'colored'

local theme = 'everforest'
vim.cmd ('colorscheme ' .. theme)

return theme
