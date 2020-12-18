set nocompatible              " be iMproved, required
filetype on                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Folder Tree
Plugin 'preservim/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'Yggdroot/LeaderF'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin 配置
" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"vim基本配置
"缩进
set tabstop=2
set backspace=2
set autoindent
set softtabstop=4
set shiftwidth=4
" 智能自动缩进
" 设置自动缩进
set smartindent            
set ai!                      
" 显示括号配对情况
set showmatch                
set autoindent
set cindent
set sw=2
"show curosr position all the time"
set  ruler
"display incomplete commands
set showcmd
syntax enable
"背景颜色
set background=dark
"行号
set number
"搜索高亮
set hlsearch
syntax on

" Javascript syntax hightlight
syntax enable

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
