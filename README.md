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
## Usage

1. **Clone or download**:<br/>
`curl -O https://raw.githubusercontent.com/KristupasJon/Pop_OS-maintenance-script/main/popos-maintenance.sh`<br/>
`chmod +x popos-maintenance.sh`
2. **Run**:<br/>
`cd {Path to script}`<br/>
`./popos-maintenance.sh`
3. **(Optional) Add script to PATH to run from anywhere**:<br/>
`sudo mv popos-maintenance.sh /usr/local/bin/`<br/>
`sudo chmod +x /usr/local/bin/popos-maintenance.sh`
