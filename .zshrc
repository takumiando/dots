#                __
#    ____  _____/ /_  __________
#   /_  / / ___/ __ \/ ___/ ___/
#  _ / /_(__  ) / / / /  / /__
# (_)___/____/_/ /_/_/   \___/
#

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

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
LESS=-R

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
	 if [[ $#BUFFER -eq 0 ]]; then
		BUFFER="fg"
		zle accept-line
	else
		zle push-input
		zle clear-screen
	fi
}

zle -N fancy-ctrl-z

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^Z' fancy-ctrl-z

zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' formats "%b$(blink %c%u)"
zstyle ':vcs_info:*' actionformats "$(blink %b%c%u)"

local PS1_HOST='%B%F{red}$HOST%f%b'
local PS1_PWD='%B%F{blue}%(5~,%-2~/.../%2~,%~)%f%b'
local PS1_GIT='%B%F{yellow}${vcs_info_msg_0_}%f%b'
local PS1_CHAR='%B%F{green}> %f%b'

PS1_INFO="${PS1_PWD} ${PS1_GIT}"
if [ -n "$SSH_TTY" ]; then
    PS1_INFO="${PS1_HOST} ${PS1_INFO}"
fi
PS1="${PS1_INFO}
${PS1_CHAR}"

case $(uname) in
	Darwin)
		alias ls='ls -FG'
		;;
	Linux)
		alias ls='ls --color -F'
		;;
esac
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lh'
alias lla='ls -la'
alias less='less -R'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias emacs='emacs -nw'
alias diff='diff -uprN'
alias ag='ag --color-match "39;46" --color-path "1;34" --color-line-number "1;30"'
if type nvim > /dev/null 2>&1; then
  alias vi=nvim
elif type vim > /dev/null 2>&1; then
  alias vi=vim
fi

stty stop undef

if [ -z ${SSH_TTY} ]; then
    case "$TERM" in
        "st-256color"|"xterm-256color"|"alacritty")
		    if [ -f ${HOME}/.cache/wal/sequences ]; then
			    cat ${HOME}/.cache/wal/sequences
		    fi
            ;;
    esac
fi
