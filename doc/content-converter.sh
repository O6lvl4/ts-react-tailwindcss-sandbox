#!/bin/bash

input="content.mov"
output="content_3mb.gif"
target_size=$((3 * 1024 * 1024))  # 3MB in bytes
duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$input")

# 初期ビットレートを計算（3MB / 動画の長さ）
bitrate=$(echo "$target_size * 8 / $duration" | bc)

while true; do
    ffmpeg -i "$input" -vf "fps=15,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -b:v "${bitrate}k" -loop 0 "$output"
    
    # 生成されたGIFのサイズをチェック
    size=$(wc -c < "$output")
    
    if [ "$size" -le "$target_size" ]; then
        echo "Successfully created GIF under 3MB"
        break
    else
        # ビットレートを10%下げて再試行
        bitrate=$(echo "$bitrate * 0.9" | bc)
        echo "Retrying with lower bitrate: ${bitrate}k"
    fi
done
