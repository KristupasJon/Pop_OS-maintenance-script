# Pop!_OS Maintenance Script

A simple Bash script to perform full system maintenance on **Pop!_OS**, including:

- APT clean/update/full-upgrade (as recommended by System76)
- Flatpak update and cleanup
- Snap refresh
- Basic repair of broken or missing packages

---

## Sources

- [System76 Support: Package Manager Issues](https://support.system76.com/articles/package-manager-pop/)

---
## Install

1. **Clone or download**:<br/>
`curl -O https://raw.githubusercontent.com/KristupasJon/Pop_OS-maintenance-script/main/pop-os-maintain.sh`<br/>
`chmod +x pop-os-maintain.sh`<br/>
2. **Run**:<br/>
`cd {PATH}`<br/>
`./pop-os-maintain.sh`<br/>
3. **(Optional) Add script to PATH to run from anywhere**:<br/>
`git clone https://github.com/KristupasJon/Pop_OS-maintenance-script`<br/>
**Run**:<br/>
`chmod +x install.sh`<br/>
`./install.sh`<br/>
**Usage**:<br/>
`pop-os-maintain.sh`
