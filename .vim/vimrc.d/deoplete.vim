" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
call deoplete#custom#option({
    \ 'auto_complete_delay': 0,
    \ 'max_list': 10000,
    \ 'enable_refresh_always': 0,
    \ 'smart_case': v:true,
    \ })

inoremap <expr><tab> pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
