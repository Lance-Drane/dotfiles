#!/bin/sh
# shellcheck shell=dash disable=SC2181
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
checkout_result=$(dotfiles checkout 2>&1)
if [ $? -eq 0 ]; then
	echo "Added dotfiles to home directory"
else
        BACKUPS=$(echo "$checkout_result" | grep -E "\s+[\.|README|LICENSE]" | awk '{print $1}')
        echo "Backing up these dotfiles in $BACKUP_DIR:"
        echo "$BACKUPS"
        for line in $BACKUPS; do mkdir -p "$(dirname "${BACKUP_DIR}/${line}")"; done
        echo "$BACKUPS" | xargs -I{} mv "$HOME"/{} "${BACKUP_DIR}"/{}
        dotfiles checkout
fi
dotfiles config status.showUntrackedFiles no
