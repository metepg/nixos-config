{ pkgs, inputs, ... }: {
  programs = {
    chromium = {
      enable = true;
      extensions = [
        # vimium
        "dbepggeogbaibhgnhhndojpepiihcmeb"
      ];
      # Set these for i to focus input on vimium settings
      #unmap i
      #map i focusInput
    };

    firefox = {
      enable = true;
      profiles.default = {
        isDefault = true;
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          vimium
        ];
        settings = {
          "extensions.autoDisableScopes" = 0;
          "extensions.enabledScopes" = 15;
        };
      };
    };

  };
}
