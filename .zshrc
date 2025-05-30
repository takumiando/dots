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

export LESS_TERMCAP_mb=$(printf "\e[1;32m")
export LESS_TERMCAP_md=$(printf "\e[1;32m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;42;37m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

export FZF_CTRL_T_OPTS="--prompt='? '"

precmd () {
    vcs_info
}

history-all () {
    history -E 1
}

fancy-ctrl-z () {
    if [ "${#BUFFER}" -eq 0 ]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}

color () {
    COLOR="$1"
    shift
    INPUT="$@"

    if [ -z "$COLOR" ]; then
        printf "%s" "$INPUT"
        return
    fi

    R_hex=$(printf "%s" "$COLOR" | cut -c1-2)
    G_hex=$(printf "%s" "$COLOR" | cut -c3-4)
    B_hex=$(printf "%s" "$COLOR" | cut -c5-6)
    R=$(printf "%d" "0x$R_hex")
    G=$(printf "%d" "0x$G_hex")
    B=$(printf "%d" "0x$B_hex")

    printf '\033[1;38;2;%d;%d;%dm%s\033[0m\n' "$R" "$G" "$B" "$INPUT"
}

zle -N fancy-ctrl-z

bindkey -d
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^Z' fancy-ctrl-z
bindkey '^F' fzf-file-widget

zstyle ':completion:*' list-colors "${LS_COLORS}"

stty stop undef

[ -e "$HOME"/.alias ] && source "$HOME"/.alias
[ -e "$HOME"/.west.zsh ] &&  source "$HOME"/.west.zsh

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  source ~/.zsh_prompt
fi
