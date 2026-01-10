autoload -U colors && colors
setopt prompt_subst

git_branch() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
      echo " (%{$fg[red]%}$branch%{$reset_color%})"
    fi
  fi
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%}\$(git_branch) "
