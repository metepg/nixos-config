{ pkgs, ... }:

{
  programs.i3status = {
    enable = true;

    general = {
      colors = true;
      interval = 5;
      # Standard colors
      color_good = "#00FF00";      # Green
      color_bad = "#FF0000";       # Red
    };

    modules = {
      "battery all" = {
        position = 1;
        settings = {
          format = " %status %percentage ";
          
          # Force integer rounding
          integer_battery_capacity = true;
          # Calculate percentage based on last full capacity instead of design capacity
          last_full_capacity = true;
          format_down = "No battery";
          status_chr = "⚡ CHARGING";
          status_bat = "🔋 BATTERY";
          low_threshold = 20;
          threshold_type = "percentage";
        };
      };
      "tztime local" = {
        position = 2;
        settings = {
          format = " %d.%m.%Y %H:%M ";
        };
      };
      # Hide others
      "ipv6".enable = false;
      "wireless _first_".enable = false;
      "ethernet _first_".enable = false;
      "disk /".enable = false;
      "load".enable = false;
      "memory".enable = false;
    };
  };
}
