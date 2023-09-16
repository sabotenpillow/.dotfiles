load_path() {
  [ -d $1 ] || return 1
  echo $PATH |grep $1 > /dev/null 2>&1 && return -1
  echo set PATH $1
  export PATH=$1:$PATH
}

is_included_in_path() {
  echo $PATH |grep $1 > /dev/null 2>&1 && return -1
  return 0
}
