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

########## get vim-ref php source ##########
mkdir -p ~/vim/refs
cd ~/local/src
wget http://jp2.php.net/distributions/manual/php_manual_ja.tar.gz
tar -zxvf php_manual_ja.tar.gz -C $HOME/vim/refs
############################################

########## Install Peco ##########
mkdir -p ~/local/src
mkdir -p ~/local/bin
cd ~/local/src
rm -fr peco_linux_amd64
wget 'https://github.com/peco/peco/releases/download/v0.3.3/peco_linux_amd64.tar.gz'
tar zxvf peco_linux_amd64.tar.gz
cp peco_linux_amd64/peco ~/local/bin/peco
chmod 744 ~/local/bin/peco
##################################
