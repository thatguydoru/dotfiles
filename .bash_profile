#
# ~/.bash_profile
#

export MOZ_ENABLE_WAYLAND=1
export QT_STYLE_OVERRIDE=kvantum

[ "$(tty)" = "/dev/tty1" ] && exec sway
[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
