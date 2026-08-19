#!/bin/bash
#
# Mushbox belaUI branding installer
#
# Applies the Mushbox header/logo patch to an existing belaUI install.
# Safe to re-run: only backs up the originals on the first run.
#
# Usage:
#   wget -qO- https://raw.githubusercontent.com/mushr00msauce/mushbox-belaui-branding/main/install.sh | sudo bash
#
set -e

REPO_RAW="https://raw.githubusercontent.com/mushr00msauce/mushbox-belaui-branding/main"
BELAUI_PUBLIC="/opt/belaUI/public"

echo "== Mushbox belaUI branding installer =="

if [ ! -d "$BELAUI_PUBLIC" ]; then
  echo "ERROR: belaUI public directory not found at $BELAUI_PUBLIC"
  echo "This doesn't look like a standard belaUI install — aborting."
  exit 1
fi

echo "Creating img directory..."
mkdir -p "$BELAUI_PUBLIC/img"

if [ ! -f "$BELAUI_PUBLIC/index.html.bak" ]; then
  cp "$BELAUI_PUBLIC/index.html" "$BELAUI_PUBLIC/index.html.bak"
  echo "Backed up original index.html -> index.html.bak"
else
  echo "index.html.bak already exists, skipping backup (original preserved from first run)"
fi

if [ ! -f "$BELAUI_PUBLIC/style.css.bak" ]; then
  cp "$BELAUI_PUBLIC/style.css" "$BELAUI_PUBLIC/style.css.bak"
  echo "Backed up original style.css -> style.css.bak"
else
  echo "style.css.bak already exists, skipping backup (original preserved from first run)"
fi

echo "Downloading branded files..."
wget -qO /tmp/mushbox-index.html "$REPO_RAW/index.html"
wget -qO /tmp/mushbox-style.css "$REPO_RAW/style.css"
wget -qO /tmp/mushbox-logo.png "$REPO_RAW/img/mushbox-logo.png"

echo "Installing..."
mv /tmp/mushbox-index.html "$BELAUI_PUBLIC/index.html"
mv /tmp/mushbox-style.css "$BELAUI_PUBLIC/style.css"
mv /tmp/mushbox-logo.png "$BELAUI_PUBLIC/img/mushbox-logo.png"

echo ""
echo "Done. Hard-refresh the belaUI page in your browser (Ctrl+Shift+R / Cmd+Shift+R) to see the change."
echo ""
echo "To revert:"
echo "  sudo cp $BELAUI_PUBLIC/index.html.bak $BELAUI_PUBLIC/index.html"
echo "  sudo cp $BELAUI_PUBLIC/style.css.bak $BELAUI_PUBLIC/style.css"
