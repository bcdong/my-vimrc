let mapleader=";"
filetype on
filetype plugin on
" 关闭兼容模式
set nocompatible
set backspace=indent,eol,start

nmap LB 0
nmap LE $

" 定义各种快捷键
noremap <Leader>y "+y
noremap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" vim plug设置
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
"Plug 'derekwyatt/vim-fswitch'
"Plug 'dyng/ctrlsf.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
"Plug 'vim-scripts/DrawIt'
"Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
"Plug 'Valloric/YouCompleteMe'
"Plug 'derekwyatt/vim-protodef'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'  }
Plug 'rking/ag.vim'
"Plug 'fholgado/minibufexpl.vim'
" Plug 'gcmt/wildfire.vim'
" Plug 'sjl/gundo.vim'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'suan/vim-instant-markdown'
" Plug 'lilydjwg/fcitx.vim'
Plug 'luochen1990/rainbow'
Plug 'junegunn/vim-emoji'
" 插件列表结束
call plug#end()

filetype plugin indent on

" 配色方案
" colorscheme molokai
set background=dark
colorscheme solarized8
"let g:solarized_termcolors=256

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 关闭括号高亮
"set noshowmatch

" 设置 gvim 显示字体
" set guifont=Source\ Code\ Pro\ 14

" 禁止折行
" set nowrap

" 设置状态栏主题风格
" let g:Powerline_colorscheme='molokai'

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=8
" 设置格式化时制表符占用空格数
set shiftwidth=8
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=8

" indentLine配置
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" 代码折叠
" 基于语法或者缩进进行折叠，快捷键：<leader> za
"set foldmethod=syntax
set foldmethod=indent
" 启动vim时不折叠代码
set nofoldenable

" powerline配置，系统已经通过pip3安装了powerline，所以Vundle中不需要再安装
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
"let g:Powerline_colorscheme='solarized256'

" *.cpp 和 *.h 间切换
"nmap <silent> <Leader>sw :FSHere<cr>

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
"nnoremap <Leader>sp :CtrlSF<CR>

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
" let g:UltiSnipsExpandTrigger="<leader><tab>"
" let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
" let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" protodef由接口快速生成实现
" 设置 pullproto.pl 脚本路径
"let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
"let g:disable_protodef_sorting=1

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
map <F2> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" NerdCommenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" 使用Tagbar查看tag列表
nmap <F3> :TagbarToggle<CR>
let tagbar_right=1
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'f:functions:0:1',
         \ 'c:classes:0:1',
         \ 'd:macros:1:1',
         \ 'e:enumerators:1:0', 
         \ 'g:enumeration:1:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" 显示/隐藏 MiniBufExplorer 窗口
"map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
"map <C-Tab> :MBEbn<cr>
"map <C-S-Tab> :MBEbp<cr>

" 设置环境保存项
"set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
"set undodir=~/.undo_history/
"set undofile
" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" YCM配置
"let g:ycm_server_python_interpreter='/usr/bin/python2'
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
" 全局ycm_extra_conf文件
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
" 从第2个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
" 语法关键字补全			
"let g:ycm_seed_identifiers_with_syntax=1

"nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
"nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'

" 启用彩虹括号
let g:rainbow_active = 1

" vim-emoji
set completefunc=emoji#complete

