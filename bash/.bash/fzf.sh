# fzf takes about 40-50ms to load the completion.bash file but I barely need something else than the history
# search and the kill completion, so loading just the key-bindings and the history completion saves most of the
# load time of fzf

export PATH=$PATH:~/.fzf/bin

# Kill completion

# To redraw line after fzf closes (printf '\e[5n')
bind '"\e[0n": redraw-current-line'

__fzf_comprun() {
  if [ "$(type -t _fzf_comprun 2>&1)" = function ]; then
    _fzf_comprun "$@"
  elif [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; }; then
    shift
    fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- "$@"
  else
    shift
    fzf "$@"
  fi
}

_fzf_complete_kill() {
  [ -n "${COMP_WORDS[COMP_CWORD]}" ] && return 1

  local selected
  selected=$(command ps -ef | sed 1d | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-50%} --min-height 15 --reverse $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS --preview 'echo {}' --preview-window down:3:wrap" __fzf_comprun "kill" -m | awk '{print $2}' | tr '\n' ' ')
  selected=${selected% }
  printf '\e[5n'

  if [ -n "$selected" ]; then
    COMPREPLY=( "$selected" )
    return 0
  fi
}

complete -F _fzf_complete_kill -o default -o bashdefault kill

# Key bindings
source ~/.fzf/shell/key-bindings.bash
