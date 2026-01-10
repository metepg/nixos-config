{ pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/desktop.nix # XFCE, i3, Xserver, LightDM
    ../../modules/nixos/audio.nix   # Pipewire, Pulse
    ../../modules/nixos/power.nix   # TLP, Lid switch, Powertop
  ];

  environment = {
    systemPackages = with pkgs; [
      docker-compose
      git
      i3status
      rofi
      vim
      wget
    ];

    variables.EDITOR = "vim";

  };

  networking.hostName = "nixosman";

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      nixosman = {
        isNormalUser = true;
        description = "nixosman";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
      };

    };
  };

  programs = {
    zsh.enable = true;

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 10";
      flake = "/home/nixosman/nixos-config";
    };
  };

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [ "DejaVu Sans Mono 14" ];
  };

  system.stateVersion = "25.11";
}
