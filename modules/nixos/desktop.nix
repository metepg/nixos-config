{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce = {
      enable = true;
      noDesktop = true;
      enableXfwm = false;
    };
    windowManager.i3.enable = true;
    xkb = { layout = "fi"; variant = "nodeadkeys"; };
  };
  services.displayManager.defaultSession = "xfce+i3";
  services.libinput.enable = true;
}
