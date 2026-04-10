# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"
autoload -U colors; colors
# black, red, green, yellow, blue, magenta, cyan, white

if [[ -n "${ZSH_LOGIN_SUMMARY:-}" ]]; then
  echo # blank line for delimiter

  echo "${fg[cyan]}===== login users =====${reset_color}";
  users; echo

  if (( $+commands[tmux] )); then
    echo "${fg[green]}===== tmux sessions =====${reset_color}";
    tmux ls; echo
  fi

  if (( $+commands[vagrant] )); then
    vms_process="$(ps x | grep virtualbox | grep VBoxHeadless)"  # ps x G virtualbox G VBoxHeadless | cut -d ' ' -f17
    if [ $? -eq 0 ]; then
      echo "${fg[magenta]}===== running VMs =====${reset_color}";
      echo "$vms_process" | sed -re 's/ +/ /g' | sed -re 's/^ //g' | cut -d ' ' -f7; echo
    fi
  fi
fi

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"
