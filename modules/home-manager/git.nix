{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";

      # Can push without setting the new branch upstream first
      push.autoSetupRemote = true;

      core = { 
        autocrlf = "input";
        eol = "lf";
      };

    };
  };
}
