var video = document.getElementById('video');
var videoSrc = "videos/master.m3u8";

if (video.canPlayType('application/vnd.apple.mpegurl')) {
  video.src = videoSrc;
  //
  // If no native HLS support, check if HLS.js is supported
  //
} else if (Hls.isSupported()) {
  var hls = new Hls();
  hls.loadSource(videoSrc);
  hls.attachMedia(video);
}