{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;

      # xset
      autoRepeatDelay = 220;
      autoRepeatInterval = 35;

      displayManager.lightdm.enable = true;
      windowManager.i3.enable = true;

      xkb = {
        layout = "fi";
        variant = "nodeadkeys";
      };
    };

    picom = {
      enable = true;
      vSync = true;
      backend = "glx";
    };

    displayManager.defaultSession = "none+i3";

    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
      };
    };
  };
}
