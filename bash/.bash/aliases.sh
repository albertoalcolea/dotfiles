# Enable color support of ls and greep and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -l'
alias la='ls -lA'
alias l='ls -C'

# Colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n 1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Activate Python virtual environment
alias venv='source venv/bin/activate'

# URL-encode strings
alias urlencode='python -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'

# Fuzzy cd
alias fcd='cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Utilities
alias mutt='neomutt'
alias view='vim -R'
alias fuckswap='sudo swapoff -a && sudo swapon -a && echo "OK"'
