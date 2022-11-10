#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias bat='bat --wrap never'
alias off='systemctl poweroff'
alias rbt='systemctl reboot'
alias v='nvim'
alias pr='paru'
alias pkup='sudo pacman -Syu'
alias pkin='sudo pacman -S'
alias pki='pacman -Si'
alias pks='pacman -Ss'
alias pkq='pkq'
alias pkqs='pacman -Qs'
alias pkqi='pacman -Qi'
alias pkr='sudo pacman -Rs'
alias gts='git status | bat'
alias gta='git add .'
alias gtc='git commit -am'
alias gtp='git push'
alias gtd='git diff | bat'
alias code='~/.config/tmux/codenv'
alias hx='helix'

PS1="\[$(tput bold)\]\[\033[38;5;14m\]   \W\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/( \1) /')\[$(tput sgr0)\]\[$(tput sgr0)\]"

. "$HOME/.cargo/env"
