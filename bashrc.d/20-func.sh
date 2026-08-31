mkcd() {
  [ "$#" -eq 1 ] || { echo "usage: mkcd DIR" >&2; return 2; }
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}
