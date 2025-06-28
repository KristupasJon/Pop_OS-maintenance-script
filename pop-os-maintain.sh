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
run sudo apt update -m
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
  run flatpak update
  run flatpak uninstall --unused --delete-data
  run flatpak repair --user
  run flatpak upgrade
else
  echo -e "${R}Skipping Flatpak (not found)${N}"
fi

echo -e "${G}Pop-OS: Update the Recovery partition${N}"

while true; do
  read -p "Do you want to run 'pop-upgrade recovery upgrade from-release'? (y/n): " choice
  
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo -e "${G}Running recovery upgrade...${N}"
    pop-upgrade recovery upgrade from-release
    break
  elif [[ "$choice" == "n" || "$choice" == "N" ]]; then
    echo -e "${G}Skipped recovery upgrade.${N}"
    break
  else
    echo -e "${R}Invalid input. Please enter y or n.${N}"
  fi
done

echo -e "${G}Maintenance completed${N}"

