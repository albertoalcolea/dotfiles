# dotfiles
My personal vim, tmux, shells, etc configuration files.

![Screenshot](./screenshots/screenshot.png)

## Installation

Clone this repository with `--recurse-submodules`:

```
git clone --recurse-submodules https://github.com/albertoalcolea/dotfiles.git
```

Install all the requirements (the `setup` script will check them and warn you if they are not present on your system).

Execute the `setup` script:

```
./setup
```

Note: if any of the files to install was already in your system the script will ask you if you want to overwrite them.

Run `vim` and execute `PlugInstall` to install all vim plugins.

Run `tmux` and press Ctrl+a+I (capital i, as in Install) to install all tmux plugins.

Launch `Sublime Text` at least once before running the setup script so that it creates base directory structure. Once the setup script finishes open `Sublime Text` again and execute `Install Package Control` to install all sublime plugins.

## Requirements

bash requirements:

- `bash-completion`
- `notify-send`
- `fzf`

vim requirements:

- `exuberant-ctags` or `universal-ctags` (for vim tagbar)
- `editorconfig` (core written in c that is hundred of times faster than the default vimcore)
- `vim-plug` (it is automatically installed with the `setup` script)

tmux requirements:

- `xsel` or `xclip` (for X) or `wl-clipboard` (for Wayland)

Some scripts in bin folder require extra dependencies
