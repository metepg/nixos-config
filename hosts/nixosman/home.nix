{ pkgs, config, ... }:

{
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

  home = {
    stateVersion = "25.11";
    username = "nixosman";
    homeDirectory = "/home/nixosman";

    packages = with pkgs; [
      bat
      eza
      fd
      htop
      nodejs_24
      pnpm
      ranger
      ripgrep
      tldr
      tree
    ];

    # Shortcut symlink for JAVA_HOME
    file.".jdk".source = config.programs.java.package;

    sessionVariables = {
       BROWSER = "chromium";
     };

  };

  programs = {
    home-manager.enable = true;

    java = {
      enable = true;
      package = pkgs.jdk21;
    };

    git = {
      settings = {
        user = {
          name = "Mete Guneysel";
          email = "52155024+metepg@users.noreply.github.com";
        };
      };
    };

  };
}
