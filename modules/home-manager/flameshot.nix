{ pkgs, ... }: {
  services.flameshot = {
    enable = true;
  };

  # Screenshot configurations
  xdg.configFile."flameshot/flameshot.ini".text = ''
    [General]
    contrastOpacity=188
    insecurePixelate=true
    showHelp=false
    showSelectionGeometryHideTime=3000
    showSidePanelButton=false
    showStartupLaunchMessage=false
    undoLimit=100
  '';
}
