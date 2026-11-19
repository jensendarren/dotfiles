#!/usr/bin/env bash
# Copy dotfiles from home_files/ into $HOME.
# Any existing file that differs is backed up first to ~/.dotfiles_backup/<timestamp>/.
set -euo pipefail

src="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/home_files"
backup_dir="${HOME}/.dotfiles_backup/$(date +%Y%m%d-%H%M%S)"

while IFS= read -r -d '' file; do
    rel="${file#"$src"/}"
    target="${HOME}/${rel}"

    if [[ -e "$target" || -L "$target" ]]; then
        if [[ ! -L "$target" ]] && cmp -s "$file" "$target"; then
            echo "Unchanged  ~/$rel"
            continue
        fi
        mkdir -p "$backup_dir/$(dirname "$rel")"
        cp -P "$target" "$backup_dir/$rel"  # -P keeps an old symlink as a symlink
        rm -f "$target"                      # so we never write through an old symlink
        echo "Backed up  ~/$rel -> $backup_dir/$rel"
    fi

    mkdir -p "$(dirname "$target")"
    cp "$file" "$target"
    echo "Installed  ~/$rel"
done < <(find "$src" -type f -print0)
