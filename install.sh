#! /usr/bin/env nix-shell
#! nix-shell -i bash --packages bash disko

## COLOURS ##
C_OFF='\e[0m'
C_YEL='\e[1;33m'
C_RED='\e[0;31m'

## HELPERS ##
function notify() { echo -e "\n${C_YEL}${1}${C_OFF}"; sleep 1; }
function fail() { echo -e "${C_RED}ERROR: ${1}${C_OFF}"; exit 1; }

notify "CLONE REPO TO LIVE ENVIRONMENT..."
git clone https://github.com/kriswilk/flake

notify "HOSTNAME..."
read -p "Enter the hostname: " host

notify "GENERATE HARDWARE CONFIG..."
sudo nixos-generate-config --no-filesystems --show-hardware-config
echo && read -p "Press Enter to continue..."

notify "RUN DISKO..."
sudo disko --mode destroy,format,mount --flake ./flake#${host}

notify "INSTALL NIXOS..."
sudo nixos-install --no-channel-copy --no-root-password --flake ./flake#${host}

notify "CLONE REPO TO NEW FILESYSTEM..."
sudo git clone https://github.com/kriswilk/flake /mnt/home/kris/.flake