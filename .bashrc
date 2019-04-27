# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='[\u@\h \W]\$ '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Enable programmable completion features with bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Set vim as default editor
export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"

# JAVA_HOME
export JAVA_HOME=/opt/jdk
export PATH=$PATH:$JAVA_HOME/bin

# MAVEN_HOME
export MAVEN_HOME=/opt/apache-maven
export PATH=$PATH:$MAVEN_HOME/bin

# GRADLE_HOME
export GRADLE_HOME=/opt/gradle
export PATH=$PATH:$GRADLE_HOME/bin

# GROOVY_HOME
export GROOVY_HOME=/opt/groovy
export PATH=$PATH:$GROOVY_HOME/bin

# Python virtualenvwrapper
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export PROJECT_HOME=$HOME/projects
	source /usr/bin/virtualenvwrapper.sh
fi

# Ruby gems
if which ruby > /dev/null && which gem > /dev/null; then
	export PATH=$PATH:"$(ruby -e 'print Gem.user_dir')/bin"
fi

