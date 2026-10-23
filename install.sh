#!/usr/bin/env bash
# Symlink this theme into an Obsidian vault so edits to theme.css show up live.
#   ./install.sh /path/to/vault          # symlink (for development)
#   ./install.sh /path/to/vault --copy   # copy files instead
set -euo pipefail

vault="${1:?usage: ./install.sh /path/to/vault [--copy]}"
mode="${2:-}"
src="$(cd "$(dirname "$0")" && pwd)"
name="$(sed -n 's/.*"name": *"\([^"]*\)".*/\1/p' "$src/manifest.json")"
dest="$vault/.obsidian/themes/$name"

if [ ! -d "$vault/.obsidian" ]; then
  echo "error: $vault is not an Obsidian vault (no .obsidian folder)" >&2
  exit 1
fi

mkdir -p "$vault/.obsidian/themes"
rm -rf "$dest"

if [ "$mode" = "--copy" ]; then
  mkdir -p "$dest"
  cp "$src/manifest.json" "$src/theme.css" "$dest/"
  echo "Copied $name theme to $dest"
else
  ln -s "$src" "$dest"
  echo "Linked $dest -> $src"
fi

echo "Now open Settings → Appearance → Themes and select \"$name\"."
