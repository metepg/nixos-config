{ pkgs, inputs, ... }: {
  programs = {
    chromium = {
      enable = true;
      extensions = [
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
        "cmedhionkhpnakcndndgjdbohmhepckk" # YouTube Adblocker
      ];
      # Set these for i to focus input on vimium settings
      #unmap i
      #map i focusInput
    };

  };
}
