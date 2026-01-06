{ pkgs, lib, ... }:

let modifier = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      # Modifier key (super)
      modifier = modifier;

      startup = [
        { command = "i3-msg workspace number 1"; notification = false; }
      ];
      bars = [
        {
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = {
            names = [ "DejaVu Sans Mono" ];
            size = 12.0;
          };
        }
      ];
      
      # Border titles
      window = {
        titlebar = false;
      };
      floating = {
        titlebar = false;
      };

      keybindings = lib.mkOptionDefault {
        
        # Alt+tab
        "Mod1+Tab" = "focus next";
        "Mod1+Shift+Tab" = "focus prev";

        # Shutdown
        "${modifier}+F4" = "exec systemctl poweroff";

        # Focus windows with h j k l
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        # Move windows with Shift + h j k l
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        
        # Navigate
        "${modifier}+q" = "kill";
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        # Move windows
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
      };

      # Rofi launcher
      menu = "${pkgs.rofi}/bin/rofi -show drun";
    };
  };

  # Rofi settings
  programs.rofi = {
    enable = true;
  };
}
