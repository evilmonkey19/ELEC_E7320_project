#!/bin/bash

sudo docker run --rm -it \
  --runtime=nvidia \
  -v $(pwd)/segments:/config \
  linuxserver/ffmpeg \
  -stream_loop -1 -re \
  -hwaccel nvdec \
  -i /config/$1 \
  -c:v h264_nvenc \
  -b:v:0 30M -b:v:1 20M -b:v:2 10M \
  -b:a:0 128k -b:a:1 128k -b:a:2 128k \
  -map 0:v -map 0:a -map 0:v -map 0:a -map 0:v -map 0:a \
  -f hls -var_stream_map "v:0,a:0 v:1,a:1, v:2,a:2" \
  -master_pl_name master.m3u8 -t 300 -hls_time 10 -hls_init_time 4 -hls_list_size \
  10 -master_pl_publish_rate 10  -hls_flags \
  delete_segments+discont_start+split_by_time config/master_%v.m3u8

rm segments/*.ts

rm segments/*.m3u8