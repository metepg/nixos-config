{ pkgs, config, ... }:

{
  imports = [
    ../../modules/home-manager/browser.nix
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
      xfce.xfce4-terminal

      (makeDesktopItem {
        name = "logout";
        desktopName = "logout";
        exec = "i3-msg exit";
        icon = "system-log-out";
        type = "Application";
        categories = [ "System" ];
      })
    ];

    # Shortcut symlink for JAVA_HOME
    file.".jdk".source = config.programs.java.package;

    sessionVariables = {
       BROWSER = "chromium";
     };

  };

  services = { 
    dunst = {
      enable = true;
      settings = {
        global = {
          font = "DejaVu Sans Mono 14";
          timeout = "2s";
          width = 400;
        };
      };
    };
    
    ssh-agent.enable = true;
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

    ssh = {
      enable = true;
      enableDefaultConfig = false;

      includes = [ "config.local" ];

      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
          forwardAgent = false;
        };
      };
    };

  };
}
