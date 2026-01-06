{ config, lib, pkgs, ... }:

{
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      shellAliases = {
        ll = "eza -l";
        lla = "ls -ld .?*";
        llt = "eza -T";
        ra = ". ranger";
        update = "sudo nixos-rebuild switch --flake .#nixos";
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
        autoload -U colors && colors
        setopt prompt_subst

        # Function to retrieve the current Git branch
        git_branch() {
          # Check if we're inside a Git repository
          if git rev-parse --git-dir > /dev/null 2>&1; then
            local branch
            branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
            if [[ -n $branch ]]; then
              echo " (%{$fg[red]%}$branch%{$reset_color%})"
            fi
          fi
        }

        PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%}\$(git_branch) "
      '';

      envExtra = ''
        export FZF_DEFAULT_OPTS="\
          --layout=reverse \
          --inline-info \
          --height=80% \
          --ansi \
          --bind '?:toggle-preview' \
          --preview-window=:hidden,right \
          --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -200'"

        export BAT_THEME="Visual Studio Dark+"
        export FZF_DEFAULT_COMMAND="fd --follow --exclude '.git' --exclude 'node_modules' --exclude '.vscode'"
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
      '';

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
          name = "zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-completions";
            rev = "0.34.0";
            sha256 = "sha256-qSobM4PRXjfsvoXY6ENqJGI9NEAaFFzlij6MPeTfT0o=";
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
  };
}
