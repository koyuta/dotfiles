" go
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

" python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        \ })
endif

" rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })
endif

"" typescript
"if executable('typescript-language-server')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'typescript-language-server',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"        \ 'whitelist': ['typescript', 'typescript.tsx'],
"        \ })
"endif
"
"" javascript
"if executable('typescript-language-server')
"    au User lsp_setup call lsp#register_server({
"      \ 'name': 'javascript support using typescript-language-server',
"      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
"      \ 'whitelist': ['javascript', 'javascript.jsx'],
"      \ })
"endif
"
"" vue (for .vue file)
"if executable('vls')
"    augroup LspVls
"        au!
"        au User lsp_setup call lsp#register_server({
"          \ 'name': 'vue-language-server',
"          \ 'cmd': {server_info->['vls']},
"          \ 'whitelist': ['vue'],
"          \ 'initialization_options': {
"          \         'config': {
"          \             'html': {},
"          \              'vetur': {
"          \                  'validation': {}
"          \              }
"          \         }
"          \     }
"          \ })
"    augroup end
"endif

nmap <silent> <Leader>d :LspDefinition<CR>
"nmap <silent> <Leader>p :LspHover<CR>
nmap <silent> <Leader>r :LspReferences<CR>
"nmap <silent> <Leader>i :LspImplementation<CR>
nmap <silent> <Leader>s :split \| :LspDefinition <CR>
nmap <silent> <Leader>v :vsplit \| :LspDefinition <CR>
