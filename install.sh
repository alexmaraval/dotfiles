#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$DOTFILES_DIR/home"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link_file() {
    local source="$1"
    local target="$2"
    local relative="${target#$HOME/}"

    mkdir -p "$(dirname "$target")"

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        printf 'ok: %s already linked\n' "$target"
        return
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup="$BACKUP_DIR/$relative"
        mkdir -p "$(dirname "$backup")"
        mv "$target" "$backup"
        printf 'backup: %s -> %s\n' "$target" "$backup"
    fi

    ln -s "$source" "$target"
    printf 'link: %s -> %s\n' "$target" "$source"
}

while IFS= read -r -d '' file; do
    relative="${file#"$SOURCE_DIR"/}"
    link_file "$file" "$HOME/$relative"
done < <(find "$SOURCE_DIR" -type f -print0 | sort -z)

printf '\nDone. Open a new shell, or source your shell rc file.\n'
