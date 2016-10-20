{{> jsp_header }}
<%
  String host = ip;
%>
<!doctype html>
<html lang="eng">
  <head>
    {{> head_meta }}
    {{> resources }}
    <title>Stream Broadcasting with the Red5 Pro Server!</title>
    <script src="lib/webrtc/adapter.js"></script>
    <script src="lib/videojs/video.min.js"></script>
    <script src="lib/videojs/videojs-media-sources.min.js"></script>
    <script src="lib/videojs/videojs.hls.min.js"></script>
    <link rel="stylesheet" href="lib/videojs/video-js.min.css">
    <style>
      object:focus {
        outline:none;
      }

      #flashContent {
        border-radius: 5px;
        background-color: #e3e3e3;
        padding: 10px;
      }

      #live-page-subcontent {
        text-align: center;
        position: relative;
        width: 100%;
        height: 230px;
        overflow: hidden;
      }

      #live-container {
        position: absolute;
      }

      #live-image-container {
        width: 540px;
      }

      #live-page-img {
        width: 100%;
      }

      .notify-callout {
        margin: 0px;
        padding: 26px 26px;
        background-color: #eeeeee
      }

      .video-element {
        width: 100%;
      }
    </style>
  </head>
  <body>
    {{> header }}
    <div class="container main-container clear-fix">
      <div id="menu-section">
        {{> menu }}
      </div>
      <div id="content-section">
        <div>
          <div class="clear-fix">
            <p class="left">
                <a class="red5pro-header-link" href="/">
                  <img class="red5pro-logo-page" src="images/red5pro_logo.svg">
               </a>
            </p>
          </div>
          <h2 class="tag-line">LIVE BROADCAST FOR ANY SCREEN</h2>
        </div>
        <div id="live-page-subcontent" class="clear-fix">
          <div id="live-image-container">
            <img id="live-page-img" src="images/red5pro_live_broadcast.png">
          </div>
        </div>
        <div class="content-section-story">
          <p>To start a Broadcast session, allow device access, provide a <strong>stream name</strong>, select any additional broadcast options, then click <strong>Start Broadcast.</strong>
          </p>
          <hr />
          <p class="notify-callout">You can also select to <strong>Enable Recording</strong> the live stream for Video On Demand playback after the Broadcast session! To view the current Video On Demand (VOD) files on your server, visit the <a class="link" href="playback.jsp" target="_blank">Playback</a> page.</p>
          <hr />
          <div id="flashContent">
            <video id="red5pro-publisher-video" controls class="video-element"></video>
          </div>
          <br><br>
          <hr class="top-padded-rule" />
          <h3><a class="link" href="http://red5pro.com/docs/streaming/overview/" target="_blank">Streaming SDKs</a></h3>
          <p>You can download the Streaming SDKs from your <a class="link" href="http://account.red5pro.com/download" target="_blank">Red5 Pro Accounts</a> page.</p>
          <p>Please visit the online <a class="link" href="http://red5pro.com/docs/streaming/overview/" target="_blank">Red5 Pro Documentation</a> for further information about integrating the streaming SDKs into your own native application!</p>
          <hr class="top-padded-rule" />
          {{> applications }}
          <hr class="top-padded-rule" />
          {{> additional_info }}
        </div>
      </div>
    </div>
    {{> es6-script-includes }}
    <script>
      window.targetHost = '<%=ip%>';
    </script>
    <script src="lib/red5pro/red5pro-sdk.js"></script>
    <script src="script/r5pro-publisher-failover.js"></script>
    {{> footer }}
   </body>
</html>