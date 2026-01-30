# flake

NixOS host & user configuration based on flakes and home-manager.

## Usage

After booting from a NixOS live CD/USB, run:

```
nix-shell -p disko
bash <(curl -Ls https://github.com/kriswilk/flake/raw/refs/heads/main/install.sh)
```