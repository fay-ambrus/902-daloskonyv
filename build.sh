#!/bin/bash
export LC_CTYPE=en_US.UTF-8
cd "$(dirname "$1")"
DOC=$(basename "$1")
lualatex --shell-escape -interaction=nonstopmode -synctex=1 "$DOC"
mkdir -p out
mv -f "${DOC%.tex}.pdf" "${DOC%.tex}.synctex.gz" out/ 2>/dev/null
