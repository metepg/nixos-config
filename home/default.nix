{ pkgs, ... }:

{
  home.username = "nixosman";
  home.homeDirectory = "/home/nixosman";

  # Set repeat delay to 200ms and rate to 50Hz
  xfconf.settings = {
    keyboards = {
      "Default/KeyRepeat/Delay" = 220;
      "Default/KeyRepeat/Rate" = 35;
    };
  };

  imports = [
    ./git.nix
    ./vim.nix
    ./xdg.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
