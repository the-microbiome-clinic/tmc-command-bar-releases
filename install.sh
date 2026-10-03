#!/bin/bash
# Installs (or reinstalls) TMC Prompts into /Applications and opens it. Updates after this are automatic.
set -euo pipefail
URL="https://github.com/the-microbiome-clinic/tmc-command-bar-releases/releases/latest/download/TMC-Prompts.zip"
TMP=$(mktemp -d)
echo "Downloading TMC Prompts…"
curl -fsSL "$URL" -o "$TMP/TMC-Prompts.zip"
pkill -x TMCPrompts 2>/dev/null || true
rm -rf "/Applications/TMC Prompts.app"
ditto -x -k "$TMP/TMC-Prompts.zip" /Applications
rm -rf "$TMP"
open "/Applications/TMC Prompts.app"
echo "Done. TMC Prompts is in your Applications folder and will keep itself up to date."
