require 'plugins'
require 'lsp_setup'

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = 'plugins.lua',
})
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile>',
  pattern = 'init.lua'
})

vim.o.termguicolors = true
vim.o.number = true
vim.o.showmode = true
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.background = 'dark'
vim.o.laststatus = 2
vim.o.mouse = 'a'
vim.g.mapleader = ','

vim.keymap.set('n', '<leader>b', ':JABSOpen<cr>')

local files_group = vim.api.nvim_create_augroup('Files', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  callback = function ()
    vim.keymap.set('n', '<leader>p', require('nabla').popup())
  end,
  group = files_group,
  pattern = 'markdown',
})
vim.api.nvim_create_autocmd('FIleType', {
  command = '%!jq .',
  group = files_group,
  pattern = 'json'
})

vim.keymap.set('n', 'vv', ':vs<cr>')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.g.everforest_background = 'hard'
vim.g.everforest_diagnostic_virtual_text = 'colored'
vim.cmd 'colorscheme everforest'


require 'scrollbar'.setup()
vim.keymap.set({'n', 'i'}, '<c-s>', '<esc>:w<cr>')
vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')

require 'lualine'.setup {
  options = {
    theme = 'everforest'
  }
}

local tele = require 'telescope.builtin'
vim.keymap.set('n' , '<leader>ff' , tele.find_files)
vim.keymap.set('n' , '<leader>fg' , tele.live_grep)
vim.keymap.set('n' , '<leader>fb' , tele.buffers)
vim.keymap.set('n' , '<leader>fh' , tele.help_tags)
vim.keymap.set('n' , '<leader>fm' , tele.man_pages)

vim.keymap.set('n' , '<leader>=' , ':Tabularize /=<cr>')
vim.keymap.set('n' , '<leader>-' , ':Tabularize /-<cr>')
vim.keymap.set('n' , '<leader>,' , ':Tabularize /,<cr>')
vim.keymap.set('n' , '<leader>#' , ':Tabularize /#<cr>')
vim.keymap.set('n' , '<leader>:' , ':Tabularize /:<cr>')

vim.keymap.set('n', '<leader>ca', ':CodeActionMenu<cr>')

-- Lua
vim.api.nvim_set_keymap("n" , "<leader>xx" , "<cmd>TroubleToggle<cr>"                       , {silent = true , noremap = true})
vim.api.nvim_set_keymap("n" , "<leader>xw" , "<cmd>TroubleToggle workspace_diagnostics<cr>" , {silent = true , noremap = true})
vim.api.nvim_set_keymap("n" , "<leader>xd" , "<cmd>TroubleToggle document_diagnostics<cr>"  , {silent = true , noremap = true})
vim.api.nvim_set_keymap("n" , "<leader>xl" , "<cmd>TroubleToggle loclist<cr>"               , {silent = true , noremap = true})
vim.api.nvim_set_keymap("n" , "<leader>xq" , "<cmd>TroubleToggle quickfix<cr>"              , {silent = true , noremap = true})
vim.api.nvim_set_keymap("n" , "gR"         , "<cmd>TroubleToggle lsp_references<cr>"        , {silent = true , noremap = true})

vim.api.nvim_set_keymap("n", '<leader>ss', '<cmd>SymbolsOutline<cr>', {silent = true, noremap = true})
