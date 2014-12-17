" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set t_Co=256

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set splitbelow
set splitright
set relativenumber

" http://usevim.com/2014/07/11/key-speed/
set timeoutlen=2000 ttimeoutlen=0

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on


" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vimrc.bundles
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2

filetype plugin on
filetype indent on


" Display tabs and trailing spaces visually
set list listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points"


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

autocmd Filetype gitcommit setlocal spell textwidth=72

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" TODO: this may not be in the correct place. It is intended to allow
" overriding <Leader>. source ~/.vimrc.after if it exists.
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Fix a lot of issues with Fish shell
if $SHELL == '/bin/fish'
  set shell=/bin/sh
endif
