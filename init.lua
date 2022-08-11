require 'plugins'
require 'masonconfig'.setup()

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
vim.g.maplocalleader = ','

vim.keymap.set('n', '<leader>b', ':JABSOpen<cr>')

-- Navigation in insert mode
vim.api.nvim_set_keymap('i', '<C-b>', '<ESC>^i', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { silent = true, noremap = true })
-- Better noh
vim.api.nvim_set_keymap('n', '<Esc>', '<cmd>noh<CR>', { silent = true, noremap = true })

vim.keymap.set('n', 'vv', ':vs<cr>')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Key bindings
vim.keymap.set({ 'n', 'i' }, '<c-s>', '<esc>:w<cr>')
vim.keymap.set({ 'n', 'i' }, '<F6>', '<esc>:w<cr>')
vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>uu', '<cmd>UndotreeToggle<cr>')

vim.keymap.set('n', 'ca', vim.lsp.buf.code_action)

vim.keymap.set('n', ']b', ':bn<cr>')
vim.keymap.set('n', '[b', ':bp<cr>')

require 'dapconfig'
require 'colorschemes'
