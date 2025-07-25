# Pop!_OS Maintenance Script

Bash script to perform full system maintenance on **Pop!_OS**, including:

- Repair of broken or missing packages
- APT clean/update/full-upgrade (as recommended by System76)
- Flatpak update and cleanup
- Snap refresh
- Optional installation or upgrade of the recovery partition

---
## How to Install?

1. **Clone or download**:<br/>
`curl -O https://raw.githubusercontent.com/KristupasJon/Pop_OS-maintenance-script/main/pop-os-maintain.sh`<br/>
2. **Run**:<br/>
`./pop-os-maintain.sh`<br/>
3. **(Optional) Add script to PATH to run from anywhere**:<br/>
`git clone https://github.com/KristupasJon/Pop_OS-maintenance-script`<br/>
**Run**:<br/>
`./install.sh`<br/>
**Usage**:<br/>
`pop-os-maintain.sh`

## NOTE
Don't run the script as `sudo pop-os-maintain.sh`. If you do, flatpak will run as sudo and there may be file permission issues. By design always run flatpak without `sudo`.

---

## Sources

- [System76: Package Manager Issues](https://support.system76.com/articles/package-manager-pop/)
- [System76: Upgrade Pop!_OS. When Should I Upgrade?](https://support.system76.com/articles/upgrade-pop/)
