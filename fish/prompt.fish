## ==== color define =======================
# set user_color         fff # 06bd1f # 09a31e # 6b8e23 # 228b22
# set host_color         fff # f98ff7
# set at_color           6b8e23
# set pwd_color          green # 00a7f4
# set first_suffix_color fff
# set status_color       red
# set open_color         fff # 7804cb
# set close_color        fff

if not set -q __fish_prompt_hostname
  set -g __fish_prompt_hostname (hostname)
end

function fish_prompt
  set exit_code $status

  ## ==== first line =======================
  set_color fff
  echo -n $USER
  set_color 6b8e23
  echo -n "@"
  set_color fff
  echo -n $__fish_prompt_hostname
  set_color normal
  echo -n ' '
  set_color green
  echo -n (prompt_pwd)
  set_color fff
  echo '>'

  ## ==== second line =====================
  set_color fff
  echo -n "_"
  if test $exit_code -ne 0
    set_color red
    echo -n ':'$exit_code
  end
  set_color fff
  echo ": "
end
