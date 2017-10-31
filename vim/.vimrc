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
