syntax on
filetype plugin indent on

"colorscheme alduin

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

execute pathogen#infect()

"gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

"Floaterm
function! SetupFloaterm()
  execute "silent FloatermKill!"
  execute "FloatermNew --name=zsh --silent"
  if &filetype == "haskell"
    execute "FloatermNew --name=ghci --silent"
    execute "FloatermSend --name=ghci stack repl"
  endif
endfunction

autocmd BufWritePost *.hs FloatermSend --name=ghc :reload

nnoremap <C-t> :FloatermNext <cr>
autocmd VimEnter * call SetupFloaterm()
let g:floaterm_keymap_toggle = '†'
let g:floaterm_wintype = 'split'
let g:floaterm_height = 19
" let g:floaterm_position = 'rightbelow'

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0

"Open NERDTree when nvim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

"Show hidden files in NERDTree
let NERDTreeShowHidden=1

"Use Grepper
nnoremap <leader>ga :Grepper<cr>
nnoremap <leader>gb :Grepper -buffer<cr>

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

let g:hdevtools_stack = 1

nnoremap <leader>= :Tabularize /=<CR>
nnoremap <leader>- :Tabularize /-><CR>
nnoremap <leader>, :Tabularize /,<CR>
nnoremap <leader># :Tabularize /#-}<CR>

" Yep CoC

map <Leader>ggd <Plug>(coc-definition)
map <Leader>ggi <Plug>(coc-implementation)
map <Leader>ggt <Plug>(coc-type-definition)
map <Leader>gh :call CocActionAsync('doHover')<cr>
map <Leader>gn <Plug>(coc-diagnostic-next)
map <Leader>gp <Plug>(coc-diagnostic-prev)
map <Leader>gr <Plug>(coc-references)

map <Leader>rn <Plug>(coc-rename)

map <Leader>rf <Plug>(coc-refactor)
map <Leader>qf <Plug>(coc-fix-current)

map <Leader>al <Plug>(coc-codeaction-line)
map <Leader>ac <Plug>(coc-codeaction-cursor)
map <Leader>ao <Plug>(coc-codelens-action)

nnoremap <Leader>kd :<C-u>CocList diagnostics<Cr>
nnoremap <Leader>kc :<C-u>CocList commands<Cr>
nnoremap <Leader>ko :<C-u>CocList outline<Cr>
nnoremap <Leader>kr :<C-u>CocListResume<Cr>

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'vim': {'left': '"'}}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
