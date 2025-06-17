#!/bin/bash
# Credit: https://graphicdesign.stackexchange.com/a/110023

set -e

svg=$1
name=${svg%.*}
ico=${2:-"$name.ico"}

size=(16 32 24 48 64 72 96 144 152 192 196 256)

out=tmp
mkdir -p "$out"
target=ico/$(basename $ico)

echo Making bitmaps from your svg...

for i in ${size[@]}; do
  inkscape $svg --export-type=png -o "$out/$i.png" -w $i -h $i
done

echo Compressing...

find "$out" -name "*.png" -exec pngquant -f --ext .png 256 {} +

echo Converting to $target...

convert "$out/*.png" "$target"

# Clean-up
rm -rf "$out/"

echo Done
