"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/johnd/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/johnd/.cache/dein')
  call dein#begin('/Users/johnd/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/johnd/.cache/dein/repos/github.com/Shougo/dein.vim')
  " call dein#add('ervandew/supertab')
  call dein#add('honza/vim-snippets')
  call dein#add('srstevenson/vim-picker')

  " Languages
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tpope/vim-markdown')
  call dein#add('tpope/vim-rails')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('ap/vim-css-color')
  call dein#add('othree/csscomplete.vim')
  call dein#add('othree/html5.vim')
  call dein#add('vim-ruby/vim-ruby')

  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-vinegar')
  call dein#add('rizzatti/funcoo.vim')
  call dein#add('rizzatti/dash.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('justinmk/vim-sneak')
  call dein#add('mattn/emmet-vim')
  call dein#add('wellle/targets.vim')
  call dein#add('mtth/scratch.vim')
  call dein#add('wellle/targets.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('alvan/vim-closetag')
  call dein#add('w0rp/ale')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'build': './install.sh nightly'})

  " Appearance
  call dein#add('joshdick/onedark.vim')
  call dein#add('patstockwell/vim-monokai-tasty')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')


  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
