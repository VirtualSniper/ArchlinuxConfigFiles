let mapleader=","
set nu " 显示行号
syntax on " 语法高亮
set ruler " 在右下角显示光标位置的状态行

" filetype on "开户文件类型侦测
" filetype plubin on "根据侦测到不同类型加载对应的插件

"colorscheme molokai "颜色方案
colorscheme kalisi
set background=dark "light, dark

set backspace=2 "backspace=indent,eol,start
set nopaste " 取消粘贴缩进
set incsearch "增量搜索：从输入第一个字符就开始搜索
set hlsearch "高亮匹配
set ignorecase "大小写忽略

"更改不可字符的显示方式
"set listchars=tab:-,

set confirm
setlocal noswapfile 

" 缩进
set tabstop=4       " 将Tab指定为4个空格字符，默认值是8
set shiftwidth=4    " shift 移动时(<<, >>)使用4个空格，默认值是8
set expandtab       " 插入模式下，Tab 会以一定数量的Space代替
set softtabstop=4   " 把连续数量的空格视为一个制表符
set smarttab
set smartindent     " 按Enter键移动到下一行时自动缩进
set cindent         " 编写C语言代码时自动匹配C语法格式

" set foldmethod=indent " 基于缩进折叠
set foldmethod=syntax " 基于语法折叠
autocmd FileType python setlocal foldmethod=indent
set nofoldenable      " 启动 vim 时关闭折叠

" vundle start
set nocompatible              " 关闭兼容模式be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'nginx.vim'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'mattn/emmet-vim'
Plugin 'burnettk/vim-angular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" for node begin{
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'  " completion
Plugin 'ahayman/vim-nodejs-complete'
" } end for node

Plugin 'taglist.vim'
Plugin 'Raimondi/delimitMate'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'VIlisp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlp.vim'
Plugin 'unite.vim'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'rainbow_parentheses.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'junegunn/goyo.vim'
Plugin 'jeaye/color_coded'
" colorscheme 
Plugin 'freeo/vim-kalisi' 
" utility start {
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
" } end utility

" All of your Plugins must be added before the following line
call vundle#end()            " required

" 自适应不同语言的智能缩进
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
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_auto_trigger=1
"let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments = 1
"let g:ycm_show_diagnostics_ui = 0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pg :YcmCompleter GoTo<CR>
nmap <F4> :YcmDiags<CR>
": YouCompleteMe end 

"ycm 和ultisnips 快捷键冲突问题
"ycm
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>','<Up>']
"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

map <F7> <Esc>:NERDTreeToggle<CR>
" map <F8> :w <CR>: TlistToggle <CR>
map <F8> :TagbarToggle<CR>

" jvascript {
"}

" molokai color {
let g:molokai_original = 1
let g:rehash256 = 1
" }

"taglist {
let Tlist_Use_Right_Window = 1  " 在窗口右侧显示taglist
let Tlist_Exit_OnlyWindow = 1   " 如果taglist是最后一个窗口，退出vim
let Tlist_show_One_File = 1     " 只显示当前文件的taglist
"let Tlist_GainFocus_On_ToggleOpen = 1 " 打开taglist时，光标保留在taglist窗口
"}
"

let delimitMate_expand_cr = 1
"let delimitMate_expand_space = 1

"vim-indent-guides {
"let g:indent_guides_enable_on_vim_startup=1 " 同vim 自动启动
"let g:indent_guides_start_level=2           " 从第二层显示缩进
"let g:indent_guides_guide_size=1            " 色块宽度
"}

"vim-jsx{
let g:jsx_ext_required = 0
"}
"}

"vim-go {
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command="goimports"
"}


" go 语言 保存时自动retab
"autocmd BufWritePost *.go set expandtab | retab

"ag{
"let g:ackprg = 'ag --vimgrep'
nnoremap <leader>s :Ag "<C-R><C-W>" <CR>
"}

"ctrlp {
"let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
"}

"airline {
"let g:airline_section_b = '%{strftime("%H:%M")}'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='kalisi'
set laststatus=2
"}

" syntastic {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_c_checkers= ['make']
" let g:syntastic_cpp_checkers= ['clang_check']
" for nginx code 
let g:syntastic_c_include_dirs = ['src/core', 'src/event', 'src/os/unix', 'objs', 'src/http', 'src/http/modules', 'src/mail', 'src/stream']

" for mlt 
let g:syntastic_cpp_include_dirs = ['src/framework']
" fo go 
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': '[go]' }
" }

"vim-javascript {
let javascript_enable_domhtmlcss = 1

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
"}

" tern_of_vim {
"let g:tern_show_argument_hints='on_hold'
"let g:tern_map_keys=1
" }



" 自动补全菜单
set wildmenu
set wildmode=full

inoremap jj <ESC>
" 将刚刚输入的单词变为大写
inoremap <C-u> <esc>gUiwea

set completeopt-=preview

" javascript 为两个空格
" ts : tabstop
" sts: softtabstop
" sw : shiftwidth
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" for ruby {
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
" } end 

" {
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }

"{vim-easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion"
let g:EasyMotion_smartcase = 1
"} vim-easymotion end

"{ a.vim

"} a.vim

"{ vim-snippets
let g:snips_author='cfpeng'
let g:snips_email='snipervirtual@gmail.com'
let g:snips_github='https://github.com/cfpeng'
"} vim-snippets 

"autocmd bufnewfile *.sh 0r ~/github/ArchlinuxConfigFiles/vim/template/bash_default.sh

" insert new line in insert mode 
imap ,nn <C-O>o

" Tabularize {
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" Tabularize end }

set cursorline
set cursorcolumn
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
