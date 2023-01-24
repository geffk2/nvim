vim.o.updatetime = 200
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
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
vim.o.undofile = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require 'plugins'
require 'masonconfig'.setup()
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile>',
  pattern = 'init.lua'
})

vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_latexmk = { 
  options = { '-verbose', '-synctex=1', '-interaction=nonstopmode', '-shell-escape'},
}
vim.keymap.set('n', '<leader>b', ':JABSOpen<cr>')
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Navigation in insert mode
vim.api.nvim_set_keymap('i', '<C-b>', '<ESC>^i', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { silent = true, noremap = true })
-- Better noh
vim.api.nvim_set_keymap('n', '<Esc>', '<cmd>noh<CR>', { silent = true, noremap = true })

vim.keymap.set('n', ',vv', ':vs<cr>')
vim.keymap.set('n', ',ss', ':split<cr>')
vim.keymap.set('n', ',lsp', ':LspStart<cr>')

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

vim.keymap.set('n', 'ca', vim.lsp.buf.code_action)

vim.keymap.set('n', ']b', ':bn<cr>')
vim.keymap.set('n', '[b', ':bp<cr>')

function EdgeGetPalette()
  local conf = vim.fn['edge#get_configuration']()
  return vim.fn['edge#get_palette'](conf.style, conf.dim_foreground, conf.colors_override)
end

require 'dapconfig'
require 'colorschemes'
require 'highlights'
require 'usercommands'
