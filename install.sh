#!/bin/sh

set -eu

cd ~
ln -fs dotfiles/vim/.vimrc

#if [ -f ~/.vim/autoload/plug.vim ];then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi
