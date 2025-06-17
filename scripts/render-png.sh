#!/bin/bash

# Define the target directory
directory="svg"

out="png"

# Create the output directory if necessary
if [ ! -d "$out" ]; then
  mkdir "$out"
fi

# Check if the target is not a directory
if [ ! -d "$directory" ]; then
  exit 1
fi

# Loop through files in the target directory
for file in "$directory"/*; do
  if [ -f "$file" ]; then
    nameext=${file#*/}
    name=${nameext%.*}
    echo "Rendering $file.png..."
    inkscape $file --export-type=png -o "$out/$name.png"
  fi
done