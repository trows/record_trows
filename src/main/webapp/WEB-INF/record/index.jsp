<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>录音测试</title>
</head>
<body>
<h2>Hello World!录音测试</h2>

<html>
<body>
<audio controls autoplay></audio>
<script type="text/javascript" src="./js/jquery-2.2.3.min.js"> </script>
<script type="text/javascript" src="./js/record.js"> </script>
<script type="text/javascript" src="./js/recorderWorker.js"> </script>
<fieldset><legend>录音测试</legend>
    <input onclick="startRecording()" type="button" value="开始录音" />
    <input onclick="stopRecording()" type="button" value="停止录音" />

    <div id="log">
        <p>日志记录</p>
    </div>
</fieldset>
</body>

<script>

    function writeLog(msg) {
        $('#log').append('<p>'+msg+'</p>');
    }
    var onFail = function(e) {
        writeLog('无法获取权限', e);
    };

    var onSuccess = function(s) {
        writeLog('权限获取成功')
        var context = new webkitAudioContext();
        var mediaStreamSource = context.createMediaStreamSource(s);
        recorder = new Recorder(mediaStreamSource);
        recorder.record();

        // audio loopback
        // mediaStreamSource.connect(context.destination);
    }

    window.URL = window.URL || window.webkitURL;
    navigator.getUserMedia  = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;

    var recorder;
    var audio = document.querySelector('audio');

    function startRecording() {
        writeLog('开始录音');
        if (navigator.getUserMedia) {
            navigator.getUserMedia({audio: true}, onSuccess, onFail);
        } else {
           writeLog('不支持该浏览器')
        }
    }

    function stopRecording() {
        writeLog('停止录音');
        recorder.stop();
        recorder.exportWAV(function(s) {

            audio.src = window.URL.createObjectURL(s);
        });
    }
</script>
</html>

</body>
</html>
