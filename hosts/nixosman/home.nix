{ pkgs, config,  ... }:

let
  java21 = pkgs.jdk21;
in
{
  home = {
    username = "nixosman";
    homeDirectory = "/home/nixosman";
  };

  programs.java = {
    enable = true;
    package = java21;
  };

  # Easier access to JAVA_HOME
  home.file.".jdk".source = java21;

  home.file."${config.home.homeDirectory}/.config/flameshot/flameshot.ini".text = ''
    [General]
    contrastOpacity=188
    insecurePixelate=true
    showHelp=false
    showSelectionGeometryHideTime=3000
    showSidePanelButton=false
    showStartupLaunchMessage=false
    undoLimit=100
  '';

  home.packages = with pkgs; [
    bat
    eza
    fd
    htop
    jdk21
    nodejs_24
    pnpm
    ranger
    ripgrep
    tldr
    tree
  ];

  imports = [
    ../../modules/home-manager/browser.nix
    ../../modules/home-manager/flameshot.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/i3.nix
    ../../modules/home-manager/i3status.nix
    ../../modules/home-manager/ideavimrc.nix
    ../../modules/home-manager/intellij.nix
    ../../modules/home-manager/vim.nix
    ../../modules/home-manager/xdg.nix
    ../../modules/home-manager/zsh.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
