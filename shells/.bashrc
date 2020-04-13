# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If we are running Arch Linux we need to load this script
# to be able to open new terminals in the current directory
# https://wiki.archlinux.org/index.php/GNOME/Tips_and_tricks#Terminal
if [ -f "/etc/arch-release" ]; then
	source /etc/profile.d/vte.sh
fi

# Register external definitions
source $HOME/.bash/prompt.sh
source $HOME/.bash/path.sh
source $HOME/.bash/history.sh
source $HOME/.bash/completion.sh
source $HOME/.bash/alias.sh

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set vim as default editor
export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"

# Load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
