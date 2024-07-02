#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman='sudo pacman'
alias grub-mkconfig='sudo grub-mkconfig'
alias clr='clear'
#alias neofetch='fastfetch'
alias neofech='fastfetch'
alias yay='paru'
alias update='sudo pacman -Syu && paru -Syu'
alias lsf='ls -lh'
alias nano='nvim'
alias nf='fd -H | fzf --preview "cat {}" --expect=ctrl-c | xargs -r nvim'
alias nfd='fd -H -d 2 | fzf --multi --layout=reverse --preview "cat {}" --preview-window=right:60%:wrap | xargs -d "\n" -r rm -r'

#PS1="\[\033[0;31m\]\$\[\033[0m\] "
PS1="\[\033[38;5;203m\]\$\[\033[0m\] "

# Auto exec bspwm
if [ "$(tty)" = "/dev/tty1" ]; then
	exec startx
fi

export FZF_DEFAULT_OPTS='
  --color=bg:#09090F,bg+:#1d2021,spinner:#d3869b,hl:#83a598
  --prompt="$ "
  --color=fg:#ebdbb2,header:#fe8019,info:#fabd2f,pointer:#fb4934
  --color=marker:#b8bb26,fg+:#ebdbb2,prompt:#EA6961,hl+:#83a598
  --color=gutter:#09090F
'

LS_COLORS='di=38;5;203:'
export LS_COLORS
