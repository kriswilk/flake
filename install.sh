#! /usr/bin/env nix-shell
#! nix-shell -i bash --packages bash disko

## COLOURS ##
C_OFF='\e[0m'
C_YEL='\e[1;33m'

## HELPERS ##
function pause() {
    echo
    read -p "Press Enter to continue..."
}
function notify() {
    echo -e "\n${C_YEL}${1}${C_OFF}"
    sleep 1
}

notify "HOSTNAME..."
read -p "Enter the hostname: " host

notify "HARDWARE..."
sudo nixos-generate-config --no-filesystems --show-hardware-config
pause

notify "DISKO..."
sudo disko --mode destroy,format,mount --flake github:kriswilk/flake#${host}

notify "SOPS KEY..."
pause
sudo mkdir -p /mnt/var/lib/sops-nix
sudo nano /mnt/var/lib/sops-nix/key.txt
sudo chmod 600 /mnt/var/lib/sops-nix/key.txt

notify "INSTALL..."
sudo nixos-install --no-channel-copy --no-root-password --flake github:kriswilk/flake#${host}

notify "CLONE REPO..."
sudo git clone https://github.com/kriswilk/flake /mnt/home/kris/.flake

