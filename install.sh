#!/bin/sh

set -eu

cd ~
ln -fs dotfiles/vim/.vimrc
ln -fs dotfiles/vim/.vimrc.nerdtree
ln -fs dotfiles/vim/.vimrc.nerdtree-git-plugin
ln -fs dotfiles/vim/.vimrc.vim-gitgutter
ln -fs dotfiles/vim/.vimrc.vim-airline
ln -fs dotfiles/vim/.vimrc.indentLine
ln -fs dotfiles/vim/.vimrc.unite
ln -fs dotfiles/vim/.vimrc.vim-quickrun
ln -fs dotfiles/vim/.vimrc.caw
ln -fs dotfiles/vim/.vimrc.open-browser
ln -fs dotfiles/vim/.vimrc.vim-fugitive
ln -fs dotfiles/vim/.vimrc.neocomplete
ln -fs dotfiles/vim/.vimrc.neosnippet
ln -fs dotfiles/vim/.vimrc.vim-expand-region
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.zshrc

#if [ -f ~/.vim/autoload/plug.vim ];then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi

########## install tmux ##########
mkdir -p ~/local/src
cd ~/local/src
rm -fr tmux-2.6
wget 'https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz'
tar zxvf tmux-2.6.tar.gz
cd tmux-2.6
./configure --prefix=$HOME/local
make
make install
##################################

########## get config tmuxinator ##########
mkdir -p ~/.tmuxinator
cd ~/.tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh
###########################################
