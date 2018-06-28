export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$PATH:`yarn global bin`"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/local/bin:$PATH

###### set up tmuxinator ######
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source ~/.tmuxinator/tmuxinator.zsh
####### set up tmuxinator ######
