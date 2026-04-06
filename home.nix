{ config, pkgs, ... }:

{
  home.username = "colton";
  home.homeDirectory = "/home/colton";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";

  librewolf = {
      enable = true;
      flavor = "mocha";   # optional (inherits from global)
      accent = "blue";    # optional (inherits from global)
      force = true;       # optional: overrides existing Firefox Color themes
    };

    cursors = {
      enable = true;
      flavor = "mocha";   # optional (inherits from global)
      accent = "blue";    # optional (inherits from global)
    };

    gtk = {
      icon = {
        enable = true;
        flavor = "mocha";
        accent = "blue";
      };
    };
  };
}
