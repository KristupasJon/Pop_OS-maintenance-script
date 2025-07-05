#!/usr/bin/env bash

set -u
set -o pipefail

# colors
Y='\033[1;33m'  # yellow
G='\033[1;32m'  # green
R='\033[1;31m'  # red
N='\033[0m'     # none

run() {
  echo -e "${Y}==> $*${N}"
  "$@"
}

if command -v system76-power >/dev/null; then
  current_gpu_mode=$(system76-power graphics)
  if [[ "$current_gpu_mode" == "integrated" ]]; then
    echo -e "${R}WARNING:${R} You are currently using ${Y}integrated graphics mode${N}."
    echo -e "${R}Removal of unneeded packages may remove NVIDIA drivers.${N}"
    echo -e "${R}Consider switching to hybrid or dedicated mode before proceeding.${N}"
    echo
  fi
fi

echo -e "${G}Pop!_OS Maintenance Script by Kristupas${N}"
echo -e "${G}This script performs system maintenance tasks on Pop!_OS${N}"
echo -e "${G}It will update the system, clean up packages, and manage Snap and Flatpak applications.${N}"
echo -e "${G}This script requires sudo privileges to perform system updates and maintenance.${N}"
echo -e "${Y}Run this script as normal user (no root) and grant sudo when requested.${N}"
echo -e "${G}Press Ctrl+C to cancel or any key to continue...${N}"
read -r -n 1 -s
echo -e "\n"

sudo -v

if [[ $? -ne 0 ]]; then
  echo -e "${R}You need to grant sudo privileges after running pop-os-maintain as normal user.${N}"
  exit 1
fi

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
  echo -e "Do you want to install or upgrade the recovery partition ${R}(~3GB)${N}? (y/n): "
  read choice
  
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo -e "${G}Running recovery upgrade...${N}"
    pop-upgrade recovery upgrade from-release
    break
  elif [[ "$choice" == "n" || "$choice" == "N" ]]; then
    echo -e "${R}Skipped recovery upgrade.${N}"
    break
  else
    echo -e "${R}Invalid input. Please enter y or n.${N}"
  fi
done

echo -e "${G}Maintenance completed${N}"

