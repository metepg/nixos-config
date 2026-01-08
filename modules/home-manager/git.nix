{ pkgs, ... }: {
  programs.git = {
    enable = true;

    # New structured settings format
    settings = {
      user = {
        name = "Mete Guneysel";
        email = "52155024+metepg@users.noreply.github.com";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        autoSetupRemote = true;
      };

      core = {
        autocrlf = "input";
        eol = "lf";
      };
    };
    
    ignores = [
      ".direnv/"
      "result"
      "*.swp"
      ".DS_Store"
    ];
  };
}
