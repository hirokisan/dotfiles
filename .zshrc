autoload -Uz compinit
compinit -u

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=vim
export SHELL=$HOME/local/bin/zsh

export PATH=$HOME/bin:$PATH
export PATH=$HOME/local/bin:$PATH

# nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:./node_modules/.bin
if (( $+commands[yarn] )); then
    export PATH="$PATH:`yarn global bin`"
fi

# pyenv
export PATH=$HOME/.pyenv/bin:$PATH
if (( $+commands[pyenv] )); then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# goenv
export GO111MODULE=on
export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="$HOME/.goenv"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOENV_ROOT/bin:$GOPATH/bin
if (( $+commands[goenv] )); then
    eval "$(goenv init -)"
fi

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
if (( $+commands[rbenv] )); then
    eval "$(rbenv init -)"
fi

# tmux
bindkey "^E" beginning-of-line
bindkey "^A" end-of-line

###### set up tmuxinator ######
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source ~/.tmuxinator/tmuxinator.zsh
################################

###### set up zplug ######
source ~/.zshrc.zplug
##########################

###### set up alias ######
source ~/.zshrc.alias
##########################

###### set up local ######
[[ -s ~/.zshrc.local ]] && source ~/.zshrc.local
##########################

###### Basic Setting ######
# PCRE 互換の正規表現を使う
setopt re_match_pcre
# ビープ音を消す
setopt nolistbeep
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# '#' 以降をコメントとして扱う
setopt interactive_comments

setopt correct
setopt list_packed
setopt auto_menu
setopt extended_glob
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt no_beep

# 補完の際に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

###########################


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

# git branch
function peco-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-branches
bindkey "^b" peco-git-recent-branches

#### Completion ###
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
###################

#### z.sh peco ###
function peco-z-search
{
  which peco z > /dev/null
  if [ $? -ne 0 ]; then
    echo "Please install peco and z"
    return 1
  fi
  local res=$(z | sort -rn | cut -c 12- | peco)
  if [ -n "$res" ]; then
    BUFFER+="cd $res"
    zle accept-line
  else
    return 1
  fi
}
zle -N peco-z-search
bindkey '^f' peco-z-search
#############


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOENV_DISABLE_GOPATH=1

alias ke='kubectl'
alias wke='watch kubectl'
