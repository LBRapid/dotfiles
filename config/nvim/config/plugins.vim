" Airline
"
"
let g:airline_theme='monokai_tasty'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" vim-picker
"
"
nmap <unique> <C-p> <Plug>(PickerEdit)
nmap <unique> <leader>pe <Plug>(PickerEdit)
nmap <unique> <leader>ps <Plug>(PickerSplit)
nmap <unique> <leader>pt <Plug>(PickerTabedit)
nmap <unique> <leader>pv <Plug>(PickerVsplit)
nmap <unique> <leader>pb <Plug>(PickerBuffer)
nmap <unique> <leader>ph <Plug>(PickerHelp)

" Emmet
"
"
let g:user_emmet_leader_key='<C-y>'

" Omnifuncs
"
"
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" coc.nvim
"
"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "<C-g>u<CR>"

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'


" vim-closetag
"
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb,*.js'

" vim-endwise
"
"
let g:endwise_no_mappings=1

" ale
"
"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier_eslint', 'prettier']
\}
let g:ale_fix_on_save = 1
