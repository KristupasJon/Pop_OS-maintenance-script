#!/usr/bin/env bash
set -euo pipefail

# colors
Y='\033[1;33m'  # yellow
G='\033[1;32m'  # green
R='\033[1;31m'  # red
N='\033[0m'     # none

run() {
  echo -e "${Y}==> $*${N}"
  "$@"
}

sudo -v

echo -e "${G}Starting maintenance${N}"
echo -e "${G}APT: Full maintenance according to System76${N}"
run sudo apt clean
run sudo apt update
run sudo dpkg --configure -a
run sudo apt install -f
run sudo apt full-upgrade
run sudo apt autoremove --purge
run sudo apt autoclean

echo -e "${G}Snap: refreshing${N}"
if command -v snap >/dev/null; then
  run sudo snap refresh
else
  echo -e "${R}Skipping Snap (not found)${N}"
fi

echo -e "${G}Flatpak: repairing, updating & cleanup${N}"
if command -v flatpak >/dev/null; then
  run flatpak repair --user
  run flatpak update
  run flatpak upgrade
  run flatpak uninstall --unused --delete-data
else
  echo -e "${R}Skipping Flatpak (not found)${N}"
fi

echo -e "${G}Maintenance completed${N}"

