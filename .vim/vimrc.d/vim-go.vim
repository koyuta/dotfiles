" Run :GoImports on save
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

let g:go_fmt_command = "goimports"

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
