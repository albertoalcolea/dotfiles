# GNOME dconf settings
Configs for GNOME application that do not use dotfiles and relies on GSettings.

## Usage
* Backup: `dconf dump /path/to/app/settings/ > app.dconf`
* Restore: `dconf load /path/to/app/settings/ < app.dconf`
