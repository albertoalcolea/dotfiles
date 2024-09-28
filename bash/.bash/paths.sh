# Local bin
# Machine-dependant executables on ~/.local/bin take preference
export PATH=$PATH:~/.local/bin:~/bin

# Dotfiles
export DOTFILES_HOME="$(readlink -f "$(dirname ${BASH_SOURCE[0]})/../../")"

# Python jupyter
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter

# Ruby gems
export GEM_HOME=$HOME/.local/lib/ruby/gems
export PATH=$PATH:$HOME/.local/lib/ruby/gems/bin

# Ruby bundler
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle

# Go
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
