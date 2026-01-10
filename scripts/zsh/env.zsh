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
