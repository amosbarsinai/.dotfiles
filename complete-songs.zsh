if [[ $DONT_AUTOCOMPLETE_SONGS != "" ]]; then
    return "0";
fi

songs() {
    sudo nano /usr/share/songs/db
}

if [[ -f "/usr/share/songs/db" ]]; then
    :
else
    echo 'Could not find `songs/db` database. Add a song database at /usr/share/songs called "db" to ignore this warning, or export DONT_AUTOCOMPLETE_SONGS set to anything to ignore this warning.'
fi

# Save original handler if exists
if whence -w command_not_found_handle >/dev/null; then
  functions[original_command_not_found_handle]="${functions[command_not_found_handle]}"
fi

command_not_found_handle() {
  local full_input="$*"
  local IFS=''  # don’t split lines unless explicitly

  local song_buffer=""
  local -a songs=()

  while IFS= read -r line || [[ -n $line ]]; do
    if [[ "$line" == "---" ]]; then
      song_buffer="${song_buffer#"${song_buffer%%[![:space:]]*}"}"
      song_buffer="${song_buffer%"${song_buffer##*[![:space:]]}"}"
      songs+=("$song_buffer")
      song_buffer=""
    else
      song_buffer+="$line"$'\n'
    fi
  done < "/usr/share/songs/db"

  [[ -n "$song_buffer" ]] && songs+=("$song_buffer")

  local input_lower="${(L)full_input}"
  for song in "${songs[@]}"; do
    local song_lower="${(L)song}"
    if [[ "$song_lower" == "$input_lower"* ]]; then
      echo "$song"
      return 0
    fi
  done

  if whence -w original_command_not_found_handle >/dev/null; then
    original_command_not_found_handle "$@"
  else
    echo "zsh: command not found: $full_input"
    return 127
  fi
}
