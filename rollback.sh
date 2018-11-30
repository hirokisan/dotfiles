#!/bin/sh

set -eu

cd ~

########## unlink dotfiles ##########
if [[ -e ~/.vimrc ]]; then
    unlink .vimrc
fi
if [[ -e ~/.gitconfig ]]; then
    unlink .gitconfig
fi
if [[ -e ~/.git_template ]]; then
    unlink .git_template
fi
if [[ -e ~/.tigrc ]]; then
    unlink .tigrc
fi
if [[ -e ~/.tmux.conf ]]; then
    unlink .tmux.conf
fi
if [[ -e ~/.zshrc ]]; then
    unlink .zshrc
fi
if [[ -e ~/.zshrc.alias ]]; then
    unlink .zshrc.alias
fi
if [[ -e ~/.zshrc.zplug ]]; then
    unlink .zshrc.zplug
fi
#####################################

########## restore dotfiles #########
if [[ -e ~/.vimrc.bk ]]; then
    mv .vimrc.bk .vimrc
fi
if [[ -e ~/.gitconfig.bk ]]; then
    mv .gitconfig.bk .gitconfig
fi
if [[ -e ~/.git_template.bk ]]; then
    mv .git_template.bk .git_template
fi
if [[ -e ~/.tigrc.bk ]]; then
    mv .tigrc.bk .tigrc
fi
if [[ -e ~/.tmux.conf.bk ]]; then
    mv .tmux.conf.bk .tmux.conf
fi
if [[ -e ~/.zshrc.bk ]]; then
    mv .zshrc.bk .zshrc
fi
if [[ -e ~/.zshrc.alias.bk ]]; then
    mv .zshrc.alias.bk .zshrc.alias
fi
if [[ -e ~/.zshrc.zplug.bk ]]; then
    mv .zshrc.zplug.bk .zshrc.zplug
fi
#####################################

########## remove zsh #########
# todo: /etc/shellsから/local/bin/zshを含む行を削除する
sudo chsh -s /bin/bash $(whoami)
cd ~/local/src
rm -rf zsh-5.5.1
rm zsh-5.5.1.tar.xz
cd ~/local/bin
rm zsh
rm zsh-5.5.1
###############################

########## remove vim #########
cd ~/local/src
rm -rf vim
cd ~/local/bin
rm vim
rm vimtutor
rm xxd
unlink vimdiff
unlink view
unlink rview
unlink rvim
unlink ex
###############################

########## remove tmux ########
cd ~/local/src
rm tmux-2.6.tar.gz
rm -rf tmux-2.6
cd ~/local/bin
rm tmux
###############################

########## remove tmuxinator ########
rm -rf ~/.tmuxinator
########## remove tmuxinator ########

########## remove vim-ref php source ##########
cd ~/local/src
rm php_manual_ja.tar.gz
rm -rf ~/.vim/refs
###############################################

########## remove Peco ##########
cd ~/local/src
rm peco_linux_amd64.tar.gz
rm -rf peco_linux_amd64
cd ~/local/bin
rm peco
##################################

########## remove Tig ##########
cd ~/local/src
rm tig-2.3.3.tar.gz
rm -rf tig-2.3.3
cd ~/local/bin
rm tig
################################

########## remove ctags ##########
cd ~/local/src
rm ctags-5.8.tar.gz
rm -rf ctags-5.8
cd ~/local/bin
rm ctags
##################################

########## remove ag ##########
cd ~/local/src
rm the_silver_searcher-2.1.0.tar.gz
rm -rf the_silver_searcher-2.1.0
cd ~/local/bin
rm ag
###############################

########## remove MySQLTuner ##########
cd ~/local/bin
rm mysqltuner.pl
########################################
