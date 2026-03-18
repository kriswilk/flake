#! /usr/bin/env nix-shell
#! nix-shell -i bash --packages bash disko

HOST="${1:$HOSTNAME}"
AGE_DIR="/mnt/var/lib/age"
AGE_FILE="${AGE_DIR}/keys.txt"

function notify() {
    echo -e "\n\e[1m${1}\e[0m\n"
    sleep 1
}

notify "DISKO..."
sudo disko --mode destroy,format,mount --flake "github:kriswilk/flake#${HOST}"

notify "AGE KEY..."
sudo mkdir -p "${AGE_DIR}"
sudo nano "${AGE_FILE}"
sudo chmod 600 "${AGE_FILE}"

notify "INSTALL..."
sudo nixos-install --max-jobs 2 --cores 2 --no-channel-copy --no-root-password --flake "github:kriswilk/flake#${HOST}"

notify "CLONE REPO..."
sudo git clone https://github.com/kriswilk/flake /mnt/etc/nixos
