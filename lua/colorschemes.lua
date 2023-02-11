-- Colorschemes
vim.g.everforest_background = 'hard'
vim.g.everforest_diagnostic_virtual_text = 'colored'

vim.g.edge_better_performance = 1
vim.g.edge_style = 'default'
vim.g.edge_diagnostic_virtual_text = 'colored'
vim.g.edge_dim_foreground = 0
vim.g.edge_diagnostic_line_highlight = 1
vim.g.edge_cursor = 'red'

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

local theme = 'catppuccin'
vim.cmd ('colorscheme ' .. theme)

return theme
 -- let palette = {
 --            \ 'black':      ['#202023',   '232'],
 --            \ 'bg_dim':     ['#24262d',   '232'],
 --            \ 'bg0':        ['#2b2d37',   '235'],
 --            \ 'bg1':        ['#333644',   '236'],
 --            \ 'bg2':        ['#363a49',   '237'],
 --            \ 'bg3':        ['#3a3e4e',   '237'],
 --            \ 'bg4':        ['#404455',   '238'],
 --            \ 'bg_grey':    ['#7e869b',   '246'],
 --            \ 'bg_red':     ['#ec7279',   '203'],
 --            \ 'diff_red':   ['#55393d',   '52'],
 --            \ 'bg_green':   ['#a0c980',   '107'],
 --            \ 'diff_green': ['#394634',   '22'],
 --            \ 'bg_blue':    ['#6cb6eb',   '110'],
 --            \ 'diff_blue':  ['#354157',   '17'],
 --            \ 'bg_purple':  ['#d38aea',   '176'],
 --            \ 'diff_yellow':['#4e432f',   '54'],
 --            \ 'red':        ['#ec7279',   '203'],
 --            \ 'yellow':     ['#deb974',   '179'],
 --            \ 'green':      ['#a0c980',   '107'],
 --            \ 'cyan':       ['#5dbbc1',   '72'],
 --            \ 'blue':       ['#6cb6eb',   '110'],
 --            \ 'purple':     ['#d38aea',   '176'],
 --            \ 'none':       ['NONE',      'NONE']
 --            \ } "}}}
