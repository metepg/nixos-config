{ pkgs, ... }:

{
  home.username = "nixosman";
  home.homeDirectory = "/home/nixosman";

  home.packages = with pkgs; [
    bat
    chromium
    firefox
    eza
    fd
    htop
    ranger
    ripgrep
    tldr
    tree
  ];

  # Set repeat delay to 200ms and rate to 50Hz
  xfconf.settings = {
    keyboards = {
      "Default/KeyRepeat/Delay" = 220;
      "Default/KeyRepeat/Rate" = 35;
    };
  };

  imports = [
    ./browser.nix
    ./git.nix
    ./i3.nix
    ./i3status.nix
    ./ideavimrc.nix
    ./intellij.nix
    ./vim.nix
    ./xdg.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
