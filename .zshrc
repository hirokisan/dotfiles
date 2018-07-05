autoload -Uz compinit
compinit -u

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$PATH:`yarn global bin`"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/local/bin:$PATH

###### set up tmuxinator ######
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source ~/.tmuxinator/tmuxinator.zsh
####### set up tmuxinator ######


# History
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

#### Peco ###
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
#############
