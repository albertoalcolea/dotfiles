# Local bin
# Machine-dependant executables on ~/.local/bin take preference
export PATH=$PATH:~/.local/bin:~/bin

# Python jupyter
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter

# Ruby bundler
export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle
