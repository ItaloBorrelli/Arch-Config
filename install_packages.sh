#!/bin/bash

# Check if the explicit_installs.txt file exists
if [ -f explicit_installs.txt ]; then
  # Loop through each line in the file
  while read -r line; do
    # Extract the package name and version
    package_name=$(echo "$line" | cut -d ' ' -f 1)

    # Use 'yay -S' to install the package at the specified version
    yay -S --needed --noconfirm "$package_name"
  done < explicit_installs.txt

  echo "All packages have been installed or are up to date."
else
  echo "explicit_installs.txt not found. Please create the file with the list of packages to install."
fi

