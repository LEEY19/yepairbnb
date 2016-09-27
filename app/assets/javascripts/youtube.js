 function onYouTubeIframeAPIReady() {

  var player;

  player = new YT.Player('myVideo', {

    videoId: 'fm7UTsXJNfw',

    width: 1280,
    height: 720,

    playerVars: {
      autoplay: 1,        // Auto-play the video on load
      controls: 0,        // Show pause/play buttons in player
      loop: 1,
      showinfo: 0,
      frameborder: 0,
      playlist: 'fm7UTsXJNfw'
    },

    events: {
      onReady: function(e) {
        e.target.mute();
      }
    }
  });
 };