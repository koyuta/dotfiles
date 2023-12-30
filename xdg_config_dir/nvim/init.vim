" dein
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(s:dein_repo_dir)

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  let s:toml      = '~/.config/nvim/rc/dein.toml'
  let s:lazy_toml = '~/.config/nvim/rc/dein_lazy.toml'

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
" colorschemeが見つからない場合は `call dein#recache_runtimepath()` で反映させる
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
set smarttab
set expandtab
set showmatch
set wildmenu
set backspace=indent,eol,start
set colorcolumn=80
set nocompatible

" include plugin settings
set runtimepath+=~/.config/nvim/
runtime! vimrc.d/*.vim
