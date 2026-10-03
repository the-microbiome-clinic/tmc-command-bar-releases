#!/bin/bash
# Installs (or reinstalls) TMC Command Bar into /Applications and opens it. Updates after this are automatic.
# Also removes the old "TMC Prompts.app" (the same app before it was renamed in 0.5).
set -euo pipefail
URL="https://github.com/the-microbiome-clinic/tmc-command-bar-releases/releases/latest/download/TMC-Command-Bar.zip"
TMP=$(mktemp -d)
echo "Downloading TMC Command Bar…"
curl -fsSL "$URL" -o "$TMP/TMC-Command-Bar.zip"
pkill -x TMCCommandBar 2>/dev/null || true
pkill -x TMCPrompts 2>/dev/null || true
rm -rf "/Applications/TMC Command Bar.app" "/Applications/TMC Prompts.app"
ditto -x -k "$TMP/TMC-Command-Bar.zip" /Applications
rm -rf "$TMP"
open "/Applications/TMC Command Bar.app"
echo "Done. TMC Command Bar is in your Applications folder and will keep itself up to date."
