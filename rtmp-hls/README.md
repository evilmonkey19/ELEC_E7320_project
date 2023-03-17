# RTMP - HLS

It is the same approach as with (HLS)[hls/README.md] but instead of rendering the video inside the server it comes from a producer that can be decoupled from the server. The client renders the video using `three.js`.

## Gaze Aware with Nginx, RTMP Module, HLS, Three.js, and ffmpeg

It is required to install Nginx, ffmpeg, RTMP module in the server. The piece of code right below goes into the Nginx configuration file, /etc/nginx/nginx.conf.

rtmp {
        server {
                listen 1935;
                chunk_size 4096;
                allow publish 127.0.0.1;
                deny publish all;

                application live {
                        live on;
                        record off;
                        hls on;
                        hls_path /var/www/html/stream/hls;
                        hls_fragment 3;
                        hls_playlist_length 60;

                        dash on;
                        dash_path /var/www/html/stream/dash;
                }
        }
}

## Streaming with FFMPEG
With ffmpeg, the 360_vr video is streamed to the RTMP module using the code below:
ffmpeg -re -i 360_vr_london_park_ducks_swans.mp4 -c:v copy -c:a aac -ar 44100 -ac 1 -f flv rtmp://localhost/live/stream
ffmpeg streams the video in chunks of byte (4096) and these stream chunks are stored in the /var/www/html/stream/hls directory of the server.

## Nginx to Client through HTTP
Using the browser, the user make a http request to watch the 360_vr video to the server through a http link in the index.html file. Nginx, the application server, serves the video chunks to the user.

## THREE 
The implementation of the three.js, JavaScript library, creates a 3D camera in the client side to give the user a better FOV on the 360 video. With the javaScript mouse events, the frontend code is able to adjust the FOV based on the user's movements.  
