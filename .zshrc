autoload -Uz compinit
compinit -u

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=vim
export SHELL=$HOME/local/bin/zsh

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$PATH:`yarn global bin`"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/local/bin:$PATH

###### set up tmuxinator ######
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source ~/.tmuxinator/tmuxinator.zsh
################################

###### set up zplug ######
source ~/.zshrc.zplug
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

#### Completion ###
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
###################
