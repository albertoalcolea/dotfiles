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

## Requirements

vim requirements:

- `exuberant-ctags` or `universal-ctags` (for vim tagbar)
- `vim-plug` (it is automatically installed with the `setup` script)

bash requirements:

- `bash-completion`
- `notify-send`

Some scripts in bin folder require extra dependencies
