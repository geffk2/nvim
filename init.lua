require 'plugins'
require 'lsp_setup'

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = 'plugins.lua',
})

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

vim.o.termguicolors = true
vim.g.everforest_background = 'hard'
vim.cmd 'colorscheme everforest'

require 'scrollbar'.setup()

vim.keymap.set({'n', 'i'}, '<c-s>', '<esc>:w<cr>')

vim.keymap.set('n', '<leader>tt', ':Fern %:h -drawer -right -stay -toggle<cr>')

vim.g['fern#renderer'] = 'nerdfont'

require 'lualine'.setup {
  options = {
    theme = 'everforest'
  }
}

local tele = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', tele.find_files)
vim.keymap.set('n', '<leader>fg', tele.live_grep)
vim.keymap.set('n', '<leader>fb', tele.buffers)
vim.keymap.set('n', '<leader>fh', tele.help_tags)

vim.keymap.set('n', '<leader>=', ':Tabularize /=<cr>')
vim.keymap.set('n', '<leader>-', ':Tabularize /-<cr>')
vim.keymap.set('n', '<leader>,', ':Tabularize /,<cr>')
vim.keymap.set('n', '<leader>#', ':Tabularize /#<cr>')
vim.keymap.set('n', '<leader>:', ':Tabularize /:<cr>')

vim.keymap.set('n', '<leader>ca', ':CodeActionMenu<cr>')

vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDToggleCheckAllLines = 1

