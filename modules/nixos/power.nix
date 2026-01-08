{ ... }: {
  powerManagement.powertop.enable = true;
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      STOP_CHARGE_THRESH_BAT0 = 95;
    };
  };
  services.logind.settings.Login = {
    HandleLidSwitch = "hibernate";
    IdleAction = "hibernate";
    IdleActionSec = "20min";
  };
}
