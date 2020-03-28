" ========== Automatic installation =========="
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ============================================"

" ========== Install plugins =========="
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
"Plug 'fenetikm/falcon'
Plug 'tomasr/molokai'
" インデントの可視化
"Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
"Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'terryma/vim-expand-region'
Plug 'bronson/vim-trailing-whitespace'
" depends on package lynx
Plug 'thinca/vim-ref'
"Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'simeji/winresizer'
Plug 'osyo-manga/vim-over'

" vue
Plug 'posva/vim-vue'

" react
Plug 'maxmellon/vim-jsx-pretty'

" javascript
Plug 'ternjs/tern_for_vim'

" typescript
Plug 'leafgarland/typescript-vim'

" typescript for react
Plug 'peitalin/vim-jsx-typescript'

" HTML/CSS
Plug 'mattn/emmet-vim'

" UML "
Plug 'kazuph/previm'
Plug 'tyru/open-browser.vim'

" LSP "
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" golang "
Plug 'fatih/vim-go'

call plug#end()
autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall | q
  \| endif
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
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
set nobackup
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" カーソルラインをハイライト
set cursorline
" スワップファイル.swpを作成しない
set noswapfile
" 検索時にハイライト表示する
set hlsearch
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" カーソル位置を記憶する
autocmd BufWinLeave ?* silent mkview
" ファイルを開いた時に、以前のカーソル位置を復元する
autocmd BufWinEnter ?* silent loadview
" Undoを永続化する
if has('persistent_undo')
  set undodir=~/.vim/.vimundo
  set undofile
endif
" バックスペースで削除可能な対象を指定
" indent: 行頭の空白類の削除, eol: 改行の削除, start: 挿入モードの開始位置での削除
set backspace=indent,eol,start


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

" https://mickey24.hatenablog.com/entry/20120808/vim_highlight_trailing_spaces
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" ========== End Indent =========="

" ==========================="


" ========== syntastic =========="

" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1
" 構文エラーリストを表示
let g:syntastic_auto_loc_list=1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd'] 

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
nmap <silent> <tab> gt
nmap <silent> <S-tab> gT

" split window
nnoremap <Space>s :vsplit<CR>
nnoremap <Space>d :split<CR>

" Previm
nmap <Space>mk :PrevimOpen<cr>

" vim-ref https://qiita.com/c8112002/items/85a2c2cc3721c79a5322 shift+k
nmap <Space>mp :<C-u>Ref phpmanual<Space>

" 最近使用したファイル
nnoremap <Space>f :Unite file_mru<CR>

" Plugのインストール
nmap <Leader>i :PlugInstall<CR>

" vimrcの更新
nmap <Leader>l :source ~/.vimrc<CR>

nnoremap <ESC><ESC> :nohl<CR>
" ================================"

" ========== Include other files =========="
" todo: automate include
if filereadable(expand('~/dotfiles/vim/.vimrc.encode'))
	source ~/dotfiles/vim/.vimrc.encode
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.nerdtree'))
	source ~/dotfiles/vim/.vimrc.nerdtree
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.unite'))
	source ~/dotfiles/vim/.vimrc.unite
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.vim-expand-region'))
	source ~/dotfiles/vim/.vimrc.vim-expand-region
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.vim-quickrun'))
	source ~/dotfiles/vim/.vimrc.vim-quickrun
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.neosnippet'))
	source ~/dotfiles/vim/.vimrc.neosnippet
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.tagbar'))
	source ~/dotfiles/vim/.vimrc.tagbar
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.bufexplorer'))
	source ~/dotfiles/vim/.vimrc.bufexplorer
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.vim-fugitive'))
	source ~/dotfiles/vim/.vimrc.vim-fugitive
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.vim-ref'))
	source ~/dotfiles/vim/.vimrc.vim-ref
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.vim-go'))
	source ~/dotfiles/vim/.vimrc.vim-go
endif
"if filereadable(expand('~/dotfiles/vim/.vimrc.falcon'))
"	source ~/dotfiles/vim/.vimrc.falcon
"endif
if filereadable(expand('~/dotfiles/vim/.vimrc.molokai'))
	source ~/dotfiles/vim/.vimrc.molokai
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.emmet-vim'))
	source ~/dotfiles/vim/.vimrc.emmet-vim
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.local'))
	source ~/dotfiles/vim/.vimrc.local
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.fzf'))
	source ~/dotfiles/vim/.vimrc.fzf
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.vim-over'))
	source ~/dotfiles/vim/.vimrc.vim-over
endif
"if filereadable(expand('~/dotfiles/vim/.vimrc.syntastic'))
"	source ~/dotfiles/vim/.vimrc.syntastic
"endif
if filereadable(expand('~/dotfiles/vim/.vimrc.ale'))
	source ~/dotfiles/vim/.vimrc.ale
endif
if filereadable(expand('~/dotfiles/vim/.vimrc.tern_for_vim'))
	source ~/dotfiles/vim/.vimrc.tern_for_vim
endif
"if filereadable(expand('~/dotfiles/vim/.vimrc.tmuxline.vim'))
"	source ~/dotfiles/vim/.vimrc.tmuxline.vim
"endif
" ========================================="

