let g:deoplete#sources#rust#racer_binary='/Users/s03621/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='{$(rustc --print sysroot)/lib/rustlib/src/rust/srcを書く}'
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#disable_keymap=1
nmap <buffer> gd <plug>DeopleteRustGoToDefinitionDefault
nmap <buffer> K  <plug>DeopleteRustShowDocumentation
