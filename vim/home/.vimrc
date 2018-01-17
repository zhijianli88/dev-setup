let &termencoding=&encoding
set fileencodings=utf-8,gbk,cp936
set fileformat=unix

colorscheme evening
set hls

" short command
map <C-F12> :!ctags -R .<CR>

" taglist
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"let Tlist_Auto_Open=1

"let mapleader=","
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

"-- WinManager setting --
" let g:winManagerWindowLayout='FileExplorer|TagList' " 设置我们要管理的插件
" let g:bufExplorerMaxHeight=30
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap wm :WMToggle<cr>

" -- MiniBufferExplorer --
let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1    "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
let g:miniBufExplorerMoreThanOne = 0

set nu
"set autoindent

" for linux code style
"set expandtab
"set shiftwidth=4

"set tabstop=4
" set mouse=a
set tags=tags
set tags+=./tags

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
set runtimepath+=/home/chenfan/data/go/misc/vim " replace $GOROOT with the output of: go env GOROOT
filetype plugin indent on
syntax on
filetype plugin on
set colorcolumn=80
set list
set listchars=tab:>-,trail:-

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
