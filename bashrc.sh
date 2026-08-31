# Entry point to load bash customisation scripts.

#════════════════════════════  Primary Defs - Begin  ════════════════════════════

# Every entry point needs these even before it loads peripheral scripts

script_dir() {
  local src="${BASH_SOURCE[1]:-}"
  [ -n "$src" ] || { echo "script_dir: must be called from a script" >&2; return 2; }
  CDPATH= cd -- "$(dirname -- "$src")" && pwd -P
}

baz_echo() {
  if [ -t 1 ]; then
    printf '\033[90m%s\033[0m\n' "$*"
  else
    printf '%s\n' "$*"
  fi
}

#════════════════════════════  Primary Defs - End  ════════════════════════════

__this_dir="$(script_dir)"
baz_echo "Running Mod scripts from:"
baz_echo "$__this_dir"


__bazrc_dir="$__this_dir/bashrc.d"

for __bazrc_f in "$__bazrc_dir"/*.sh; do
    [ -r "$__bazrc_f" ] && . "$__bazrc_f"
done

unset __this_dir __bazrc_dir __bazrc_f
