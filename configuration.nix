

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  fonts = {
    packages = with pkgs; [
      maple-mono.truetype
      maple-mono.NF-unhinted
      maple-mono.NF-CN-unhinted
    ];
  };

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";
  catppuccin.accent = "blue";


  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.colton = {
    isNormalUser = true;
    description = "colton";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  programs.firefox.enable = true;
  programs.git.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    pkgs.discord
    pkgs.prismlauncher
    pkgs.librewolf
    pkgs.thunderbird
    pkgs.spotify
    pkgs.imv
    pkgs.mpv
    pkgs.vencord
    pkgs.libreoffice
    pkgs.steam
    pkgs.freenet
    pkgs.jetbrains.idea
    pkgs.gnome-console
    pkgs.bibata-cursors
  ];

  system.stateVersion = "25.11";
}

