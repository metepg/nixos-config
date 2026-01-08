{ pkgs, ... }: {
  programs.fzf = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      size = 10000;
      save = 10000;
    };
  };
}
