#!/bin/sh
# shellcheck shell=dash
# This sets up the git bare dotfile repo, see https://www.atlassian.com/git/tutorials/dotfiles

# configurable variables, change if you want
REPO="https://github.com/Lance-Drane/dotfiles.git"
GIT_DIR="$HOME/.dotfiles-git"
BACKUP_DIR="$HOME/.dotfiles-backup"

# script, don't change
git clone --bare "$REPO" "$GIT_DIR"
dotfiles() {
	git --git-dir "$GIT_DIR" --work-tree "$HOME" "$@"
}
mkdir -p "$BACKUP_DIR"
if dotfiles checkout; then
	echo "Added dotfiles to home directory"
else
	echo "Backing up dotfiles in $GIT_DIR"
	dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} "${BACKUP_DIR}/"{}
	dotfiles checkout
fi
dotfiles config status.showUntrackedFiles no
