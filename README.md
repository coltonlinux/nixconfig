# nixconfig
This repository contains my personal NixOS configuration, managed with flakes and Home Manager.  
It can be used as a reference or installed directly on another machine.

---

## 🚀 Requirements

- NixOS 23.11 or later
- Flakes enabled (`nix-command` + `flakes`)
- Internet connection

---

## 📦 Install on a Fresh NixOS System

1. Boot into the NixOS installer.
2. Partition and mount your disks as usual.
3. Clone this repository:

```bash
git clone https://github.com/coltonlinux/nixconfig /mnt/etc/nixos
```

4. Install the config:
```bash
bash nixos-install --flake /mnt/etc/nixos#nixos
reboot
```
