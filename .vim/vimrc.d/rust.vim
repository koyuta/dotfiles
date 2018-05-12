let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

let g:ale_linters = {'rust': ['cargo']}
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
