#!/usr/bin/env bash

for sub_folder in "unknown" "signed_with_production_cert" "signed_with_staging_cert" "unsigned"; do
  dist_folder="dist/$sub_folder"

  rm -rf "$dist_folder"
  mkdir -p "$dist_folder"

  find "$sub_folder" -type d -maxdepth 1 -print0 | while read -r -d $'\0' folder; do
    if [[ "$folder" == "$sub_folder" ]]; then
      continue
    fi

    zip_file="$(basename "$folder").zip"

    # Move to the directory of the add-on and zip its content.
    pushd "$folder" || exit 1
    zip "../../$dist_folder/$zip_file" ./*
    popd || exit 2
  done
done
