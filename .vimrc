"#####################################################
" 设置选项
"#####################################################
set number	" 开启行号显示
set nocompatible	" 不兼容vi模式
set hls		" 设置搜索时高亮显示
set laststatus=2
set tabstop=4	" 设置Tab键跳过的空格数为4
syntax enable
syntax on
colorscheme default

"#####################################################
" 设置按键映射 
"#####################################################
"-----------------------------
" 插入模式下的按键映射
"-----------------------------
let mapleader=","
inoremap jk <esc>	"将jk映射为退出插入模式

"-----------------------------
" 普通模式下的按键映射
"-----------------------------
" 以下为取消方向键的作用
" nnoremap <left> <nop>
" nnoremap <right> <nop>	
" nnoremap <up> <nop>	
" nnoremap <down> <nop>	


"#####################################################
" 设置自动命令
"#####################################################


"####################################################
" 设置插件
"####################################################
"==================================
" 设置vundle用于插件管理
"==================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"==================================
" 状态栏使用airline
"==================================
Plugin 'bling/vim-airline'
""air-line
set laststatus=2
set t_Co=256
" set fileformat=unix
set encoding=utf-8

" font
" set guifont=Droid\ Sans\ Mono\ for\ Powerline

" let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0

" configure whether buffer numbers should be shown.
let g:airline#extensions#tabline#buffer_nr_show = 1
" configure the formatting of filenames (see |filename-modifiers|)
let g:airline#extensions#tabline#fnamemod = ':p:t'

" unicode symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

"==================================
" 设置ctag
"==================================
""ctag
" add current directory's generated tags file to available tags
set tags+=./tags

"=================================
" 设置taglist
"=================================
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim

"==================================
" 设置nerdcommenter
"==================================
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

call vundle#end()            " required
filetype plugin indent on    " required

"==================================
" 设置fugitive
" 这是用来使airline支持git分支的
"==================================
Plugin 'tpope/vim-fugitive'
