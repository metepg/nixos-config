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

        # Ranger config to exit to navigated dir
        function ra() {
          local tmp="$(mktemp -t "ranger_cd.XXXXXX")"
          ranger --choosedir="$tmp" "$@"
          if [ -f "$tmp" ]; then
              local dir="$(cat "$tmp")"
              rm -f "$tmp"
              if [ -d "$dir" ] && [ "$dir" != "$PWD" ]; then
                  cd "$dir"
              fi
          fi
        }

        # --- Existing Logic ---
        autoload -U colors && colors
        setopt prompt_subst

        git_branch() {
          if git rev-parse --git-dir > /dev/null 2>&1; then
            local branch
            branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
            if [[ -n $branch ]]; then
              echo " (%{$fg[red]%}$branch%{$reset_color%})"
            fi
          fi
        }

        PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%}\$(git_branch) "

        # --- Ctrl+F to Find from file ---
        fzf-custom-search() {
          local result=$(rg --line-number . \
            --glob '!.git/*' \
            --glob '!node_modules/*' \
            --glob '!.gradle/*' \
            --glob '!.m2/*' \
            --glob '!package-lock.json' \
            --glob '!target/*' \
            --glob '!build/*' | \
            fzf --ansi \
                --color "bg+:-1,fg+:15,hl+:15:bold:underline" \
                --delimiter : \
                --preview-window 'right,60%,border-left,+{2}' \
                --preview 'bat --color=always --style=numbers --theme="Visual Studio Dark+" --highlight-line {2} {1}')
          
          if [[ -n "$result" ]]; then
            local file=$(echo "$result" | cut -d: -f1)
            local line=$(echo "$result" | cut -d: -f2)
            BUFFER="vim $file +$line"
            zle accept-line
          fi
          zle reset-prompt
        }

        # --- Ctrl+T to open file in Vim ---
        fzf-open-in-vim() {
          local file=$(eval "$FZF_CTRL_T_COMMAND" | fzf --exit-0)

          if [[ -n "$file" ]]; then
            if [[ -d "$file" ]]; then
              BUFFER="cd $file"
            else
              BUFFER="vim $file"
            fi
            zle accept-line
          fi
          zle reset-prompt
        }

        # Register and bind to Ctrl+f
        zle -N fzf-custom-search
        bindkey '^f' fzf-custom-search
        zle -N fzf-custom-search
        bindkey '^f' fzf-custom-search
        
        zle -N fzf-open-in-vim
        bindkey '^t' fzf-open-in-vim
      '';

      envExtra = ''
        export FZF_DEFAULT_OPTS="\
          --layout=reverse \
          --inline-info \
          --height=80% \
          --ansi \
          --bind '?:toggle-preview' \
          --preview-window=right \
          --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"

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
