<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=basePath%>">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
  <title>iFlytek Web Api</title>
  <meta name="keywords" content="free mobile website templates, free mobile website template, free iphone template, free android template, free high end touch mobile templates, free high end touch mobile template" />
  <meta name="description" content="Get free mobile website templates for Iphone , Android and High end touch mobile devices" />
  <link href="./xf/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="header">
  <div class="nav">
    <ul>
      <li><a href="#">IAT</a></li>
    </ul>
  </div>
  <div class="logo"><img src="./xf/images/logo.png" alt="Company Logo - voicecloud.cn" /></div>
</div>
<div class="clear"></div>
<h2 id='iat_result'>语音听写</h2>
<ul class="helper">
  <li>请确认麦克风可以正常使用</li>
  <li>请保持网络接入畅通、稳定</li>
  <li>在安静环境下使用效果更佳</li>
</ul>

<div style="position:relative">

  <div id='a'>点击开始录音</div>
  <div id="canvas_wrapper" style="display:none">
    <div style="display: inline">&spades;</div>
    <canvas id="volume" height="4"></canvas>
  </div>
</div>
<script>
  onerror=function(a,b,c){
    alert(a+b+c);
  }
</script>
<script type="text/javascript" src='./xf/js/fingerprint2.min.js'></script>
<script type="text/javascript" src="./xf/js/iat.all.js"></script>
<script type="text/javascript" src="./xf/js/demo.js"></script>
</body>
</html>
