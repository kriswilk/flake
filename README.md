# flake

NixOS host & user configuration based on flakes and home-manager.

## Usage

Boot from a NixOS live CD/USB and run:

```
nix --extra-experimental-features "nix-command flakes" run --refresh github:kriswilk/flake#install
```
