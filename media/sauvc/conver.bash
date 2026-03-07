#!/bin/bash
for file in *.mp4; do
  [ -f "$file" ] || continue
  output="${file%.*}.gif"
  ffmpeg -i "$file" -filter_complex "fps=10,scale=640:-1:flags=lanczos[p];[p]split[a][b];[a]palettegen[palette];[b][palette]paletteuse" "$output"
done
echo "All MP4s converted to GIFs!"
