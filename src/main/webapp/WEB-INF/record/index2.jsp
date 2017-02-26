<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>

<html>
<head>
  <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Live input record and playback</title>
  <style type='text/css'>
    ul { list-style: none; }
    #recordingslist audio { display: block; margin-bottom: 10px; }
  </style>
</head>
<body>

  <h1>Recorder.js改造后的录音测试</h1>


  <button onclick="startRecording(this);">开始录音</button>
  <button onclick="stopRecording(this);" disabled>停止录音并播放</button>
  
  <h2>Recordings</h2>
  <ul id="recordingslist"></ul>
  
  <h2>Log</h2>
  <pre id="log"></pre>

  <script>
  function __log(e, data) {
    log.innerHTML += "\n" + e + " " + (data || '');
  }

  var audio_context;
  var recorder;

  function startUserMedia(stream) {
    var input = audio_context.createMediaStreamSource(stream);
    __log('权限获取成功');
    __log('创建文件流成功');

    // Uncomment if you want the audio to feedback directly
    //input.connect(audio_context.destination);
    //__log('Input connected to audio context destination.');
    
    recorder = new Recorder(input);
    __log('初始化成功');
  }

  function startRecording(button) {
    recorder && recorder.record();
    button.disabled = true;
    button.nextElementSibling.disabled = false;
    __log('正在录音...');
  }

  function stopRecording(button) {
    recorder && recorder.stop();
    button.disabled = true;
    button.previousElementSibling.disabled = false;
    __log('停止录音.');
    
    // create WAV download link using audio data blob
    createDownloadLink();
    
    recorder.clear();
  }

  function createDownloadLink() {
    recorder && recorder.exportWAV(function(blob) {
      var url = URL.createObjectURL(blob);
      var li = document.createElement('li');
      var au = document.createElement('audio');
      var hf = document.createElement('a');
      
      au.controls = true;
      au.src = url;
      hf.href = url;
      hf.download = new Date().toISOString() + '.wav';
      hf.innerHTML = hf.download;
      li.appendChild(au);
      li.appendChild(hf);
      recordingslist.appendChild(li);
    });
  }

  window.onload = function init() {
    try {
      // webkit shim
      window.AudioContext = window.AudioContext || window.webkitAudioContext;
      navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;
      window.URL = window.URL || window.webkitURL;

      audio_context = new AudioContext;

      //多浏览器获取音频
      navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia ||
              navigator.mozGetUserMedia || navigator.msGetUserMedia;


      __log('音频环境创建成功.');
      __log('navigator.getUserMedia方法 ' + (navigator.getUserMedia ? '可以使用' : '无法启用'));
    } catch (e) {
      alert('不支持当前浏览器');
    }
    
    navigator.getUserMedia({audio: true}, startUserMedia, function(e) {
      __log('无法获取权限' + e);
    });
  };
  </script>

  <script src="./js/recorder.js"></script>
</body>
</html>
