#                __
#    ____  _____/ /_  __________
#   /_  / / ___/ __ \/ ___/ ___/
#  _ / /_(__  ) / / / /  / /__
# (_)___/____/_/ /_/_/   \___/
#

[ -f /etc/os-release ] && source /etc/os-release
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
autoload -Uz vcs_info

setopt extended_history
setopt histignorealldups
setopt sharehistory
setopt correct
setopt auto_cd
setopt auto_menu
setopt auto_list
setopt list_types
setopt auto_param_slash
setopt prompt_subst

export LS_COLORS='di=01;34:ln=01;36:so=01;33:pi=01;32:ex=01;31:bd=42;30:cd=44;30:su=41;30:sg=46;30:tw=42;34:ow=44;32'
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
export LESS=-R

export LESS_TERMCAP_mb=$(printf "\e[1;32m") \
export LESS_TERMCAP_md=$(printf "\e[1;32m") \
export LESS_TERMCAP_me=$(printf "\e[0m") \
export LESS_TERMCAP_se=$(printf "\e[0m") \
export LESS_TERMCAP_so=$(printf "\e[1;42;37m") \
export LESS_TERMCAP_ue=$(printf "\e[0m") \
export LESS_TERMCAP_us=$(printf "\e[1;32m") \

export FZF_CTRL_T_OPTS="--prompt='? '"

precmd () {
    vcs_info
}

history-all () {
    history -E 1
}

blink () {
    blink="\033[05m"
    end="\033[00m"
    echo -e "${blink}${1}${end}"
}

fancy-ctrl-z () {
    if [ "$#BUFFER" -eq 0 ]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}

zle -N fancy-ctrl-z

bindkey -d
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^Z' fancy-ctrl-z
bindkey '^F' fzf-file-widget

zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' formats "%b$(blink %c%u)"
zstyle ':vcs_info:*' actionformats "$(blink %b%c%u)"

local PS1_HOST='%B%F{red}$HOST%f%b'
local PS1_POD='%B%F{green}$HOST/$ID%f%b'
local PS1_PWD='%B%F{blue}%(5~,%-2~/.../%2~,%~)%f%b'
local PS1_GIT='%B%F{yellow}${vcs_info_msg_0_}%f%b'
local PS1_SYMBOL='%B%F{green}> %f%b'

PS1="$PS1_PWD $PS1_GIT
$PS1_SYMBOL"

if [ -n "$SSH_TTY" ]; then
    PS1="$PS1_HOST $PS1"
elif [ -n "$container" ]; then
    PS1="$PS1_POD $PS1"
fi

stty stop undef

if [ -z "$SSH_TTY" ] && [ -f ${HOME}/.cache/wal/sequences ]; then
    case "$TERM" in
        st-256color|xterm-256color|alacritty)
            cat ${HOME}/.cache/wal/sequences
            ;;
    esac
fi

source "$HOME"/.alias
