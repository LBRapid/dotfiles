" changing tabs with number keys
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>[ gT
map <leader>] gt
map <leader>0 :tablast<CR>

" Custom Indent Mappings
nmap <d-[> <<
nmap <d-]> >>
vmap <d-[> <gv
vmap <d-]> >gv

" Easy split navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Use cursor keys to navigate buffers.
nmap  <Right> :bnext<CR>
nmap  <Left>  :bprev<CR>
imap <Right> <ESC>:bnext<CR>
imap <Left>  <ESC>:bprev<CR>
nmap  <Del>   :bd<CR>

" Make the dot key functional in visual mode
vnoremap . :norm.<CR>

" Toggle tagbar
nnoremap <leader>6 :TagbarToggle<CR>

" Compile and run current buffer
nnoremap <F7> :w <CR> :!gcc % -o %< && ./%< <CR>

" switch to alternate file
nnoremap <leader><leader> <c-^>

" Toggle relative line numbering
nnoremap <leader>r :set relativenumber!<CR>

" Copy and paste to/from system clipboard
  vnoremap <leader>y "+y
  nnoremap <leader>y "+y
  noremap <leader>p :set paste<cr>"+p<cr>:set nopaste<cr>
  vnoremap <leader>p d:set paste<cr>"+p<cr>:set nopaste<cr>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
