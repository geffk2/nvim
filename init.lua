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
vim.o.tabstop = 2
vim.o.background = 'dark'
vim.o.laststatus = 2
vim.o.mouse = 'a'
vim.o.undofile = true
vim.o.conceallevel = 0
vim.o.cmdheight=1
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.g.mapleader = ','
vim.g.maplocalleader  = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

vim.o.guifont = 'Liga SFMono Nerd Font:h14'
require 'plugins'
require'masonconfig'.setup()
vim.api.nvim_create_autocmd('BufWritePost',
                            {command = 'source <afile>', pattern = 'nvim/.init.lua'})

vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_compiler_latexmk = {
    options = {
        '-verbose', '-synctex=1', '-interaction=nonstopmode', '-shell-escape'
    }
}

vim.g.vimtex_quickfix_enabled = 0

vim.keymap.set('n', '<leader>b', ':JABSOpen<cr>')
vim.diagnostic.config({virtual_text = false, virtual_lines = false})

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
-- Pane navigation 
vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')
-- Navigation in insert mode
vim.api.nvim_set_keymap('i', '<C-b>', '<ESC>^i', {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', {silent = true, noremap = true})
-- Better noh
vim.api.nvim_set_keymap('n', '<Esc>', '<cmd>noh<CR>', {silent = true, noremap = true})

vim.keymap.set('n', ',vv', ':vs<cr>')
vim.keymap.set('n', ',ss', ':split<cr>')
vim.keymap.set('n', ',lsp', ':LspStart<cr>')
vim.keymap.set('n', ';', ':')


vim.keymap.set('i', 'jk', '<esc>')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight',
                                                    {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = highlight_group,
    pattern = '*'
})


vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.go',
  callback = function() vim.o.expandtab = false end
})

-- vim.api.nvim_create_autocmd('InsertEnter', {
--   pattern = '*.md',
--   callback = function() vim.o.conceallevel = 0 end
-- })
--
-- vim.api.nvim_create_autocmd('InsertLeave', {
--   pattern = '*.md',
--   callback = function() vim.o.conceallevel = 2 end
-- })

-- Key bindings
vim.keymap.set({'n', 'i'}, '<c-s>', '<esc>:w<cr>')
vim.keymap.set({'n', 'i'}, '<D-s>', '<esc>:w<cr>')
vim.keymap.set({'n', 'i'}, '<F6>', '<esc>:w<cr>')

-- neovide
if vim.g.neovide then
  vim.g.neovide_input_use_logo = true
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_input_macos_alt_is_meta = true
end

vim.keymap.set('n', 'ca', vim.lsp.buf.code_action)

vim.keymap.set('n', '<c-tab>', ':bn<cr>')
vim.keymap.set('n', '<c-s-tab>', ':bp<cr>')
function EdgeGetPalette()
    local conf = vim.fn['edge#get_configuration']()
    return vim.fn['edge#get_palette'](conf.style, conf.dim_foreground,
                                      conf.colors_override)
end

require 'dapconfig'
require 'colorschemes'
require 'highlights'
require 'usercommands'
-- require 'netman'
