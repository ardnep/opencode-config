#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
config_dir=${XDG_CONFIG_HOME:-"$HOME/.config"}/opencode
backup_dir=

mkdir -p "$config_dir"
if [ "$(CDPATH= cd -- "$config_dir" && pwd -P)" = "$repo_dir" ]; then
    echo "OpenCode config directory already points to this repository."
    exit 0
fi

for file in opencode.json cli.json opencode-mem.jsonc; do
    source=$repo_dir/$file
    target=$config_dir/$file

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        echo "Already linked: $target"
        continue
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ -z "$backup_dir" ]; then
            backup_dir=$(mktemp -d "$config_dir/backups-$(date +%Y%m%d-%H%M%S)-XXXXXX")
        fi
        mv "$target" "$backup_dir/$file"
        echo "Backed up: $backup_dir/$file"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target -> $source"
done
