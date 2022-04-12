" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set exrc

" ================ General Config ====================
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set backspace=indent,eol,start    " Intuitive backspacing.
set history=1000                  " Store lots of :cmdline history.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set visualbell                    " No beeping.
set gcr=a:blinkon0                " Disable cursor blink.
set autoread                      " Reload files changed outside vim.
set title                         " Set the terminal's title.
set nrformats=alpha               " Decimal arithmetic.
set timeoutlen=1000 ttimeoutlen=0
set textwidth=79                         " Max line length is 80 columns
set wrap
set linebreak
set formatoptions+=w
set formatoptions-=t
set ignorecase
set infercase

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" Turn on syntax highlighting.
syntax on
syntax enable

" Change leader to a space because the backslash is too far away
" That means all \x commands turn into <space>x
let mapleader = " "

" ================ Turn Off Swap Files ==============
set nobackup                      " Don't make a backup before overwriting a file.
set noswapfile                    " No swap files
set nowritebackup                 " And again.

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set listchars=tab:>-,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================
set wildmode=list:longest         " Complete files like a shell.
set wildmenu                      " Enhanced command line completion.
set shortmess+=c
set cmdheight=2
set updatetime=300

" ================ Scrolling ========================
set scrolloff=5                   " Start scrolling when we're 5 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Show trailing spaces

" ================ Searching ========================
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

" use magic regex by default
" don't have to escape everything anymore
nnoremap / /\v
vnoremap / /\v

" Strip trailing whitespace on save
autocmd FileType c,cpp,java,php,ruby,javascript,elixir,jsx,html,css,erlang,eruby autocmd BufWritePre <buffer> %s/\s\+$//e

" Language specific
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Enable matchit.vim (comes with vim these days)
runtime macros/matchit.vim

set rtp+=/usr/local/opt/fzf
