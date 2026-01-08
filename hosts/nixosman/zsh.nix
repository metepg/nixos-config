{ pkgs, ... }: {
  imports = [ ../../modules/home-manager/zsh-base.nix ];

  programs.zsh = {
    enableZshIntegration = true;

    # 1. Aliases
    shellAliases = {
      ll = "eza -l";
      lla = "ls -ld .?*";
      llt = "eza -T";
      ra = ". ranger";
      update = "sudo nixos-rebuild switch --flake .#nixosman";
      open = "xdg-open";
      pre = "fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'";
    };

    # 2. Prompt
    initContent = ''
      autoload -U colors && colors
      setopt prompt_subst
      git_branch() {
        if git rev-parse --git-dir > /dev/null 2>&1; then
          local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
          [[ -n $branch ]] && echo " (%{$fg[red]%}$branch%{$reset_color%})"
        fi
      }
      PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%}\$(git_branch) "
    '';

    # 3. Env Variables
    envExtra = ''
      export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80% --ansi --preview-window=:hidden,right"
      export BAT_THEME="Visual Studio Dark+"
      export FZF_DEFAULT_COMMAND="fd --follow --exclude '.git'"
    '';

    # 4. ZSH Plugins
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          sha256 = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
        };
      }
    ];
  };
}
