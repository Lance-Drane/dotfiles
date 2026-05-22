#!/bin/sh
# shellcheck shell=dash disable=SC2181
# This sets up the git bare dotfile repo, see https://www.atlassian.com/git/tutorials/dotfiles

# configurable variables, change if you want or use environment variables in shell
DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/Lance-Drane/dotfiles.git}"
DOTFILES_GIT_DIR="${DOTFILES_GIT_DIR:-$HOME/.dotfiles-git}"
DOTFILES_BACKUP_DIR="${DOTFILES_BACKUP_DIR:-$HOME/.dotfiles-backup}"

# script, don't change
git clone --bare "$REPO" "$DOTFILES_GIT_DIR"
dotfiles() {
	git --git-dir "$DOTFILES_GIT_DIR" --work-tree "$HOME" "$@"
}
checkout_result=$(dotfiles checkout 2>&1)
if [ $? -eq 0 ]; then
	printf 'Added dotfiles to home directory\n'
else
	BACKUPS=$(printf '%s' "$checkout_result" | grep -E '^\s+[\.|README|LICENSE]' | awk '{print $1}')
	printf 'Backing up these dotfiles in %s:\n' "$DOTFILES_BACKUP_DIR"
	printf '%s\n' "$BACKUPS"
	# move by file, not by entire directory
	for line in $BACKUPS; do mkdir -p "$(dirname "${DOTFILES_BACKUP_DIR}/${line}")"; done
	printf '%s' "$BACKUPS" | xargs -I{} mv "$HOME"/{} "${DOTFILES_BACKUP_DIR}"/{}
	dotfiles checkout
fi
dotfiles config status.showUntrackedFiles no
