# Use 256 colors
set -g default-terminal 'screen-256color'
set -g terminal-overrides ',xterm-256color:Tc'

# Status bar design
set -g status on
set-option -g set-titles on

set -g status-bg colour234
set -g status-fg colour137
set -g status-justify left
set -g status-position bottom
set -g status-right-length 50
set -g status-left-length 20

set -g status-left '#[bg=colour233] #S '
set -g status-right '#[bg=colour235,fg=colour245] %Y-%m-%d #[fg=colour245] %H:%M '

# Colors
win_bg_colour="#{?window_activity_flag, colour137, colour235}"
win_fg_colour1="#{?window_activity_flag, colour235, colour137}"

setw -g window-status-separator ''
setw -g window-status-style 'bg=colour235,fg=colour137'
#setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W '
setw -g window-status-format " #I#{?window_activity_flag,#[fg=colour250],#[fg=colour237]}:#{?window_activity_flag,#[fg=colour255],#[fg=colour250]}#W "
setw -g window-status-current-style 'bg=colour237,fg=colour137'
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W '
setw -g window-status-activity-style 'bg=colour137,fg=colour235'
setw -g window-status-bell-style 'bg=colour137,fg=colour250'

setw -g pane-border-style 'fg=colour237'
setw -g pane-active-border-style 'fg=colour245'

