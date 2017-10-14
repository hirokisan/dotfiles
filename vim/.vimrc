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
Plug 'thinca/vim-quickrun'
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

" ========== Include other files =========="
if filereadable(expand('~/.vimrc.nerdtree'))
	source ~/.vimrc.nerdtree
endif
" ========================================="

" ========== Specific setting=========="
set encoding=utf-8
" ========================================="
