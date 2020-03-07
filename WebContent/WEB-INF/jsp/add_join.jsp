<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <title>申请加入</title>
    <link type="text/css" rel="styleSheet"  href="${ctx}///css/home.css" />
     <!--  创建成功提示页-->
    <link type="text/css" rel="styleSheet"  href="${ctx}/css/xcConfirm.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${ctx}/js//xcConfirm.js"></script>
    <style type="text/css">
    input,
	textarea {
	    font-size: 14px !important;
	    padding: 8px;
	    box-sizing: border-box;
	}
    </style>
</head>

<body class="join" style="margin-top:3rem">
<!-- 判断发布申请成功提示页面 -->
	<c:if test="${requestScope.join_mess =='1' }">
		<script type="text/javascript">
			var txt1=  "发送申请成功";
			window.wxc.xcConfirm(txt1, window.wxc.xcConfirm.typeEnum.success);
			$('.txtBox').append('<span style="font-size: 14px; color: #9F9FAC;">请等待发起人同意<span>')
		</script>
	</c:if>
	<form action="${ctx}/add_join" method="post" >
	 <c:set var="join" value="${requestScope.join }"></c:set>
	<input type="hidden" name="flag"  value="1" />
	<input type="hidden" name="activity_id" value="${requestScope.activity_id }" />
      <div class="join_title">捎句话给发起人</div>
      <textarea  id="textarea" class="join_content" name="words" style="height: 157px;" required>${join.words }</textarea>
      <div class="join_title" >qq:</div>
       <input class="join_content" name="join_qq" type="text" value="${join.join_qq }" required/>
       <div class="join_title" >手机号:</div>
       <input class="join_content" name="join_phone" type="text" value="${join.join_phone }" required/>
       <span class="join_message">必填项  方便加入活动后进行联系</span>
      <button type="submit" class="join_insert">发送申请</button>
      </form>
</body>
<script type="text/javascript">
	window.onload = function() {  
	    // 设置文本域“活动内容”高度自适应
	    var textarea = document.querySelector('#textarea') 
	    autoTextarea(textarea)
	};
/**
 * 文本框根据输入内容自适应高度
 * @param                {HTMLElement}        输入框元素
 * @param                {Number}                设置光标与输入框保持的距离(默认0)
 * @param                {Number}                设置最大高度(可选)
 */
var autoTextarea = function (elem, extra, maxHeight) {
  extra = extra || 0;
  var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
    isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
    addEvent = function (type, callback) {
      elem.addEventListener ?
        elem.addEventListener(type, callback, false) :
        elem.attachEvent('on' + type, callback);
    },
    getStyle = elem.currentStyle ? function (name) {
      var val = elem.currentStyle[name];

      if (name === 'height' && val.search(/px/i) !== 1) {
        var rect = elem.getBoundingClientRect();
        return rect.bottom - rect.top -
          parseFloat(getStyle('paddingTop')) -
          parseFloat(getStyle('paddingBottom')) + 'px';
      };

      return val;
    } : function (name) {
      return getComputedStyle(elem, null)[name];
    },
    minHeight = parseFloat(getStyle('height'));

  elem.style.resize = 'none'; 

  var change = function () {
    var scrollTop, height,
      padding = 0,
      style = elem.style;

    if (elem._length === elem.value.length) return;
    elem._length = elem.value.length;

    if (!isFirefox && !isOpera) {
      padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
    };
    scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

    elem.style.height = minHeight + 'px';
    if (elem.scrollHeight > minHeight) {
      if (maxHeight && elem.scrollHeight > maxHeight) {
        height = maxHeight - padding;
        style.overflowY = 'auto';
      } else {
        height = elem.scrollHeight - padding;
        style.overflowY = 'hidden';
      };
      style.height = height + extra + 'px';
      scrollTop += parseInt(style.height) - elem.currHeight;
      // document.body.scrollTop = scrollTop;
      // document.documentElement.scrollTop = scrollTop;
      elem.currHeight = parseInt(style.height);
    };
  };

  addEvent('propertychange', change);
  addEvent('input', change);
  addEvent('focus', change);
  change();
};
</script>
</html>