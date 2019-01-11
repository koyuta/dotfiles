" dein
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" download dein.vim if not installed
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" load plugins
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml      = '~/.vim/rc/dein.toml'
  let s:lazy_toml = '~/.vim/rc/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" check and install
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" color
colorscheme iceberg

" change mapleader `,` to `<space>`
let mapleader = "\<Space>"

" general
syntax on
set number
set cursorline
set clipboard+=unnamed
set tabstop=2
set shiftwidth=2
set incsearch
set hlsearch
set autoindent
set smartindent
set showmatch
set wildmenu
set backspace=indent,eol,start
set colorcolumn=80

" include plugin settings
set runtimepath+=~/.vim/
runtime! vimrc.d/*.vim
