# DASH

A Dash real-time flow it is generated and it is send via HTTP using a web-server to the client. The master playlist and the segments will be put inside `segments/`.

## Advantages
- Really easy to deploy (literally can be deployed tomorrow).
- HTTP based.
- The reponsability relies on the client.
- Video can be sent beforehand. (Latency is not a "huge" problem).
- The main point of preassure in a not really large scale is in the encoder only. Recommended to use a hardware accelerator as Nvidia because it is encoding on real-time 4K 360º.


## Downsides
- It is not efficient in the bandwidth (sends full video).
- Client does a lot of useless work on part where is does not watch.


# Deployment 
## Considerations
We use Nvidia as hardware acceleration.

## Server

Download a video and put inside the segments folder. You can download one from [here](https://www.mettle.com/360vr-master-series-free-360-downloads-page/). 

As a web-server it can be used whether [Apache](https://httpd.apache.org/), [Nginx](https://nginx.org/en/) or [Caddy](https://caddyserver.com/).

It uses a ffmpeg within a dockerfile for easy deployment [link](https://hub.docker.com/r/linuxserver/ffmpeg).

The encoder generates 3 different bitrates: 30M, 20M and 10M.

To run the encoder:
```
chmod +x run_ffmpeg.sh
./run_ffmpeg.sh <video_name>
```
It wil start ffmpeg in a loop. When you want to finish just `Crtl+C` and it will delete all the files in `segments/`.

## Client
Just put your URL on your navigator and enjoy 😎.

### Cosideration
It works on MacOS Firefox, Chrome and Safari.
It does **NOT** work on Android.
