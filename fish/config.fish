set fish_dir $HOME/.dotfiles/fish

# set -gx LS_COLORS (dircolors $HOME/.solarized/dircolors.256dark)

#source $fish_dir/environment.fish  # 環境変数は.bash_profileに記載
source $fish_dir/ls.fish
source $fish_dir/bind.fish
source $fish_dir/prompt.fish
source $fish_dir/git_prompt.fish
source $fish_dir/alias.fish
# source $fish_dir/fish-git/completions/git.fish
# source $fish_dir/fish-git/functions/prompt_git.fish
# source $fish_dir/right_prompt.fish

set fish_color_normal         cyan
set fish_color_command        FF9400
set fish_color_quote          BF9C30
set fish_color_redirection    70c0b1
set fish_color_end            FF4C00
set fish_color_error          a40000
set fish_color_param          7aa6da # FFC000
set fish_color_comment        A63100
set fish_color_match          --background=brblue
set fish_color_search_match   bryellow --background=brblack
set fish_color_operator       bryellow
set fish_color_escape         bryellow --bold
set fish_color_autosuggestion 969896
