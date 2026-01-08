{ pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/desktop.nix # XFCE, i3, Xserver, LightDM
    ../../modules/nixos/audio.nix   # Pipewire, Pulse
    ../../modules/nixos/power.nix   # TLP, Lid switch, Powertop
  ];

  networking.hostName = "nixosman";

  users.users.nixosman = {
    isNormalUser = true;
    description = "nixosman";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    git
    i3status
    rofi
    vim
    wget
  ];

  environment.variables.EDITOR = "vim";

  system.stateVersion = "25.11";
}
