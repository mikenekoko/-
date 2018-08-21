" ---------------------------------
" 基本設定
" ---------------------------------

" set nocompatibleはオワコンらしいが一応
if !&compatible
  set nocompatible
endif
augroup MyAutoCmd
  autocmd!
augroup END
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" | endif
augroup END

" シンタックスカラーとか
hi Visual cterm=bold
filetype on
filetype plugin on
filetype indent on
autocmd ColorScheme * highlight Comment ctermfg=239 cterm=BOLD
autocmd ColorScheme * highlight LineNr  ctermfg=239
autocmd BufNewFile,BufRead *.{tt,html,htm,vue*} set filetype=html
autocmd FileType vue syntax sync fromstart
syntax on

" 色の設定
colorscheme pablo
hi clear

" タブの数等の基本設定
set number
set expandtab
set tabstop=2
set shiftwidth=2
set laststatus=2
set t_Co=256
set hlsearch
set showcmd
set backspace=indent,eol,start
set autoindent
set list
set listchars=tab:»-

" 行末文字をハイライトする
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


" ---------------------------------
" deinの設定
" ---------------------------------

if &compatible
 set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" ここに使いたいプラグインを記述
if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')
 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('Yggdroot/indentLine')
 call dein#add('Shougo/neocomplete.vim')
 call dein#add('Shougo/neomru.vim')
 call dein#add('Shougo/neosnippet')

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
 call dein#install()
endif

filetype plugin indent on
syntax enable

" インストールしてないプラグインがあれば起動時に自動でインストールする
if dein#check_install()
 call dein#install()
endif


" ------------------------------------------------
" neocomplete(入力補完)の設定
" ------------------------------------------------

" 起動時に有効
let g:neocomplete#enable_at_startup = 1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 50
" キーワードの長さ、デフォルトで80
let g:neocomplete#max_keyword_width = 80
let g:neocomplete#enable_ignore_case = 1
highlight Pmenu ctermbg=6
highlight PmenuSel ctermbg=3
highlight PMenuSbar ctermbg=0
