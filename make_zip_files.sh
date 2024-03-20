#!/usr/bin/env bash

SOURCE_DIR=unpacked

# Remove previous ZIP files, if any.
rm -f dist/*.zip

find "$SOURCE_DIR" -type d -maxdepth 1 -print0 | while read -r -d $'\0' folder; do
  if [[ "$folder" == "$SOURCE_DIR" ]]; then
    continue
  fi

  zip_file="$(basename "$folder").zip"

  # Move to the directory of the add-on and zip its content.
  pushd "$folder" || exit 1
  zip "../../dist/$zip_file" ./*
  popd || exit 2
done
