#!/bin/bash

sudo docker run --rm -it \
  --runtime=nvidia \
  -v $(pwd)/segments:/config \
  linuxserver/ffmpeg \
  -stream_loop -1 -re \
  -hwaccel nvdec \
  -i /config/$1 \
  -c:v h264_nvenc \
  -c:a aac -b:a 128k \
  -bf 1 -b_strategy 0 -sc_threshold 0 -pix_fmt yuv420p \
  -map 0:v:0 -map 0:a:0 -map 0:v:0 -map 0:a:0 -map 0:v:0 -map 0:a:0 \
  -b:v:0 10M -profile:v:0 baseline \
  -b:v:0 10M -profile:v:1 main \
  -b:v:0 30M -profile:v:2 high \
  -use_timeline 1 -use_template 1 -window_size 5 -adaptation_sets "id=0,streams=v id=1,streams=a" \
  -f dash config/manifest.mpd

rm segments/*.m4s

rm segments/*.mpd