{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      # vimium
      "dbepggeogbaibhgnhhndojpepiihcmeb"
    ];
    # Set these for i to focus input on vimium settings
    #unmap i
    #map i focusInput
  };

  programs.firefox = {
    enable = true;
  };
}
