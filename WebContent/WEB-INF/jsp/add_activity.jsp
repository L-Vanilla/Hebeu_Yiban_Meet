<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <title>创建活动</title>
    <link type="text/css" rel="styleSheet"  href="${ctx}//css/agreement.css" />
    <!--单项选择  -->
    <link type="text/css" rel="styleSheet"  href="${ctx}//css/MultiPicker.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/MultiPicker.js"></script>
    <!--  创建成功提示页-->
    <link type="text/css" rel="styleSheet"  href="${ctx}///css/xcConfirm.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${ctx}/js//xcConfirm.js"></script>
    <!-- 图片显示 -->
    <script src="${ctx }/js/exif.js"></script>
    
</head>
<body class="launch">
<!-- 判断发布活动成功提示页面 -->
<c:if test="${requestScope.add_mess =='1' }">
	<script type="text/javascript">
	var txt1=  "创建活动成功";
	window.wxc.xcConfirm(txt1, window.wxc.xcConfirm.typeEnum.success);
	$('.xc_layer').css({'background-color': '#000000 !important', "opacity": "0.6 !important"})
	$('.txtBox').append('<span style="font-size: 14px; color: #9F9FAC;">请等待小伙伴们的加入吧<span>')
    // 查看详情按钮
    $('.btnArea').prepend('<div class="btnGroup"><a class="sgBtn act-detail" href="details?id=${requestScope.activity1.id }">查看详情</a></div>')
	</script>
</c:if>

<!-- 发布活动表单 -->
    <form action="${ctx}/add_activity" enctype="multipart/form-data" method="post" >
    <c:set var="activity" value="${requestScope.activity1 }"></c:set>
    	<input type="hidden" name="flag"  value="1" />
        <div class="content">
            <div class="launch_title">请填写以下内容</div>
            <div class="message_launch">活动名称</div>
            <input class="launch_content" name="title" value="${activity.title}" required/>

            <div class="message_launch">活动分类</div>
            <c:choose>
				<c:when test="${activity.type == 0}">
					<input class="launch_select type-input" type="text" name="type1" id="type1" value="约吃饭"  required/>
            				<!--类型选择容器-->
         			<div id="type-targetContainer"></div>
					
				</c:when>
				<c:when test="${activity.type == 1}">
					<input class="launch_select type-input" type="text" name="type1" id="type1" value="约跑步"  required/>
            				<!--类型选择容器-->
         			<div id="type-targetContainer"></div>
					
				</c:when>
				<c:when test="${activity.type == 2}">
					<input class="launch_select type-input" type="text" name="type1" id="type1" value="约逛街"  required/>
            				<!--类型选择容器-->
         			<div id="type-targetContainer"></div>
					
				</c:when>
				<c:when test="${activity.type == 3}">
					<input class="launch_select type-input" type="text" name="type1" id="type1" value="约学习"  required/>
            				<!--类型选择容器-->
         			<div id="type-targetContainer"></div>
					
				</c:when>
				<c:when test="${activity.type == 4}">
					<input class="launch_select type-input" type="text" name="type1" id="type1" value="约游戏"  required/>
            				<!--类型选择容器-->
         			<div id="type-targetContainer"></div>
					
				</c:when>
				<c:when test="${activity.type == 5}">
					<input class="launch_select type-input" type="text" name="type1" id="type1" value="约其他"  required/>
         			<div id="type-targetContainer"></div>
				</c:when>
				<c:otherwise>
					<input class="launch_select type-input" type="text" name="type1" id="type1"   required/>
         			<div id="type-targetContainer"></div>
				</c:otherwise>
			</c:choose>

            <div class="launch_level">
            	<div>
	           		 <div class="message_launch">限制参加者性别</div>
	           		  <c:choose>
                        <c:when test="${activity.sex_limit == 0}">
                        	<input class="launch_select sex-input" type="text" name="sex_limit1" id="sex-limit1" value="不限男女" required/>
   	   					</c:when>
			       	   <c:when test="${activity.sex_limit == 1}">
			       	   		<input class="launch_select sex-input" type="text" name="sex_limit1" id="sex-limit1" value="仅限男生" required/>
			       	   </c:when>
			       	   <c:when test="${activity.sex_limit == 2}">
			       	   		<input class="launch_select sex-input" type="text" name="sex_limit1" id="sex-limit1" value="仅限女生" required/>
			       	   </c:when>
      	   				<c:otherwise>
      	   					<input class="launch_select sex-input" type="text" name="sex_limit1" id="sex-limit1"  required/>
      	   				</c:otherwise>
						</c:choose>
	               	 
		          	 <!--性别选择容器-->
		           	 <div id="sex-targetContainer"></div>
	           	 </div>
	           	 <div>
            		<div class="message_launch">限制人数</div>
            		<input class="launch_content" name="people_limit" value="${activity.people_limit}" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="  请填写人数，默认无限制"/>
           		 </div>
            </div>

            <div class="message_launch">活动时间</div>
            <c:choose>
                <c:when test="${not empty activity.activity_date}">
                	<f:formatDate value="${activity.activity_date}" type="date" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/>
				</c:when>
            	<c:otherwise>
             		<input class="launch_content launch_date" name="activity_date" id="date3" required/>
             	</c:otherwise>
             </c:choose>
            <div class="message_launch">活动地点</div>
            <input class="launch_content" name="activity_place" value="${activity.activity_place}" required/>

            <div class="message_launch">活动内容</div>
            <textarea id="textarea" class="launch_content"  name="activity_content " required>${activity.activity_content}</textarea>

            <div class="launch_backgroundimg" id="preview">
                <input type="file" accept="image/*" id="file" value="" name="file" required/>
            </div> 

            <div class="message_launch">qq</div>
            <input class="launch_content" name="qq" value="${activity.qq}" style="margin-bottom: 1rem" required/>
             <div class="message_launch">手机号</div>
            <input class="launch_content" name="phone" value="${activity.phone}" style="margin-bottom: 1rem" required/>
            <span class="launch-message">成员申请加入活动后可见发起人联系方式</span>
 			<button type="submit" class="launch_submit">发布活动</button>
        </div>
    </form>
        <!--底部导航栏-->
    <footer class="footer">
        <div class="navigation" ><a href="home""><img src="${ctx}/imgs/home.png" style="height:28.5px;width:32px;"></a></div>
        <div class="navigation"><a href="add_activity?flag=0"> <img src="${ctx}/imgs/insert_active.png" style="height:40.5px;width:40.5px"></a></div>
        <div class="navigation"><a href="mine"><img src="${ctx}/imgs/my.png" style="height:29.5px;width:27.5px"></a></div>
    </footer>

</body>

<script type="text/javascript">
   //日期选择
    window.onload = function() {
            new rolldate.Date({
                el:'#date3',
                format:'YYYY-MM-DD hh:mm',
                beginYear:2000,
                endYear:2100
            })
            
            // 设置文本域“活动内容”高度自适应
            var textarea = document.querySelector('#textarea') 
            autoTextarea(textarea)
        };
    //活动选择
	   new MultiPicker({
	       input: 'type1',//点击触发插件的input框的id
	       container: 'type-targetContainer',//插件插入的容器id
	       jsonData: [{
	           value: '约吃饭',
	       },{
	           value: '约跑步',
	       },{
	           value: '约逛街',
	       },{
	           value: '约学习',
	       },{
	           value: '约游戏',
	       }, {
	           value: '约其他',
	       }],
	       success: function (arr) {
	           $('.type-input').attr('value',JSON.stringify(arr[0].value).replace(/\"/g,""));
	       }//回调
	   });

    //性别选择
  	   new MultiPicker({
       input: 'sex-limit1',//点击触发插件的input框的id
       container: 'sex-targetContainer',//插件插入的容器id
       jsonData: [{
           value: '男女不限',
       }, {
           value: '男',
       }, {
           value: '女',
       }],
       success: function (arr) {
           $('.sex-input').attr('value',JSON.stringify(arr[0].value).replace(/\"/g,""));
       }//回调
   });
    //显示图片
   var preview = document.querySelector('#preview');
   var eleFile = document.querySelector('#file');
   eleFile.addEventListener('change', function() {
       var file = this.files[0];
       // 确认选择的文件是图片
       if(file.type.indexOf("image") == 0) {
           var reader = new FileReader();
           reader.readAsDataURL(file);
           reader.onload = function(e) {
               // 图片base64化
               var newUrl = this.result;
               /* preview.style.backgroundImage = 'url(' + newUrl + ')'; */
               // 设置选中图片全部覆盖容器
               /* preview.style.backgroundSize = '100%'; */
               
               var Orientation = 1;
               var imageObj = new Image();
               imageObj.src = newUrl;
               imageObj.onload = function () {
                 varOrientation = 1;
                 var cvs = document.createElement('canvas');
                 var ctx = cvs.getContext('2d');
                 var scale = 1;//预留压缩比
                 var size = this.size;
                 cvs.width = this.width * scale;
                 cvs.height = this.height * scale;//计算等比缩小后图片宽高
                 var imgHeight = this.height 
                 EXIF.getData(imageObj, function () {
                   Orientation = EXIF.getTag(this, "Orientation");
                   if (Orientation && Orientation != 1) {
                     switch (Orientation) {
                       case 6:
                         var fatherWidth = parseFloat($('.launch_backgroundimg').css('width'));
                         var fatherheight = parseFloat($('.launch_backgroundimg').css('height'));
                         scale = fatherWidth / this.width;
                         heightScale = fatherheight / this.height;
                         cvs.width = fatherWidth;
                         var x = this.height * scale / 2;
                         //旋转后的画布需要img标签获取高度的2倍
                         // cvs.height = fatherheight * 2;
                         cvs.height = fatherheight;                  
                         ctx.rotate(Math.PI / 2);
                         // (0,-imgHeight) 从旋转原理图那里获得的起始点
                         ctx.drawImage(this, 0, -this.height * scale - (fatherWidth / 2 - x), fatherWidth, fatherheight);                                    
                         break;
                       case 3:// 旋转180度
                         ctx.rotate(Math.PI);
                         ctx.drawImage(this, this.width * scale, -this.height * scale, this.width * scale, this.height * scale);
                         break;
                       case 8:// 旋转-90度
                         cvs.width = this.height * scale;
                         cvs.height = this.width * scale;
                         ctx.rotate(3 * Math.PI / 2);
                         ctx.drawImage(this, -this.width * scale, 0, this.width * scale, this.height * scale);
                         break;
                     }
                   } else {
                     ctx.drawImage(this, 0, 0, cvs.width, cvs.height);
                   }
                   var newImageData = cvs.toDataURL(this, 1);
                   //重新定向加载url地址            
                   preview.style.backgroundImage = 'url(' + newImageData + ')';
                   preview.style.backgroundSize = '100%'
                 });
               };

           };
       }
   });
   
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
<script type="text/javascript" src="js/rolldate.min.js"></script>

</html>