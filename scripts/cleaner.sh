#!/bin/bash

echo "🚀 Starting full ultra-clean system cleanup..."
echo "==================================="

# Function to safely clean directories
clean_dir() {
  local dir="$1"
  if [ -d "$dir" ]; then
    echo "🧩 Cleaning: $dir"
    sudo rm -rf "${dir:?}/"* 2>/dev/null
  else
    echo "⚠️ Skipped (not found): $dir"
  fi
}

# ----------------------------
# 🔹 TEMP + CACHE CLEANUP
# ----------------------------
echo "🧊 Clearing temporary files..."
clean_dir "/tmp"
clean_dir "/var/tmp"

echo "💾 Clearing system cache..."
clean_dir "/var/cache"

echo "🗑️ Clearing user cache..."
clean_dir "$HOME/.cache"

# ----------------------------
# 🔹 LOG FILE CLEANUP
# ----------------------------
echo "📜 Clearing old logs..."
find /var/log -type f -name "*.log" -exec sudo truncate -s 0 {} \; 2>/dev/null
find "$HOME" -type f -name "*.log" -exec truncate -s 0 {} \; 2>/dev/null

# ----------------------------
# 🔹 PACKAGE MANAGER CLEANUP
# ----------------------------
if command -v apt >/dev/null 2>&1; then
  echo "📦 Cleaning APT cache..."
  sudo apt-get clean
  sudo apt-get autoclean
  sudo apt-get autoremove -y
fi

if command -v dnf >/dev/null 2>&1; then
  echo "📦 Cleaning DNF cache..."
  sudo dnf clean all
fi

# ----------------------------
# 🔹 NPM & BUN CACHE CLEANUP
# ----------------------------
if command -v npm >/dev/null 2>&1; then
  echo "📦 Clearing npm cache..."
  npm cache clean --force
fi

if command -v bun >/dev/null 2>&1; then
  echo "🔥 Clearing Bun cache..."
  bun pm cache rm
fi

# ----------------------------
# 🔹 BROWSER CACHE CLEANUP
# ----------------------------
echo "🌐 Clearing browser caches..."
clean_dir "$HOME/.cache/mozilla"
clean_dir "$HOME/.cache/google-chrome"
clean_dir "$HOME/.cache/chromium"
clean_dir "$HOME/.cache/brave"

# ----------------------------
# 🔹 Flatpak & Snap
# ----------------------------
if command -v flatpak >/dev/null 2>&1; then
  echo "📦 Cleaning Flatpak..."
  flatpak uninstall --unused -y
fi

if command -v snap >/dev/null 2>&1; then
  echo "📦 Cleaning Snap..."
  sudo snap set system refresh.retain=2
  sudo snap remove --purge $(snap list --all | awk '/disabled/{print $1, $2}') 2>/dev/null
fi

# ----------------------------
# 🔹 Docker CLEANUP
# ----------------------------
if command -v docker >/dev/null 2>&1; then
  echo "🐳 Cleaning Docker unused images and containers..."
  docker system prune -a --volumes -f
fi

# ----------------------------
# 🔹 JOURNAL + THUMBNAILS
# ----------------------------
echo "📓 Cleaning journal logs..."
sudo journalctl --vacuum-time=7d

echo "🖼️ Cleaning thumbnails..."
clean_dir "$HOME/.cache/thumbnails"

# ----------------------------
# 🔹 NODE_MODULES CHECK (optional)
# ----------------------------
echo "📦 Checking heavy node_modules folders..."
find "$HOME" -type d -name "node_modules" -exec du -sh {} + | sort -h

# ----------------------------
# 🔹 FINISH
# ----------------------------
echo "==================================="
echo "✅ Ultra-clean complete!"
echo "💪 Your system is now lean, mean, and lightning fast."
echo "==================================="

