" ========== Automatic installation =========="
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ============================================"

" ========== Install plugins =========="
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'terryma/vim-expand-region'
" depends on package lynx
Plug 'thinca/vim-ref'

" UML "
Plug 'kazuph/previm'
Plug 'feature/add-plantuml-plugin'
Plug 'tyru/open-browser.vim'
call plug#end()
" ====================================="

" ========== Todo =========="
" todo: add more plugin
" todo: do not create swap file
" todo: add color setting
" todo: add file extention setting
" todo: add completion setting
" todo: add validation setting
" todo: divide .vimrc
" =========================="

" ========== Specific setting =========="

" ========== Basic =========="

" Vimをvi互換モードではなく、Vimとして使用する
set nocompatible
" シンタックスハイライト機能をオン
syntax enable
" ファイルタイプ検出及び各種プラグインを有効にする
filetype plugin indent on
" 行番号を表示する
set number

" ==========================="

" ========== Indent =========="
" todo: check below setting follows coding rules
set autoindent          "改行時に前の行のインデントを計測
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する 
set cindent             "Cプログラムファイルの自動インデントを始める
set smarttab            "新しい行を作った時に高度な自動インデントを行う
set expandtab           "タブ入力を複数の空白に置き換える 

set tabstop=2           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=2        "自動インデントで入る空白数
set softtabstop=0       "キーボードから入るタブの数

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType apache      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType java        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=2 sts=2 ts=2 et
endif

" ========== End Indent =========="

" ==========================="

" ========== character =========="
"
" === ファイル読み込み時の文字コード ==="
set encoding=utf-8

" === Vim script内でマルチバイト文字を使う場合の設定 ==="
scriptencoding utf-8

" === □や○文字が崩れる問題を解決, if you use iterm2 chk https://qiita.com/macoshita/items/f7e0f5eda02f45736b52 ==="
" set ambiwidth=double

" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac

" vim-ref
let g:ref_phpmanual_path = $HOME . '/vim/refs/php-chunked-xhtml'

" ==============================="

" ======================================"

" ========== Common map (Locate "Common map" section before "Include other files") =========="
" Set leader
let mapleader = ","

" Move pane
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Move tab
nmap <Space>n :tabnew<CR>
nmap <Space>l gt
nmap <Space>h gT

" Previm
nmap <Space>mk :PrevimOpen<cr>

nmap <Leader>l :source ~/.vimrc<CR>
" ================================"

" ========== Include other files =========="
" todo: automate include
if filereadable(expand('~/.vimrc.nerdtree'))
	source ~/.vimrc.nerdtree
endif
if filereadable(expand('~/.vimrc.unite'))
	source ~/.vimrc.unite
endif
if filereadable(expand('~/.vimrc.vim-expand-region'))
	source ~/.vimrc.vim-expand-region
endif
" ========================================="

