#!/usr/bin/env zsh

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

# Register helpers
zle -N fzf-custom-search
zle -N fzf-open-in-vim

# Bind keys (Ctrl+f and Ctrl+t)
bindkey '^f' fzf-custom-search
bindkey '^t' fzf-open-in-vim
