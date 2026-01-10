{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;

      # xset
      autoRepeatDelay = 220;
      autoRepeatInterval = 35;

      displayManager.lightdm.enable = true;
      windowManager.i3.enable = true;

      desktopManager.xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };

      xkb = {
        layout = "fi";
        variant = "nodeadkeys";
      };
    };

    displayManager.defaultSession = "xfce+i3";
    
    libinput.enable = true;
  };
}
