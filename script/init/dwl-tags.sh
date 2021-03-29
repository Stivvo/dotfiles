#!/usr/bin/env bash

# Variables
declare titleline tagline title taginfo isactive ctags mtags layout
declare -a tags name
readonly fname=/tmp/dwltags


_cycle() {
  tags=( "1" "2" "3" "4" "5" "6" "7" "8" "9" )

  # Name of tag (optional)
  # If there is no name, number are used
  #
  # Example:
  #  name=( "" "" "" "Media" )
  #  -> return "" "" "" "Media" 5 6 7 8 9)
  name=()

  for tag in "${!tags[@]}"; do
    mask=$((1<<tag))

    tag_name="tag"
    declare "${tag_name}_${tag}"
    name[tag]="${name[tag]:-${tags[tag]}}"

    printf -- '%s\n' "${tag_name}_${tag}|string|${name[tag]}"

    # Occupied
    if (( ctags & mask )); then
      printf -- '%s\n' "${tag_name}_${tag}_occupied|bool|true"
    else
      printf -- '%s\n' "${tag_name}_${tag}_occupied|bool|false"
    fi

    # Focused
    if (( mtags & mask )); then
      printf -- '%s\n' "${tag_name}_${tag}_focused|bool|true"
      printf -- '%s\n' "title|string|${title}"
    else
      printf -- '%s\n' "${tag_name}_${tag}_focused|bool|false"
    fi

  done

  printf -- '%s\n' "layout|string|${layout}"
  printf -- '%s\n' ""

}

# Call the function here so the tags are displayed at dwl launch
_cycle

while true; do

  # Wait for dwl to close it after writing
  inotifywait -qqe close_write "${fname}"

  # Get info from the file
  title=$(sed "1!d" "${fname}")
  taginfo=$(sed "2!d" "${fname}")
  tagsinfo=$(sed "3!d" "${fname}")
  layoutinfo=$(sed "4!d" "${fname}")

  isactive=$(printf -- '%s\n' "${tagline}" | cut -d ' ' -f 1)
  ctags=$(printf -- '%s\n' "${tagsinfo}" | cut -d ' ' -f 3)
  mtags=$(printf -- '%s\n' "${tagsinfo}" | cut -d ' ' -f 4)
  layout=$(printf -- '%s\n' "${layoutinfo}" | cut -d ' ' -f 3)

  _cycle

done

unset -v titleline tagline title taginfo isactive ctags mtags layout
unset -v tags name
