#!/usr/bin/env bash

set -euo pipefail

sudo -v

echo "Moving pop-os-maintain.sh to /usr/local/bin/"

sudo mv pop-os-maintain.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/pop-os-maintain.sh

echo "Done!"
echo "Now you may run pop-os-maintain.sh system wide."
