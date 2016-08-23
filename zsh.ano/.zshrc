##  環境設定
autoload -Uz compinit
compinit
# autoload -U colors; colors
# autoload -Uz add-zsh-hook

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


##  オプション

# zstyle ':completion:*:default' menu select=2
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*' ignore-parents parent pwd ..

# setopt no_beep
# setopt auto_cd
# setopt CHASE_LINKS    # リンクへ移動するとき実体へ移動
# setopt auto_param_keys
# setopt auto_menu      # 複数の補完候補は一覧表示
# setopt list_types     # 補完時にファイルの種別をマーク表示
# setopt auto_list      # 補完候補は一覧表示
# setopt list_packed    # 補完候補を詰めて表示
# setopt extended_history
# setopt share_history
# setopt hist_reduce_blanks
# setopt notify
# setopt correct

alias v='vim'

#
##  LEFT PROMPT
#
# local simple_prompt=$zsh_dir/zsh_simple_prompt

local prompt=$HOME/.zsh/left_prompt.zsh
[ -e $prompt ] && source $prompt
# PROMPT='%{[30;48;5;237m%}%{[38;5;178m%}%n@%m %{[30;48;5;067m%}%{[38;5;007m%}%~%{[0m%}'

# PROMPT='`left-prompt`'
# 
# function left-prompt {
#   FIRST='178m%}'
#   FIRST_B='237m%}'
#   SECOND='007m%}'
#   SECOND_B='064m%}' # 067
# 
#   local sharp='\uE0B0'
#   FG='%{[38;5;'
#   BG='%{[30;48;5;'
#   USER_AND_HOST="${BG}${FIRST_B}${FG}${FIRST}"
#   DIR="${BG}${SECOND_B}${FG}${SECOND}"
#   RESET='%{[0m%}'
# 
#   echo "${USER_AND_HOST}foo@bar${BG}${SECOND_B}${FG}${FIRST_B}${sharp} ${DIR}%~${RESET}${FG}${SECOND_B}${sharp} ${RESET}"
# }


#
## RIGHT PROMPT
#
local rprompt=$HOME/.zsh/right_prompt.zsh
[ -e $rprompt ] && source $rprompt

