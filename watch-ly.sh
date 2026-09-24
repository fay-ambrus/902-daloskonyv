#!/bin/bash
# Watches kottak/**/*.ly for changes and rebuilds the main document.
# Needed because LaTeX Workshop's dependency watcher does not know about
# \lilypondfile, so saving a .ly file alone would not trigger a rebuild.
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAIN_TEX="$DIR/902-daloskonyv.tex"

echo "Figyelem: kottak/*.ly fájlok változásának figyelése..."

while true; do
  inotifywait -q -r -e close_write,create,delete --format '%w%f' "$DIR/kottak" 2>/dev/null | while read -r CHANGED; do
    case "$CHANGED" in
      *.ly)
        echo "Módosult: $CHANGED – újrafordítás..."
        bash "$DIR/build.sh" "$MAIN_TEX"
        ;;
    esac
  done
done
