{ config, lib, pkgs, ... }:

let
  scriptsDir = ../../scripts/zsh;
  fzfHelpers = "${scriptsDir}/fzf-helpers.zsh";
  rangerNavigation = "${scriptsDir}/ranger-navigation";
  zshPrompt = "${scriptsDir}/prompt.zsh";
  envExtra = "${scriptsDir}/env.zsh";
in
{
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "eza -l";
        lla = "ls -ld .?*";
        llt = "eza -T";
        buildit = "nh os switch .";
        testit = "nh os test .";
        open = "xdg-open";
        pre="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'";
      };

      history = {
        expireDuplicatesFirst = true;
        ignoreDups = true;
        ignoreAllDups = true;
        ignoreSpace = true;
        size = 10000;
        save = 10000;
      };

      initContent = ''
        source ${fzfHelpers}
        source ${zshPrompt}

        ra() {
          source ${rangerNavigation} "$@"
        }
      '';

      envExtra = ''
        source ${envExtra}
      '';

    };
  };
}
