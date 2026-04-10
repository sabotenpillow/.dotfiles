load_path() {
  [ -d "$1" ] || return 1
  case ":$PATH:" in
    *":$1:"*) return 0 ;;
  esac
  export PATH="$1:$PATH"
}

is_included_in_path() {
  case ":$PATH:" in
    *":$1:"*) return 0 ;;
  esac
  return 1
}
