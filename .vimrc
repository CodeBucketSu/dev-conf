"#####################################################
" 设置选项
"#####################################################
set number	" 开启行号显示
set nocompatible	" 不兼容vi模式

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

set hls		" 设置搜索时高亮显示
set laststatus=2
set tabstop=4	" 设置Tab键跳过的空格数为4
syntax enable
syntax on
colorscheme molokai
let g:rehash256 = 1

"#####################################################
" 设置按键映射 
"#####################################################
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<F10>无须重启即使vimrc配置生效
"<F12>generate ctags for current folder
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"<F10> 改变.vimrc后无须重启vi即生效
map <F10> :w<cr>:so %<cr>

" map F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

"-----------------------------
" 插入模式下的按键映射
"-----------------------------
let mapleader=","
inoremap jk <esc>	"将jk映射为退出插入模式

"-----------------------------
" 普通模式下的按键映射
"-----------------------------


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
" 设置ctag 用于代码跳转
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
" let g:NERDSpaceDelims=1


"==================================
" 设置fugitive
" 这是用来使airline支持git分支的
"==================================
Plugin 'tpope/vim-fugitive'

"==================================
" 设置neocomplete
" 顾名思义，这是用来实现自动补全的
"==================================
Plugin 'Shougo/neocomplete.vim'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" 如果存在大写，则大小写敏感
let g:neocomplete#enable_smart_case = 1
" 成为目标关键词的最短长度
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" 撤销最近的一次输入
inoremap <expr><C-g>     neocomplete#undo_completion()
" 将所有备选方案的共同部分补充完整
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
" pumvisible()表示是否有可见的弹出菜单
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" 退格，重新生成菜单
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"==================================
" 设置neosnippet
"==================================
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"==================================
" 设置 jedi-vim
"==================================
Plugin 'davidhalter/jedi-vim'
" If you are a person who likes to use VIM-buffers not tabs
let g:jedi#use_tabs_not_buffers = 0
" disable docstrings popup
autocmd FileType python setlocal completeopt-=preview

" use neocomplcache with jedi-vim
" autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.python = '[^. \t]\.\w*'
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

call vundle#end()            " required
filetype plugin indent on    " required

