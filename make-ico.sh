#!/bin/bash

set -e

svg=$1
filename=${svg%.*}
ico=${2:-"$filename.ico"}
echo "$filename"
echo "$ico"

size=(16 32 24 48 64 72 96 144 152 192 196 256)

out=tmp
mkdir -p "$out"

echo Making bitmaps from your svg...

for i in ${size[@]}; do
  inkscape $svg --export-type=png -o "$out/$i.png" -w $i -h $i
done

echo Compressing...

## Replace with your favorite (e.g. pngquant)
# optipng -o7 "$out/*.png"
find "$out" -name "*.png" -exec pngquant -f --ext .png 256 {} +

echo Converting to $ico...

convert "$out/*.png" "$ico"

# Clean-up
rm -rf "$out/"

echo Done
