" vim-plug setup and configuration
if &compatible
  set nocompatible               " Be iMproved
endif

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" Plug('ervandew/supertab')
Plug('srstevenson/vim-picker')
Plug('junegunn/fzf.vim')

" Languages
" Plug('maxmellon/vim-jsx-pretty')
Plug('sheerun/vim-polyglot')
Plug('tpope/vim-rails')
Plug('hail2u/vim-css3-syntax')
Plug('ap/vim-css-color')
Plug('othree/csscomplete.vim')
Plug('fatih/vim-go')

Plug('tpope/vim-fugitive')
Plug('tpope/vim-rhubarb')
Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')
Plug('tpope/vim-vinegar')
Plug('rizzatti/funcoo.vim')
Plug('rizzatti/dash.vim')
Plug('scrooloose/syntastic')
Plug('justinmk/vim-sneak')
Plug('mattn/emmet-vim')
Plug('wellle/targets.vim')
Plug('mtth/scratch.vim')
Plug('wellle/targets.vim')
Plug('junegunn/vim-easy-align')
Plug('christoomey/vim-tmux-navigator')
Plug('alvan/vim-closetag')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug('thinca/vim-quickrun')

" Appearance
Plug('joshdick/onedark.vim')
Plug('patstockwell/vim-monokai-tasty')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

" Initialize plugin system
call plug#end()
