# Internet Protocols [ ELEC-E7320 ]

This a repo for the Internet Protocols [ ELEC-E7320 ] course at Aalto University. Here a 4 approaches for sending a 360º live-streaming over the internet.

In each folder there is a more in deep explanation of the advantages and downsides of the solution and the commands on how to make it work.

Our focus has been on using HTTP as the "transport protocol" and be scalable (e.g. CDN). We responsability of tracking the movement is on the client side always.

Due to github limitations we have not included the video files. You can download them from [here](https://www.mettle.com/360vr-master-series-free-360-downloads-page/).


## [HLS](hls/README.md)
Renders the full video in 360º using HLS container in different resolutions. It sends all the video to the client. The client renders the video using `aframe.js` and `hls.js`.

## [RTMP - HLS](rtmp-hls/README.md)
It is the same approach but instead of rendering the video inside the server it comes from a producer that can be decoupled from the server. The client renders the video using `three.js`.

## [DASH](dash/README.md)
The same as HLS but using `dash.js` for receiving the video.

## [OMAF](omaf/README.md)
In this approach the client request the video of higher quality only wherever it is looking at.
