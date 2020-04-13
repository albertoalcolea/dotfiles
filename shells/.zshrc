# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If we are running Arch Linux we need to load this script
# to be able to open new terminals in the current directory
# https://wiki.archlinux.org/index.php/GNOME/Tips_and_tricks#Terminal
if [ -f "/etc/arch-release" ]; then
	source /etc/profile.d/vte.sh
fi

# Register external definitions
source $HOME/.zsh/binding.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/path.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/alias.zsh

# Set vim as default editor
export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

