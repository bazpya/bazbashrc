# Appends a line to ~/.bashrc for the current user making
# interactive bash instances source the bashrc.sh file from here

set -eu

#════════════════════════════  Primary Defs - Begin  ════════════════════════════

# Every entry point needs these even before it loads peripheral scripts

script_dir() {
  local src="${BASH_SOURCE[1]:-}"
  [ -n "$src" ] || { echo "script_dir: must be called from a script" >&2; return 2; }
  CDPATH= cd -- "$(dirname -- "$src")" && pwd -P
}

#════════════════════════════  Primary Defs - End  ════════════════════════════

__dir="$(script_dir)"
__line="[ -r \"$__dir/bashrc.sh\" ] && . \"$__dir/bashrc.sh\""

if grep -qxF "$__line" ~/.bashrc 2>/dev/null; then
  echo "Already applied in ~/.bashrc"
else
  # start on a fresh line only if the file doesn't already end with one
  [ -s ~/.bashrc ] && [ -n "$(tail -c1 ~/.bashrc)" ] && printf '\n' >> ~/.bashrc
  printf '%s\n' "$__line" >> ~/.bashrc
  echo "Appended this line to ~/.bashrc:"
  echo "$__line"
fi

unset __dir __line
