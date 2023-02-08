#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export DATA_DIR='/home/joana/Data'
export DATA_DEV='/dev/mapper/data'
export MOUNT_DATA_DIR=true

# Open and mount data partition if it isn't already
! ls $DATA_DEV &> /dev/null && sudo cryptsetup open /dev/sda1 data 
! mountpoint -q $DATA_DIR && sudo mount $DATA_DEV $DATA_DIR

PS1='\[\e[0m\](\[\e[1;35m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]) \[\e[1;36m\]\W \[\e[1m\]>\[\e[1m\]> \[\e[0m\]'

alias ls='ls --color=auto'
alias fuzzel='fuzzel -f Iosevka -t ccccccff -S ffffffff -b 000000ff -m 93a1d1ff -s 222244ff -r 0 -B 2 -C 93a1d1ff'
alias sbat='cat /sys/class/power_supply/BAT0/capacity'
alias hx='helix'
alias filesize='du -ahx . | sort -rh | head -10'
alias pkgsize='expac "%n %m" -l'\n' -Q $(pacman -Qq) | sort -rhk 2 | less'
alias pi='ping wikipedia.org'

orgtodoc() {
  emacs --batch --eval "(require 'org)" "$1" --funcall org-latex-export-to-pdf
}

orgtoodt() {
  emacs --batch --eval "(require 'org)" "$1" --funcall org-export-as-odt
}

orgtohtml() {
  emacs --batch --eval "(require 'org)" "$1" --funcall org-html-export-to-html
}

orgtobeamer() {
  emacs --batch --eval "(require 'org)" "$1" --funcall org-beamer-export-to-pdf
}

