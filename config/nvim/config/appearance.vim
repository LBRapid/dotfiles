set background=dark
let g:material_theme_style = 'darker'
colorscheme material

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set guifont=Sauce\ Code\ Powerline:h15
  set transparency=0
  set guioptions=aAce
  set guitablabel=%N\ %t\ %m
  set noballooneval
endif

if (has('termguicolors'))
  set termguicolors
endif
