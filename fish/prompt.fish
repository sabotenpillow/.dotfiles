function fish_prompt
  set exit_code $status

  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname)
  end

  ## color define =======================
  set user_color   06bd1f # 09a31e # 6b8e23 # 228b22
  set host_color   f98ff7
  set pwd_color    00a7f4
  set status_color red
  set open_color   7804cb
  set close_color  fff

  ## ==== first line =======================
  echo -n '['
  set_color $user_color
  echo -n $USER
  set_color normal
  echo -n "@"
  set_color $host_color
  echo -n $__fish_prompt_hostname
  set_color normal
  echo -n '] '
  set_color $pwd_color
  echo (prompt_pwd)

  ## ==== second line =====================
  set_color $open_color
  echo -n ":(%"
  if test $exit_code -ne 0
    set_color red
    echo -n ':'$exit_code
  end
  set_color $close_color
  echo "): "
end
