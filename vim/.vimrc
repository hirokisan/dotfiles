if has('vim_starting')
	set rtp+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	end
endif
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
call plug#end()
