setopt COMPLETE_ALIASES

fpath=($HOME/.zsh/zsh-completions/src $fpath)

autoload -Uz compinit

# Speed up compinit checking the cached .zcompdump once per day
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# For autocompletion with an arrow-key driven interface press Tab twice
zstyle ':completion:*' menu select search

# Verbose description and options
zstyle ':completion:*' verbose true

# Kill menu
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
