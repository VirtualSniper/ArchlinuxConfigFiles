set nu " 显示行号
syntax on " 语法高亮
set ruler " 在右下角显示光标位置的状态行

colorscheme molokai "颜色方案
set backspace=2 "backspace=indent,eol,start
set nopaste " 取消粘贴缩进
set incsearch "增量搜索：从输入第一个字符就开始搜索
set hlsearch "高亮匹配
set ignorecase "大小写忽略

"更改不可字符的显示方式
set listchars=tab:-,

set confirm
setlocal noswapfile 

" 缩进
set tabstop=4       " 将Tab指定为4个空格字符，默认值是8
set shiftwidth=4    " shift 移动时(<<, >>)使用4个空格，默认值是8
set expandtab       " 插入模式下，Tab 会以一定数量的Space代替
set softtabstop=4 
set smarttab
set smartindent     " 按Enter键移动到下一行时自动缩进
set cindent         " 编写C语言代码时自动匹配C语法格式


" vundle start
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nginx.vim'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'winmanager'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'mattn/emmet-vim'
Plugin 'burnettk/vim-angular'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'wincent/command-t'
Plugin 'pangloss/vim-javascript'
Plugin 'taglist.vim'

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
" vundle end



" YouCompleteMe start
let g:ycm_global_ycm_extra_conf = '/home/linode/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
": YouCompleteMe end 

"ycm 和ultisnips 快捷键冲突问题
"ycm
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>','<Up>']
"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

map <F7> <Esc>:WMToggle<CR>
map <F8> :w <CR>: TlistToggle <CR>

"powerline{
 "set guifont=PowerlineSymbols\ for\ Powerline
 set t_Co=256
 set laststatus=2
 " set showtabline=2
 set noshowmode
 let g:Powerline_symbols = 'fancy'
 "}
 
" jvascript {
"}

" molokai color {
let g:molokai_original = 1
" }

"taglist {
let Tlist_Use_Right_Window = 1  " 在窗口右侧显示taglist
let Tlist_Exit_OnlyWindow = 1   " 如果taglist是最后一个窗口，退出vim
let Tlist_show_One_File = 1     " 只显示当前文件的taglist
"let Tlist_GainFocus_On_ToggleOpen = 1 " 打开taglist时，光标保留在taglist窗口
"}
