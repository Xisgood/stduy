" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

""""""""""set backspace"""""""""""
set nocompatible
set backspace=indent,eol,start
"
""""""""" Settings of taglist""""""""""""""
 let Tlist_WinWidth=10
 let Tlist_Show_One_File=0 "显示多个文件的tags"
 let Tlist_Auto_Open=0
 let Tlist_Exit_OnlyWindow=1 "在taglist是最后一个窗口时退出vim"
 let Tlist_Use_SingleClick=1 "单击时跳转"
 let Tlist_File_Fold_Auto_Close=1 "非当前文件,函数列表折叠隐藏"
 let Tlist_Enable_Fold_Column=1
 let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点"
 let Tlist_Process_File_Always=1 "不管taglist窗口是否打开,始终解析文件中的tag"
 let Tlist_Auto_Update=1
" """""""""" NERDtree settings"""""""""""""""
 let NERDTreeWinPos='right'
" """""""""" mini buffer navigator"""""""""""
 let g:miniBUfExplMapWindowNavVim=1
 let g:miniBufExplMapWindowNavArrows=1
 let g:miniBufExplMapCTabSwitchBufs=1
 let g:miniBufExplModSelTarget=1 
 let g:miniBufExplUseSingleClick=1
 let g:miniBufExplMoreThanOne=0
"
" """"""""""""ctags settings"""""""""""""""""
 set tags+=~/.vim/cpptags
 set tags+=~/.vim/systags
 
"启动时如果存在tags则自动加载"
if exists("ctags")
    set tags=./tags
endif 

"
" """""""""""color scheme""""""""""""""""""""
"let g:molokai_original=1
"设置molokai在终端的配色方案"
colorscheme molokai
set t_Co=256
"let g:rehash256=1
"设置缩进"
set smartindent
set ts=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set cindent
set tabstop=4
set nu
"""""""""""""""""""""set vundle"""""""""""""""""""""""
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
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'taglist.vim'
""Plugin 'c.vim'
Plugin 'minibufexpl.vim'
""Plugin 'grep.vim'
""Plugin 'mru.vim'
""Plugin 'comments.vim'
Plugin 'tenfyzhong/CompleteParameter.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Auto-Pairs'
""Plugin 'Lokaltog/vim-powerline'
""Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
""Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe  代码自动补全
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 set completeopt=longest,menu
 let g:ycm_confirm_extra_conf=0
 " 关闭加载.ycm_extra_conf.py提示
 let g:ycm_complete_in_comments = 1
 "在注释输入中也能补全
 let g:ycm_complete_in_strings = 1
 "在字符串输入中也能补全
 let g:ycm_collect_identifiers_from_tags_files=1
 " 开启 YCM 基于标签引擎
 let g:ycm_collect_identifiers_from_comments_and_strings = 1
 "注释和字符串中的文字也会被收入补全
 let g:ycm_seed_identifiers_with_syntax=1
 "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
 let g:ycm_collect_identifiers_from_tags_files = 1
 let g:ycm_min_num_of_chars_for_completion=2
 " 从第2个键入字符就开始罗列匹配项
 let g:ycm_path_to_python_interpreter='/usr/bin/python'
 " 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"mapping
let g:ycm_key_invoke_completion = '<C-Space>'



""""""""""syntastic建议的设置""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1


" For syntastic settings 这个是我的syntastic的配置
 let g:syntastic_enable_highlighting = 1 " 错误单词高亮
 let g:syntastic_aggregate_errors = 1 "第一时间检查发现任何错误
 let g:syntastic_enable_signs = 1 
 let g:syntastic_auto_loc_list = 1 
 let g:syntastic_check_on_open = 1 
 let g:syntastic_check_on_wq = 0 
 let g:syntastic_always_populate_loc_list = 1 
 let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"
 let g:syntastic_debug_file = "~/syntastic.log"
  let g:syntastic_cpp_check_header = 1
  "检查头文件"
 let g:syntastic_cpp_checkers = ['gcc']

 let g:syntastic_auto_jump = 1
 let g:syntastic_enable_balloons = 1

" let g:syntastic_cpp_compiler = 'g++'
" let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'

 let g:syntastic_cpp_check_header = 1
 let g:syntastic_cpp_auto_refresh_includes = 1

 let g:syntastic_c_config_file = ['/home/howard/qt/qt-embedded-4.8.5/include/QtGui']
let g:syntastic_cpp_include_dirs = [
     \ '/home/howard/qt/qt-embedded-4.8.5/include/QtCore',
     \ '/home/howard/qt/qt-embedded-4.8.5/include/QtGui',
     \ '/usr/lib/llvm-3.8/include/llvm',
     \ '/usr/include/c++/5',
     \ '/usr/lib/llvm-3.8/lib/clang/3.8.0/include']
let  g:syntastic_ignore_files=[".*\.py$" , ".*\.S$"] 
"忽略python和汇编"
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ng-"]"
let g:ycm_autoclose_preview_window_after_completion=1
let mapleader=","
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 状态栏显示文件名及路径 
 set laststatus=2      " 总是显示状态栏
 highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" " 获取当前路径，将$HOME转化为~
 function! CurDir()
     let curdir = substitute(getcwd(), $HOME, "~", "g")
         return curdir
     endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}
         
"设置编码"
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese

"设置语言"
set langmenu=zh_CN.UTF-8
"语法高亮"
syntax enable 
"可以在buffer的任何地方使用鼠标"
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"auto-pairs映射键盘,避免与complete paremeter的键盘冲突"
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'`':'`','"':'"'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

"complete_parameter配置"
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <C-j> <Plug>(complete_parameter#goto_next_parameter)
imap <C-j> <Plug>(complete_parameter#goto_next_parameter)
smap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <C-k> <Plug>(complete_parameter#goto_previous_parameter)

