# Sort iterm config file by keys and separate ones  with color in the name  
# usage:  `sort_iterm_config iterm-file.json`
sort_iterm_config() {
  jq '
    to_entries
    | (map(select(.key | test("color$"; "i") | not | sort_by(.key))))
      +
      (map(select(.key | test("color$"; "i"))) | sort_by(.key))
    | from_entries
  ' "$@"
}
