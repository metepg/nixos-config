{ pkgs, inputs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/desktop.nix # XFCE, i3, Xserver, LightDM
    ../../modules/nixos/audio.nix   # Pipewire, Pulse
    ../../modules/nixos/power.nix   # TLP, Lid switch, Powertop
    inputs.home-manager.nixosModules.home-manager
  ];

  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      docker-compose
      git
      i3status
      ksnip
      networkmanagerapplet
      rofi
      vim
      wget
      xclip
    ];

    variables.EDITOR = "vim";

  };

  networking.hostName = "nixosman";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.nixosman = import ./nixosman.nix;
  };

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      nixosman = {
        isNormalUser = true;
        uid = 1000;
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
