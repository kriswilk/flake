#! /usr/bin/env nix-shell
#! nix-shell -i bash -p disko
set -euo pipefail

function notify() {
    echo -e "\n\e[1m${1}\e[0m\n"
    sleep 1
}

notify "HOSTNAME..."
read -r -p "-> " HOST

notify "DISKO..."
sudo disko --mode destroy,format,mount --flake "github:kriswilk/flake#${HOST}"

notify "AGE KEY..."
AGE_FILE="/mnt/var/lib/age/keys.txt"
sudo mkdir -p "$(dirname $AGE_FILE)"
sudo nano "${AGE_FILE}"
sudo chmod 600 "${AGE_FILE}"

notify "INSTALL..."
sudo nixos-install --max-jobs 2 --cores 2 --no-channel-copy --no-root-password --flake "github:kriswilk/flake#${HOST}"

notify "CLONE REPO..."
sudo git clone https://github.com/kriswilk/flake /mnt/etc/nixos
