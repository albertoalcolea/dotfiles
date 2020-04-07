# Last command return code
__prompt_char() {
	if [ $? -eq 0 ]; then
		echo -e "\[\033[01;32m\]\$\[\033[00m\]"
	else
		echo -e "\[\033[01;31m\]\$\[\033[00m\]"
	fi
}

# Python virtual env
__python_venv() {
	if [ ! -z "$VIRTUAL_ENV" ]; then
		echo -e "($(basename "$VIRTUAL_ENV")) "
	fi
}

# Git
__git_info() {
	# Fast exit if dir is not a git repo
	git rev-parse 2> /dev/null || return

	local status=$(git status --porcelain=v2 --branch)
	local head=$(echo "$status" | sed -n 's/^# branch.head \(.*\)$/\1/p')

	# Verify if HEAD points to branch or to single commit
	if [ "$head" = "(detached)" ]; then
		# Use commit id in short format as branch id
		local branch=$(echo "$status" | sed -n 's/^# branch.oid \(.\{7\}\).*$/\1/p')
	else
		# Use the first 15 chars of the branch name as branch id
		local branch=$(echo "$head" | sed -n 's/\(.\{1,15\}\).*/\1/p')
		if [ "$branch" != "$head" ]; then
			branch="$branch…"
		fi
	fi

	# Verify index status (staging area) checking the first char:
	#   1->changed
	#   2->renamed or copied
	#   u->unmerged
	#   ?->untracked
	#   !->ignored
	if echo "$status" | grep -q '^[12] '; then
		local status_icon="\[\033[01;31m\]✖\[\033[01;33m\]"
	else
		local status_icon="\[\033[01;32m\]✔\[\033[01;33m\]"
	fi

	echo -e " \[\033[01;33m\]($branch $status_icon)\[\033[00m\]"
}

# Set the PS1 prompt dynamically
__set_bash_prompt() {
	# We need to execute this block before the others to not override the value of $?
	local prompt_char=$(__prompt_char)

	PS1="$(__python_venv)\[\033[01;34m\]\w\[\033[00m\]$(__git_info) $prompt_char "

	# If available we call this function to save the current directory
	# This will allow to open new terminals in that directory.
	if type __vte_osc7 &> /dev/null; then
		__vte_osc7
	fi
}

PROMPT_COMMAND=__set_bash_prompt
