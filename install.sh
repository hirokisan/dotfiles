#!/bin/sh

set -eu

cd ~
ln -fs dotfiles/vim/.vimrc
ln -fs dotfiles/vim/.vimrc.nerdtree
ln -fs dotfiles/vim/.vimrc.nerdtree-git-plugin
ln -fs dotfiles/vim/.vimrc.vim-gitgutter
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.tigrc

#if [ -f ~/.vim/autoload/plug.vim ];then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi
