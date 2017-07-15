"==========================================
" Author:  wklken
" Version: 5
" Email: wklken@yeah.net
" BlogPost: http://blog.csdn.net/wklken/article/details/8044678
" ReadMe: README.md
" Last_modify: 2012-12-16
" Sections:
"     ->General 基础设置
"     ->Show 展示/排班等界面格式设置
"     ->file encode, 文件编码,格式
"     ->others 其它基础配置
"     ->hot key  自定义快捷键
"     ->bundle 插件管理和配置项
"     ->colortheme 主题,及一些展示上颜色的修改
"==========================================

"==========================================
" General 基础设置
"==========================================

" set guifont=Monaco\ 14          " 字体 && 字号
"配色方案

" history存储长度。
set history=2000

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

" 备份,到另一个位置. 防止误删
set backup
set backupext=.bak
set backupdir=/tmp/

" 取消备份。 视情况自己改
"set nobackup
set noswapfile

" 突出显示当前行列 不喜欢这种定位可注解
set cursorcolumn
set cursorline              " 突出显示当前行

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

"- 则点击光标不会换,用于复制
"set mouse=a           " 鼠标暂不启用, 键盘党....
set mousemodel=popup
set selection=exclusive
set selectmode=mouse,key

set fileformat=unix  "换行使用unix方式

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show 展示/排班等界面格式设置
"==========================================

"显示行号：
set number
"set nowrap                    " 取消换行。
"

"set lines=40
"set columns=140


" 命令行高度
set cmdheight=2

"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=4

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
"set foldlevelstart=0  "默认折叠级别：0为缩进的1级，1为2级
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

"Smart indent
set smartindent
set autoindent    " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

set tabstop=4 " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格

set expandtab " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set showcmd
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


"行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
set relativenumber
au FocusLost * :set number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc
" C-n切换相对与绝对行号
nnoremap <C-n> :call NumberToggle()<cr>

"create undo file
set undolevels=10000         " How many undos
set undoreload=10000        " number of lines to save for undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vimfilebak/vimundo/
endif

"显示当前的行号列号：
set ruler
""在状态栏显示正在输入的命令
set showcmd
" Show current mode
set showmode

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set scrolloff=7

set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2

" 显示TAB字符为<+++
set list
set list listchars=tab:<+

set lazyredraw  "延迟重绘

set cc=79  " 最大宽度 set colorcolumn=79
set fo+=m  " 中文40个字符
" set tw=79

" 第79列高亮颜色
highlight ColorColumn guibg=DarkGray
highlight ColorColumn ctermbg=236

"==========================================
" file encode, 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
"set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1

set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"language message zh_CN.UTF-8
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" others 其它配置
"==========================================
autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。

" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set completeopt+=longest
set completeopt=longest,menu

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.swp,*.bak,*.pyc,*.class,*.obj,*.o,*.map,*~

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent
set backspace=2     "退格键可以删除任何东西
set whichwrap+=<,>,h,l

"==========================================
"hot key  自定义快捷键
"==========================================
let mapleader = ';'
let g:mapleader = ';'

" 运行python
map [r :w <CR>:! python % <CR>
map [3 :w <CR>:! python3 % <CR>
map <leader>py :w <CR>:! python % <CR>
map <leader>ts :w <CR>:! tsc % <CR>

" 运行shell
map <leader>sh :w <CR>:!bash % <CR>

" 运行java
func! CompileRunJava()
    exec "w"
    exec "!javac %"
    if v:shell_error == 0
        exec "!java %<"
    endif
endfunc
map <leader>ja :w <CR>:call CompileRunJava()<CR>

" tab转换为4个空格tab to space
map <leader>t2s :%s/<tab>/    /g<CR>
" 快速保存
nmap <leader>w :w!<cr>

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ee :e ~/.vimrc<CR>
nmap <silent> <leader>ss :so ~/.vimrc<CR>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

" better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H 0
noremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

""为方便复制，用<F2>开启/关闭行号显示:
function! ShowHideNumber()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
  if(&number == 1)
    set nonumber
  else
    set number
  endif
endfunc
" C-n切换相对与绝对行号，同时如果不显示数字，那么同时隐藏缩进线
"nnoremap <F2> :set nonumber! number?<CR>
nnoremap <F2> :call ShowHideNumber()<cr>:IndentLinesToggle<cr>

" 移除缩进线
"nnoremap <F3> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
nnoremap <F3> :IndentLinesToggle<CR>

nnoremap <F4> :set wrap! wrap?<CR>
"set paste
set pastetoggle=<F5>            " when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

nnoremap <F6> :set list! list?<CR>


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
"map <c-space> ?"

map Y y$
cmap w!! %!sudo tee > /dev/null %
noremap <silent><leader>/ :nohls<CR>

inoremap jj <Esc>
" I can type :help on my own, thanks.
noremap <F1> <Esc>"

"nnoremap ; :

nnoremap <leader>v V`}

"Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" > <符号缩进
vnoremap < <gv
vnoremap > >gv

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"Use arrow key to change buffer"
noremap <left> :bp<CR>
noremap <right> :bn<CR>

""Jump to start and end of line using the home row keys
""
nmap t o<ESC>k
nmap T O<ESC>j

" ctrl +jk to move lines   经常敲错换错行...一致没想好配哪个映射
"noremap <C-k> :m+<CR>
"noremap <C-j> :m-2<CR>
"inoremap <C-j> <Esc>:m+<CR>
"inoremap <C-k> <Esc>:m-2<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
" 下面这两个映射困扰了N年，现在终于解决了:(
" 如果启用，那么当保存文件的时候，光标会自动跳转到行首！！！
"nnoremap ' `
"nnoremap ` '

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
"nnoremap <silent> <leader>d "_d
"vnoremap <silent> <leader>d "_d

" remap U to <C-r> for easier redo
nnoremap U <C-r>

"au VimResized * exe "normal! \<c-w>=""

" select all
map <Leader>sa ggVG"

" automatically reload vimrc when it's saved
"au BufWritePost .vimrc so ~/.vimrc'"

" Close the current buffer
map <leader>bd :Bclose<cr>
" " Close all the buffers
map <leader>ba :1,1000 bd!<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


"==========================================
" bundle 插件管理和配置项
"==========================================
"========================== config for plugins begin ======================================

" 0-bundle the plugins
"package dependent:  ctags
"python dependent:  pep8, pyflake

filetype off " required! turn off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'
" vim plugin bundle control, command model
" :BundleInstall     install
" :BundleInstall!    update
" :BundleClean       remove plugin not in list

Bundle 'leafgarland/typescript-vim'

Bundle "elzr/vim-json"
" 显示双引号
let g:vim_json_syntax_conceal=0


Bundle 'editorconfig/editorconfig-vim'
Bundle 'posva/vim-vue'
"Bundle 'digitaltoad/vim-pug'

"Bundle 'StanAngeloff/php.vim'
"Bundle 'shawncplus/phpcomplete.vim'

"Bundle 'mtscout6/vim-cjsx'

" jinja2高亮,因为原插件将jinja2识别为jinja类型,并且语法高亮的文件名也为
" jinja.vim,导致snips插件不能正确使用代码片段,故fork过来了.
"Bundle 'Glench/Vim-Jinja2-Syntax'

Bundle 'digitaltoad/vim-jade'
Bundle 'digitaltoad/vim-pug'


"主题 solarized
"Bundle 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" colorscheme solarized

"主题 molokai
Bundle 'Shu-Ji/molokai'
let g:molokai_original = 1
colorscheme molokai

" distinguished主题
" Bundle 'Lokaltog/vim-distinguished'
" colorscheme distinguished

" session管理,保存编辑会话,undo,redo等等
" Bundle 'vim-scripts/sessionman.vim'

" minibufexplorer
Bundle 'fholgado/minibufexpl.vim'
" minibufexpl插件的一般设置
let g:miniBufExplMapCTabSwitchBufs = 1
" minibuffer操作快捷方式!
nnoremap <tab> :bn<CR>
nnoremap <c-s-tab> :bp<CR>
" 右方向键切换到下一个缓冲区文件
map <right> :bn<cr>
" 左方向键切换到上一个缓冲区文件
map <left> :bp<cr>
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 15
let g:miniBufExplSplitBelow=0
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:bufExplorerSortBy = "name"

" zencoding
Bundle 'mattn/emmet-vim'

Bundle 'othree/html5.vim'


"目录导航
" Bundle 'vim-scripts/The-NERD-tree'
" map <leader>n :NERDTreeToggle<CR>
" let NERDTreeHighlightCursorline=1
" let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
" let g:netrw_home='~/.vimbak'
" 打开文件时自动打开NERDTree
" autocmd VimEnter *.* :NERDTree

"标签导航
Bundle 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" 打开文件时自动打开tagbar
"autocmd BufEnter *.* :TagbarOpen


"标签导航 要装ctags
"Bundle 'vim-scripts/taglist.vim'
"set tags=tags;/
"let Tlist_Ctags_Cmd="/usr/bin/ctags"
"nnoremap <silent> <F8> :TlistToggle<CR>
"let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Auto_Open = 0
"let Tlist_Auto_Update = 1
"let Tlist_Close_On_Select = 0
"let Tlist_Compact_Format = 0
"let Tlist_Display_Prototype = 0
"let Tlist_Display_Tag_Scope = 1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_File_Fold_Auto_Close = 0
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Hightlight_Tag_On_BufEnter = 1
"let Tlist_Inc_Winwidth = 0
"let Tlist_Max_Submenu_Items = 1
"let Tlist_Max_Tag_Length = 30
"let Tlist_Process_File_Always = 0
"let Tlist_Show_Menu = 0
"let Tlist_Show_One_File = 1
"let Tlist_Sort_Type = "order"
"let Tlist_Use_Horiz_Window = 0
"let Tlist_Use_Right_Window = 0
"let Tlist_WinWidth = 25


"状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
" let g:Powerline_stl_path_style = 'short'


"括号显示增强
"Bundle 'kien/rainbow_parentheses.vim'
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['black',       'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces


"代码排版缩进标识
Bundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '.'


"更高效的移动 ,, + w/fx
" Bundle 'Lokaltog/vim-easymotion'

"for file search ctrlp
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\.(git|hg|svn)$|.rvm$\|\.wsgic$\|\.gif$\|\.png$\|\.jpg$\|\.bmp$\|\.pyc$\|\.pyo$|\vnode_modules$|\.map$'
set wildignore+=node_modules
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"自动补全单引号，双引号等 Bundle 'underlog/ClosePairs'
Bundle 'Raimondi/delimitMate'

"快速 加减注释
" Bundle 'scrooloose/nerdcommenter'
"

Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'


"快速插入代码片段
"Bundle 'vim-scripts/UltiSnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["snippets", "bundle/UltiSnips/UltiSnips"]

" 快速加入修改环绕字符
Bundle 'tpope/vim-surround'
"for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'


" for markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

"for nginx conf file highlight.   need to confirm it works
Bundle 'Shu-Ji/nginx-vim-syntax'

" task list
"Bundle 'vim-scripts/TaskList.vim'
"map <leader>td <Plug>TaskList

" CoffeeScript高亮
Bundle 'kchmck/vim-coffee-script'

" lesscss
Bundle 'groenewege/vim-less'
"Bundle 'lunaru/vim-less'

" less转换为css, 需要sudo apt-get install lessc
"nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
" css中颜色显示为背景
"Bundle 'skammer/vim-css-color'
" css3 语法高亮
Bundle 'hail2u/vim-css3-syntax'


" 编辑时自动语法检查标红, vim-flake8目前还不支持,所以多装一个
" 使用pyflakes,速度比pylint快
"Bundle 'scrooloose/syntastic'
"let g:syntastic_error_symbol='>>'
"let g:syntastic_warning_symbol='>'
"let g:syntastic_check_on_open=1
"let g:syntastic_enable_highlighting=1
""let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
"let g:syntastic_python_checkers=['pyflakes']
"" 不要检查xmllint语法，有的网址被和谐了，不能访问，会卡死：
"let g:loaded_syntastic_xml_xmllint_checker=0
"let g:syntastic_ignore_files=[ ".*\.py$", ".*\.xml$", ".*\.txt$", ".*\.html", ".*\.md$", ".*\.vue" ]
"highlight SyntasticErrorSign guifg=white guibg=black
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_jump = 0
"
"" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
"Bundle 'kevinw/pyflakes-vim'
"let g:pyflakes_use_quickfix = 0

" http://stackoverflow.com/questions/2360249/vim-automatically-removes-indentation-on-python-comments
" 输入#时缩进会消失，用下面解决
inoremap # X<BS>#


" for golang
" Bundle 'jnwhiteh/vim-golang'


" for javascript
Bundle "pangloss/vim-javascript"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" for git 尚未用起来
Bundle 'tpope/vim-fugitive'

"edit history, 可以查看回到某个历史状态
Bundle 'sjl/gundo.vim'
nnoremap <leader>h :GundoToggle<CR>

"for mru, recently opened files
Bundle 'vim-scripts/mru.vim'
map <leader>f :MRU<CR>
let MRU_Max_Menu_Entries = 20
let MRU_Use_Current_Window = 1
let MRU_Max_Entries = 100

"Bundle 'vim-scripts/matchit.zip'

"for code alignment
"Bundle 'godlygeek/tabular'
"nmap <Leader>a= :Tabularize /=<CR>
"vmap <Leader>a= :Tabularize /=<CR>
"nmap <Leader>a: :Tabularize /:\zs<CR>
"vmap <Leader>a: :Tabularize /:\zs<CR>

"for jquery
Bundle 'nono/jquery.vim'

"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'

"for visual selection
Bundle 'terryma/vim-expand-region'
map = <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

"for mutil cursor
"Bundle 'terryma/vim-multiple-cursors'
"" Default mapping
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

"迄今位置用到的最好的自动VIM自动补全插件
Bundle 'Valloric/YouCompleteMe'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
nmap <F4> :YcmDiags<CR>
nmap <leader>jd :YcmCompleter GoTo<CR>
nmap gl :YcmCompleter GoToDeclaration<CR>
nmap gf :YcmCompleter GoToDefinition<CR>
nmap go :YcmCompleter GoToDefinition<CR>


" end turn on
filetype plugin indent on

"========================== config for plugins end ======================================

"==========================================
" 主题,及一些展示上颜色的修改
"==========================================
"开启语法高亮
syntax enable
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco\ 12
    set guioptions-=T
    set guioptions+=e
    set guioptions-=L  " 隐藏左侧滚动条
    set guioptions-=r  " 隐藏右侧滚动条"
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif


" 修改主题和颜色展示
set background=dark
set t_Co=256


"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange
"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" nginx 高亮：需要将文件名以.nginx.conf结尾，如mysite.nginx.conf
au BufNewFile,BufRead *.nginx.conf setf nginx


" 解决vim粘贴时缩进的问题（不用再按F5后再粘贴了，tmux自动处理）
" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
