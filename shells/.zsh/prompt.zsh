setopt PROMPT_SUBST

# Last command return code
#   $1 exit code of the last command
__prompt_char() {
	if [ "$1" -eq 0 ]; then
		echo -n "%B%F{green}$%f%b"
	else
		echo -n "%B%F{red}$%f%b"
	fi
}

# Git
__git_info() {
	# Fast exit if dir is not a git repo
	git rev-parse 2> /dev/null || return

	local git_status=$(git status --porcelain=v2 --branch)
	local git_head=$(echo "$git_status" | sed -n 's/^# branch.head \(.*\)$/\1/p')

	# Verify if HEAD points to branch or to single commit
	if [ "$git_head" = "(detached)" ]; then
		# Use commit id in short format as branch id
		local git_branch=$(echo "$git_status" | sed -n 's/^# branch.oid \(.\{7\}\).*$/\1/p')
	else
		# Use the first 15 chars of the branch name as branch id
		local git_branch=$(echo "$git_head" | sed -n 's/\(.\{1,15\}\).*/\1/p')
		if [ "$git_branch" != "$git_head" ]; then
			git_branch="$git_branch…"
		fi
	fi

	# Verify index status (staging area) checking the first char:
	#   1->changed
	#   2->renamed or copied
	#   u->unmerged
	#   ?->untracked
	#   !->ignored
	if echo "$git_status" | grep -q '^[12] '; then
		local status_icon="%B%F{red}✖%f%b"
	else
		local status_icon="%B%F{green}✔%f%b"
	fi

	echo -n " %B%F{yellow}($git_branch $status_icon)%f%b"
}

# Custom prompt
__prompt() {
	# Get exit code of last command
	# We need to capture this befure the others to not oerride the value of $?
	local retval=$?

	echo -n "%B%F{blue}%~%f%b$(__git_info) $(__prompt_char $retval) "
}

PROMPT='$(__prompt)'
