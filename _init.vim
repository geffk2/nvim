syntax on
filetype plugin indent on

set nocompatible
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set background=dark
set laststatus=0
set mouse=a

let mapleader = ","

lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" Easier buffer switching
nnoremap <leader>b :JABSOpen <cr>

let g:tmux_navigator_save_on_switch = 2

" Nabla
augroup MdStuff
  autocmd!
  autocmd FIleType markdown nnoremap <leader>p :lua require("nabla").popup()<CR>
augroup END

" Json format
augroup JSON
  autocmd!
  autocmd FileType json nnoremap <leader>= :%!jq .<cr>  
augroup end

" Splits
nnoremap vv :vsplit<cr>

augroup HoogleMaps
  autocmd!
  autocmd FileType haskell nnoremap <buffer> <leader>hh :Hoogle <C-r><C-w><CR>
augroup END

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

"spelling
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"vimtex
let g:vimtex_view_method = 'zathura'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

"colorscheme
if has('termguicolors')
  set termguicolors
endif
let g:everforest_background='hard'
colorscheme everforest

"snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"scrollbar 
lua require("scrollbar").setup()

"Make Cmd-S work
noremap! <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

""Set up fern 
map <leader>tt :Fern %:h -drawer -right -stay -toggle<cr>

let g:fern#renderer = "nerdfont"

"Bufferline
nnoremap <leader>[ :BufferLineCycleNext<CR>
nnoremap <leader>] :BufferLineCyclePrev<CR>

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0


" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Neoformat

nnoremap <leader>pp :Neoformat<cr>

" Tabular
nnoremap <leader>= :Tabularize /=<CR>
nnoremap <leader>- :Tabularize /-><CR>
nnoremap <leader>, :Tabularize /,<CR>
nnoremap <leader># :Tabularize /#-}<CR>
nnoremap <leader>: :Tabularize /:-}<CR>

" Yep coq
augroup coq
  autocmd!
  autocmd VimEnter * execute 'COQnow -s' 
augroup END
let g:coq_settings = { 'keymap.bigger_preview': v:null, 'keymap.jump_to_mark': v:null }

" Nvim-lsp
nnoremap <leader>ao :CodeActionMenu<CR>


" nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

