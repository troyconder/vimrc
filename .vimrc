"TODO: jshint
"TODO:按指定字符对齐

"是否兼容VI,开启iMproved,用Bundlet管理插件，此选项必须设置nocompatible
set nocompatible
"适应Windows环境的一些设置，不用的可以关闭
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set guifont=Consolas:h12
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"禁止生成备份文件
set nobackup
"搜索忽略大小写
set ignorecase 
"搜索逐字符高亮
set incsearch
"行内替换
set gdefault
"始终显示行号
set nu!
"显示光标的坐标
set ruler
"高亮整行
set cursorline
"自动缩进
set noautoindent
set cindent
set smartindent
"设置Tab键的宽度
set shiftwidth=4
set tabstop=4
"将Tab键更改为四个空格
set expandtab
"这里是为了php的编码规范需求，所以也可以将文件只限定为php生效
autocmd FileType php set expandtab
"根据编辑模式更改输入法光标颜色，同时禁用IME自动切换
if has('multi_byte_ime')
	hi Cursor guifg=bg guibg=Orange gui=NONE
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	set iminsert=0 imsearch=0
endif
"与Windows共享剪贴板
set clipboard+=unnamed
"编辑vimrc之后，重新加载
autocmd! bufwritepost _vimrc source $VIM/_vimrc
"设置语法高亮
syntax on
colorscheme delek
"
"测试gitflow
"
"##########Bundle 插件管理 配置开始#############
filetype off
set rtp+=D:/vim73/vimfiles/bundle/vundle/
call vundle#rc('D:/vim73/vimfiles/bundle/')

"插件管理核心库
Bundle 'gmarik/vundle'
"代码补全
Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'https://github.com/Shougo/neosnippet'
"代码段自动生成
"Bundle 'snipMate'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle "snipmate-snippets"
"Bundle "garbas/vim-snipmate"
"插件 语法/高亮
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'Markdown'
Bundle 'Markdown-syntax'
Bundle 'php.vim-html-enhanced'
"HTML混排缩进改善
Bundle "pangloss/vim-javascript"

"按特殊字符对其， 需要修改源码以支持中文字符 https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'

"statuslines 增强状态栏
"Bundle 'scrooloose/vim-statline'
"powerline 增强状态栏
Bundle 'https://github.com/Lokaltog/vim-powerline.git'

"文件管理器
Bundle 'scrooloose/nerdtree'
"autocmd vimenter * NERDTree
"Bundle 'hallettj/jslint.vim'

"即时预览CSS颜色
"Bundle 'skammer/vim-css-color'
"Bundle 'ZenCoding.vim'
"Bundle 'The-NERD-tree'
"Bundle 'SuperTab'


"激活插件与文件类型的依赖关系
filetype plugin indent on
"##########插件管理 结束#############

"自定义关联文件类型
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.phtml set filetype=php
au BufRead,BufNewFile *.js set ft=javascript.jquery

"--------插件设置

"---NeoComplCache 启动并使用Tab触发
let g:neocomplcache_enable_at_startup = 1 

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

"vim-powerline插件配置
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf8


autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"--------自定义快捷键

" 编辑模式进行光标移动
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk


"A-t : 打开NERDTree
map <silent> <C-t>   <ESC>:NERDTree<CR>
" 以打开NERDTree时的目录为工作目录
let NERDTreeChDirMode=1

"mm : 规范行首空格<cr>去除多余字符<cr>删除空白行<cr>规范行数
nmap mm :%s/\r//g<cr>

"ff : 前后补全
"vmap ff <Esc>`>i')?><Esc>`<i<?=$this->_('<Esc>
vmap ff "zdi<?=$this->_('<C-R>z');?><ESC>

