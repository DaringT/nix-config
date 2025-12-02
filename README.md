# ❄️ NixOS Doc

<img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/33856d7837cb8ba76c4fc9e26f91a659066ee31f/logo/nixos.svg" width="450">

## How to pull down nix config for a test VM
```bash
cd ~ && \
nix-shell -p git && \
git clone https://github.com/DaringT/nix-config.git && \
cd nix-config && \
cp /etc/nixos/hardware-configuration.nix ~/nix-config/host/VM/hardware-configuration.nix && \
sudo nixos-rebuild switch --flake .#VM && \
home-manager switch --flake ~/nix-config#daren && \
```