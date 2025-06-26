# Pop!_OS Maintenance Script

A simple Bash script to perform full system maintenance on **Pop!_OS**, including:

- APT clean/update/full-upgrade (as recommended by System76)
- Flatpak update and cleanup
- Snap refresh
- Basic repair of broken or missing packages

---

## Sources

- [System76 Support: Updating Your System](https://support.system76.com/articles/package-manager/)
- [System76 Support: Fixing Broken Packages](https://support.system76.com/articles/fix-broken-packages/)

---
## Usage

1. **Clone or download**:
`curl -O https://raw.githubusercontent.com/KristupasJon/Pop_OS-maintenance-script/main/popos-maintenance.sh`
`chmod +x popos-maintenance.sh`
2. **Run**:
`cd {path to bash script}`
`./popos-maintenance.sh`
3. **(Optional) Add script to PATH to run from anywhere**
`sudo mv yourscript /usr/local/bin/
sudo chmod +x /usr/local/bin/yourscript`
