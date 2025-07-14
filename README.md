# dotfiles

## management

I personally manage these with the [Git bare repository](https://www.atlassian.com/git/tutorials/dotfiles) approach, and there's a couple of scripts/aliases which assume this management approach.

## installation

1. Make sure that you have `git` and `curl` installed.
2. Run `curl -fsSL https://raw.githubusercontent.com/Lance-Drane/dotfiles/refs/heads/master/.local/share/dotfiles/install.sh | sh`

NOTE: the script will overwrite files which already exist on your computer, and place them in "$HOME/.dotfiles-backup"
