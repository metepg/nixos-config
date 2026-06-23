{ config, lib, pkgs, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      VIMUNDO = "${config.home.homeDirectory}/.vimundo";
      PROJECTS = "${config.home.homeDirectory}/projects";
    };
  };

  # Set Chromium as the default for web links and HTML files
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "chromium-browser.desktop";
      "x-scheme-handler/http" = "chromium-browser.desktop";
      "x-scheme-handler/https" = "chromium-browser.desktop";
      "x-scheme-handler/about" = "chromium-browser.desktop";
      "x-scheme-handler/unknown" = "chromium-browser.desktop";
    };
  };

  xdg.configFile."user-dirs.dirs".force = true;

}
