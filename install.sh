#!/bin/sh

set -eu

cd ~

########## restore dotfiles #########
if [[ -e ~/.vimrc ]]; then
    mv .vimrc .vimrc.bk
fi
if [[ -e ~/.gitconfig ]]; then
    mv .gitconfig .gitconfig.bk
fi
if [[ -e ~/.git_template ]]; then
    mv .git_template .git_template.bk
fi
if [[ -e ~/.tigrc ]]; then
    mv .tigrc .tigrc.bk
fi
if [[ -e ~/.tmux.conf ]]; then
    mv .tmux.conf .tmux.conf.bk
fi
if [[ -e ~/.zshrc ]]; then
    mv .zshrc .zshrc.bk
fi
if [[ -e ~/.zshrc.alias ]]; then
    mv .zshrc.alias .zshrc.alias.bk
fi
if [[ -e ~/.zshrc.zplug ]]; then
    mv .zshrc.zplug .zshrc.zplug.bk
fi
#####################################

ln -fs dotfiles/vim/.vimrc
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.git_template
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.tmux.conf
ln -fs dotfiles/.zshrc
ln -fs dotfiles/.zshrc.alias
ln -fs dotfiles/.zshrc.zplug

#if [ -f ~/.vim/autoload/plug.vim ];then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi

########## install zsh ##########
mkdir -p ~/local/src
cd ~/local/src
rm -fr zsh-5.5.1.tar.xz
wget https://sourceforge.net/projects/zsh/files/zsh/5.5.1/zsh-5.5.1.tar.xz/download -O zsh-5.5.1.tar.xz
tar xvf zsh-5.5.1.tar.xz
cd zsh-5.5.1
./configure --enable-multibyte --disable-gdbm --enable-pcre --prefix=$HOME/local
make
make install
sudo sh -c "echo '$HOME/local/bin/zsh' >> /etc/shells"
sudo chsh -s $HOME/local/bin/zsh $(whoami)
##################################

########## install vim ##########
mkdir -p ~/local/src
cd ~/local/src
git clone https://github.com/vim/vim
cd vim
./configure \
    --prefix=$HOME/local \
    --enable-multibyte \
    --with-features=huge \
    --enable-luainterp
make
make install
##################################

########## setup vim undo ##########
mkdir -p ~/.vim/.vimundo
####################################

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
mkdir -p ~/.vim/refs
cd ~/local/src
wget http://jp2.php.net/distributions/manual/php_manual_ja.tar.gz
tar -zxvf php_manual_ja.tar.gz -C $HOME/.vim/refs
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

########## Install Tig ##########
mkdir -p ~/local/src && mkdir -p ~/local/bin
cd ~/local/src
wget https://github.com/jonas/tig/releases/download/tig-2.3.3/tig-2.3.3.tar.gz
tar zxf tig-2.3.3.tar.gz
cd ./tig-2.3.3
./configure --prefix=$HOME/local
make
make install
#################################

########## install ctags ##########
mkdir -p ~/local/src
cd ~/local/src
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar zxf ctags-5.8.tar.gz
cd ctags-5.8
./configure --prefix=$HOME/local
make
make install
###################################

########## install ag ##########
# https://geoff.greer.fm/ag/
mkdir -p ~/local/src
cd ~/local/src
wget https://geoff.greer.fm/ag/releases/the_silver_searcher-2.1.0.tar.gz
tar zxf the_silver_searcher-2.1.0.tar.gz
cd the_silver_searcher-2.1.0
./configure --prefix=$HOME/local
make
make install
################################

########## Source .zshrc ##########
#source ~/.zshrc
###################################

########## Install MySQLTuner ##########
mkdir -p ~/local/bin
cd ~/local/bin
wget http://mysqltuner.pl/ -O mysqltuner.pl
chmod +x mysqltuner.pl
########################################

########## Install z.sh ##########
git clone https://github.com/rupa/z.git ~/.zsh.d
##################################
