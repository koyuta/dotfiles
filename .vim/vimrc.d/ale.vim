let g:ale_linters = {
			\ 'rust': ['cargo', 'rls', 'rustc'],
			\ 'go': ['gometalinter'],
			\ }

let g:ale_fixers = {
			\ 'rust': ['rustfmt'],
			\ 'go': ['gofmt', 'goimports'],
			\ }

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_list_window_size = 4

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'
