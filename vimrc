" Leader
"let mapleader="\"

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Colour scheme
syntax enable
colorscheme Tomorrow-Night
set lines=33 columns=90
set guioptions-=T
set guioptions-=m
set guioptions+=LlRrb
set guioptions-=LlRrb


"define font"
"set guifont=Ubuntu\ Mono:h18
set guifont=Ubuntu\ Mono\ Bold\ 12
"set guifont=Monaco\ Bold\ 9.5
"set guifont=Monaco\ 9.5
"set guifont=Monospace\ Bold\ 10
"set guifont=Monospace\ 10

" Highlight current line
set cursorline

"number lines"
set number

"define the space between lines"
set linespace=0

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

"indentation"
set smartindent
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" Powerline options
"let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1
set laststatus=2

" NERDTree mappings
nnoremap <Leader>p :NERDTreeToggle<CR>

" vim-rspec mappings
nnoremap <Leader>t :RunCurrentSpecFile()<CR>
nnoremap <Leader>s :RunNearestSpec()<CR>
nnoremap <Leader>l :RunLastSpec()<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

if exists("&relativenumber")
  " Use relative line numbers
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Local config
" if filereadable($HOME . "/.gvimrc.local")
"   source ~/.gvimrc.local
" endif
