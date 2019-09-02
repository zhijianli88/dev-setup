" submodules: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'

Plugin 'fholgado/minibufexpl.vim'

Plugin 'fatih/vim-go'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" https://github.com/scrooloose/nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

:cw

" cscope
map <C-F11> :!cscope -Rbq<CR>
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-]>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"查找声明
nmap <C-]>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"查找定义
nmap <C-]>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"查找调用
nmap <C-]>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"查找指定的字符串
nmap <C-]>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"查找egrep模式，相当于egrep功能，但查找速度快多了
nmap <C-]>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
"查找文件
nmap <C-]>i :cs find i <C-R>^=expand("<cfile>")<CR>$<CR> 
"查找包含本文件的文件
nmap <C-]>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
"查找本函数调用的函数

if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

" -- MiniBufferExplorer --
autocmd BufReadPost *
\ if line("'\"")>0&&line("'\"")<=line("$") |
\ exe "normal g'\"" |
\ endif
let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1    "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
let g:miniBufExplorerMoreThanOne = 0

"=============Plugins above======================
let &termencoding=&encoding

set fileencodings=utf-8,gbk,cp936

set nu
set hlsearch

set nobackup
set ruler
set showmode
set backspace=2
syntax on
set showcmd
set whichwrap=b,s,<,>,[,]
set list
set listchars=tab:>-,trail:-
set tabstop=8
set expandtab
set ai
set colorcolumn=80
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
