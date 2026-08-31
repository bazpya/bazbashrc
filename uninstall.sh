# this undos the install.sh script

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
  grep -vxF "$__line" ~/.bashrc > ~/.bashrc.tmp || [ "$?" = 1 ]
  mv ~/.bashrc.tmp ~/.bashrc
  echo "Removed this line from ~/.bashrc:"
  echo "$__line"
else
  echo "Nothing to remove from ~/.bashrc"
  echo "as the file didn't contain this line:"
  echo "$__line"
fi

unset __dir __line
