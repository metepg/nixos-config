{ pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Mete Guneysel";
        email = "52155024+metepg@users.noreply.github.com";
      };

      init = {
        defaultBranch = "main";
      };

      # Can push without setting the new branch upstream first
      push = {
        autoSetupRemote = true;
      };

      core = {
        autocrlf = "input";
        eol = "lf";
      };
    };
    
  };
}
