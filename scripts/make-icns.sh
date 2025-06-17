#!/bin/bash
# Credit: https://graphicdesign.stackexchange.com/a/110023

set -e

svg=$1
name=$(basename ${svg%.*})
target=icns/${2:-"$name.icns"}

size=(16 32 48 128 256)

out=tmp
mkdir -p "$out"

echo Making bitmaps from your svg...

for i in ${size[@]}; do
  inkscape $svg --export-type=png -o "$out/$i.png" -w $i -h $i
done

echo Compressing...

find "$out" -name "*.png" -exec pngquant -f --ext .png 256 {} +

echo Converting to $target...

png2icns "$target" $out/*.png

# Clean-up
rm -rf "$out/"

echo Done
